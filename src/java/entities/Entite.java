/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entities;

import javax.persistence.Entity;
import javax.persistence.Table;
import javax.persistence.Id;




/**
 *
 * @author sidimed
 */
@Entity
@Table(name = "Entite") 
public class Entite {
 
    @Id
    private int id;

    private String libelle;

    /* getters / setters */
    public int getId()         { return id; }
    public void setId(int id)  { this.id = id; }

    public String getLibelle()              { return libelle; }
    public void setLibelle(String libelle)  { this.libelle = libelle; }
}
