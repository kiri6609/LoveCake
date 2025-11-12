<%-- 
    Document   : listAllNews
    Created on : Feb 22, 2024, 1:31:19 PM
    Author     : HP
--%>

<%@page import="java.sql.Date"%>
<%@page import="Models.News"%>
<%@page import="java.util.LinkedList"%>
<%@page import="DAOs.NewsDAO"%>
<%@page import="DAOs.StaffDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Danh sách tin tức</title>
        <script src="https://kit.fontawesome.com/1bd9fa3a2e.js" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="../CSS/listAllNews.css"/></head>
        <%@include file="headOfHome.jsp" %>
    <body>

        <section class="banner mt-1">
            <i class="fa-solid fa-circle control prev"></i>
            <i class="fa-solid fa-circle control next"></i>
            <div class="wrapper">
                <img src="../images/slider_1_blog.png" alt="">
            </div>
            <div class="list_img">
                <img src="../images/slider_1_blog.png" alt="">
                <img src="../images/slider_3_blog.png" alt="">
            </div>
        </section>

        <div class="content">
            <div class="layout1">
                <div class="layout1_title">
                    <a href="listNews">Các bài viết nổi bật</a>
                </div>
                <div class="layout1_content">
                    <aside>
                        <%
                            StaffDAO staffDAO = new StaffDAO();
                            NewsDAO newsDAO = new NewsDAO();
                            News news = newsDAO.getTop1News();
                            String fullname = staffDAO.getFullNameByID(news.getStaff_id());
                        %>
                        <a href="./newsDetail?news_id=<%= news.getNews_id()%>" class="other_img">
                            <img src="/<%= news.getImage_url()%>" alt="">
                        </a>
                        <div class="card_news_bot">
                            <a href="./newsDetail?news_id=<%= news.getNews_id()%>"> <%= news.getTitle()%></a>
                            <div class="other_infor">
                                <span><i class="fa-regular fa-clock"></i> <%= news.getCreate_date()%></span>
                                <span><i class="fa-solid fa-feather-pointed"></i> <%= fullname%></span>
                            </div>
                            <div class="read_more">
                                <span>
                                    <span><%= news.getTitle_content()%></span>
                                    <a href="./newsDetail?news_id=<%= news.getNews_id()%>">[Đọc tiếp]</a>
                                </span>
                            </div>
                        </div>
                    </aside>
                    <div class="layout1_right">
                        <%
                            LinkedList<News> listNews = newsDAO.getTop3News();
                            for (News element : listNews) {
                                fullname = staffDAO.getFullNameByID(element.getStaff_id());
                                String image_url = element.getImage_url();
                                String title = element.getTitle();
                        %>
                        <div class="right_card">
                            <a href="./newsDetail?news_id=<%= element.getNews_id()%>">
                                <img src="/<%= image_url%>" alt="">
                            </a>
                            <div class="bot_right_card">
                                <a href="./newsDetail?news_id=<%= element.getNews_id()%>"><%= title%></a>
                                <div class="card_right_infor">
                                    <span><i class="fa-regular fa-clock"></i> <%= element.getCreate_date()%></span>
                                </div>
                                <div class="card_right_read_more">
                                    <p><%= element.getTitle_content()%></p>
                                </div>
                            </div>
                        </div>
                        <%
                            }
                        %>
                    </div>
                </div>
            </div>

            <div class="layout2">
                <div class="layout2_title">
                    <h3>Tất cả các bài viết</h3>
                </div>
                <div class="list_card_news">
                    <%
                        listNews = newsDAO.getAll();
                        for (News element : listNews) {
                            fullname = staffDAO.getFullNameByID(element.getStaff_id());
                            String image_url = element.getImage_url();
                            String title = element.getTitle();
                            Date create_date = element.getCreate_date();
                    %>
                    <div class="card_news">
                        <a href="./newsDetail?news_id=<%= element.getNews_id()%>" class="other_img">
                            <img src="/<%= image_url%>" alt="">
                        </a>
                        <div class="card_news_bot">
                            <a href="./newsDetail?news_id=<%= element.getNews_id()%>"><%= title%></a>
                            <div class="other_infor">
                                <span><i class="fa-regular fa-clock"></i> <%= news.getCreate_date()%></span>
                                <span><i class="fa-solid fa-feather-pointed"></i> <%= fullname%></span>
                            </div>
                        </div>
                    </div>
                    <%
                        }
                    %>
                </div>
            </div>
        </div>
    </body>
    <%@include file="footerOfHome.jsp" %>
    <style>
        a{
            color: #3e3e3e;
            text-decoration: none;
            transition: 0.15s;
        }
    </style>
    <script src="../JS/listAllNews.js"></script>
</html>
