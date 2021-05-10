/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.mavenproject1.servlets;

import com.mycompany.mavenproject1.dao.UserDao;
import com.mycompany.mavenproject1.entities.User;
import com.mycompany.mavenproject1.helper.factoryProvider;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Aditi
 */
public class LoginServlet extends HttpServlet {

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
         //coding area
         String email= request.getParameter("email");
         String password=request.getParameter("password");
         //authentication
         UserDao userDao=new UserDao(factoryProvider.getFactory());
         User user=userDao.getUserByEmailAndPassword(email, password);
            HttpSession httpSession=request.getSession();
            //System.out.println(user);
            if(user==null){
                //oHttpSession httpSeut.println("<h1> Invalid Details </h1>");
                httpSession.setAttribute("message", "Invalid Details");
                response.sendRedirect("login.jsp");
            }
            else{
                httpSession.setAttribute("current-user", user);
                if (user.getUserType().equals("admin")) {
                    response.sendRedirect("admin.jsp");
                } else if (user.getUserType().equals("normal")) {
                    response.sendRedirect("normal.jsp");
                }else{
                     out.println("<h1>we have not identified user type <h1>");
                }
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
