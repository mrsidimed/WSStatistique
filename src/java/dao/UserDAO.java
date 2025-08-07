/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import entities.User;
import org.hibernate.Session;

/**
 *
 * @author sidimed
 */
public class UserDAO {
    private static final UserDAO INSTANCE = new UserDAO();
    public static UserDAO getInstance() { return INSTANCE; }

    public User findByUsername(String username) {
        Session s = HibernateUtil.getSessionFactory().openSession();
        try {
            return (User) s.createQuery("from User u where u.username = :u")
                            .setParameter("u", username)
                            .uniqueResult();
        } finally { s.close(); }
    }
}
