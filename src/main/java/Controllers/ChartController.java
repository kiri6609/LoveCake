/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controllers;

import DAOs.OrderDAO;
import DAOs.OrderDetailDAO;
import Models.Chart;
import Models.Staff;
import Models.chartPro;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;

/**
 *
 * @author Vu Minh Uyen
 */
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 2,
        maxFileSize = 1024 * 1024 * 10,
        maxRequestSize = 1024 * 1024 * 50
)
@WebServlet(name = "ChartController", urlPatterns = {"/ChartController"})
public class ChartController extends HttpServlet {

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
            out.println("<title>Servlet ChartController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ChartController at " + request.getContextPath() + "</h1>");
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
        HttpSession session = request.getSession();
        OrderDAO chartDAO = new OrderDAO();
        String path = request.getRequestURI();
        Staff staff = (Staff) request.getSession().getAttribute("staff");
        if (staff != null) {
            OrderDetailDAO chartOrderDetailDAO = new OrderDetailDAO();
            List<chartPro> chartDataListProduct = chartOrderDetailDAO.getChartDataProduct();//BIỂU ĐỒ 2 : thống kê sản phẩm đã bán từ trước đến nay
            List<chartPro> chartDataListDay = chartOrderDetailDAO.getChartDataDay();// BIỂU ĐỒ 3  : thống kê sản phẩm theo tất cả các ngày từ trước đến nay
            request.setAttribute("ChartDataProduct", chartDataListProduct);
            request.setAttribute("ChartDataProductDay", chartDataListDay);
            if (path.endsWith("/ChartController/Chart")) {   //BIỂU ĐỒ 1  : không chọn tháng,năm....  Ấn nút 'Biểu đồ chung'
                List<Chart> chartDataList = chartDAO.getChartData();     
                request.setAttribute("chartData", chartDataList);

                request.getRequestDispatcher("/chart.jsp").forward(request, response);

                
                
                //Chọn năm và ấn nút 'Biểu đồ năm'
            } else if (path.endsWith("/ChartController/ChartYear")) { //BIỂU ĐỒ 1  : Có chọn năm - Ấn nút 'Biểu đồ năm'
//            List<Chart> chartDataList = chartDAO.getChartData();
//            OrderDAO chartDAO = new OrderDAO();
                int year = Integer.parseInt(session.getAttribute("year").toString());
                List<Chart> chartDataListY = chartDAO.getMonthInYear(year);
                request.setAttribute("chartData", chartDataListY);
                request.setAttribute("selectedYear", year);
//            response.sendRedirect("/ChartController/ChartYear");
                request.setAttribute("chartData", chartDataListY);
                request.getRequestDispatcher("/chart.jsp").forward(request, response);

            } else if (path.endsWith("/ChartController/ChartMonth")) { //BIỂU ĐỒ 1 : Có chọn năm , tháng - Ấn nút 'Biểu đồ tháng'
                int yearM = Integer.parseInt(session.getAttribute("yearM").toString());
                int month = Integer.parseInt(session.getAttribute("month").toString());
//            List<Chart> chartDataList = chartDAO.getChartData();
                List<Chart> chartDataListM = chartDAO.getMonthInMonth(yearM, month);
                request.setAttribute("chartData", chartDataListM);
                request.setAttribute("selectedYear", yearM);
                request.setAttribute("selectedMonth", month);
                request.setAttribute("chartData", chartDataListM);
                request.getRequestDispatcher("/chart.jsp").forward(request, response);

            }
        }else{
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
        if (request.getParameter("xemBieuDo") != null) {
            OrderDAO chartDAO = new OrderDAO();
            int year = Integer.parseInt(request.getParameter("year"));
//            List<Chart> chartDataListY = chartDAO.getMonthInYear(year);
//            request.setAttribute("chartData", chartDataListY);
//            request.setAttribute("selectedYear", year);
            session.setAttribute("year", year);
            response.sendRedirect("/ChartController/ChartYear");

        } else if (request.getParameter("xemBieuDoThang") != null) {
            OrderDAO chartDAO = new OrderDAO();
            int yearM = Integer.parseInt(request.getParameter("year"));
            int month = Integer.parseInt(request.getParameter("month"));

            session.setAttribute("yearM", yearM);
            session.setAttribute("month", month);
            response.sendRedirect("/ChartController/ChartMonth");
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
