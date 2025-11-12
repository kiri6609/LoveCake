<%-- 
    Document   : AddProForm
    Created on : Feb 12, 2024, 3:05:47 PM
    Author     : Dell
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
        <link rel="stylesheet" href="/CSS/AddNewsForm.css"/>
        <style>
            .font-italic{
                font-style: italic;
            }
            .form-hover:hover {
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.5);
                border-radius: 0.5rem;
            }
        </style>
        <title>Thêm mới nhà cung cấp</title>
    </head>
    <body>
        <div class="row">
            <%@include file="DashBoardSlideBarVer2.jsp" %>
            <div class="col-lg-10 col-md-9 col-sm-9 min-vh-100 px-4 ps-4 mt-3" style="position: absolute;
                 left: 265px;
                 top: 0;
                 width: 80%;">
                <form method="post" action="SupplierController" class="border border-2 rounded-4 p-4 pt-2" style="margin: 0px 30px;" 
                      onsubmit="return validateAddSupplier()" >
                    <div class="text-center mb-3">
                        <span class="h3 fw-bold">Thêm mới nhà cung cấp</span>
                    </div>
                    <div style="gap: 20px;">
                        <div class="w-100">
                            <div class="form-outline w-100 form-group">
                                <div class="form-hover">
                                    <input type="text" id="proName" name="proName" placeholder="Tên nha cung cap"
                                           class="form-control form-control-lg" />
                                    <label for="proName" class="form-label">Tên nhà cung cấp</label>
                                </div>
                                <span class="error errorProName text-danger fw-bold font-italic"></span>
                            </div>
                            <div class="form-group w-100 mt-4">
                                <div class="form-hover">
                                    <input type="text" id="email" name="email" placeholder="Email" class="form-control form-control-lg"/>
                                    <label for="email" class="form-label">Email</label>
                                </div>
                                <span class="errorEmail text-danger fw-bold font-italic"></span>
                            </div>
                            <div class="form-group w-100 mt-4">
                                <div class="form-hover">
                                    <input type="text" id="phone" name="phone" placeholder="Số điện thoại" class="form-control form-control-lg"/>
                                    <label for="Phone" class="form-label">Số điện thoại</label>
                                </div>
                                <span class="errorPhone text-danger fw-bold font-italic"></span>
                            </div>
                            <div class="form-group w-100 mt-4">
                                <div class="form-hover">
                                    <input type="text" id="address" name="address" placeholder="Dia chi" class="form-control form-control-lg"/>
                                    <label for="address" class="form-label">Địa chỉ</label>
                                </div>
                                <span class="errorAddress text-danger fw-bold font-italic"></span>
                            </div>
                            <div class="form-outline mt-3 w-100 mb-0">
                                <label class="form-label h5">Tên sản phẩm cung cấp</label>
                                <div class="form-hover">
                                    <select class="w-100 form-control form-control-lg" name="pro_id">
                                        <c:forEach items="${listPro}" var="c">
                                            <option value="${c.pro_id}">${c.pro_name}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                            </div>

                        </div>
                        <div class="form-outline mb-3 mt-4">
                            <input type="submit" name="AddSupplier" class="btn btn-success w-100" style="font-size: 20px" value="Thêm mới"/>
                        </div> 
                </form>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
        crossorigin="anonymous"></script>
        <script src="/JS/AddProAdmin.js"></script>
    </body>
</html>