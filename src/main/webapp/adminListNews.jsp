<%-- 
    Document   : adminListNews
    Created on : Feb 17, 2024, 8:17:22 PM
    Author     : PC
--%>

<%@page import="DAOs.NewsDAO"%>
<%@page import="java.util.LinkedList"%>
<%@page import="Models.News"%>
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
        <title>Quản lý tin tức</title>
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

            .news-tab{
                width: 10%;
            }
        </style>
    </head>
    <body>
        <div>
            <%@include file="DashBoardSlideBarVer2.jsp" %>
            <div style="flex: 1; position: absolute; width: 80%;top: 0; left: 265px;">
                <h1 class="m-2">Quản lý tin tức</h1>
                <div class="mx-2 ms-1 border border-2 p-2 m-2">
                    <p class="btn btn-warning m-2" style="width: 200px;">
                        <a href="AddNews" class="text-decoration-none text-dark">Thêm mới tin tức</a>
                    </p>
                    <table id="example" class="table table-responsive" style="width:100%">
                        <thead>
                            <tr>
                                <th class="text-start news-tab">Mã TT</th>
                                <th class="text-start">Tiêu đề</th>
                                <th class="text-start">Tên tác giả</th>
                                <th class="text-start">Ngày viết</th>
                                <th class="text-start">Thao tác</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                StaffDAO staffDAO = new StaffDAO();
                                NewsDAO newsDAO = new NewsDAO();
                                LinkedList<News> listNews = newsDAO.getAll();
                                for (News element : listNews) {
                                    String fullname = staffDAO.getFullNameByID(element.getStaff_id());
                            %>
                            <tr>
                                <td class="text-start align-middle news-tab"><%= element.getNews_id()%></td>
                                <td class="text-start align-middle"><%= element.getTitle()%></td>
                                <td class="text-start align-middle"><%= fullname%></td>
                                <td class="text-start align-middle"><%= element.getCreate_date()%></td>
                                <td class="text-start">
                                    <a href="AdminNewsDetail?news_id=<%= element.getNews_id()%>" class="btn btn-primary">Xem chi tiết</a>
                                    <a href="UpdateNews?news_id=<%= element.getNews_id()%>" class="btn btn-success">Chỉnh sửa</a>
                                    <a href="DeleteNews?news_id=<%= element.getNews_id()%>" class="btn btn-danger">Xóa</a>
                                </td>
                            </tr>
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
            new DataTable('#example');
        </script>
    </body>
</html>
