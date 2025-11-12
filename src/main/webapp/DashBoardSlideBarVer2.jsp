<%-- 
    Document   : DashBoardSlideBarVer2
    Created on : Feb 16, 2024, 8:00:33 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Dash Board</title>
        <link rel="stylesheet" href="/CSS/dashboardnamver2.css">
        <script src="https://kit.fontawesome.com/1bd9fa3a2e.js" crossorigin="anonymous"></script>
        <style>
            ul,ol{
                padding-left: 0;
            }
        </style>
    </head>
    <body>
        <div class="sidebar">
            <div class="header_sidebar">
                <div class="logo">
                    <a href="/ChartController/Chart">
                        <img src="/images/Lovecake.png" alt="">
                    </a>
                </div>
                <span>Dashboard</span>
            </div>
            <ul>
                <c:if test="${staff.position == 'product manager'}">
                    <li>
                        <a href="/AdminController/adminListPro"><i class="fa-brands fa-product-hunt"></i>Quản lí sản phẩm</a>
                    </li>
                    <li>
                        <a href="/AdminController/adminListProHistory"><i class="fa-solid fa-layer-group"></i>Lịch sử sản phẩm</a>
                    </li>
                </c:if>

                <c:if test="${staff.position=='order manager'}">
                    <li>
                        <a href="/AdminController/adminListOrder"><i class="fa-solid fa-cart-shopping"></i>Quản lí sản phẩm</a>
                    </li>
                    <li>
                        <a href="/AdminController/adminListOrderHistory"><i class="fa-solid fa-cart-shopping"></i>Quản lí đơn hàng</a>
                    </li>
                </c:if>
                <c:if test="${staff.position=='news manager'}">
                    <li>
                        <a href="/AdminController/adminListNews"><i class="fa-solid fa-newspaper"></i>Quản lí tin tức</a>
                    </li>
                    <li>
                        <a href="/AdminController/adminListNewsHistory"><i class="fa-solid fa-newspaper"></i>Lịch sử tin tức</a>
                    </li>
                </c:if>

                <c:if test="${staff.position=='admin'}">


                    <li>
                        <a href="/AdminController/adminListPro"><i class="fa-brands fa-product-hunt"></i>Quản lí sản phẩm</a>
                    </li>

                    <li>
                        <a href="/AdminController/adminImportPro"><i class="fa-solid fa-layer-group"></i>Nhập hàng</a>
                    </li>
                    <li>
                        <a href="/AdminController/adminImportProHis"><i class="fa-solid fa-layer-group"></i>Lịch sử nhập hàng</a>
                    </li>
                    <li>
                        <a href="/AdminController/adminListSupplier"><i class="fa-solid fa-layer-group"></i>Danh sách nhà cung cấp</a>
                    </li>
                    <li>
                        <a href="/AdminController/adminListProHistory"><i class="fa-solid fa-layer-group"></i>Lịch sử sản phẩm</a>
                    </li>

                    <li>
                        <a href="/AdminController/adminListOrder"><i class="fa-solid fa-cart-shopping"></i>Quản lí đơn hàng</a>
                    </li>

                    <li>
                        <a href="/AdminController/adminListOrderHistory"><i class="fa-solid fa-cart-shopping"></i>Lịch sử đơn hàng</a>
                    </li>
                    <li>
                        <a href="/AdminController/adminListNews"><i class="fa-solid fa-newspaper"></i>Quản lí tin tức</a>
                    </li>
                    <li>
                        <a href="/AdminController/adminListNewsHistory"><i class="fa-solid fa-newspaper"></i>Lịch sử tin tức</a>
                    </li>
                    <li>
                        <a href="/AdminController/adminListStaff"><i class="fa-solid fa-clipboard-user"></i>Quản lí nhân viên</a>
                    </li>
                    <li>
                        <a href="/AdminController/adminListCustomer"><i class="fa-solid fa-clipboard-user"></i>Quản lí khách hàng</a>
                    </li>

                </c:if>
            </ul>
            <div class="bot_sidebar">
                <a class="btn_logout" href="/StaffController"><i class="fa-solid fa-right-from-bracket"></i>Hồ sơ</a>
                <a class="btn_logout" href="/LogoutController"><i class="fa-solid fa-right-from-bracket"></i>Đăng xuất</a>
            </div>
        </div>
    </body>
</html>
