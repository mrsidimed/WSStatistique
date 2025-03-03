/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entities;


import java.sql.Timestamp;
import java.util.Date;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Temporal;

/**
 *
 * @author PC
 */
@Entity
public class Log {

    public Log() {
    }
    
    @Id @GeneratedValue(strategy=GenerationType.AUTO)
    private int id;
    private int idEntite;
    private Timestamp timestamp;
    private String nni;
    private String ipAdress;

    
    private int  status; // =1 si les donnees ont ete retournees =0 sinon
    private String numtel;
    
  
    
    public Log(int idEntite , Timestamp timestamp , String nni , String ipAdress , int status ,String numtel){
        
        this.idEntite=idEntite;
        this.timestamp=timestamp;
        this.nni=nni;
        this.ipAdress=ipAdress;
        this.status=status;
        this.numtel=numtel;

    }
    /**
     * @return the id
     */
    public int getId() {
        return id;
    }

    /**
     * @param id the id to set
     */
    public void setId(int id) {
        this.id = id;
    }

    /**
     * @return the idEntite
     */
    public int getIdEntite() {
        return idEntite;
    }

    /**
     * @param idEntite the idEntite to set
     */
    public void setIdEntite(int idEntite) {
        this.idEntite = idEntite;
    }

    /**
     * @return the date
     */
    public Timestamp getTimestamp() {
        return timestamp;
    }

     
    public void setTimestamp(Timestamp timestamp) {
        this.timestamp = timestamp;
    }

    /**
     * @return the nni
     */
    public String getNni() {
        return nni;
    }

    /**
     * @param nni the nni to set
     */
    public void setNni(String nni) {
        this.nni = nni;
    }
 

    /**
     * @return the ipAdress
     */
    public String getIpAdress() {
        return ipAdress;
    }

    /**
     * @param ipAdress the ipAdress to set
     */
    public void setIpAdress(String ipAdress) {
        this.ipAdress = ipAdress;
    }

    /**
     * @return the status
     */
    public int getStatus() {
        return status;
    }

    /**
     * @param status the status to set
     */
    public void setStatus(int status) {
        this.status = status;
    }
    public String getNumtel() {
        return numtel;
    }

    public void setNumtel(String numtel) {
        this.numtel = numtel;
    }

    
}
