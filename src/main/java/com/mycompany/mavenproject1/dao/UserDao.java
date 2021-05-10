/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.mavenproject1.dao;

import com.mycompany.mavenproject1.entities.User;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;

/**
 *
 * @author Aditi
 */
public class UserDao {
    
private SessionFactory factory;

    public UserDao(SessionFactory factory) {
        this.factory = factory;
    }
    
    // get user by email and password
    public User getUserByEmailAndPassword(String email,String password)
    {
    User user=null;
    try{
       // System.out.println("InDao");
        String query="from User where userEmail=: e and userPassword=: p";
        Session session=this.factory.openSession();
        Query q=session.createQuery(query);
        q.setParameter("e", email);
        q.setParameter("p", password);
        user = (User) q.uniqueResult();
        //System.out.println("InDao"+user);
        session.close();
    }catch(Exception e){
        e.printStackTrace();
    }
    return user;    
    }

    
}
