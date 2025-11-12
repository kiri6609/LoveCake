<%-- 
    Document   : cart
    Created on : Feb 13, 2024, 12:14:36 PM
    Author     : Dell
--%>

<%@page import="DAOs.CartDAO"%>
<%@page import="DAOs.ProductDAO"%>
<%@page import="java.util.LinkedList"%>
<%@page import="Models.Product"%>
<%@page import="Models.Cart"%>
<%@page import="Models.Customer"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
        crossorigin="anonymous"></script>
        <title>Giỏ hàng</title>
        <link rel="stylesheet" href="/CSS/cart.css"/>
        <script src="https://kit.fontawesome.com/1bd9fa3a2e.js" crossorigin="anonymous"></script>
    </head>
    <body>
        <%@include file="headOfCart.jsp" %>

        <div class="container-fluid mt-3">
            <%
                CartDAO cdao = new CartDAO();
            %>
            <form class="container-fluid" action="CartController" method="post" onsubmit="return validateCheckBox();">

                <div class="cart_title">Giỏ hàng</div>

                <div class="cart_body">

                    <div class="left_cart">
                        <%
                            ProductDAO pdao = new ProductDAO();
                            LinkedList<Cart> listCart = (LinkedList<Cart>) request.getAttribute("listCart");
                            if (listCart.isEmpty()) {
                        %>
                        <h3 class="noti_null">Chưa có sản phẩm trong giỏ hàng</h3>
                        <%
                        } else {
                        %>
                        <div class="list_cart">
                            <%
                                Customer cus = (Customer) request.getSession().getAttribute("account");
                                for (Cart item : listCart) {
                                    Product pro = pdao.getProductByID(item.getPro_id());
                            %>
                            <!-- CART -->
                            <div class="cart">
                                <div class="top_cart">

                                    <!-- CHECKBOX GROUP -->
                                    <div class="checkbox-wrapper-21 group_checkbox">
                                        <%
                                            if (item.getPro_quantity() <= pro.getPro_quantity()) {
                                        %>
                                        <label class="control control--checkbox">
                                            Chọn
                                            <input type="checkbox" value="<%= pro.getPro_id()%>" name="checkBoxID" class="chooseCheckBoxID" onclick="getCheckBox(this)"/>
                                            <input type="hidden" value="<%= item.getCart_price()%>">
                                            <div class="control__indicator"></div>
                                        </label>
                                        <%
                                            } else {
                                        %>
                                        <p>Không đủ hàng tồn kho</p>
                                        <%
                                            }
                                        %>
                                    </div>
                                    <!-- END CHECKBOX GROUP -->

                                    <div class="mid_top_cart">
                                        <div class="img_cart">
                                            <img src="/<%= pro.getPro_image()%>" alt="image">
                                        </div>
                                        <div class="infor_cart">
                                            <p><%= pro.getPro_name()%></p>
                                            <p class="price_cart">Đơn giá: 
                                                <span>
                                                    <%
                                                        if (pro.getDiscount() < pro.getPro_price()) {
                                                    %>
                                                    <%= pro.getDiscount()%>
                                                    <%
                                                    } else {
                                                    %>
                                                    <%= pro.getPro_price()%>
                                                    <%
                                                        }
                                                    %>
                                                </span>
                                            </p>
                                        </div>
                                    </div>
                                    <div class="right_top_cart">
                                        <div class="group_quantity">
                                            <div class="control_quantity">
                                                <a name="decrease_quan" href="/CartController/decreaseQuantity/<%= pro.getPro_id()%>" onclick="this.parentNode.parentNode.querySelector('input[type=number]').stepDown();"><i class="fa-solid fa-minus"></i></a>
                                            </div>
                                            <input type="number" name="quantity" class="quantity proQuantity form-control text-center" value="<%= item.getPro_quantity()%>" min="1" max="<%= pro.getPro_quantity()%>" onchange="if(this.value == 0)this.value=1;"/>
                                            <div class="control_quantity">
                                                <a name="increase_quan" href="/CartController/increaseQuantity/<%= pro.getPro_id()%>" onclick="this.parentNode.parentNode.querySelector('input[type=number]').stepUp();"><i class="fa-solid fa-plus"></i></a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="bot_cart">
                                    <a class="deleteCart" onclick="return confirm('Bạn có muốn xóa sản phẩm này không?')" href="/CartController/delete/<%= item.getPro_id()%>">Xóa</a>
                                    <p style="font-weight: 700;">Thành tiền: <span style="font-weight: 500;"><%= item.getCart_price()%></span></p>
                                </div>
                            </div>
                            <!-- END CART -->

                            <%
                                }
                            %>
                        </div>

                        <!--END LIST CART-->
                        <%
                            }
                        %>
                    </div>

                    <div class="right_cart">
                        <h3 class="title_right" style="font-weight: 700">Thông tin đơn hàng</h3>
                        <div class="total">
                            <div class="total_price">
                                <p>Tổng tiền: <span id="total-price">0</span></p>
                            </div>

                            <%
                                if (!listCart.isEmpty()) {
                            %>
                            <div class="pay">
                                <input type="submit" value="Tiến hành đặt hàng" name="btnBuyInCart"/>
                            </div>
                            <%
                                }
                            %>

                        </div>
                    </div>

                </div>

            </form>          
        </div>

        <script>
            var toltalPrice = 0;
            function getCheckBox(obj) {
                console.log(obj.checked);
                if (obj.checked === true) {
                    toltalPrice += parseFloat(obj.nextElementSibling.value);
                } else if (obj.checked === false) {
                    toltalPrice -= parseFloat(obj.nextElementSibling.value);
                }
                var displayTotal = document.querySelector("#total-price");
                displayTotal.innerHTML = toltalPrice;
            }

            function validateCheckBox() {
                var checkboxes = document.querySelectorAll(".chooseCheckBoxID");
                let atLeastOneChecked = false;
                for (var i = 0; i < checkboxes.length; i++) {
                    if (checkboxes[i].checked) {
                        atLeastOneChecked = true;
                        break;
                    }
                }

                if (!atLeastOneChecked) {
                    alert("You must select at least one checkbox.");
                    atLeastOneChecked = false;
                }

                return atLeastOneChecked;
            }
        </script>
    </body>

</html>