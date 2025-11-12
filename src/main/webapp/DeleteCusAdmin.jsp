<%-- 
    Document   : AddCusAdmin
    Created on : Feb 24, 2024, 5:57:30 PM
    Author     : Dell
--%>

<%@page import="Models.Account"%>
<%@page import="DAOs.AccountDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" />
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
        <title>Xóa khách hàng</title>
    </head>
    <body>
        <div class="row">
            <%@include file="DashBoardSlideBarVer2.jsp" %>


            <div class="col-lg-10 col-md-9 col-sm-9 min-vh-100 mt-3" style="position: absolute;
                 left: 265px;
                 top: 0;
                 width: 80%;">
                <form method="post" action="CustomerController" class="border border-2 rounded-4 p-4 pt-2" style="margin: 0px 30px">
                    <div class="text-center mb-3">
                        <span class="h3 fw-bold">Xóa khách hàng</span>
                    </div>

                    <div class="form-group w-100" >
                        <div class="form-hover">
                            <input type="hidden" id="acc_id" name="acc_id" placeholder="" class="form-control form-control-lg" value="${acc_id}" readonly/>
                            <input type="hidden" id="cus_id" name="cus_id" placeholder="" class="form-control form-control-lg" value="${cus_id}" readonly/>
                        </div>
                        <span class="errorFullname text-danger fw-bold font-italic"></span>
                    </div>
                    <div class="form-group w-100">
                        <div class="form-hover">
                            <input type="text" id="fullname" name="fullname" placeholder="Họ và tên" class="form-control form-control-lg" value="${fullname}" readonly/>
                            <label for="fullname" class="form-label">Họ và tên</label>
                        </div>
                        <span class="errorFullname text-danger fw-bold font-italic"></span>
                    </div>

                    <div class="form-outline mt-4 w-100">
                        <div class="validate form-outline col">
                            <label class="form-label h5">Avatar</label>
                            <div class="form-hover">
                                <input type="file" name="newsPic" id="newsPic" accept="image/*" 
                                       onchange="displayImage(event, 'displayImage')" 
                                       class="border form-control form-control-lg" value="${avatar}" readonly>
                            </div>
                        </div>
                        <div id="displayImage" class="mt-2 w-25">
                            <img src="/${avatar}" alt="No Image" id="defaultImage" style="max-width: 100%;">
                        </div>
                    </div>


                    <div class="form-group w-100 mt-4">
                        <div class="form-hover">
                            <input type="text" id="email" name="email" placeholder="Email" class="form-control form-control-lg" value="${email}" readonly/>
                            <label for="email" class="form-label">Email</label>
                        </div>
                        <span class="errorEmail text-danger fw-bold font-italic"></span>
                    </div>
                    <div class="form-group w-100 mt-4">
                        <div class="form-hover">
                            <input type="text" id="Phone" name="Phone" placeholder="Số điện thoại" value="${phone_number}" class="form-control form-control-lg" readonly/>
                            <label for="Phone" class="form-label">Số điện thoại</label>
                        </div>
                        <span class="errorPhone text-danger fw-bold font-italic"></span>
                    </div>
                    <div class="form-group w-100 mt-4">
                        <div class="form-hover">
                            <input type="text" id="username" name="username" value="${username}" placeholder="Tên đăng nhập" class="form-control form-control-lg" readonly/>
                            <label for="username" class="form-label">Tên đăng nhập</label>
                        </div>
                        <span class="errorUsername text-danger fw-bold font-italic"></span>
                    </div>
                    <div class="form-group w-100 mt-4">
                        <div class="form-hover">
                            <input type="password" id="pass" name="pass" value="${password}" placeholder="Mật khẩu" class="form-control form-control-lg" readonly/>
                            <label for="pass" class="form-label">Mật khẩu</label>
                        </div>
                        <span class="errorPass text-danger fw-bold font-italic"></span>
                    </div>


                    <span class="error text-danger fw-bold font-italic text-center"></span>

                    <div class="form-outline mb-3 mt-4">

                       

                        <input type="submit" name="btnDeleteCus" class="btn btn-success w-100" style="font-size: 20px" value="Xóa tài khoản"/>

                    </div>  
                </form>
            </div>
        </div>
     
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
        crossorigin="anonymous"></script>
        <script src="JS/AddNewsForm.js"></script>

    </body>
</html>
