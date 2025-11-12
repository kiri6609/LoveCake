<%-- 
    Document   : adminListCustomer
    Created on : Feb 17, 2024, 8:11:52 PM
    Author     : PC
--%>

<%@page import="Models.Customer"%>
<%@page import="DAOs.CustomerDAO"%>
<%@page import="java.util.LinkedList"%>
<%@page import="DAOs.AccountDAO"%>
<%@page import="Models.Account"%>
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
        <title>Quản lí khách hàng</title>
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

            .username-tab{
                width: 20%;
            }

            .kh-tab{
                width: 10%;
            }
        </style>
    </head>
    <body>
        <div>
            <%@include file="DashBoardSlideBarVer2.jsp" %>
            <div style="flex: 1; position: absolute; width: 80%;top: 0; left: 265px;">
                <h1 class="m-2">Quản lí khách hàng</h1>
                <div class="mx-2 ms-1 border border-2 p-2 m-2">
                    <p class="btn btn-warning m-2" style="width: 200px;">
                        <a href="/CustomerController/Create" class="text-decoration-none text-dark">Thêm mới khách hàng</a>
                    </p>
                    <table id="example" class="table table-responsive" style="width:100%">
                        <thead>
                            <tr>
                                <th class="text-start kh-tab">Mã khách hàng</th>
                                <th class="text-start username-tab">Tên đăng nhập</th>
                                <th class="text-start">Họ và tên</th>
                                <th class="text-start">SĐT</th>
                                <th class="text-start">Thao tác</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                CustomerDAO accDAO = new CustomerDAO();
                                LinkedList<Customer> listAcc = accDAO.getAll();
                                for (Account element : listAcc) {
                            %>
                            <tr>
                                <td class="text-start align-middle kh-tab"><%= element.getAcc_id()%></td>
                                <td class="text-start align-middle username-tab"><%= element.getUsername()%></td>
                                <td class="text-start align-middle"><%= element.getFullname()%></td>
                                <td class="text-start align-middle"><%= element.getPhone_number()%></td>
                                <td class="text-start">
                                    <% if (element.getIsDelete() != 1) {%>
                                    <a href="/CustomerController/DeleteCusAdmin?cus_id=<%= element.getAcc_id()%>" class="btn btn-danger"><i class="fa fa-trash text-white"></i></a>
                                        <% } else { %>
                                    <p style="color: #999999">Tài khoản đã xóa.</p>
                                    <% } %>
                            </tr>

                        </tbody>  
                        <%                            }
                        %>
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
