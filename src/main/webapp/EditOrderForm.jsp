<%-- 
    Document   : EditOrderForm
    Created on : Feb 20, 2024, 10:14:35 AM
    Author     : PC
--%>

<%@page import="Models.Product"%>
<%@page import="Models.OrderDetail"%>
<%@page import="java.util.LinkedList"%>
<%@page import="Models.Order"%>
<%@page import="DAOs.ProductDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <title>Chi tiết đơn hàng</title>
    </head>
    <body>
        <div>
            <%@include file="DashBoardSlideBarVer2.jsp" %>
            <div style="flex: 1; position: absolute; width: 80%;top: 0; left: 265px;">
                <h1 class="m-2">Cập nhật đơn hàng</h1>
                <section class="h-100">
                    <div class="container py-4 h-100">
                        <div class="row d-flex justify-content-center align-items-center h-100">
                            <c:if test="${getOrderByID != null}">
                                <div class="col-lg-10 col-xl-8" style="width: 100%;">
                                    <div class="card" style="border-radius: 10px;">
                                        <form class="card-body p-4" action="OrderController" style="width: 100%;"  method="post" >
                                            <div class="d-flex justify-content-between align-items-center mb-4">
                                                <input type="hidden" name="orderID" value="${getOrderByID.o_id}">
                                                <input type="hidden" name="staffID" value="${staff.staff_id}">
                                                <p class="fw-bold small text-muted mb-0">MÃ ĐƠN HÀNG : ${getOrderByID.o_id}</p>
                                            </div>
                                            <c:if test="${odList != null}">
                                                <%
                                                    ProductDAO pDAO = new ProductDAO();
                                                    Order getOrder = (Order) request.getAttribute("getOrderByID");
                                                    LinkedList<OrderDetail> odList = (LinkedList<OrderDetail>) request.getAttribute("odList");
                                                    for (OrderDetail elem : odList) {
                                                        Product pro = pDAO.getProductByID(elem.getPro_id());
                                                %>
                                                <div class="card shadow-0 border mb-4">
                                                    <div class="card-body">
                                                        <div class="row">
                                                            <div class="col-md-2">
                                                                <img src="/<%= pro.getPro_image()%>"
                                                                     class="img-fluid" alt="Phone">
                                                            </div>
                                                            <div class="col-md-6 text-center d-flex justify-content-center align-items-center">
                                                                <p class="text-muted mb-0"><%= pro.getPro_name()%></p>
                                                            </div>
                                                            <div class="col-md-2 text-center d-flex justify-content-center align-items-center">
                                                                <p class="text-muted mb-0 small">Số lượng: <%= elem.getQuantity()%></p>
                                                            </div>
                                                            <div class="col-md-2 text-center d-flex justify-content-center align-items-center">
                                                                <%
                                                                    if (pro.getDiscount() < pro.getPro_price()) {
                                                                %>
                                                                <p class="text-muted mb-0 small"><%= pro.getDiscount() * elem.getQuantity()%></p>
                                                                <%
                                                                } else {
                                                                %>
                                                                <p class="text-muted mb-0 small"><%= pro.getPro_price() * elem.getQuantity()%></p>
                                                                <%
                                                                    }
                                                                %>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <%
                                                    }
                                                %>
                                            </c:if>
                                            <div class="d-flex justify-content-between pt-2">
                                                <p class="fw-bold mb-0">Chi tiết đơn hàng</p>
                                            </div>

                                            <div class="d-flex justify-content-between pt-2">
                                                <p class="text-muted mb-0"><span class="me-2">Người đặt hàng:</span>${cus.username}</p>
                                                <p class="text-muted mb-0"><span class="me-2">Số điện thoại:</span>${cus.phone_number}</p>
                                            </div>

                                            <div class="d-flex justify-content-between">
                                                <p class="text-muted mb-0"><span class="me-2">Ngày đặt hàng:</span>${getOrderByID.o_date}</p>
                                            </div>

                                            <div class="d-flex justify-content-between">
                                                <p class="text-muted mb-0"><span class="me-2">Địa chỉ:</span>${getOrderByID.address}</p>
                                            </div>

                                            <div class="d-flex justify-content-between mt-2">
                                                <p class="text-muted mb-0" style="display: flex;"><span class="fw-bold me-4 mt-2">Trạng thái: </span>
                                                    <span>
                                                        <select class="form-select" name="statusBtn">
                                                            <option>${getOrderByID.status}</option>
                                                            <option value="Chờ xác nhận">Chờ xác nhận</option>
                                                            <option value="Đã xác nhận">Đã xác nhận</option>
                                                            <option value="Đang giao">Đang giao</option>
                                                            <option value="Đã giao">Đã giao</option>
                                                            <option value="Đã hủy">Đã hủy</option>
                                                        </select>
                                                    </span>
                                                </p>
                                                <p class="text-muted mb-0 mt-2"><span class="fw-bold me-4">Phương thức thanh toán: </span>${getOrderByID.payment}</p>
                                            </div>

                                            <div class="d-flex justify-content-between mt-3">
                                                <input type="submit" name="updateOrderAdminBtn" class="btn btn-success" style="font-size: 20px" value="Cập nhật trạng thái"/>
                                            </div>
                                        </form>
                                        <div class="card-footer border-0 px-4 py-5"
                                             style="background-color: #a8729a; border-bottom-left-radius: 10px; border-bottom-right-radius: 10px;">
                                            <h5 class="d-flex align-items-center justify-content-end text-white text-uppercase mb-0">Tổng tiền : <span class="h2 mb-0 ms-2 text-white">${getOrderByID.total_price}</span></h5>
                                        </div>
                                    </div>
                                </div>
                            </c:if>
                        </div>
                    </div>
                </section>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    </body>
</html>
