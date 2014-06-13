/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.util.List;
import java.util.Random;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import sql.tables.Accounts;
import utils.HibernateUtil;

/**
 *
 * @author User
 */
@WebServlet(name = "Register", urlPatterns = {"/Register"})
public class RegisterServlet extends HttpServlet {

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
            String name = request.getParameter("name");
            String lastname = request.getParameter("lastname");
            String email = request.getParameter("email");
            String nickname = request.getParameter("username");
            String address = request.getParameter("address");
            String password = request.getParameter("password");
            String token="";
            Random rand = new Random();
            
            for(int i=0; i<71;i++){
                token+=rand.nextInt(10);
            }
            Accounts account = new Accounts(nickname, password, name, lastname, address, email, token);
            account.setActivated("N");
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Rejestracja</title>");            
            out.println("</head>");
            out.println("<body>");
            if(name.equals("")|| lastname.equals("")|| email.equals("")|| nickname.equals("")|| address.equals("")|| password.equals("")){
                out.println("<script>alert(Uzupenij wszystkie pola danymi!);</script>");
                out.println("<meta http-equiv=\"refresh\" content=\"0; url=WebShop/register.jsp\"/>");
                out.println("</body>");
                out.println("</html>");
                return;
            }
            Session session = HibernateUtil.getSessionFactory().getCurrentSession();
            Transaction transaction = session.beginTransaction();
            Query query = session.createQuery("Select A.username from Accounts A where A.username = :username ");
            query.setParameter("username", account.getUsername());
            List list = query.list();
            if(!list.isEmpty()){
                out.println("<script>alert(Ta nazwa uzytkownika juz istnieje!);</script>");
            }
            out.println("<h1>Pomyslnie zostales zarejestrowany!</h1>");
            out.println("<h1>Sprawdz swoja skrzynke email po klucz aktywacyjny.</h1>");
            out.println("token to "+token);
            //out.println("<h1>Servlet Register at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
            session.save(account);
            transaction.commit();
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
