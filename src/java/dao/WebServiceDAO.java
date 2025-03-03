
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
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
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

    public String getStatistique(int idEntity1 ,  String debut, String fin) throws ParseException {

        Session session = HibernateUtil.getSessionFactory().openSession();
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
        String formatInvalide ="-1", nniInexistant="-2", InfosRetournees="-3";
        List idsEntities = new ArrayList();
        Date dateDebut = formatter.parse(debut);
        Date dateFin = formatter.parse(fin);
        int i = 0;
        idsEntities.add(1);
        idsEntities.add(2);
        idsEntities.add(4);

        while (i < idsEntities.size()) {
            //String hql = "select count(*) from Log where (idEntite = :idEntite1  or  idEntite = :idEntite2 ) and timestamp between :dateDebut and :dateFin and status = :status";
            String hql = "select count(*) from Log where (idEntite = :idEntite1 ) and timestamp between :dateDebut and :dateFin and status = :status";

            Query query = session.createQuery(hql);

            query.setParameter("dateDebut", dateDebut);
            query.setParameter("dateFin", dateFin);
            query.setParameter("idEntite1", idEntity1);
            //query.setParameter("idEntite2", idEntity2);
            
            query.setParameter("status", (int)idsEntities.get(i));
            
            long count = (long) query.uniqueResult();
            switch ((int)idsEntities.get(i)) {
                case 1:
                    nniInexistant =  ""+count;
                    break;
                case 2:
                    InfosRetournees =  ""+count;
                    break;
                default:
                    formatInvalide =  ""+count;
                    break;
            }   
            i++;
        }

        session.close();

        return "InfosRetournees:"+InfosRetournees+"_nniInexistant:"+nniInexistant+"_formatInvalide:"+formatInvalide;
    }

  
}
