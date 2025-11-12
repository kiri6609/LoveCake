<%-- 
    Document   : ListOrderAdmin
    Created on : Feb 13, 2024, 12:49:59 PM
    Author     : Dell
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">
        <link rel="icon" type="image/png" href="images/Lovecake.png">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.3.0/js/bootstrap.bundle.min.js"/>
        <link rel="stylesheet" href="https://cdn.datatables.net/2.0.0/css/dataTables.bootstrap5.css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css"/>
        <script src="https://kit.fontawesome.com/1bd9fa3a2e.js" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.3.0/js/bootstrap.bundle.min.js"/>
        <link rel="stylesheet" href="https://cdn.datatables.net/2.0.0/css/dataTables.bootstrap5.css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css"/>
        <title>Quản lý đơn hàng</title>
        <style>
            .btn{
                cursor: pointer;
            }
            ul, ol{
                padding-left: 0;
            }
            a{
                color: #3e3e3e;
                text-decoration: none;
            }

            .admin-dashboard{
                display: flex;
            }
        </style>
    </head>
    <body>
        <div>
            <%@include file="DashBoardSlideBarVer2.jsp" %>
            <div style="flex: 1; position: absolute; width: 80%;top: 0; left: 265px;">
                <h1 class="m-2">Quản lý đơn hàng</h1>
                <div class="mx-2 ms-1 border border-2 p-2 m-2">

                    <table id="example" class="table table-responsive" style="width:100%">
                        <thead>
                            <tr>
                                <th class="text-start">Mã đơn hàng</th>
                                <th class="text-start">Trạng thái</th>
                                <th class="text-start">Tổng tiền</th>
                                <th class="text-start">Ngày mua</th>
                                <th class="text-start">Thao tác</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${orderList}" var="ol">
                                <tr>
                                    <td class="text-start align-middle">${ol.o_id}</td>
                                    <td class="text-start align-middle">${ol.status}</td>
                                    <td class="text-start align-middle">${ol.total_price}</td>
                                    <td class="text-start align-middle">${ol.o_date}</td>
                                    <td class="text-start">
                                        <c:if test="${ol.isDelete == 0}">
                                            <a href="/OrderController/OrderDetailAdmin/${ol.o_id}" class="btn btn-primary mt-3 mb-3">Xem chi tiết</a>
                                            <c:if test="${ol.status !='Đã hủy' && ol.status !='Đã giao'}">
                                                <a href="/OrderController/UpdateOrderAdmin/${ol.o_id}" class="btn btn-success mt-3 mb-3">Cập nhật</a>
                                            </c:if>
                                            <a href="/OrderController/DeleteOrderAdmin/${ol.o_id}" class="btn btn-danger mt-3 mb-3">Xóa</a>
                                        </c:if>
                                        <c:if test="${ol.isDelete == 1}">
                                            <p class="btn btn-secondary mt-3">Ðã xóa</p>
                                        </c:if>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody><!-- comment -->
                    </table>
                </div>
            </div>
        </div>
        <script src="https://code.jquery.com/jquery-3.7.1.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>
        <script src="https://cdn.datatables.net/2.0.0/js/dataTables.js"></script>
        <script src="https://cdn.datatables.net/2.0.0/js/dataTables.bootstrap5.js"></script>
        <script>
            new DataTable('#example');
        </script>
    </body>
</html>
