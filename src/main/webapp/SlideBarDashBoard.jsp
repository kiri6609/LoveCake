<%-- 
    Document   : admin
    Created on : Feb 6, 2024, 9:45:37 AM
    Author     : Dell
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Trang Admin</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">
        <link rel="icon" type="image/png" href="images/Lovecake.png">
        <link rel="stylesheet" href="CSS/admin.css">
        <script src="https://kit.fontawesome.com/1bd9fa3a2e.js" crossorigin="anonymous"></script>
    </head>

    <body>

        <div
            class="d-flex flex-column justify-content-between col-lg-2 col-md-3 col-sm-3 min-vh-100 border border-1 slide-bar">
            <div class="">
                <ul class="menu">
                    <li class="">
                        <p class="text-center mt-3 pb-3 border-bottom ms-2"><a href=""
                                                                               class="text-decoration-none fs-5">DashBoard</a></p>
                    </li>
                    <li class="item">
                        <p class="sub-btn"><a class="text-decoration-none" href="">Danh sách sản phẩm</a><i
                                class="fas fa-angle-right dropdown"></i></p>
                        <div class="sub-menu">
                            <p><a class="sub-item text-decoration-none" href="#">Top 5 sản phẩm bán chạy</a>
                            </p>
                            <p class=""><a class="sub-item text-decoration-none " href="#">Lịch sử sản phẩm</a></p>
                            <!-- <p class=""><a class="sub-item text-decoration-none " href="#">Set nguyên liệu
                                    bánh mì</a></p>
                            <p class=""><a class="sub-item text-decoration-none" href="#">Set nguyên liệu
                                    bánh ăn vặt</a></p>
                            <p class=""><a class="sub-item text-decoration-none " href="#">Set nguyên liệu
                                    làm socola</a></p> -->
                        </div>
                    </li>

                    <li class="item">
                        <p class="sub-btn"><a class="text-decoration-none" href="">Danh sách đơn hàng</a><i
                                class="fas fa-angle-right dropdown"></i></p>
                        <div class="sub-menu">
                            <p><a class="sub-item text-decoration-none" href="#">Lịch sử đơn hàng</a>
                            </p>
                            <!-- <p class="m-0 pb-0"><a class="sub-item text-decoration-none " href="#">Whipping(Cream)</a>
                            </p>
                            <p class="m-0 pb-0"><a class="sub-item text-decoration-none " href="#">Phô
                                    mai(cheese)</a></p>
                            <p class="m-0 pb-0"><a class="sub-item text-decoration-none " href="#">Sữa và sản phẩm
                                    làm từ sữa</a></p> -->
                        </div>
                    </li>

                    <li class="item">
                        <p class="sub-btn"><a class="text-decoration-none" href="">Danh sách nhân viên</a></p>

                    </li>



                    <li class="item">
                        <p class="sub-btn"><a class="text-decoration-none" href="">Danh sách khách hàng</a></p>
                    </li>

                    <li class="item">
                        <p class="sub-btn"><a class="text-decoration-none" href="">Danh sách tin tức</a><i
                                class="fas fa-angle-right dropdown"></i></p>
                        <div class="sub-menu">
                            <p><a class="sub-item text-decoration-none" href="#">Lịch sử tin tức</a></p>

                        </div>
                    </li>
                    <li class="item">
                        <p class="sub-btn"><a class="text-decoration-none" href="">Nhà cung cấp & nhập
                                hàng</a></p>
                        <!-- <div class="sub-menu">
                            <p><a class="sub-item text-decoration-none" href="#">Danh sách nhà cung cấp</a></p>
                            <p><a class="sub-item text-decoration-none" href="#">sub1</a></p>
                            <p><a class="sub-item text-decoration-none" href="#">sub1</a></p>
                        </div> -->
                    </li>
                    <li class="item">
                        <p class="sub-btn"><a class="text-decoration-none" href="">Profile</a><i
                                class="fas fa-angle-right dropdown"></i></p>
                        <div class="sub-menu">
                            <p><a class="sub-item text-decoration-none" href="#">sub1</a></p>
                            <p><a class="sub-item text-decoration-none" href="#">sub1</a></p>
                            <p><a class="sub-item text-decoration-none" href="#">sub1</a></p>
                        </div>
                    </li>

                </ul>

            </div>
        </div>




        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
        crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script type="text/javascript">
            $(document).ready(function () {
                $('.sub-btn').click(function () {
                    $(this).next('.sub-menu').slideToggle();
                });
            });
        </script>
    </body>

</html>
