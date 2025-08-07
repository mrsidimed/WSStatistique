
/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import entities.Log;

import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.hibernate.Criteria;
import org.hibernate.FetchMode;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Disjunction;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Property;
import org.hibernate.criterion.Restrictions;
import org.hibernate.criterion.Subqueries;

/**
 *
 * @author DRD
 */
public class WebServiceDAO {

    public static final WebServiceDAO instance = new WebServiceDAO();

    private WebServiceDAO() {

    }

    public static WebServiceDAO getInstance() {
        return instance;
    }

    /**
     * Fetch logs that match a given NNI or phone number.
     *
     * @param nni the NNI to search for (may be null / empty)
     * @param numTel the phone number to search for (may be null / empty)
     * @return list of matching Log entities; empty list if both params are
     * blank
     */
    @SuppressWarnings("unchecked")
    public List<Log> getLogs(String nni, String numTel) {

        // nothing to look for
        if ((nni == null || nni.trim().isEmpty())
                && (numTel == null || numTel.trim().isEmpty())) {
            return java.util.Collections.emptyList();
        }

        Session session = HibernateUtil.getSessionFactory().openSession();
        try {
//            StringBuilder hql = new StringBuilder("from Log l where ");
//            List<String> clauses = new ArrayList<>();
//
//            if (nni != null && !nni.trim().isEmpty()) {
//                clauses.add("l.nni = :nni");
//            }
//            if (numTel != null && !numTel.trim().isEmpty()) {
//                //clauses.add("l.numTel = :numTel");
//                clauses.add("l.numtel = :numTel");   // ← match the entity exactly
//            }
//
//            hql.append(String.join(" or ", clauses));
//
//            Query q = session.createQuery(hql.toString());

            StringBuilder hql = new StringBuilder(
                    "from Log l join fetch l.entite where ");

            List<String> clauses = new ArrayList<>();
            if (nni != null && !nni.trim().isEmpty()) {
                clauses.add("l.nni like :nni");
            }
            if (numTel != null && !numTel.trim().isEmpty()) {
                clauses.add("l.numtel like :numTel");
            }
            
            

            hql.append(String.join(" or ", clauses));

            Query q = session.createQuery(hql.toString());
            /* set parameters as before */

            if (hql.indexOf(":nni") > 0) {
                q.setParameter("nni", "%"+nni.trim());
            }
            if (hql.indexOf(":numTel") > 0) {
                q.setParameter("numTel", "%"+numTel.trim());
            }
 

            return q.list();
        } finally {
            session.close();
        }
    }

    public String getStatistique(int idEntite,
            String debut,
            String fin,
            boolean countDuplicates /* renamed for clarity */) throws ParseException {

        // ---- Parse dates only once ----
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
        Date start = formatter.parse(debut);
        Date end = formatter.parse(fin);

//        DateTimeFormatter fmt = DateTimeFormatter.ofPattern("yyyy-MM-dd");
//        LocalDateTime start = LocalDate.parse(debut, fmt).atStartOfDay();
//        LocalDateTime end = LocalDate.parse(fin, fmt).atTime(LocalTime.MAX);
        // ---- Build the HQL dynamically ----
        String selectPart = countDuplicates
                ? "count(l)" // every row
                : "count(distinct l.nni)";    // unique NNIs

        String hql
                = "select l.status, " + selectPart + " "
                + "from Log l "
                + "where l.idEntite   = :entite "
                + "  and l.status     in (:statuses) "
                + "  and l.timestamp  between :start and :end "
                + "group by l.status";

        List<Integer> statuses = List.of(1, 2, 4);   // <<-- keep all here

        Map<Integer, Long> counters = new HashMap<>(3);

        Session session = HibernateUtil.getSessionFactory().openSession();

        @SuppressWarnings("unchecked")                 // ← old API is untyped
        List<Object[]> rows = (List<Object[]>) session.createQuery(hql)
                .setParameter("entite", idEntite)
                .setParameterList("statuses", statuses)
                .setParameter("start", start)
                .setParameter("end", end)
                .list();                  // ← not getResultList()

        for (Object[] row : rows) {
            counters.put((Integer) row[0], (Long) row[1]);
        }

        long nniInexistant = counters.getOrDefault(1, 0L);
        long infosRetournees = counters.getOrDefault(2, 0L);
        long formatInvalide = counters.getOrDefault(4, 0L);

        return "InfosRetournees:" + infosRetournees
                + "_nniInexistant:" + nniInexistant
                + "_formatInvalide:" + formatInvalide;
    }

    public String getStatistiqueOLD(int idEntity1, String debut, String fin, boolean nniDistinct) throws ParseException {

        Session session = HibernateUtil.getSessionFactory().openSession();
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
        String formatInvalide = "-1", nniInexistant = "-2", InfosRetournees = "-3";
        List idsEntities = new ArrayList();
        Date dateDebut = formatter.parse(debut);
        Date dateFin = formatter.parse(fin);
        int i = 0;
        String hql;
        idsEntities.add(1);
        idsEntities.add(2);
        idsEntities.add(4);

        while (i < idsEntities.size()) {
            //String hql = "select count(*) from Log where (idEntite = :idEntite1  or  idEntite = :idEntite2 ) and timestamp between :dateDebut and :dateFin and status = :status";

            // String hql = "select count(*) from Log where (idEntite = :idEntite1 ) and timestamp between :dateDebut and :dateFin and status = :status";
            if (nniDistinct) {

                hql = "select count(*) from Log where (idEntite = :idEntite1 ) and timestamp between :dateDebut and :dateFin and status = :status";

            } else {

                hql
                        = "select count(distinct l.nni) "
                        + "from Log l "
                        + "where l.idEntite   = :idEntite1  "
                        + "  and l.timestamp between :dateDebut and :dateFin  "
                        + "  and l.status     = :status";

            }
            Query query = session.createQuery(hql);

            query.setParameter("dateDebut", dateDebut);
            query.setParameter("dateFin", dateFin);
            query.setParameter("idEntite1", idEntity1);
            //query.setParameter("idEntite2", idEntity2);

            query.setParameter("status", (int) idsEntities.get(i));

            long count = (long) query.uniqueResult();
            switch ((int) idsEntities.get(i)) {
                case 1:
                    nniInexistant = "" + count;
                    break;
                case 2:
                    InfosRetournees = "" + count;
                    break;
                default:
                    formatInvalide = "" + count;
                    break;
            }
            i++;
        }

        session.close();

        return "InfosRetournees:" + InfosRetournees + "_nniInexistant:" + nniInexistant + "_formatInvalide:" + formatInvalide;
    }

}
