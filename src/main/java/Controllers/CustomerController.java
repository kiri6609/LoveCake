/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controllers;

import DAOs.AccountDAO;
import DAOs.CustomerDAO;
import DAOs.NewsDAO;
import DAOs.ProductDAO;
import Models.Account;
import Models.Customer;
import Models.News;
import Models.Product;
import Models.Staff;
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
@WebServlet(name = "CustomerController", urlPatterns = {"/CustomerController"})
public class CustomerController extends HttpServlet {

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
            out.println("<title>Servlet CustomerController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CustomerController at " + request.getContextPath() + "</h1>");
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
        HttpSession session = request.getSession();//tao session
        String path = request.getRequestURI();
        Staff staff = (Staff) request.getSession().getAttribute("staff");
        if (staff != null) {
            if (path.endsWith("/CustomerController/Create")) {
                request.getRequestDispatcher("/AddCusAdmin.jsp").forward(request, response);
            } else if (path.endsWith("/CustomerController/DeleteCusAdmin")) {
                int cus_id = Integer.parseInt(request.getParameter("cus_id"));
                CustomerDAO acdao = new CustomerDAO();
                Customer cuss = acdao.getCustomer(cus_id);
                request.setAttribute("username", cuss.getUsername());
                request.setAttribute("password", cuss.getPassword());
                request.setAttribute("fullname", cuss.getFullname());
                request.setAttribute("avatar", cuss.getAvatar());
                request.setAttribute("phone_number", cuss.getPhone_number());
                request.setAttribute("email", cuss.getEmail());
                request.setAttribute("code_reset", cuss.getCode_reset());
                request.setAttribute("isDelete", cuss.getIsDelete());
                request.setAttribute("acc_id", cuss.getAcc_id());
                request.setAttribute("cus_id", cuss.getCus_id());

                request.getRequestDispatcher("/DeleteCusAdmin.jsp").forward(request, response);
            }
        }

        if (path.endsWith("/CustomerController/ok")) {
            request.getRequestDispatcher("/ok.jsp").forward(request, response);
        } else if (path.endsWith("CustomerController/listNews")) {
            NewsDAO newsDAO = new NewsDAO();

            LinkedList<News> listNewsTop5 = newsDAO.getTop5News();
            LinkedList<News> listNewsTop3 = newsDAO.getTop3News();
            request.setAttribute("listNewsTop5", listNewsTop5);
            request.setAttribute("listNewsTop3", listNewsTop3);

            request.getRequestDispatcher("/listAllNews.jsp").forward(request, response);
        } else if (path.endsWith("CustomerController/newsDetail")) {
            ProductDAO proDAO = new ProductDAO();
            LinkedList<Product> product = proDAO.getTop4Pro();

            int news_id = Integer.parseInt(request.getParameter("news_id"));
            NewsDAO newsDAO = new NewsDAO();
            News news = newsDAO.getNews(news_id);
            request.setAttribute("news", news);
            request.getRequestDispatcher("/newsDetail.jsp").forward(request, response);

        } else if (path.endsWith("CustomerController/aboutUs")) {
            request.getRequestDispatcher("/about.jsp").forward(request, response);
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
        CustomerDAO cdao = new CustomerDAO();
        AccountDAO acdao = new AccountDAO();
//        AccountDAO acdao = new AccountDAO();
        CustomerDAO cusdao = new CustomerDAO();
        Account as = (Account) request.getSession().getAttribute("account");
        Customer cs = (Customer) request.getSession().getAttribute("account");
        String usern = request.getParameter("user");
        LinkedList<String> listUsername = acdao.getAllUserName();
        for (String s : listUsername) {
            if (s.equals(usern)) {
                response.setContentType("text/html");
                PrintWriter out = response.getWriter();
                out.print("Tên đăng nhập này đã tồn tại!");
                break;
            }
        }

        String emailUser = request.getParameter("email");
        LinkedList<String> listEmail = acdao.getAllEmail();
        for (String s : listEmail) {
            if (s.equals(emailUser)) {
                response.setContentType("text/html");
                PrintWriter out = response.getWriter();
                out.print("Địa chỉ email này đã tồn tại!");
                break;
            }
        }

//        check duplicate username
        String userPhone = request.getParameter("phone");
        LinkedList<String> listPhone = acdao.getAllPhone();
        for (String s : listPhone) {
            if (s.equals(userPhone)) {
                response.setContentType("text/html");
                PrintWriter out = response.getWriter();
                out.print("Số điện thoại này đã tồn tại!");
                break;
            }
        }

        if (request.getParameter("btnAddNews") != null) {
            String fileName = null;
            try {
                Part part = request.getPart("avatar");
                String realPart = request.getServletContext().getRealPath("/images");

                fileName = Paths.get(part.getSubmittedFileName())
                        .getFileName().toString();

                System.out.println("hinh :" + fileName);

                if (fileName == null || fileName.equals("")) {
                    fileName = "no_image.png";
                }

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
            String password = request.getParameter("pass");
            Account acc = new Account(0, username, password, fullname, phone, email, 0, 0);
            int acc_id = acdao.createAcc(acc);
            if (acc_id != 0) {
                Customer cus = new Customer(0, acc_id, username, password, fullname, "images/" + fileName, phone, email, 0, 0);
                int createCus = cusdao.createCus(cus);
                if (createCus != 0) {

                    response.sendRedirect("/AdminController/adminListCustomer");
                } else {
                    response.sendRedirect("/CustomerController");
                }

            } else {
                response.sendRedirect("/CustomerController");
            }
        }
//        if (request.getParameter("btnDeleteCus") != null) {
//
//            int cusId = Integer.parseInt(request.getParameter("cus_id"));
//            int accId = Integer.parseInt(request.getParameter("acc_id"));
//
//            System.out.println("account id : " + accId);
//            System.out.println("cus id : " + cusId);
//
//            try {
//                int deleteC = cdao.deleteCus(cusId);
//                int deleteA = acdao.deleteAcc(accId);
//                if (deleteC > 0 && deleteA > 0) {
//                    System.out.println("Xoa acc cus thanh cong");
//                    response.sendRedirect("/AdminController/adminListCustomer");
//                } else {
//                    response.sendRedirect("/AdminController/adminListCustomer");
//
//                }
//            } catch (Exception e) {
//                // Xử lý exception tùy ý
//                e.printStackTrace();
//                response.getWriter().println("An error occurred.");
//            }
//
//        }

        if (request.getParameter("btnDeleteCus") != null) {
            System.out.println("done connect");

            int accId = Integer.valueOf(request.getParameter("acc_id"));
            int cusId = Integer.valueOf(request.getParameter("cus_id"));

            Customer cus = cdao.getCustomer(accId);

            System.out.println("account id : " + accId);
            System.out.println("cus id : " + cusId);

            int resultAcc = acdao.deleteAccAdmin(accId);
            int resultCus = cdao.deleteCusAdmin(cusId);

            System.out.println("ok update account");
            if (resultAcc > 0 && resultCus > 0) {

                session.setAttribute("account", cus);
                response.sendRedirect("/AdminController/adminListCustomer");
            } else {
                session.setAttribute("fail", "That bai");
                response.sendRedirect("/AdminController/adminListCustomer");
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
