/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.util.ArrayList;
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
import utils.EmailValidator;
import utils.HibernateUtil;
import utils.MailSender;

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
    String site = "http://localhost:8080/WebShop/activate.jsp";
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            String name = request.getParameter("name");
            String lastname = request.getParameter("lastname");
            String email = request.getParameter("email");
            String username = request.getParameter("username");
            String address = request.getParameter("address");
            String password = request.getParameter("password");
            String token="";
            Random rand = new Random();
            
            for(int i=0; i<71;i++){
                token+=rand.nextInt(10);
            }
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");      
            out.println("<link href=menustuff/styles/bootstrap.min.css rel=stylesheet>");      
            out.println("<title>Rejestracja</title>");            
            out.println("</head>");
            out.println("<body>");
            if(name.equals("")|| lastname.equals("")|| email.equals("")|| username.equals("")|| address.equals("")|| password.equals("")){
                out.println("<h1>Uzupelnij wszystkie pola danymi!</h1>");
                out.println("<script>alert(Uzupelnij wszystkie pola danymi!);</script>");
                out.println("<meta http-equiv=\"refresh\" content=\"5; url=register.jsp\"/>");
                out.println("</body>");
                out.println("</html>");
                return;
            }
            EmailValidator emailValidator = new EmailValidator();
            if(!emailValidator.validate(email)){
                out.println("<h1>Podales nieprawidlowy email!</h1>");
                out.println("<script>alert(Podales nieprawidlowy email!);</script>");
                out.println("<meta http-equiv=\"refresh\" content=\"5; url=register.jsp\"/>");
                out.println("</body>");
                out.println("</html>");
                return;
            }
            
            Accounts account = new Accounts(username, password, name, lastname, address, email, token);
            account.setActivated("N");
            Session session = HibernateUtil.getSessionFactory().openSession();
            Transaction transaction = session.beginTransaction();
            List<String> list = getListOfUsername(username, email);
            if(!list.isEmpty()){
                out.println("<script>alert(Ten email lub nazwa uzytkownika juz zajeta!);</script>");
                out.println("<meta http-equiv=\"refresh\" content=\"5; url=register.jsp\"/>");
                out.println("<h1>Ten email lub nazwa uzytkownika juz zajeta!</h1>");
                out.println("</body>");
                out.println("</html>");
                return;
            }
            out.println("<h1>Zostales pomyslnie zarejestrowany!</h1>");
            out.println("<h1>Sprawdz swoja skrzynke email po klucz aktywacyjny.</h1>");
            out.println("<meta http-equiv=\"refresh\" content=\"10; url=activate.jsp\"/>");
            //out.println("token to "+token);
            //out.println("<h1>Servlet Register at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
            out.close();
            session.save(account);
            transaction.commit();
            //new MailSender("localhost","grzegorz2047@tlen.pl",account.getEmail(),"Token aktywacyjny to \n"+token+"\n Aby aktywowac konto wejdz na te strone:\n"+site,"Aktywacja konta");
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
    public List<String> getListOfUsername(String username, String email){
        List<String> list = new ArrayList<String>();
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = null;        
        try {
            tx = session.getTransaction();
            tx.begin();
            
            Query query = session.createQuery("select a.username from Accounts a WHERE a.username='"+username+"' OR a.email='"+email+"'");
            list = query.list();
            tx.commit();
        } catch (Exception e) {
            if (tx != null) {
                tx.rollback();
            }
            e.printStackTrace();
        } finally {
            session.close();
        }
        return list;
    }
}
