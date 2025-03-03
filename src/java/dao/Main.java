/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

 
import java.text.ParseException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author DRD
 */

public class Main {

    public static void main(String args[]) throws ParseException {
        
       
        WebServiceDAO dao = WebServiceDAO.getInstance();
        String resu = dao.getStatistique(5  , "2017-01-01", "2017-02-01");
        System.out.println("resu = "+  resu);

    }
}
