<%-- 
    Document   : adminAddPro
    Created on : Feb 12, 2024, 10:49:43 AM
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
        <title>Lịch sử nhập hàng</title>

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
                <h1 class="m-2">Lịch sử nhập hàng</h1>  </p>
                <div class="mx-2 ms-1 border border-2 p-2 m-2">
                    <table id="example" class="table table-responsive" style="width:100%">
                        <thead>
                            <tr>
                                <th class="text-start">Mã sản phẩm</th>
                                <th class="text-start">Tên sản phẩm</th>
                                <th class="text-start">Mã nhà cung cấp</th>
                                <th class="text-start">Tên nhà cung cấp</th>
                                <th class="text-start">Số lượng</th>
                                <th class="text-start">Ngày nhập hàng</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${listImpHis}" var="s">
                            <tr>
                                <td class="text-start align-middle">${s.pro_id}</td>
                                <td class="text-start align-middle">${s.pro_name}</td>
                                <td class="text-start align-middle">${s.sup_id}</td>
                                <td class="text-start align-middle">${s.company_name}</td>
                                <td class="text-start align-middle">${s.quantity}</td>
                                <td class="text-start align-middle">${s.create_date}</td>

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
