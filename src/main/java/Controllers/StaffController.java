/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controllers;

import DAOs.AccountDAO;
import DAOs.CustomerDAO;
import DAOs.StaffDAO;
import Models.Account;
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
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.LinkedList;

/**
 *
 * @author Admin
 */
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 2,
        maxFileSize = 1024 * 1024 * 10,
        maxRequestSize = 1024 * 1024 * 50
)
@WebServlet(name = "StaffController", urlPatterns = {"/StaffController"})
public class StaffController extends HttpServlet {

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
            out.println("<title>Servlet StaffController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet StaffController at " + request.getContextPath() + "</h1>");
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
        String url = request.getRequestURI();
        StaffDAO sdao = new StaffDAO();
        Staff stafff = (Staff) request.getSession().getAttribute("staff");
        if (stafff != null) {
            if (url.endsWith("/StaffController")) {
                request.getRequestDispatcher("/profileStaff.jsp").forward(request, response);
            } else if (url.startsWith("/StaffController/DetailStaff")) {
                String[] s = url.split("/");
                int staffId = Integer.parseInt(s[s.length - 1]);
                Staff staff = sdao.getStaffById(staffId);

                session.setAttribute("getStaff", staff);
                request.getRequestDispatcher("/DetailStaff.jsp").forward(request, response);
            } else if (url.startsWith("/StaffController/EditStaff")) {
                String[] s = url.split("/");
                int staffId = Integer.parseInt(s[s.length - 1]);
                Staff staff = sdao.getStaffById(staffId);

                session.setAttribute("getStaff", staff);
                request.getRequestDispatcher("/EditStaff.jsp").forward(request, response);
            } else if (url.startsWith("/StaffController/DeleteStaff")) {
                String[] s = url.split("/");
                int staffId = Integer.parseInt(s[s.length - 1]);
                Staff staff = sdao.getStaffById(staffId);

                session.setAttribute("getStaff", staff);
                request.getRequestDispatcher("/DeleteStaff.jsp").forward(request, response);
            } else if (url.endsWith("/StaffController/Create")) {
                request.getRequestDispatcher("/AddnewStaff.jsp").forward(request, response);
            }
        } else {
            response.sendRedirect("/LoginController");
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
        StaffDAO sdao = new StaffDAO();
        AccountDAO adao = new AccountDAO();
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");


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

        String emailStaff = request.getParameter("email");
        LinkedList<String> listEmail = accdao.getAllEmail();
        for (String s : listEmail) {
            if (s.equals(emailStaff)) {
                response.setContentType("text/html");
                PrintWriter out = response.getWriter();
                out.print("Địa chỉ email này đã tồn tại!");
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
        
        
        
        if (request.getParameter("btnAddStaff") != null) {

            String username = request.getParameter("user");
            String password = request.getParameter("pass");
            String fullname = request.getParameter("fullname");
            String phone = request.getParameter("phone");
            String email = request.getParameter("email");
            Date birthday = Date.valueOf(request.getParameter("birthday"));
            String gender = request.getParameter("gender");
            String address = request.getParameter("address");
            String position = request.getParameter("position");
            Date begin_work = Date.valueOf(request.getParameter("daywork"));

            Account acc = new Account(0, username, password, fullname, phone, email, 0, 0);
            int acc_id = adao.createAcc(acc);

            if (acc_id != 0) {
                Staff staff = new Staff(0, acc_id, acc.getUsername(), acc.getPassword(), acc.getFullname(), acc.getPhone_number(), acc.getEmail(), birthday, gender, address, position, begin_work, 0, 0);
                Staff new_staff = sdao.addNewStaff(staff);

                if (new_staff != null) {
                    response.sendRedirect("/AdminController/adminListStaff");
                } else {
                    response.sendRedirect("/StaffController/Create");
                }
            }
        }

        if (request.getParameter("btnEditStaff") != null) {
            int staff_id = Integer.parseInt(request.getParameter("idStaff"));
            int acc_id = Integer.parseInt(request.getParameter("idAcc"));

            String username = request.getParameter("username");
            String password = request.getParameter("password");
            String fullname = request.getParameter("fullname");
            String phone = request.getParameter("phone");
            String email = request.getParameter("email");
            Date birthday = Date.valueOf(request.getParameter("birthday"));
            String gender = request.getParameter("gender");
            String address = request.getParameter("address");
            String position = request.getParameter("position");
            Date begin_work = Date.valueOf(request.getParameter("begin_work"));

            Staff staff = new Staff(username, password, fullname, phone, email, birthday, gender, address, position, begin_work);
            Staff new_staff = sdao.editStaff(staff_id, staff);

            if (new_staff != null) {
                Account acc = new Account(username, password, fullname, phone, email);
                Account new_acc = adao.updateAccStaff(acc_id, acc);

                response.sendRedirect("/AdminController/adminListStaff");
            } else {
                response.sendRedirect("/StaffController/EditStaff/" + staff_id);
            }
        }

        if (request.getParameter("btnDeleteStaff") != null) {
            int staff_id = Integer.parseInt(request.getParameter("idStaff"));
            int acc_id = Integer.parseInt(request.getParameter("idAcc"));
            long millis = System.currentTimeMillis();
            java.sql.Date current = new java.sql.Date(millis);

            if (sdao.isDelete(staff_id, current)) {
                if (adao.isDelete(acc_id, current)) {
                    response.sendRedirect("/AdminController/adminListStaff");
                }
            } else {
                response.sendRedirect("/StaffController/DeleteStaff/" + staff_id);
            }
        }

        Staff ss = (Staff) request.getSession().getAttribute("staff");

        String phoneNumber = ss.getPhone_number();
        String email = ss.getEmail();
        String username = ss.getUsername();

        CustomerDAO cdao = new CustomerDAO();

        if (request.getParameter(
                "btnChangePassStaff") != null) {

            System.out.println("done connect");
            String oldPassword = request.getParameter("oldPass");

            String newPassword = request.getParameter("newP");
            String newPasswordHashed = Utils.Hashing.getMd5(newPassword);

            String confirmPassword = request.getParameter("confirm");

            if (!adao.checkPassword(oldPassword)) {
                session.setAttribute("duplicateError", "PassError");
                response.sendRedirect("/StaffController");
                return;
            }

            System.out.println("done check OldPass");

            String fullname = ss.getFullname();

            String gender = ss.getGender();
            String address = ss.getAddress();
            String position = ss.getPosition();
            Date birthday = ss.getBirthday();
            Date begin = ss.getBegin_work();
            Date end = ss.getEnd_work();
            int accId = ss.getAcc_id();
            int staffId = ss.getStaff_id();

            System.out.println(username + ".." + accId);

            Account acdc = new Account(accId, username, newPasswordHashed, fullname, phoneNumber, email, 0, 0);
            Staff sss = new Staff(staffId, accId, username, newPasswordHashed, fullname, phoneNumber, email, birthday, gender, address, position, begin, end, 0, 0);

            System.out.println("day");
            int resultAcc = adao.updateAcc(acdc);
            int resultSS = sdao.updateStaff(sss);

            System.out.println("ok update account");
            if (resultAcc > 0 && resultSS > 0) {

                response.sendRedirect("/StaffController");

            } else {

                //thất bại
                session.setAttribute("failll", "thất bại");
                response.sendRedirect("/StaffController");
            }
        }
        if (request.getParameter("btnUpdatefStaff") != null) {
            String emailUser = request.getParameter("email");
            String usernameUser = request.getParameter("username");
            String phoneUser = request.getParameter("phone");
            // Kiểm tra xem email đã tồn tại trong bảng Account hay không
            boolean emailExists = false;
            boolean phoneExists = false;
            boolean usernameExists = false;

            if (emailUser.equals(email)) {
                // Nếu email nhập vào giống với email trong session
                if (!phoneUser.equals(phoneNumber)) {
                    // Kiểm tra xem số điện thoại hoặc username đã tồn tại trong bảng Account hay không
                    phoneExists = adao.checkPhoneExists(phoneUser);
//                    usernameExists = adao.checkUsernameExists(usernameUser);
                }
            } else {
                // Nếu email nhập vào khác với email trong session
                emailExists = adao.checkEmailExists(emailUser);
                if (!phoneUser.equals(phoneNumber)) {
                    // Kiểm tra xem số điện thoại hoặc username đã tồn tại trong bảng Account hay không
                    phoneExists = adao.checkPhoneExists(phoneUser);
//                    usernameExists = adao.checkUsernameExists(usernameUser);
                }
            }

            if (emailExists && phoneExists) {
                session.setAttribute("phoneCk", phoneUser);
                session.setAttribute("emailCk", emailUser);
                session.setAttribute("emailCk", usernameUser);
                session.setAttribute("duplicateError", "both");
                response.sendRedirect("/StaffController");
            } else if (usernameExists) {
                session.setAttribute("usernameUserCk", usernameUser);
                session.setAttribute("duplicateError", "username");
                response.sendRedirect("/StaffController");
            } else if (emailExists) {
                session.setAttribute("emailCk", emailUser);
                session.setAttribute("duplicateError", "email");
                response.sendRedirect("/StaffController");
            } else if (phoneExists) {
                session.setAttribute("phoneCk", phoneUser);
                System.out.println("ph..." + phoneUser);
                session.setAttribute("duplicateError", "phone");
                response.sendRedirect("/StaffController");
            } else {

                // Nếu email không tồn tại, tiến hành cập nhật dữ liệu trong cả hai bảng
                // Thực hiện các thao tác cập nhật dữ liệu
                String fullnameU = request.getParameter("fullname");
                String emailU = request.getParameter("email");
                String phoneU = request.getParameter("phone");
                String addressU = request.getParameter("address");
                Date birthdayU = Date.valueOf(request.getParameter("birthday"));
                Date beginU = ss.getBegin_work();
                Date endU = ss.getEnd_work();
                int accId = ss.getAcc_id();
                int staffId = ss.getStaff_id();
                String gender = ss.getGender();
                String password = ss.getPassword();
                String positionU = ss.getPosition();

                Account acdc = new Account(accId, username, password, fullnameU, phoneU, emailU, 0, 0);
                Staff sss = new Staff(staffId, accId, username, password, fullnameU, phoneU, emailU, birthdayU, gender, addressU, positionU, beginU, endU, 0, 0);

                // Thực hiện cập nhật dữ liệu trong cả hai bảng
                int resultAcc = adao.updateAcc(acdc);
                int resultStt = sdao.updateStaff(sss);

                // Kiểm tra kết quả của các câu lệnh SQL và xử lý kết quả
                if (resultAcc > 0 && resultStt > 0) {
                    session.setAttribute("staff", sss);
                    response.sendRedirect("/StaffController");
                } else {
                    session.setAttribute("fail", "That bai");
                    response.sendRedirect("/StaffController");
                }

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
