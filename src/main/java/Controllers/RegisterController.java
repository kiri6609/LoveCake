/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controllers;

import DAOs.AccountDAO;
import DAOs.CustomerDAO;
import Models.Account;
import Models.Customer;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.LinkedList;

/**
 *
 * @author Dell
 */
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 2,
        maxFileSize = 1024 * 1024 * 10,
        maxRequestSize = 1024 * 1024 * 50
)
@WebServlet(name = "RegisterController", urlPatterns = {"/RegisterController"})
public class RegisterController extends HttpServlet {

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
            out.println("<title>Servlet RegisterController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet RegisterController at " + request.getContextPath() + "</h1>");
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
        if (path.endsWith("/RegisterController")) {
            request.getRequestDispatcher("registerCustomerForm.jsp").forward(request, response);
        }
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
        HttpSession session = request.getSession();

        AccountDAO accdao = new AccountDAO();
        CustomerDAO cusdao = new CustomerDAO();

        String usern = request.getParameter("user");
        LinkedList<String> listUsername = accdao.getAllUserName();
        for (String s : listUsername) {
            if (s.equals(usern)) {
                response.setContentType("text/html");
                PrintWriter out = response.getWriter();
                out.print("Tên đăng nhập này đã tồn tại!");
                break;
            }
        }

        String emailUser = request.getParameter("email");
        LinkedList<String> listEmail = accdao.getAllEmail();
        for (String s : listEmail) {
            if (s.equals(emailUser)) {
                response.setContentType("text/html");
                PrintWriter out = response.getWriter();
                out.print("Email này đã tồn tại!");
                break;
            }
        }

//        check duplicate username
        String userPhone = request.getParameter("phone");
        LinkedList<String> listPhone = accdao.getAllPhone();
        for (String s : listPhone) {
            if (s.equals(userPhone)) {
                response.setContentType("text/html");
                PrintWriter out = response.getWriter();
                out.print("Số điện thoại này đã tồn tại!");
                break;
            }
        }

        if (request.getParameter("register") != null) {
            String fileName = null;
            try {
                Part part = request.getPart("avatar");
                String realPart = request.getServletContext().getRealPath("/images");

                fileName = Paths.get(part.getSubmittedFileName())
                        .getFileName().toString();
                if (!Files.exists(Paths.get(realPart))) {
                    Files.createDirectory(Paths.get(realPart));
                }
                part.write(realPart + "/" + fileName);
            } catch (Exception e) {
            }
            String fullname = request.getParameter("fullname");
            String email = request.getParameter("email");
            String phone = request.getParameter("phone");
            String username = request.getParameter("username");
            String passowrd = request.getParameter("password");
            Account acc = new Account(0, username, passowrd, fullname, phone, email, 0, 0);
            int acc_id = accdao.createAcc(acc);
            if (acc_id != 0) {
                Customer cus = new Customer(0, acc_id, username, passowrd, fullname, "images/" + fileName, phone, email, 0, 0);
                int createCus = cusdao.createCus(cus);
                if (createCus != 0) {
                    response.sendRedirect("/LoginController");
                } else {
                    response.sendRedirect("/RegisterController");
                }

            } else {
                response.sendRedirect("/RegisterController");
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
