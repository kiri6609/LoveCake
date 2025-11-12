<%-- 
    Document   : ListOrderCusVer2
    Created on : Feb 21, 2024, 2:30:47 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Danh mục đơn hàng</title>
        <link rel="stylesheet" href="/CSS/ListOrderCusStyleVer2.css">
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
                            <a href="/OrderController/GetAllOrderList"><i class="fa-solid fa-rectangle-list"></i> Tất cả</a>
                        </li>
                        <li>
                            <a href="/OrderController/GetOrderList/CXN"><i class="fa-solid fa-rectangle-list"></i> Chờ xác nhận</a>
                        </li>
                        <li>
                            <a href="/OrderController/GetOrderList/DXN"><i class="fa-solid fa-rectangle-list"></i> Đã xác nhận</a>
                        </li>
                        <li>
                            <a href="/OrderController/GetOrderList/DGG"><i class="fa-solid fa-rectangle-list"></i> Đang giao</a>
                        </li>
                        <li>
                            <a href="/OrderController/GetOrderList/DG"><i class="fa-solid fa-rectangle-list"></i> Đã giao</a>
                        </li>
                        <li>
                            <a href="/OrderController/GetOrderList/DH"><i class="fa-solid fa-rectangle-list"></i> Đã hủy</a>
                        </li>
                    </ul>
                </aside>

                <section class="order">
                    <div class="top_order">
                        <div class="chitiet">
                            <h4 style="font-weight: 700;">Danh mục đơn hàng</h4>
                        </div>
                    </div>

                    <div class="bot_order">
                        <div class="danhsachdonhang">
                            <!-- CARD ORDER -->
                            <c:choose>
                                <c:when test="${not empty orderListCus && orderListCus != null}">
                                    <c:forEach items="${orderListCus}" var="ol">
                                        <c:if test="${ol.isDelete == 0}">
                                            <div class="donhang">
                                                <div class="top_donhang">
                                                    <div class="left_thongtindonhang">
                                                        <p>Mã đơn hàng: <span>${ol.o_id}</span></p>
                                                        <p>Địa chỉ: <span>${ol.address}</span></p>
                                                        <p>Ngày đặt hàng: <span>${ol.o_date}</span></p>
                                                    </div>
                                                    <div class="right_thongtindonhang">
                                                        <p>Phương thức thanh toán: <span>${ol.payment}</span></p>
                                                        <p>Trạng thái đơn hàng: <span>${ol.status}</span></p>
                                                        <p>Tổng tiền: <span>${ol.total_price}đ</span></p>
                                                    </div>
                                                </div>
                                                <div class="bot_donhang">
                                                    <div class="thaotac">
                                                        <c:choose>
                                                            <c:when test="${ol.status == 'Đã hủy'}"></c:when>
                                                            <c:otherwise>
                                                                <a class="xemchitiet" href="/OrderController/OrderDetailCustomer/${ol.o_id}">Xem chi tiết</a>
                                                                <c:if test="${ol.status == 'Chờ xác nhận' || ol.status == 'Đã xác nhận'}">
                                                                    <a class="huydon" href="/OrderController/OrderDeleteCustomer/${ol.o_id}" onclick="return confirm('Bạn có chắc muốn hủy đơn hàng này không?')">Hủy đơn</a>
                                                                </c:if>
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </div>
                                                </div>
                                            </div>
                                        </c:if>
                                    </c:forEach>
                                </c:when>
                                <c:when test="${not empty orderListCusFil && orderListCusFil != null}">
                                    <c:forEach items="${orderListCusFil}" var="ol">
                                        <div class="donhang">
                                            <div class="top_donhang">
                                                <div class="left_thongtindonhang">
                                                    <p>Mã đơn hàng: <span>${ol.o_id}</span></p>
                                                    <p>Địa chỉ: <span>${ol.address}</span></p>
                                                    <p>Ngày đặt hàng: <span>${ol.o_date}</span></p>
                                                </div>
                                                <div class="right_thongtindonhang">
                                                    <p>Phương thức thanh toán: <span>${ol.payment}</span></p>
                                                    <p>Trạng thái đơn hàng: <span>${ol.status}</span></p>
                                                    <p>Tổng tiền: <span>${ol.total_price}đ</span></p>
                                                </div>
                                            </div>
                                            <div class="bot_donhang">
                                                <div class="thaotac">
                                                    <c:choose>
                                                        <c:when test="${ol.status == 'Đã hủy'}"></c:when>
                                                        <c:otherwise>
                                                            <a class="xemchitiet" href="/OrderController/OrderDetailCustomer/${ol.o_id}">Xem chi tiết</a>
                                                            <c:if test="${ol.status == 'Chờ xác nhận' || ol.status == 'Đã xác nhận'}">
                                                                <a class="huydon" href="/OrderController/OrderDeleteCustomer/${ol.o_id}">Hủy đơn</a>
                                                            </c:if>
                                                        </c:otherwise>
                                                    </c:choose>
                                                </div>
                                            </div>
                                        </div>
                                    </c:forEach>
                                </c:when>
                                <c:otherwise>
                                    <h3>Không có đơn hàng</h3>
                                </c:otherwise>
                            </c:choose>
                            <!-- END CARD ORDER -->

                        </div>
                    </div>
                </section>
            </section>
        </main>
        <!--END NAM CODE-->
    </body>
</html>
