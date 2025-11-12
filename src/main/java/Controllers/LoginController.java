/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controllers;

import DAOs.AccountDAO;
import DAOs.CustomerDAO;
import DAOs.StaffDAO;
import Models.Account;
import Models.Customer;
import Models.Staff;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 *
 * @author Dell
 */
public class LoginController extends HttpServlet {

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
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet LoginController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet LoginController at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
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
        String path = request.getRequestURI();
        if (path.endsWith("/LoginController")) {
            request.getRequestDispatcher("LoginForm.jsp").forward(request, response);
        }
//        else {
//            if (path.endsWith("/LoginController/Create")) {
//                request.getRequestDispatcher("/createAcc.jsp").forward(request, response);
//            }
//        }
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
        HttpSession session = request.getSession();//tao session

        AccountDAO dao = new AccountDAO();
        CustomerDAO cusDao = new CustomerDAO();
        StaffDAO staffDao = new StaffDAO();
        if (request.getParameter("btnLogin") != null) {//kiem tra xem co bam nut co name = btnSubmit chua
            // btnSubmit la nut login
            String us = request.getParameter("txtUS");//lay gia tri cua bien co ten "txtUS",
            //la username cua form login
            String pw = request.getParameter("txtPwd");//lay gia tri cua bien co ten "txtPud",
            //la password cua form login
            Account acc = dao.getAccount(us, pw);
            if (acc != null) {
                Customer cus = cusDao.getCustomer(acc.getAcc_id());
                if (cus != null) {

                    session.setAttribute("account", cus);

                    response.sendRedirect("HomeController");

                } else {
                    Staff staff = staffDao.getStaff(acc.getAcc_id());
                    if (staff != null) {
                        session.setAttribute("staff", staff);

                        response.sendRedirect("/ChartController/Chart");
                    } else {
                        session.setAttribute("fail", "Không tìm thấy tài khoản!");
                        response.sendRedirect("/LoginController");
                    }
                }
            } else {
                session.setAttribute("fail", "Không tìm thấy tài khoản!");
                response.sendRedirect("/LoginController");
            }

        }
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
