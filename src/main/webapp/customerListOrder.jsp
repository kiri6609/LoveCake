<%-- 
    Document   : ListOrderCustomer
    Created on : Feb 13, 2024, 12:48:18 PM
    Author     : Dell
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="https://kit.fontawesome.com/1bd9fa3a2e.js" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="https://cdn.datatables.net/2.0.0/css/dataTables.bootstrap5.css"/>
        <title>Danh sách đơn hàng</title>
    </head>
    <body>
        <%@include file="headOfCart.jsp" %>
        <div class="container mt-3 border rounded">
            <table id="example" class="display" style="width:100%;">
                <thead class="bg-body-secondary border-bottom border-top">
                    <tr style="line-height: 40px;" class="text-center">
                        <th>Mã đơn hàng</th>
                        <th>Trạng thái</th>
                        <th>Địa chỉ</th>
                        <th>Tổng tiền</th>
                        <th>Ngày mua</th>
                        <th>Xem chi tiết</th>
                        <th>Hủy đơn</th>
                    </tr>
                </thead>
                <tbody>
                    <%--<c:forEach items="${listPH}" var="ph">--%>
                    <tr class="border border-1" style="line-height: 40px;">
                        <td>123</td>
                        <td>Ðang giao</td>
                        <td>can tho, thanh pho , 123 </td>
                        <td>12000</td>
                        <td>20/2/2024</td>
                        <td>
                            <a class="text-success">
                                <i class="fa fa-pencil fs-5 mt-2" aria-hidden="true"></i></a>

                        </td>
                        <td class="text-center">
                            <a class="text-danger" onclick="return confirm('Do you want to delete this order?')" href="#"
                               ><i class="fas fa-trash-alt fs-5 mt-2"></i></a>

                        </td>

                    </tr>
                    <%--</c:forEach>--%>
                </tbody><!-- comment -->
            </table>
        </div>
        <script src="https://cdn.datatables.net/2.0.0/js/dataTables.js"></script>
        <script src="https://cdn.datatables.net/2.0.0/js/dataTables.bootstrap5.js"></script>
        <script>
                                    new DataTable('#example');
        </script>

    </body>
</html>
