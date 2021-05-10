/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.mavenproject1.helper;

import com.mycompany.mavenproject1.entities.User;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

/**
 *
 * @author Aditi
 */
public class factoryProvider {

    private static SessionFactory factory;

    public static SessionFactory getFactory() {
        
        try {
            if (factory == null) {
                System.out.print("Hello in factory not null");
                factory = new Configuration().configure("hibernate.cfg.xml").buildSessionFactory();
                //creating User
                //User us=new User();
                
            }

        } catch (Exception e) {
            System.out.print("Hello in exception");
            e.printStackTrace();
        }
        return factory;
    }
}
