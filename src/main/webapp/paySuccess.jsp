<%-- 
    Document   : paySuccess
    Created on : Feb 18, 2024, 9:37:48 PM
    Author     : PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
        <link rel="stylesheet" href="/CSS/paySuccessStyle.css"/>
        <link rel="icon" type="image/png" href="/images/Lovecake.png">
        <title>Thanh toán thành công</title> 
    </head>
    <body>
        <%@include file="headOfHome.jsp" %>
        <div class="container p-0">
            <div class="card px-4">
                <i class="pt-3 fa-solid fa-circle-check fa-4x"></i>
                <p class="h8 py-3">Thanh toán thành công</p>
                <c:if test="${getOrderWhenPay != null}">
                    <div class="row gx-3">
                        <div class="col-12">
                            <div class="d-flex flex-column">
                                <p class="text mb-1">Phương thức thanh toán</p>
                                <p class="mb-3">${getOrderWhenPay.payment}</p>
                            </div>
                        </div>
                        <c:choose>
                            <c:when test="${getOrderWhenPay.payment == 'COD'}">                           
                            </c:when>
                            <c:otherwise>
                                <div class="col-12">
                                    <div class="d-flex flex-column">
                                        <p class="text mb-1">Ngân hàng</p>
                                        <p class="mb-3">NCB</p>
                                    </div>
                                </div>
                            </c:otherwise>
                        </c:choose>
                        <div class="col-12">
                            <div class="d-flex flex-column">
                                <p class="text mb-1">Số tiền thanh toán</p>
                                <p class="mb-3">${getOrderWhenPay.total_price}</p>
                            </div>
                        </div>
                        <div class="col-12">
                            <a href="/ProductController" class="btn btn-primary mb-3">
                                <span class="ps-3">Tiếp tục mua hàng</span>
                                <span class="fas fa-arrow-right"></span>
                            </a>
                        </div>
                    </div>
                </c:if>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    </body>
</html>
