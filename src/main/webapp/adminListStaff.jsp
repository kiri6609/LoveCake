<%-- 
    Document   : adminListStaff
    Created on : Feb 17, 2024, 8:19:53 PM
    Author     : PC
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="DAOs.StaffDAO"%>
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
        <title>Quản lý nhân viên</title>
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

            .nv-tab{
                width: 10%;
            }

            .username-tab{
                width: 15%;
            }

            .gender-tab{
                width: 10%;
            }

            .position-tab{
                width: 15%;
            }
            table th, table td{
                font-size: 13px;
            }
            .dt-length label, .dt-search label{
                font-family: Arial, sans-serif;
                font-size: 14px;
                font-weight: 500;
            }
            .action_staff{
                margin-left: 7px;
                color: #3498db;
            }
        </style>
    </head>
    <body>
        <div>
            <%@include file="DashBoardSlideBarVer2.jsp" %>
            <div style="flex: 1; position: absolute; width: 80%;top: 0; left: 265px;">
                <h1 class="m-2">Quản lý nhân viên</h1>
                <div class="mx-2 ms-1 border border-2 p-2 m-2">
                    <p class="btn btn-warning m-2" style="width: 200px;">
                        <a href="/StaffController/Create" class="text-decoration-none text-dark">Tạo tài khoản</a>
                    </p>
                    <table id="listStaff" class="table table-responsive" style="width:100%">
                        <thead>
                            <tr>
                                <th class="text-start nv-tab">Mã nhân viên</th>
                                <th class="text-start username-tab">Tên đăng nhập</th>
                                <th class="text-start">Họ và tên</th>
                                <th class="text-start gender-tab">Giới tính</th>
                                <th class="text-start position-tab">Chức vụ</th>
                                <th class="text-start">Thao tác</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                StaffDAO sdao = new StaffDAO();
                                ResultSet rs = sdao.getAllStaff();

                                if (rs != null) {
                                    while (rs.next()) {
                                    if(!rs.getString("username").equals("admin")){
                            %>
                            <tr>
                                <td class="text-start align-middle nv-tab"><%= rs.getInt("staff_id")%></td>
                                <td class="text-start align-middle username-tab"><%= rs.getString("username")%></td>
                                <td class="text-start align-middle"><%= rs.getString("fullname")%></td>
                                <td class="text-start align-middle gender-tab"><%= rs.getString("gender")%></td>
                                <td class="text-start align-middle position-tab"><%= rs.getString("position")%></td>
                                <td class="text-start">
                                    <%
                                        if (rs.getInt("isDelete") == 0) {
                                    %>
                                    <a href="/StaffController/DetailStaff/<%= rs.getInt("staff_id")%>" class="action_staff view_detail">Xem chi tiết</a>
                                    <a href="/StaffController/EditStaff/<%= rs.getInt("staff_id")%>" class="action_staff edit">Chỉnh sửa</a>
                                    <a href="/StaffController/DeleteStaff/<%= rs.getInt("staff_id")%>" class="action_staff delete">Xóa</a>
                                    <%
                                    } else {
                                    %>
                                    <a href="/StaffController/DetailStaff/<%= rs.getInt("staff_id")%>" class="action_staff view_detail">Xem chi tiết</a>
                                    <small style="font-size: 13px; color: #3e3e3e; font-style: italic">Tài khoản vô hiệu hóa</small>
                                    <%
                                        }
                                    %>

                                </td>
                            </tr>
                            <%
                                }
                                }
                            } else {
                            %>
                        <div class="d-flex align-items-center justify-content-center vh-100">
                            <div class="text-center">
                                <p class="fs-3"> Không tìm thấy nhân viên </p>
                            </div>
                        </div>
                        <%
                            }
                        %> 
                        <tbody>  
                    </table>
                </div>
            </div>
        </div>
        <script src="https://code.jquery.com/jquery-3.7.1.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>
        <script src="https://cdn.datatables.net/2.0.0/js/dataTables.js"></script>
        <script src="https://cdn.datatables.net/2.0.0/js/dataTables.bootstrap5.js"></script>
        <script>
            new DataTable('#listStaff');

            document.querySelector('.dt-length label').innerText = "Chọn lọc";
            document.querySelector('.dt-search label').innerText = "Tìm kiếm:"
        </script>
    </body>
</html>
