<%-- 
    Document   : OrderDetailCusVer2
    Created on : Feb 21, 2024, 2:40:03 PM
    Author     : Admin
--%>

<%@page import="Models.Categories"%>
<%@page import="Models.Product"%>
<%@page import="Models.OrderDetail"%>
<%@page import="java.util.LinkedList"%>
<%@page import="Models.Order"%>
<%@page import="DAOs.CategoriesDAO"%>
<%@page import="DAOs.ProductDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Chi tiết đơn hàng</title>
        <link rel="stylesheet" href="/CSS/OrderDetailCusVer2Style.css">
        <script src="https://kit.fontawesome.com/1bd9fa3a2e.js" crossorigin="anonymous"></script>
    </head>
    <body>
        <%@include file="headOfCart.jsp" %>
        <style>
            a{
                text-decoration: none;
            }
            ul{
                padding: 0;
            }
            .thongkegia p{
                margin-bottom: 0;
            }
        </style>
        
        <!--NAM CODE-->
        <main class="mt-3">
            <section class="content">
                <aside>
                    <div class="top_aside">
                        <div class="avatar_aside">
                            <a href="#">
                                <img src="/${account.avatar}" alt="">
                            </a>
                        </div>
                        <div class="infor_aside">
                            <span>${account.fullname}</span>
                            <span href="#"><i class="fa-solid fa-pen"></i>${account.phone_number}</span>
                        </div>
                    </div>
                    <ul>
                        <li>
                            <a href="/OrderController/GetAllOrderList"><i class="fa-solid fa-rectangle-list"></i> Đơn mua</a>
                        </li>
                    </ul>
                </aside>

                <section class="o_detail">
                    <div class="top_o_detail">
                        <div class="chitiet">
                            <h4>Chi tiết đơn hàng</h4>
                        </div>
                        <c:if test="${account != null && getOrderByID != null}">
                            <div class="thongtin">
                                <div class="user_infor_o_detail">
                                    <p class="label_order">Người đặt hàng: <span>${account.fullname}</span></p>
                                    <p class="label_order">Địa chỉ: <span>${getOrderByID.address}</span></p>
                                    <p class="label_order">Số điện thoại: <span>${account.phone_number}</span></p>
                                </div>
                                <div class="order_infor_o_detail">
                                    <p class="label_order">Mã đơn hàng: <span>${getOrderByID.o_id}</span></p>
                                    <p class="label_order">Ngày đặt hàng: <span>${getOrderByID.o_date}</span></p>
                                    <p class="label_order">Số lượng: <span>${quantityOrderDetail}</span></p>
                                    <p class="label_order">Phương thức thanh toán: <span class="phuongthuc">${getOrderByID.payment}</span></p>
                                    <p class="label_order">
                                        Trạng thái:
                                        <span class="trangthai">
                                            ${getOrderByID.status}
                                        </span>
                                    </p>
                                </div>
                            </div>
                        </c:if>
                    </div>

                    <div class="bot_o_detail">
                        <h2>Danh sách đơn hàng</h2>
                        <div class="danhsachsanpham">
                            <!-- CARD -->
                            <%
                                ProductDAO pDAO = new ProductDAO();
                                CategoriesDAO catDAO = new CategoriesDAO();
                                Order getOrder = (Order) request.getAttribute("getOrderByID");
                                LinkedList<OrderDetail> odList = (LinkedList<OrderDetail>) request.getAttribute("odList");
                                for (OrderDetail elem : odList) {
                                    Product pro = pDAO.getProductByID(elem.getPro_id());
                                    System.out.println(pro.getCat_id());
                                    Categories getCat = catDAO.getCatByCatID(pro.getCat_id());
                            %>
                            <div class="sanpham">
                                <div class="thongtinsanpham">
                                    <div class="anhsanpham">
                                        <img src="/<%= pro.getPro_image()%>" alt="">
                                    </div>
                                    <div class="thongtinconlai">
                                        <h3><%= pro.getPro_name()%></h3>
                                        <p>Thể loại: <span><%= getCat.getCat_name()%></span></p>
                                        <p>Số lượng: <span><%= elem.getQuantity()%></span></p>
                                    </div>
                                </div>
                                <div class="giasanpham">
                                    <%
                                        if (pro.getDiscount() < pro.getPro_price()) {
                                    %>
                                    <p class="giathat"><%= pro.getPro_price() * elem.getQuantity() %>đ</p>
                                    <p class="giagiam"><%= pro.getDiscount() * elem.getQuantity() %>đ</p>
                                    <%
                                        } else {
                                    %>
                                    <p class="giagiam"><%= pro.getPro_price() * elem.getQuantity() %>đ</p>
                                    <%
                                        } 
                                    %>
                                </div>
                            </div>
                            <!-- END CARD -->
                            <%
                                }
                            %>
                        </div>
                        <div class="tongtien">
                            <div class="thongkegia">
                                <p><i class="fa-solid fa-money-bill"></i><span>Thành tiền: </span></p>
                                <span class="giacuoicung">${getOrderByID.total_price}đ</span>
                            </div>
                        </div>
                    </div>
                </section>
            </section>
        </main>
        <!--END NAM CODE-->
    </body>
</html>
