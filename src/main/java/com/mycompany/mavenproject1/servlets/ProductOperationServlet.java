/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.mavenproject1.servlets;

import com.mycompany.mavenproject1.dao.CategoryDao;
import com.mycompany.mavenproject1.dao.ProductDao;
import com.mycompany.mavenproject1.entities.Category;
import com.mycompany.mavenproject1.entities.Product;
import com.mycompany.mavenproject1.helper.factoryProvider;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

/**
 *
 * @author Aditi
 */
  @MultipartConfig
public class ProductOperationServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
  
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            String op=request.getParameter("operation");
            if(op.trim().equals("addCategory")){
                //Fetching category Data
            String title=request.getParameter("catTitle");
            String description=request.getParameter("catDescription");
            Category category=new Category();
            category.setCategoryDescription(description);
            category.setCategoryTitle(title);
            CategoryDao categoryDao=new CategoryDao(factoryProvider.getFactory()); //Setting Factory in constructor
            int catId=categoryDao.saveCategory(category);
              HttpSession httpSession=request.getSession();
            //System.out.println(user);
                httpSession.setAttribute("message", "Category Saved with ID "+ catId);
                response.sendRedirect("admin.jsp");
                
            }else if(op.trim().equals("addProduct")){
                String pName=request.getParameter("pName");
                String pDescription=request.getParameter("pDescription");
                int pPrice=Integer.parseInt(request.getParameter("pPrice"));
                int pDiscount=Integer.parseInt(request.getParameter("pDiscount"));
                int pQuantity=Integer.parseInt(request.getParameter("pQuantity"));
                int catId=Integer.parseInt(request.getParameter("catId"));
                Part part=request.getPart("pPic");
                Product product = new Product();
                product.setpPrice(pPrice);
                product.setpDiscount(pDiscount);
                product.setpQuantity(pQuantity);
                product.setpName(pName);
                product.setpDescription(pDescription);
                product.setpPhoto(part.getSubmittedFileName());
                //getting category
                CategoryDao categoryDao=new CategoryDao((factoryProvider.getFactory()));
                Category category=categoryDao.getCategoryById(catId);
                product.setCategory(category);
                //product save
                ProductDao pdao=new ProductDao(factoryProvider.getFactory());
                pdao.saveProduct(product);
                //pic upload
                //find out the path to upload photo
                try{
                String path=request.getRealPath("images")+File.separator+"products"+File.separator+part.getSubmittedFileName();
                System.out.println(path);
                //uploading code
                FileOutputStream fos=new FileOutputStream(path);
                InputStream inputStream= part.getInputStream();
                //reading data
                byte []data=new byte[inputStream.available()];
                inputStream.read(data);
                //writing the data
                fos.write(data);
                inputStream.close();
                fos.close();
                }
                catch (Exception e){
                    e.printStackTrace();
                }
                HttpSession httpSession=request.getSession();
                httpSession.setAttribute("message", "Product Added");
                response.sendRedirect("admin.jsp");
                //out.println("Product Success");
                        
                        
                
                
            }
            
            
            
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
