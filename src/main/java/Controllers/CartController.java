/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controllers;

import DAOs.CartDAO;
import DAOs.ProductDAO;
import Models.Cart;
import Models.Customer;
import Models.Product;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.SQLException;
import java.util.LinkedList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Dell
 */
public class CartController extends HttpServlet {

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
            out.println("<title>Servlet CartController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CartController at " + request.getContextPath() + "</h1>");
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
        CartDAO cdao = new CartDAO();
        ProductDAO pdao = new ProductDAO();
        String path = request.getRequestURI();
        Customer customer = (Customer) request.getSession().getAttribute("account");
        if (customer != null) {
            if (path.endsWith("/CartController")) {
                Customer cus = (Customer) request.getSession().getAttribute("account");
                System.out.println(cus.getCus_id());
                LinkedList<Cart> listCart = null;
                try {
                    listCart = cdao.getAllCarts(cus.getCus_id());
                } catch (SQLException ex) {
                    Logger.getLogger(CartController.class.getName()).log(Level.SEVERE, null, ex);
                }
                System.out.println(listCart);
                request.setAttribute("listCart", listCart);
                request.getRequestDispatcher("/cart.jsp").forward(request, response);
            } else if (path.startsWith("/CartController/delete/")) {
                Customer cus = (Customer) request.getSession().getAttribute("account");
                String[] s = path.split("/");
                int pro_id = Integer.parseInt(s[s.length - 1]);
                int isDelete = cdao.delete(cus.getCus_id(), pro_id);

                if (isDelete != 0) {
                    response.sendRedirect("/CartController");
                } else {
                    response.sendRedirect("/CartController");
                }
            } else if (path.startsWith("/CartController/decreaseQuantity/")) {
                Customer cus = (Customer) request.getSession().getAttribute("account");
                String[] s = path.split("/");

                int proId = Integer.parseInt(s[s.length - 1]);
                int current_quantity = cdao.getCurrentQuantity(cus.getCus_id(), proId);

                if ((current_quantity - 1) == 0) {
                    response.sendRedirect("/CartController");
                } else {
                    int isUpdateDecrease = cdao.updateQuantityCart(cus.getCus_id(), proId, current_quantity - 1);
                    Cart cart = cdao.getCartByProAndCusID(cus.getCus_id(), proId);
                    Product product = pdao.getProById(proId);
                    if (isUpdateDecrease != 0) {
                        double new_price = 0;
                        if (product.getPro_price() > product.getDiscount()) {
                            new_price = product.getDiscount() * cart.getPro_quantity();
                        } else {
                            new_price = product.getPro_price() * cart.getPro_quantity();
                        }
                        int isUpdatePrice = cdao.updatePriceCart(cus.getCus_id(), proId, new_price);
                        response.sendRedirect("/CartController");
                    } else {
                        response.sendRedirect("/CartController");
                    }
                }
            } else if (path.startsWith("/CartController/increaseQuantity/")) {
                Customer cus = (Customer) request.getSession().getAttribute("account");
                String[] s = path.split("/");

                int proId = Integer.parseInt(s[s.length - 1]);
                int current_quantity = cdao.getCurrentQuantity(cus.getCus_id(), proId);
                Product product = pdao.getProById(proId);

                if ((current_quantity + 1) > product.getPro_quantity()) {
                    response.sendRedirect("/CartController");
                } else {
                    int isUpdateDecrease = cdao.updateQuantityCart(cus.getCus_id(), proId, current_quantity + 1);
                    Cart cart = cdao.getCartByProAndCusID(cus.getCus_id(), proId);

                    if (isUpdateDecrease != 0) {
                        double new_price = 0;
                        if (product.getPro_price() > product.getDiscount()) {
                            new_price = product.getDiscount() * cart.getPro_quantity();
                        } else {
                            new_price = product.getPro_price() * cart.getPro_quantity();
                        }

                        int isUpdatePrice = cdao.updatePriceCart(cus.getCus_id(), proId, new_price);
                        System.out.println(cart.getCart_price());
                        response.sendRedirect("/CartController");
                    } else {
                        response.sendRedirect("/CartController");
                    }
                }

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
        if (request.getParameter("btnBuyInCart") != null) {
            String s[] = request.getParameterValues("checkBoxID");
            request.getSession().setAttribute("listCheckCart", s);
            response.sendRedirect("/OrderController/BuyInCart");
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
