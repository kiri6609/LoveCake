<%-- 
    Document   : newsDetail
    Created on : Feb 22, 2024, 1:57:01 PM
    Author     : HP
--%>

<%@page import="java.sql.Date"%>
<%@page import="Models.Product"%>
<%@page import="DAOs.ProductDAO"%>
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
        <title>${news.getTitle()}</title>
        <script src="https://kit.fontawesome.com/1bd9fa3a2e.js" crossorigin="anonymous"></script>
        <%@include file="headOfHome.jsp" %>
        <link rel="stylesheet" href="../CSS/newsDetail.css"/>
        <link rel="stylesheet" href="../CSS/listAllNews.css"/></head>
    <link rel="stylesheet" href="/CSS/style.css">

</head>
<body>

    <section id="main">
        <div class="address">
            <!--<a href="">Trang chủ</a> <span class="from_to"></span>-->
            <a style="font-size: 1.3rem" class="fw-bold" href="/HomeController">Trang chủ</a> <i class="fa-solid fa-chevron-right"></i>
            <a style="font-size: 1.3rem" class="fw-bold" href="listNews">Blog</a> <i class="fa-solid fa-chevron-right"></i>
            <span style="font-size: 1.3rem" class="name_product_add fw-bold">${news.getTitle()}</span>
        </div>

        <div class="content">

            <div class="main_content">
                <div class="title">
                    <h2>${news.getTitle()}</h2>
                </div>
                <div class="infor_news">
                    <div class="time_publish">
                        <i class="fa-regular fa-clock"></i> ${news.getCreate_date()}
                    </div>
                    <div class="author">
                        <%
                            StaffDAO staffDAO = new StaffDAO();
                            NewsDAO newsDAO = new NewsDAO();
                            News news = newsDAO.getTop1News();
                            String fullname = staffDAO.getFullNameByID(news.getStaff_id());
                        %>
                        <i class="fa-solid fa-feather-pointed"></i> <%= fullname%>
                    </div>
                </div>
                <div class="img_news">
                    <div>
                        <img src="/${news.getImage_url()}" alt="">
                    </div>
                </div>

                <div class="mt-5">
                    <div class="paragraph content_1 mt-3">
                        <div class="title_content text-lg-start mb-3">${news.getTitle_content()}</div>
                        <div>
                            <p>${news.getContent1()}</p>
                        </div>
                    </div>
                    <div class="paragraph content_2">
                        <!--<div class="title_content">Ăn kẹo sáp thế nào là đúng cách?</div>-->
                        <div>
                            <p>${news.getContent2()}</p>
                        </div>
                    </div>
                    <div class="paragraph content_3">
                        <!--<div class="title_content">Kẹo sáp là gì?</div>-->
                        <div>
                            <p>${news.getContent3()}</p>
                        </div>
                    </div>
                </div>
            </div>

            <aside class="more_content">
                <div class="more_title">
                    Các bài viết khác
                </div>
                <div class="other_list">
                    <%
                        LinkedList<News> listNews = newsDAO.getTop3News();
                        for (News element : listNews) {
                            fullname = staffDAO.getFullNameByID(element.getStaff_id());
                    %>
                    <div class="card_news">
                        <a href="./newsDetail?news_id=<%= element.getNews_id()%>" class="other_img">
                            <img src="/<%= element.getImage_url()%>" alt="">
                        </a>

                        <div class="card_news_bot">
                            <a href="./newsDetail"><%= element.getTitle()%></a>
                            <div class="other_infor">
                                <span><i class="fa-regular fa-clock"></i> <%= element.getCreate_date()%></span>
                                <span><i class="fa-solid fa-feather-pointed"></i> <%= fullname%></span>
                            </div>
                        </div>
                    </div>
                    <%
                        }
                    %>
                </div>
            </aside>
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
    </section>
</body>
<%@include file="footerOfHome.jsp" %>
<style>
    a {
        color: #3e3e3e;
        text-decoration: none;
        transition: 0.15s;
    }

</style>
</html>
