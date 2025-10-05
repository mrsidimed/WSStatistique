package action;

import static com.opensymphony.xwork2.Action.SUCCESS;
import com.opensymphony.xwork2.ActionSupport;
import dao.WebServiceDAO;
import entities.Log;
import java.text.ParseException;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.util.List;
// For Struts2 you might need the following import to get the servlet context:
import org.apache.struts2.ServletActionContext;

public class SearchAction extends ActionSupport {

    /**
     * @return the nniDistinct
     */
    public boolean isNniDistinct() {
        return nniDistinct;
    }

    /**
     * @param nniDistinct the nniDistinct to set
     */
    public void setNniDistinct(boolean nniDistinct) {
        this.nniDistinct = nniDistinct;
    }

    private String operateur;
    private String dateDebut;
    private String dateFin;

    private String dateDebutAutreFormat;
    private String dateFinAutreFormat;
    private int idEntite1;
    private int idEntite2;

    private boolean nniDistinct;

    private String retour;

    private String nni;
    private String numTel;
    private List<Log> logs;   // holds the results returned to the JSP

    private String retourOfAllOperators;

    WebServiceDAO dao = WebServiceDAO.getInstance();

    public String searchLogs() {
        logs = dao.getLogs(nni, numTel);   // returns empty list if both params blank
        System.out.println("nniDistinct ====================== " );
        return SUCCESS;                    // map this result to the page that shows “logs”
    }

    public String sendStatistique() throws ParseException {

        System.out.println("nniDistinct = " + nniDistinct);
//        switch (operateur) {
//            case "Mattel":
//                idEntite1 = 6;
//                idEntite2 = 11;
//                break;
//            case "Mauritel":
//                idEntite1 = 5;
//                idEntite2 = 12;
//                break;
//            case "Chinguitel":
//                idEntite1 = 2;
//                idEntite2 = 13;
//                break;
//            default:
//
//                idEntite1 = 2;
//                idEntite2 = 13;
//                break;
//        }

        idEntite1 = Integer.parseInt(operateur);

        retour = dao.getStatistique(idEntite1, dateDebut, dateFin, nniDistinct);

        return SUCCESS;
    }

    public String sendStatistiqueOfAllOperators() throws ParseException {
        System.out.println("operateur = " + operateur);

        // Read the file operateur.txt and get the libelle corresponding to the operateur id
        String libelle = "";
        BufferedReader br = null;
        try {
            // Get the file path (adjust the path if necessary)
            String filePath = ServletActionContext.getServletContext().getRealPath("/WEB-INF/operateur.txt");
            br = new BufferedReader(new FileReader(filePath));
            String line;
            // Skip the header line (assumes first line is header "Id,libelle")
            if ((line = br.readLine()) != null) {
                // header skipped
            }
            // Read each line and check for matching id
            while ((line = br.readLine()) != null) {
                String[] parts = line.split(",");
                if (parts.length >= 2) {
                    String id = parts[0].trim();
                    if (id.equals(operateur)) {
                        libelle = parts[1].trim();
                        break;
                    }
                }
            }
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            if (br != null) {
                try {
                    br.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }

        // Now that we have the libelle, you might want to log or use it.
        System.out.println("Libelle found = " + libelle);

        // Convert operateur to integer and assign to idEntite1
        idEntite1 = Integer.parseInt(operateur);

        // Call the DAO method and include the libelle if needed.
        retourOfAllOperators = libelle + "__" + dao.getStatistique(idEntite1, dateDebut, dateFin, true);
        System.out.print("retour1 = " + retourOfAllOperators + "\n");

        return "pd4ml";
    }

    public String sendStatistiqueOfAllOperatorsOLD() throws ParseException {

        System.out.println("operateur = " + operateur);
//        switch (operateur) {
//            case "Mattel":
//                idEntite1 = 6;
//                idEntite2 = 11;
//                break;
//            case "Mauritel":
//                idEntite1 = 5;
//                idEntite2 = 12;
//                break;
//            case "Chinguitel":
//                idEntite1 = 2;
//                idEntite2 = 13;
//                break;
//            default:
//
//                break;
//        }

        idEntite1 = Integer.parseInt(operateur);

        //retourOfAllOperators = operateur+"__"+dao.getStatistique(idEntite1 ,idEntite2 , dateDebut, dateFin);
        retourOfAllOperators = operateur + "__" + dao.getStatistique(idEntite1, dateDebut, dateFin, nniDistinct);
        System.out.print("retour1 = " + retourOfAllOperators + "\n");
        return "pd4ml";
    }

    public String sendStatistiqueOfAllOperators2() throws ParseException {

        String mattel, mauritel, chinguitel;

        System.out.println("operateur = " + operateur);

        mattel = dao.getStatistique(11, dateDebut, dateFin, nniDistinct);
        mauritel = dao.getStatistique(5, dateDebut, dateFin, nniDistinct);
        chinguitel = dao.getStatistique(2, dateDebut, dateFin, nniDistinct);

        retourOfAllOperators = mattel + ";" + mauritel + ";" + chinguitel;

        return "pd4ml";
    }

    public String execute() {

        return SUCCESS;
    }

    /**
     * @return the operateur
     */
    public String getOperateur() {
        return operateur;
    }

    /**
     * @param operateur the operateur to set
     */
    public void setOperateur(String operateur) {
        this.operateur = operateur;
    }

    /**
     * @return the dateDebut
     */
    public String getDateDebut() {
        return dateDebut;
    }

    /**
     * @param dateDebut the dateDebut to set
     */
    public void setDateDebut(String dateDebut) {
        this.dateDebut = dateDebut;
        String[] tab = dateDebut.split("-");
        setDateDebutAutreFormat(tab[2] + "/" + tab[1] + "/" + tab[0]);
    }

    /**
     * @return the dateFin
     */
    public String getDateFin() {
        return dateFin;
    }

    /**
     * @param dateFin the dateFin to set
     */
    public void setDateFin(String dateFin) {
        this.dateFin = dateFin;
        String[] tab = dateFin.split("-");
        setDateFinAutreFormat(tab[2] + "/" + tab[1] + "/" + tab[0]);
    }

    /**
     * @return the idEntite
     */
    public int getIdEntite1() {
        return idEntite1;
    }

    /**
     * @param idEntite the idEntite to set
     */
    public void setIdEntite1(int idEntite1) {
        this.idEntite1 = idEntite1;
    }

    public int getIdEntite2() {
        return idEntite2;
    }

    /**
     * @param idEntite the idEntite to set
     */
    public void setIdEntite2(int idEntite2) {
        this.idEntite2 = idEntite2;
    }

    /**
     * @return the retour
     */
    public String getRetour() {
        return retour;
    }

    /**
     * @param retour the retour to set
     */
    public void setRetour(String retour) {
        this.retour = retour;
    }

    /**
     * @return the retourOfAllOperators
     */
    public String getRetourOfAllOperators() {
        return retourOfAllOperators;
    }

    /**
     * @param retourOfAllOperators the retourOfAllOperators to set
     */
    public void setRetourOfAllOperators(String retourOfAllOperators) {
        this.retourOfAllOperators = retourOfAllOperators;
    }

    /**
     * @return the dateDebutAutreFormat
     */
    public String getDateDebutAutreFormat() {
        return dateDebutAutreFormat;
    }

    /**
     * @param dateDebutAutreFormat the dateDebutAutreFormat to set
     */
    public void setDateDebutAutreFormat(String dateDebutAutreFormat) {
        this.dateDebutAutreFormat = dateDebutAutreFormat;
    }

    /**
     * @return the dateFinAutreFormat
     */
    public String getDateFinAutreFormat() {
        return dateFinAutreFormat;
    }

    /**
     * @param dateFinAutreFormat the dateFinAutreFormat to set
     */
    public void setDateFinAutreFormat(String dateFinAutreFormat) {
        this.dateFinAutreFormat = dateFinAutreFormat;
    }

    public String getNni() {
        return nni;
    }

    public void setNni(String nni) {
        this.nni = nni;
    }

    public String getNumTel() {
        return numTel;
    }

    public void setNumTel(String numTel) {
        this.numTel = numTel;
    }

    public List<Log> getLogs() {
        return logs;
    }

}
