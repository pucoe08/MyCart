/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.mavenproject1.dao;

import com.mycompany.mavenproject1.entities.Product;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

/**
 *
 * @author Aditi
 */
public class ProductDao {
       private SessionFactory factory;

    public ProductDao(SessionFactory factory) {
        this.factory = factory;
    }
    public boolean saveProduct(Product product){
        boolean f=false;
        try{
            Session session=this.factory.openSession();
            Transaction tx= session.beginTransaction();
            session.save(product);
            tx.commit();
            session.close();
            f=true;
        }
        catch(Exception e){
            e.printStackTrace();
            f=false;
        }
        return f;
    }
     //get all product
    public List<Product> getAllProducts(){
        Session session=this.factory.openSession();
        Query query=session.createQuery("from Product");
        List<Product> list=query.list();
        return list;
    }
    //get all product of given category
    public List<Product> getProductsById(int cId){
        Session session=this.factory.openSession();
        Query query=session.createQuery("from Product as p where p.category.categoryId=: id");
        query.setParameter("id", cId);
        List<Product> list=query.list();
        return list;
    }
    
}
