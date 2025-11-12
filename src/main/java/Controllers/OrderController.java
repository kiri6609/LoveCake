/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controllers;

import DAOs.CartDAO;
import DAOs.CustomerDAO;
import DAOs.OrderDAO;
import DAOs.OrderDetailDAO;
import DAOs.OrderStatusHistoryDAO;
import DAOs.ProductDAO;
import Models.Cart;
import Models.Customer;
import Models.Order;
import Models.OrderDetail;
import Models.OrderStatusHistory;
import Models.Product;
import Models.Staff;
import config.Config;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collections;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.TimeZone;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author PC
 */
public class OrderController extends HttpServlet {

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
            out.println("<title>Servlet OrderController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet OrderController at " + request.getContextPath() + "</h1>");
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
        Staff staff  = (Staff) request.getSession().getAttribute("staff");
        Customer customer = (Customer) request.getSession().getAttribute("account");
        if (staff != null) {
            if (path.startsWith("/OrderController/OrderDetailAdmin/")) {
                String s[] = path.split("/");
                int orderID = Integer.parseInt(s[s.length - 1]);
                OrderDAO oDAO = new OrderDAO();
                OrderDetailDAO odDAO = new OrderDetailDAO();
                CustomerDAO cuDAO = new CustomerDAO();

                Order getOrderByID = oDAO.getOrderByID(orderID);
                LinkedList<OrderDetail> odList = odDAO.getAllOrderDetailsByOrderID(orderID);
                Customer cus = cuDAO.getCustomerByCusID(getOrderByID.getCus_id());

                request.setAttribute("getOrderByID", getOrderByID);
                request.setAttribute("odList", odList);
                request.setAttribute("cus", cus);
                request.getRequestDispatcher("/orderDetailAdmin.jsp").forward(request, response);
            } else if (path.startsWith("/OrderController/UpdateOrderAdmin/")) {
                String s[] = path.split("/");
                int orderID = Integer.parseInt(s[s.length - 1]);
                OrderDAO oDAO = new OrderDAO();
                OrderDetailDAO odDAO = new OrderDetailDAO();
                CustomerDAO cuDAO = new CustomerDAO();

                Order getOrderByID = oDAO.getOrderByID(orderID);
                LinkedList<OrderDetail> odList = odDAO.getAllOrderDetailsByOrderID(orderID);
                Customer cus = cuDAO.getCustomerByCusID(getOrderByID.getCus_id());

                request.setAttribute("getOrderByID", getOrderByID);
                request.setAttribute("odList", odList);
                request.setAttribute("cus", cus);
                request.getRequestDispatcher("/EditOrderForm.jsp").forward(request, response);
            } else if (path.startsWith("/OrderController/DeleteOrderAdmin/")) {
                String s[] = path.split("/");
                int orderID = Integer.parseInt(s[s.length - 1]);
                OrderDAO oDAO = new OrderDAO();
                OrderDetailDAO odDAO = new OrderDetailDAO();
                CustomerDAO cuDAO = new CustomerDAO();

                Order getOrderByID = oDAO.getOrderByID(orderID);
                LinkedList<OrderDetail> odList = odDAO.getAllOrderDetailsByOrderID(orderID);
                Customer cus = cuDAO.getCustomerByCusID(getOrderByID.getCus_id());

                request.setAttribute("getOrderByID", getOrderByID);
                request.setAttribute("odList", odList);
                request.setAttribute("cus", cus);
                request.getRequestDispatcher("/DeleteOrderForm.jsp").forward(request, response);
            }
        } else if (customer != null) {
            if (path.endsWith("/OrderController/BuyInShop")) {
                Product proSessionBill = (Product) request.getSession().getAttribute("pro");

                request.getSession().setAttribute("proSessionBill", proSessionBill);
                request.getSession().setAttribute("proSessionCartBill", null);
                response.sendRedirect("/OrderController/CheckOut");
            } else if (path.endsWith("/OrderController/BuyInCart")) {
                String[] proSessionCartBill = (String[]) request.getSession().getAttribute("listCheckCart");

                request.getSession().setAttribute("proSessionCartBill", proSessionCartBill);
                request.getSession().setAttribute("proSessionBill", null);
                response.sendRedirect("/OrderController/CheckOut");
            } else if (path.endsWith("/OrderController/CheckOut")) {
                Product finalPro = (Product) request.getSession().getAttribute("proSessionBill");
                String[] finalCart = (String[]) request.getSession().getAttribute("proSessionCartBill");

                request.getSession().setAttribute("finalPro", finalPro);
                request.getSession().setAttribute("finalCart", finalCart);
                request.getRequestDispatcher("/checkOut.jsp").forward(request, response);
            } else if (path.endsWith("/OrderController/PayBill")) {
                OrderDAO oDAO = new OrderDAO();
                ProductDAO pDAO = new ProductDAO();
                OrderDetailDAO odtDAO = new OrderDetailDAO();
                CartDAO caDAO = new CartDAO();

                String vnp_ResponseCode = request.getParameter("vnp_ResponseCode");

                // Lay thong tin KH mua truc tiep
                String fullname = (String) request.getSession().getAttribute("fullname");
                String phonenumber = (String) request.getSession().getAttribute("phonenumber");
                String email = (String) request.getSession().getAttribute("email");
                String fullAddress = (String) request.getSession().getAttribute("fullAddress");
                DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd");
                LocalDateTime now = LocalDateTime.now();
                Date orderPayDate = Date.valueOf(dtf.format(now));
                Customer getCusWhenPay = (Customer) request.getSession().getAttribute("account");

                // Lay thong tin sp khi mua truc tiep
                Product getProInBill = (Product) request.getSession().getAttribute("finalPro");
                String[] getCartInBill = (String[]) request.getSession().getAttribute("finalCart");
                double amount = 0;

                // Kiem tra thanh toan thanh cong
                if ("00".equals(vnp_ResponseCode)) {
                    // Tinh tong tien khi mua truc tiep
                    if (getProInBill != null) {
                        int quantityBill = (Integer) request.getSession().getAttribute("quantityBuyNow");
                        if (getProInBill.getDiscount() < getProInBill.getPro_price()) {
                            amount = getProInBill.getDiscount() * quantityBill;
                        } else {
                            amount = getProInBill.getPro_price() * quantityBill;
                        }

                        Order orderPay = new Order(0, getCusWhenPay.getCus_id(), "VNPay", fullAddress, "Chờ xác nhận", orderPayDate, amount, 0);
                        int addNewOrder = oDAO.addOrder(orderPay);

                        if (addNewOrder > 0) {
                            // Tao Order Detail
                            Order getOrderWhenPay = oDAO.getOrderWhenPay(getCusWhenPay.getCus_id());
                            OrderDetail odtAddNew = new OrderDetail(getOrderWhenPay.getO_id(), getProInBill.getPro_id(), quantityBill);
                            int addOrderDetail = odtDAO.addOrderDetail(odtAddNew);

                            // Cap nhat sl SP
                            int quantityAfterPay = getProInBill.getPro_quantity() - quantityBill;
                            Product editProPay = new Product(0, 0, "", "", "", "", 0.0, "", quantityAfterPay, 0.0, 0.0, "", orderPayDate, 0);
                            int changeProQuan = pDAO.editProQuan(getProInBill.getPro_id(), editProPay);

                            System.out.println("Mua thanh cong VNPAY");
                        }
                        response.sendRedirect("/OrderController/Success");
                    } else if (getCartInBill != null) {
                        for (int i = 0; i < getCartInBill.length; i++) {
                            int proID = Integer.parseInt(getCartInBill[i]);
                            Cart getProCart = caDAO.getCartByProAndCusID(getCusWhenPay.getCus_id(), proID);
                            Product getPro = pDAO.getProductByID(proID);

                            if (getPro.getDiscount() < getPro.getPro_price()) {
                                amount += getPro.getDiscount() * getProCart.getPro_quantity();
                            } else {
                                amount += getPro.getPro_price() * getProCart.getPro_quantity();
                            }
                        }

                        Order orderPay = new Order(0, getCusWhenPay.getCus_id(), "VNPay", fullAddress, "Chờ xác nhận", orderPayDate, amount, 0);
                        int addNewOrder = oDAO.addOrder(orderPay);

                        if (addNewOrder > 0) {
                            Order getOrderWhenPay = oDAO.getOrderWhenPay(getCusWhenPay.getCus_id());
                            int addOrderDetail = 0;

                            for (int i = 0; i < getCartInBill.length; i++) {
                                int proID = Integer.parseInt(getCartInBill[i]);
                                Cart getProCart = caDAO.getCartByProAndCusID(getCusWhenPay.getCus_id(), proID);
                                Product getPro = pDAO.getProductByID(proID);

                                OrderDetail odtAddNew = new OrderDetail(getOrderWhenPay.getO_id(), getPro.getPro_id(), getProCart.getPro_quantity());
                                addOrderDetail = odtDAO.addOrderDetail(odtAddNew);

                                int quantityAfterPay = getPro.getPro_quantity() - getProCart.getPro_quantity();

                                // Cap nhat sl sp sau khi mua
                                Product editProPay = new Product(0, 0, "", "", "", "", 0.0, "", quantityAfterPay, 0.0, 0.0, "", orderPayDate, 0);
                                int changeProQuan = pDAO.editProQuan(getPro.getPro_id(), editProPay);

                                //Xoa gio hang sau khi mua
                                int deleteCartAfterPay = caDAO.delete(getCusWhenPay.getCus_id(), proID);
                            }
                        }
                        System.out.println("Thanh toan VNPay thanh cong");

                        response.sendRedirect("/OrderController/Success");
                    }
                } else {
                    response.sendRedirect("/OrderController/CheckOut");
                }
            } else if (path.endsWith("/OrderController/Success")) {
                OrderDAO oDAO = new OrderDAO();
                Customer getCusWhenPay = (Customer) request.getSession().getAttribute("account");

                Order getOrderWhenPay = oDAO.getOrderWhenPay(getCusWhenPay.getCus_id());

                request.setAttribute("getOrderWhenPay", getOrderWhenPay);
                request.getRequestDispatcher("/paySuccess.jsp").forward(request, response);
            } else if (path.startsWith("/OrderController/GetOrderList/")) {
                System.out.println("Lay list loc");
                String s[] = path.split("/");
                String status = s[s.length - 1];
                String addStatus = "";
                System.out.println(status);
                if (status.equals("CXN")) {
                    addStatus = "Chờ xác nhận";
                } else if (status.equals("DXN")) {
                    addStatus = "Đã xác nhận";
                } else if (status.equals("DGG")) {
                    addStatus = "Đang giao";
                } else if (status.equals("DG")) {
                    addStatus = "Đã giao";
                } else if (status.equals("DH")) {
                    addStatus = "Đã hủy";
                }
                System.out.println(addStatus);
                OrderDAO oDAO = new OrderDAO();
                Customer getCusWhenPay = (Customer) request.getSession().getAttribute("account");

                LinkedList<Order> orderListCusFil = oDAO.getAllOrdersByCusIdFil(getCusWhenPay.getCus_id(), addStatus);

                request.getSession().setAttribute("orderListCus", null);
                request.getSession().setAttribute("orderListCusFil", orderListCusFil);

                response.sendRedirect("/OrderController/OrderList");
            } else if (path.endsWith("/OrderController/GetAllOrderList")) {
                System.out.println("Lay het list");
                OrderDAO oDAO = new OrderDAO();
                Customer cusSession = (Customer) request.getSession().getAttribute("account");
                int cusID = cusSession.getCus_id();

                LinkedList<Order> orderListCus = oDAO.getAllOrdersByCusId(cusID);

                request.getSession().setAttribute("orderListCus", orderListCus);
                request.getSession().setAttribute("orderListCusFil", null);

                response.sendRedirect("/OrderController/OrderList");
            } else if (path.endsWith("/OrderController/OrderList")) {
                request.getRequestDispatcher("/ListOrderCusVer2.jsp").forward(request, response);
            } else if (path.startsWith("/OrderController/OrderDetailCustomer/")) {
                String s[] = path.split("/");
                int orderID = Integer.parseInt(s[s.length - 1]);
                OrderDAO oDAO = new OrderDAO();
                OrderDetailDAO odDAO = new OrderDetailDAO();
                CustomerDAO cuDAO = new CustomerDAO();

                System.out.println("OrderID");
                System.out.println(orderID);

                Order getOrderByID = oDAO.getOrderByID(orderID);
                LinkedList<OrderDetail> odList = odDAO.getAllOrderDetailsByOrderID(orderID);

                request.setAttribute("getOrderByID", getOrderByID);
                request.setAttribute("odList", odList);
                request.setAttribute("quantityOrderDetail", odList.size());
                request.getRequestDispatcher("/OrderDetailCusVer2.jsp").forward(request, response);
            } else if (path.startsWith("/OrderController/OrderDeleteCustomer/")) {
                String s[] = path.split("/");
                int orderID = Integer.parseInt(s[s.length - 1]);
                OrderDAO oDAO = new OrderDAO();
                OrderDetailDAO odtDAO = new OrderDetailDAO();
                ProductDAO pDAO = new ProductDAO();

                LinkedList<OrderDetail> odList = odtDAO.getAllOrderDetailsByOrderID(orderID);

                Customer cusSession = (Customer) request.getSession().getAttribute("account");

                Order orderEdit = new Order(0, 0, "", "", "Đã hủy", null, 0, 0);

                int editOrderStatus = oDAO.editOrderStatus(orderID, orderEdit);

                for (OrderDetail odt : odList) {
                    Product getPro = pDAO.getProById(odt.getPro_id());
                    int backQuantit = getPro.getPro_quantity() + odt.getQuantity();
                    Product updateCancelPro = new Product(odt.getPro_id(), 0, "", "", "", "", 0.0, "", backQuantit, 0.0, 0.0, "", null, 0);
                    int backOrderQuan = pDAO.editProQuan(odt.getPro_id(), updateCancelPro);
                }

                LinkedList<Order> orderListCus = (LinkedList<Order>) request.getSession().getAttribute("orderListCus");

                LinkedList<Order> orderListCusFil = (LinkedList<Order>) request.getSession().getAttribute("orderListCusFil");

                if (orderListCus != null) {
                    LinkedList<Order> orderListCus1 = oDAO.getAllOrdersByCusId(cusSession.getCus_id());
                    request.getSession().setAttribute("orderListCus", orderListCus1);
                    request.getSession().setAttribute("orderListCusFil", null);

                    response.sendRedirect("/OrderController/OrderList");
                } else if (orderListCusFil != null) {
                    String addStatus = "";
                    for (Order ord : orderListCusFil) {
                        addStatus = ord.getStatus();
                        break;
                    }
                    System.out.println("Trang thai");
                    System.out.println(addStatus);

                    LinkedList<Order> orderListCusFil1 = oDAO.getAllOrdersByCusIdFil(cusSession.getCus_id(), addStatus);
                    request.getSession().setAttribute("orderListCus", null);
                    request.getSession().setAttribute("orderListCusFil", orderListCusFil1);

                    response.sendRedirect("/OrderController/OrderList");
                }
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

        // Cap nhat trang thai don hang
        if (request.getParameter("updateOrderAdminBtn") != null) {
            OrderDAO oDAO = new OrderDAO();
            OrderDetailDAO odtDAO = new OrderDetailDAO();
            ProductDAO pDAO = new ProductDAO();

            OrderStatusHistoryDAO oshDAO = new OrderStatusHistoryDAO();

            int orderID = Integer.parseInt(request.getParameter("orderID"));
            int staffID = Integer.parseInt(request.getParameter("staffID"));
            String statusOrder = request.getParameter("statusBtn");
            DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd");
            LocalDateTime now = LocalDateTime.now();
            Date orderStatusDate = Date.valueOf(dtf.format(now));

            Order getOrder = oDAO.getOrderByID(orderID);
            Order orderEdit = new Order(0, 0, "", "", statusOrder, getOrder.getO_date(), 0, 0);

            LinkedList<OrderDetail> odList = odtDAO.getAllOrderDetailsByOrderID(orderID);
            
            int editOrderStatus = 0;

            if (statusOrder.equals("Đã hủy")) {
                System.out.println("Huy don tu admin");
                editOrderStatus = oDAO.editOrderStatus(orderID, orderEdit);

                for (OrderDetail odt : odList) {
                    Product getPro = pDAO.getProById(odt.getPro_id());
                    int backQuantit = getPro.getPro_quantity() + odt.getQuantity();
                    Product updateCancelPro = new Product(odt.getPro_id(), 0, "", "", "", "", 0.0, "", backQuantit, 0.0, 0.0, "", null, 0);
                    int backOrderQuan = pDAO.editProQuan(odt.getPro_id(), updateCancelPro);
                }
            } else {
                editOrderStatus = oDAO.editOrderStatus(orderID, orderEdit);
            }

            if (!getOrder.getStatus().equals(statusOrder)) {
                OrderStatusHistory ordHis = new OrderStatusHistory(0, orderID, staffID, statusOrder, "Cập nhật", orderStatusDate);
                int addHisOrderStatus = oshDAO.addOrderStatus(ordHis);
            }

            if (editOrderStatus > 0) {
                response.sendRedirect("/AdminController/adminListOrder");
            } else {
                response.sendRedirect("/OrderController/UpdateOrderAdmin/" + orderID);
            }
        }

        // Xoa don hang trong admin
        if (request.getParameter("deleteOrderBtn") != null) {
            OrderDAO oDAO = new OrderDAO();
            OrderStatusHistoryDAO oshDAO = new OrderStatusHistoryDAO();

            int orderID = Integer.parseInt(request.getParameter("orderID"));
            DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd");
            LocalDateTime now = LocalDateTime.now();
            Date orderStatusDate = Date.valueOf(dtf.format(now));
            Staff getStaff = (Staff) request.getSession().getAttribute("staff");
            String getStatus = request.getParameter("statusWhenDelete");

            int deleteOrder = oDAO.deleteOrder(orderID);

            OrderStatusHistory ordHis = new OrderStatusHistory(0, orderID, getStaff.getStaff_id(), getStatus, "Xóa", orderStatusDate);
            int addHisOrderStatus = oshDAO.addOrderStatus(ordHis);
            if (deleteOrder > 0) {
                response.sendRedirect("/AdminController/adminListOrder");
            } else {
                response.sendRedirect("/OrderController/DeleteOrderAdmin/" + orderID);
            }
        }

        // Tao don hang
        if (request.getParameter("payBtn") != null) {
            OrderDAO oDAO = new OrderDAO();
            ProductDAO pDAO = new ProductDAO();
            OrderDetailDAO odtDAO = new OrderDetailDAO();
            CartDAO caDAO = new CartDAO();

            // Lay thong tin KH co tren checkout
            String fullname = request.getParameter("fullname");
            request.getSession().setAttribute("fullname", fullname);
            String phonenumber = request.getParameter("phonenumber");
            request.getSession().setAttribute("phonenumber", phonenumber);
            String email = request.getParameter("email");
            request.getSession().setAttribute("email", email);
            String fullAddress = request.getParameter("address1");
            request.getSession().setAttribute("fullAddress", fullAddress);
            String paymentMethod = request.getParameter("paymentMethod");
            DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd");
            LocalDateTime now = LocalDateTime.now();
            Date orderPayDate = Date.valueOf(dtf.format(now));
            Customer getCusWhenPay = (Customer) request.getSession().getAttribute("account");

            // Lay thong tin sp khi mua truc tiep
            Product getProInBill = (Product) request.getSession().getAttribute("finalPro");
            String[] getCartInBill = (String[]) request.getSession().getAttribute("finalCart");

            double amount = 0;

            // Tinh tong tien khi mua truc tiep
            if (getProInBill != null) {
                int quantityBill = (Integer) request.getSession().getAttribute("quantityBuyNow");
                if (getProInBill.getDiscount() < getProInBill.getPro_price()) {
                    amount = getProInBill.getDiscount() * quantityBill;
                } else {
                    amount = getProInBill.getPro_price() * quantityBill;
                }

                // Hinh thuc thanh toan
                if (paymentMethod.equals("COD")) {
                    Order orderPay = new Order(0, getCusWhenPay.getCus_id(), paymentMethod, fullAddress, "Chờ xác nhận", orderPayDate, amount, 0);
                    int addNewOrder = oDAO.addOrder(orderPay);

                    if (addNewOrder > 0) {
                        // Tao Order Detail
                        Order getOrderWhenPay = oDAO.getOrderWhenPay(getCusWhenPay.getCus_id());
                        OrderDetail odtAddNew = new OrderDetail(getOrderWhenPay.getO_id(), getProInBill.getPro_id(), quantityBill);
                        int addOrderDetail = odtDAO.addOrderDetail(odtAddNew);

                        // Cap nhat sl SP
                        int quantityAfterPay = getProInBill.getPro_quantity() - quantityBill;
                        Product editProPay = new Product(0, 0, "", "", "", "", 0.0, "", quantityAfterPay, 0.0, 0.0, "", orderPayDate, 0);
                        int changeProQuan = pDAO.editProQuan(getProInBill.getPro_id(), editProPay);

                        response.sendRedirect("/OrderController/Success");
                    } else {
                        response.sendRedirect("/OrderController/CheckOut");
                    }
                } else if (paymentMethod.equals("VNPay")) {
                    long amountVNPay = (new Double(amount).longValue());
                    amountVNPay *= 100;

                    String orderType = "other";
                    String vnp_TxnRef = Config.getRandomNumber(8);
                    String vnp_IpAddr = Config.getIpAddress(request);

                    String vnp_TmnCode = Config.vnp_TmnCode;

                    Map<String, String> vnp_Params = new HashMap<>();
                    vnp_Params.put("vnp_Version", Config.vnp_Version);
                    vnp_Params.put("vnp_Command", Config.vnp_Command);
                    vnp_Params.put("vnp_TmnCode", Config.vnp_TmnCode);
                    vnp_Params.put("vnp_Amount", String.valueOf(amountVNPay));
                    vnp_Params.put("vnp_CurrCode", "VND");
                    vnp_Params.put("vnp_BankCode", "NCB");

                    vnp_Params.put("vnp_TxnRef", vnp_TxnRef);
                    vnp_Params.put("vnp_OrderInfo", "Thanh toan don hang:" + vnp_TxnRef);

                    vnp_Params.put("vnp_OrderType", orderType);
                    vnp_Params.put("vnp_Locale", "vn");

                    vnp_Params.put("vnp_ReturnUrl", Config.vnp_ReturnUrl);
                    vnp_Params.put("vnp_IpAddr", vnp_IpAddr);

                    Calendar cld = Calendar.getInstance(TimeZone.getTimeZone("Etc/GMT+7"));
                    SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");
                    String vnp_CreateDate = formatter.format(cld.getTime());
                    vnp_Params.put("vnp_CreateDate", vnp_CreateDate);

                    cld.add(Calendar.MINUTE, 15);
                    String vnp_ExpireDate = formatter.format(cld.getTime());
                    vnp_Params.put("vnp_ExpireDate", vnp_ExpireDate);

                    List fieldNames = new ArrayList(vnp_Params.keySet());
                    Collections.sort(fieldNames);
                    StringBuilder hashData = new StringBuilder();
                    StringBuilder query = new StringBuilder();
                    Iterator itr = fieldNames.iterator();
                    while (itr.hasNext()) {
                        String fieldName = (String) itr.next();
                        String fieldValue = (String) vnp_Params.get(fieldName);
                        if ((fieldValue != null) && (fieldValue.length() > 0)) {
                            //Build hash data
                            hashData.append(fieldName);
                            hashData.append('=');
                            hashData.append(URLEncoder.encode(fieldValue, StandardCharsets.US_ASCII.toString()));
                            //Build query
                            query.append(URLEncoder.encode(fieldName, StandardCharsets.US_ASCII.toString()));
                            query.append('=');
                            query.append(URLEncoder.encode(fieldValue, StandardCharsets.US_ASCII.toString()));
                            if (itr.hasNext()) {
                                query.append('&');
                                hashData.append('&');
                            }
                        }
                    }
                    String queryUrl = query.toString();
                    String vnp_SecureHash = Config.hmacSHA512(Config.secretKey, hashData.toString());
                    queryUrl += "&vnp_SecureHash=" + vnp_SecureHash;
                    String paymentUrl = Config.vnp_PayUrl + "?" + queryUrl;
                    System.out.println(paymentUrl);
                    response.sendRedirect(paymentUrl);
                }
            } else if (getCartInBill != null) {
                for (int i = 0; i < getCartInBill.length; i++) {
                    int proID = Integer.parseInt(getCartInBill[i]);
                    Cart getProCart = caDAO.getCartByProAndCusID(getCusWhenPay.getCus_id(), proID);
                    Product getPro = pDAO.getProductByID(proID);

                    if (getPro.getDiscount() < getPro.getPro_price()) {
                        amount += getPro.getDiscount() * getProCart.getPro_quantity();
                    } else {
                        amount += getPro.getPro_price() * getProCart.getPro_quantity();
                    }
                }

                if (paymentMethod.equals("COD")) {
                    Order orderPay = new Order(0, getCusWhenPay.getCus_id(), paymentMethod, fullAddress, "Chờ xác nhận", orderPayDate, amount, 0);
                    int addNewOrder = oDAO.addOrder(orderPay);

                    if (addNewOrder > 0) {
                        // Tao Order Detail
                        Order getOrderWhenPay = oDAO.getOrderWhenPay(getCusWhenPay.getCus_id());
                        int addOrderDetail = 0;
                        for (int i = 0; i < getCartInBill.length; i++) {
                            int proID = Integer.parseInt(getCartInBill[i]);
                            Cart getProCart = caDAO.getCartByProAndCusID(getCusWhenPay.getCus_id(), proID);
                            Product getPro = pDAO.getProductByID(proID);

                            OrderDetail odtAddNew = new OrderDetail(getOrderWhenPay.getO_id(), getPro.getPro_id(), getProCart.getPro_quantity());
                            addOrderDetail = odtDAO.addOrderDetail(odtAddNew);

                            int quantityAfterPay = getPro.getPro_quantity() - getProCart.getPro_quantity();

                            // Cap nhat sl sp sau khi mua
                            Product editProPay = new Product(0, 0, "", "", "", "", 0.0, "", quantityAfterPay, 0.0, 0.0, "", orderPayDate, 0);
                            int changeProQuan = pDAO.editProQuan(getPro.getPro_id(), editProPay);

                            //Xoa gio hang sau khi mua
                            int deleteCartAfterPay = caDAO.delete(getCusWhenPay.getCus_id(), proID);
                        }
                        response.sendRedirect("/OrderController/Success");
                    } else {
                        response.sendRedirect("/OrderController/CheckOut");
                    }
                } else if (paymentMethod.equals("VNPay")) {
                    long amountVNPay2 = (new Double(amount).longValue());
                    amountVNPay2 *= 100;

                    String orderType = "other";
                    String vnp_TxnRef = Config.getRandomNumber(8);
                    String vnp_IpAddr = Config.getIpAddress(request);

                    String vnp_TmnCode = Config.vnp_TmnCode;

                    Map<String, String> vnp_Params = new HashMap<>();
                    vnp_Params.put("vnp_Version", Config.vnp_Version);
                    vnp_Params.put("vnp_Command", Config.vnp_Command);
                    vnp_Params.put("vnp_TmnCode", Config.vnp_TmnCode);
                    vnp_Params.put("vnp_Amount", String.valueOf(amountVNPay2));
                    vnp_Params.put("vnp_CurrCode", "VND");
                    vnp_Params.put("vnp_BankCode", "NCB");

                    vnp_Params.put("vnp_TxnRef", vnp_TxnRef);
                    vnp_Params.put("vnp_OrderInfo", "Thanh toan don hang:" + vnp_TxnRef);

                    vnp_Params.put("vnp_OrderType", orderType);
                    vnp_Params.put("vnp_Locale", "vn");

                    vnp_Params.put("vnp_ReturnUrl", Config.vnp_ReturnUrl);
                    vnp_Params.put("vnp_IpAddr", vnp_IpAddr);

                    Calendar cld = Calendar.getInstance(TimeZone.getTimeZone("Etc/GMT+7"));
                    SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");
                    String vnp_CreateDate = formatter.format(cld.getTime());
                    vnp_Params.put("vnp_CreateDate", vnp_CreateDate);

                    cld.add(Calendar.MINUTE, 15);
                    String vnp_ExpireDate = formatter.format(cld.getTime());
                    vnp_Params.put("vnp_ExpireDate", vnp_ExpireDate);

                    List fieldNames = new ArrayList(vnp_Params.keySet());
                    Collections.sort(fieldNames);
                    StringBuilder hashData = new StringBuilder();
                    StringBuilder query = new StringBuilder();
                    Iterator itr = fieldNames.iterator();
                    while (itr.hasNext()) {
                        String fieldName = (String) itr.next();
                        String fieldValue = (String) vnp_Params.get(fieldName);
                        if ((fieldValue != null) && (fieldValue.length() > 0)) {
                            //Build hash data
                            hashData.append(fieldName);
                            hashData.append('=');
                            hashData.append(URLEncoder.encode(fieldValue, StandardCharsets.US_ASCII.toString()));
                            //Build query
                            query.append(URLEncoder.encode(fieldName, StandardCharsets.US_ASCII.toString()));
                            query.append('=');
                            query.append(URLEncoder.encode(fieldValue, StandardCharsets.US_ASCII.toString()));
                            if (itr.hasNext()) {
                                query.append('&');
                                hashData.append('&');
                            }
                        }
                    }
                    String queryUrl = query.toString();
                    String vnp_SecureHash = Config.hmacSHA512(Config.secretKey, hashData.toString());
                    queryUrl += "&vnp_SecureHash=" + vnp_SecureHash;
                    String paymentUrl = Config.vnp_PayUrl + "?" + queryUrl;
                    System.out.println(paymentUrl);
                    response.sendRedirect(paymentUrl);
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
