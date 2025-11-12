<%-- 
    Document   : footerOfHome
    Created on : Feb 16, 2024, 8:23:46 PM
    Author     : PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">
        <link rel="stylesheet" href="/CSS/footer.css">
        <script src="https://kit.fontawesome.com/1bd9fa3a2e.js" crossorigin="anonymous"></script>
    </head>
    <body>
        <footer class="text-center text-lg-start text-white" style="background-color: #d5e3e4">
            <!-- Section: Links  -->
            <section class="">
                <div class="container text-center text-md-start mt-5 pt-2">
                    <!-- Grid row -->
                    <div class="row mt-3">
                        <!-- Grid column -->
                        <div class="col-md-4 col-lg-4 col-xl-4 mx-auto mb-4">
                            <!-- Content -->
                            <!-- <h6 class="text-uppercase fw-bold">Company name</h6> -->
                            <a href=""><img class="border rounded-circle" src="/images/Lovecake.png" alt="logo"
                                            style="width: 100px; height: 80px;"></a>
                            <p class="mt-3 text-secondary">
                                Kiến thức cơ bản về đồ làm bánh 
                                Công thức hướng dẫn làm bánh
                                Công thức làm chè, kem, đồ uống
                                Làm bánh không cần lò nướng
                            </p>
                        </div>
                        <!-- Grid column -->

                        <!-- Grid column -->
                        <div class="col-md-4 col-lg-4 col-xl-3 mx-auto mb-4">
                            <!-- Links -->
                            <h6 class="text-uppercase fw-bold text-secondary">Truy cập nhanh</h6>
                            <hr class="mb-4 mt-0 d-inline-block mx-auto"
                                style="width: 60px; background-color: #3f1b1b; height: 2px" />
                            <p>
                                <a href="/HomeController" class="text-secondary text-decoration-none">Trang chủ</a>
                            </p>
                            <p>
                                <a href="/CustomerController/aboutUs" class="text-secondary text-decoration-none">Giới thiệu</a>
                            </p>
                            <p>
                                <a href="/CustomerController/listNews" class="text-secondary text-decoration-none">Tin tức</a>
                            </p>
                        </div>
                        <!-- Grid column -->

                        <!-- Grid column -->
                        <div class="col-md-4 col-lg-3 col-xl-3 mx-auto mb-md-0 mb-4">
                            <!-- Links -->
                            <h6 class="text-uppercase fw-bold text-secondary">Liên hệ</h6>
                            <hr class="mb-4 mt-0 d-inline-block mx-auto"
                                style="width: 60px; background-color: #3f1b1b; height: 2px" />
                            <p class="text-secondary"><i class="fas fa-home mr-3"></i> Cần Thơ</p>
                            <p class="text-secondary"><i class="fas fa-envelope mr-3"></i> lovecake@gmail.com</p>
                            <p class="text-secondary"><i class="fas fa-phone mr-3"></i> 090000000</p>
                            <p class="mt-1">
                                <!-- Facebook -->
                                <a type="button" class="button-icon rounded-circle btn btn-primary btn-lg"><i class="social-icon fa fa-facebook-f"></i></a>
                                <!-- Dribbble -->
                                <a type="button" class="button-icon rounded-circle btn btn-primary btn-lg"><i class="social-icon fa fa-instagram"></i></a>
                                <!-- Twitter -->
                                <a type="button" class="button-icon rounded-circle btn btn-primary btn-lg"><i class="social-icon fa fa-twitter"></i></a>
                                <!-- Google + -->
                                <a type="button" class="button-icon rounded-circle btn btn-primary btn-lg"><i class="social-icon fa fa-google"></i></a>
                                <!-- Linkedin -->
                            </p>
                        </div>
                        <!-- Grid column -->
                    </div>
                    <!-- Grid row -->
                </div>
            </section>
            <!-- Section: Links  -->

            <!-- Copyright -->
            <div class="text-center p-3" style="background-color: #454445">
                © 2020 Copyright:
                <a class="text-white text-decoration-none" href="https://mdbootstrap.com/">Group4</a>
            </div>
            <!-- Copyright -->
        </footer>
    </body>
</html>
