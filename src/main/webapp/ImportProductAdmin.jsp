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
        <title>Nhập sản phẩm</title>
    </head>
    <body>
        <div class="row">
            <%@include file="DashBoardSlideBarVer2.jsp" %>
            <div class="col-lg-10 col-md-9 col-sm-9 min-vh-100 px-4 ps-4 mt-3" style="position: absolute;
                 left: 265px;
                 top: 0;
                 width: 80%;">
                <form method="post" action="ProductController" class="border border-2 rounded-4 p-4 pt-2" style="margin: 0px 30px;" 
                      onsubmit="return validateImportPro()" >
                    <div class="text-center mb-3">
                        <span class="h3 fw-bold">Nhập sản phẩm</span>
                    </div>
                    <div style="gap: 20px;">


                        <div class="form-outline w-100 form-group">
                            <div class="form-hover">
                                <input type="text"  name="pro_id" placeholder="Ma sản phẩm"
                                       class="form-control form-control-lg" readonly value="${pro.pro_id}" />
                                <label class="form-label"> Mã sản phẩm</label>
                            </div>
                            <span class="error errorBrand text-danger fw-bold font-italic"></span>
                        </div>
                        <div class="form-group form-outline mt-4 w-100">
                            <div class="form-hover">
                                <input type="text" id="proName" name="proName" placeholder="Tên sản phẩm"
                                       class="form-control form-control-lg" readonly value="${pro.pro_name}"/>
                                <label for="proName" class="form-label" >Tên sản phẩm</label>
                            </div>
                            <span class="error errorProName text-danger fw-bold font-italic"></span>
                        </div>
                        <div class="form-outline mt-3 w-100 mb-0">
                            <label class="form-label h5">Nhà cung cấp sản phẩm</label>
                            <div class="form-hover">
                                <select class="w-100 form-control form-control-lg" name="sup_id">
                                    <c:forEach items="${listSup}" var="s">
                                        <option value="${s.sup_id}">${s.company_name}</option>
                                    </c:forEach>
                                </select>
                            </div>
                        </div>
                        <div class="form-group form-outline mt-4 w-100">
                            <div class="form-hover">
                                <input type="number" id="quantity" name="quantity" placeholder="Số lượng"
                                       class="form-control form-control-lg" min="1" />
                                <label for="quantity" class="form-label">Số lượng</label>
                            </div>
                            <span class="error errorQuantity text-danger fw-bold font-italic"></span>
                        </div>


                        <div class="form-outline mb-3 mt-4">
                            <input type="submit" name="ImportPro" class="btn btn-success w-100" style="font-size: 20px" value="Xác nhận đặt hàng"/>
                        </div> 
                </form>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
        crossorigin="anonymous"></script>
        <script>
                          function validateImportPro() {
                              var quantity = document.getElementById('quantity').value.trim();



                              var errorQuantity = document.querySelector(".errorQuantity");

                              errorQuantity.innerHTML = '';


                              var isValid = true;

                              if (quantity === '') {
                                  errorQuantity.innerHTML = "Nhập số lượng!";
                                  isValid = false;
                              }

                              return isValid;
                          }
        </script>
    </body>
</html>