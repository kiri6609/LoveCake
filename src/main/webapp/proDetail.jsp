<%-- 
    Document   : proDetail
    Created on : Feb 13, 2024, 12:59:29 PM
    Author     : Dell
--%>

<%@page import="Models.Product"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Chi tiết sản phẩm</title>
        <link rel="stylesheet" href="/CSS/proDetail.css"/>
        <script src="https://kit.fontawesome.com/1bd9fa3a2e.js" crossorigin="anonymous"></script>
    </head>
    <body>
        <%--<%@include file="headOfCart.jsp" %>--%>
        <%@include file="headOfHome.jsp" %>
        <main style="margin-bottom: 100px;">
            <div class="content">

                <div id="address_page">
                    <a href="/HomeController" class="text-decoration-none" style=" color: #ff6123;">Trang chủ</a> <span class="from_to">></span>
                    <a class="text-decoration-none" style=" color: #ff6123;">${cat.typeCategories}</a> <span class="from_to">></span>
                    <span class="name_product_add">${pro.pro_name}</span>
                </div>

                <div id="product_detail_container">

                    <div class="img_product_gallery">
                        <div class="main_img">
                            <span class="control next">
                                <i class="fa-solid fa-arrow-right"></i>
                            </span>
                            <span class="control prev">
                                <i class="fa-solid fa-arrow-left"></i>
                            </span>
                            <div class="img_wrap">
                                <img src="/${pro.pro_image}" alt="Lovecake">
                            </div>
                        </div>
                        <div class="list_img">
                            <c:forEach items="${listPI}" var="p">
                                <div>
                                    <img src="/${p.image_url}" alt="">
                                </div>
                            </c:forEach>
                        </div>
                    </div>

                    <form class="infor_product" action="ProductController" method="post">

                        <div class="intro_product">
                            <input type="hidden" name="proID" value="${pro.pro_id}">
                            <div class="name_product">${pro.pro_name}</div>
                            <div class="id_product">Mã sản phẩm: <span>${pro.pro_id}</span></div>
                            <div class="cost_product"></div>
                        </div>

                        <div class="choose_option">
                            <div class="quantity_product">
                                <span class="quantity_label">Số lượng: </span>
                                <div class="choose_quantity">
                                    <span class="decrease"
                                          onclick="this.parentNode.querySelector('input[type=number]').stepDown();">
                                        <i class="fa-solid fa-minus"></i>
                                    </span>
                                    <input type="number" name="quantityBuyInShop" value="1" min="1" max="${pro.pro_quantity}" onchange="if(this.value == 0)this.value=1;">
                                    <span class="increase"
                                          onclick="this.parentNode.querySelector('input[type=number]').stepUp();">
                                        <i class="fa-solid fa-plus"></i>
                                    </span>
                                </div>
                            </div>



                            <c:if test="${pro.pro_quantity <= 0}">
                                <h1 style="color: #ff6223">Hết hàng</h1>
                            </c:if>

                            <c:if test="${pro.pro_quantity > 0}">


                                <div class="option_product">
                                    <button type="submit" name="btnBuyNow" class="buyNow_btn text-decoration-none">
                                        <div>
                                            <i class="fa-solid fa-bag-shopping"></i>Mua ngay
                                        </div>
                                        <div>
                                            Giao hàng tận tay quý khách
                                        </div>
                                    </button>
                                    <button href="submit" name="btnAddCartDetail" class="addCart_btn text-decoration-none">
                                        <div>
                                            <i class="fa-solid fa-cart-shopping"></i>Thêm vào giỏ hàng
                                        </div>
                                        <div>
                                            Chọn vào giỏ hàng để mua
                                        </div>
                                    </button>

                                </div>
                            </c:if>
                        </div>

                        <div class="more_infor">
                            <div class="freeShip">
                                <div></div>
                                Sản phẩm luôn nhận giao hàng Online.
                            </div>
                            <div class="more_infor_content">
                                <div class="brand">
                                    - Thương hiệu: <span>${pro.brand}</span>
                                </div>
                                <div class="origin">
                                    - Xuất xứ: <span>${pro.origin}</span>
                                </div>
                                <div class="component">
                                    - Thành phần: <span>${pro.ingredient}</span>
                                </div>
                                <div class="weight">
                                    - Trọng lượng: <span>${pro.mass}kg</span>
                                </div>
                                <div class="usesage">
                                    - Mô tả: <span>${pro.pro_description}</span>
                                </div>
                                <div class="preserve">
                                    - Số lượng trong kho: <span>${pro.pro_quantity}</span>
                                </div>
                            </div>
                        </div>

                    </form>
                </div>

                <!-- SẢN PHẨM HOT -->
                <div class="hot_product">
                    <!-- SELECT 5 PRODUCT -->
                    <div class="hot_product_title">
                        SẢN PHẨM HOT NHẤT
                    </div>

                    <!--NAM CODE HOT PRODUCT-->
                    <div class="list_card_item">
                        <c:forEach items="${listProHot}" var="proHot">

                            <!--NAM CODE-->
                            <form action="ProductController" method="post" class="card_product">
                                <input type="hidden" name="product-id" value="${proHot.pro_id}"/>
                                <a href="/ProductController/DetailProduct/${proHot.pro_id}" class="card_img">
                                    <img src="/${proHot.pro_image}" alt="">
                                </a>

                                <div class="card_content">
                                    <div class="card_top">
                                        <a href="/ProductController/DetailProduct/${proHot.pro_id}" class="card_title">${proHot.pro_name}</a>
                                    </div>

                                    <div class="card_infor">
                                        <div class="card_price">
                                            <c:if test="${proHot.discount == 0}">
                                                ${proHot.pro_price}đ
                                            </c:if>
                                            <c:if test="${proHot.discount > 0}">
                                                <span class="discount">${proHot.discount}đ</span>
                                                <span class="real_price" style=" text-decoration: line-through;">${proHot.pro_price}đ</span>    
                                            </c:if>

                                        </div>
                                        <button class="card_buy" name="btnAddCart" type="submit">
                                            <i class="fa-solid fa-cart-shopping"></i>
                                            <span>Thêm</span>
                                        </button>
                                    </div>
                                </div>
                            </form>    
                            <!--END NAM CODE-->
                        </c:forEach>
                    </div>
                    <!--END NAM CODE HOT PRODUCT-->
                </div>
            </div>
        </main>
        <%@include file="footerOfHome.jsp" %>

        <script src="/JS/product_detail.js"></script>
    </body>
</html>
