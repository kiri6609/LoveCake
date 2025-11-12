<%-- 
    Document   : AddnewStaff
    Created on : Feb 24, 2024, 11:28:40 AM
    Author     : Admin
--%>

<%@page import="java.util.LinkedList"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="DAOs.AccountDAO"%>
<%@page import="Models.Account"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Thêm mới nhân viên</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
        <link rel="stylesheet" href="/CSS/AddNewsForm.css"/>
        <link rel="stylesheet" href="CSS/validate.css"/>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <style>
            .font-italic{
                font-style: italic;
            }
            .form-hover:hover {
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.5);
                border-radius: 0.5rem;
            }
            input{
                font-size: 14px;
            }
        </style>
    </head>
    <body>

        <div class="row">
            <%@include file="DashBoardSlideBarVer2.jsp" %>
            <div class="col-lg-10 col-md-9 col-sm-9 min-vh-100 px-4 ps-4 mt-3" style="flex: 1; position: absolute; width: 80%;top: 0; left: 265px;">
                <form id="staffForm" method="post" action="StaffController" class="border border-2 rounded-4 p-4 pt-2" onsubmit="return validateStaff();">
                    <div class="text-center mb-3">
                        <span class="h3 fw-bold">Thêm mới nhân viên</span>
                    </div>
                    <%
                        AccountDAO adao = new AccountDAO();
                        LinkedList<String> listUsername = adao.getAllUserName();
                        for (String item : listUsername) {
                    %>
                    <input type="hidden" class="listUsername" value="<%= item%>"/>
                    <%
                        }
                    %>
                    <div class="d-flex" style="gap: 20px">
                        <div class="w-100">

                            <div class="form-outline w-100 form-group">
                                <div class="validate">
                                    <input type="text" id="user" name="user" placeholder="Tên đăng nhập" class="form-control form-control-lg" />
                                    <label for="username" class="form-label">Tên đăng nhập</label>
                                    <span class="error text-danger fw-bold font-italic"></span>
                                    <span class="text-danger" id="result"></span>
                                </div>
                            </div>

                            <div class="form-group form-outline mt-4 w-100">
                                <div class=" validate">
                                    <input type="password" id="pass" name="pass" placeholder="Mật khẩu"
                                           class="form-control form-control-lg" />
                                    <label for="password" class="form-label">Mật khẩu</label>
                                    <span class="error text-danger fw-bold font-italic"></span>
                                </div>
                            </div>

                            <div class="form-group form-outline mt-4 w-100">
                                <div class="validate">
                                    <input type="text" id="fullname" name="fullname" placeholder="Tên nhân viên"
                                           class="form-control form-control-lg" />
                                    <label for="fullname" class="form-label">Tên nhân viên</label>
                                    <span class="error text-danger fw-bold font-italic"></span>
                                </div>
                            </div>

                            <div class="form-group form-outline mt-4 w-100">
                                <div class="validate">
                                    <input type="text" id="phone" name="phone" placeholder="Số điện thoại"
                                           class="form-control form-control-lg" />
                                    <label for="phone" class="form-label">Số điện thoại</label>
                                    <span class="error text-danger fw-bold font-italic"></span>
                                    <span class="text-danger" id="resultPhone"></span>
                                </div>
                            </div>

                            <div class="form-group form-outline mt-4 w-100">
                                <div class="validate">
                                    <input type="email" id="email" name="email" placeholder="Email"
                                           class="form-control form-control-lg" />
                                    <label for="email" class="form-label">Email</label>
                                    <span class="error text-danger fw-bold font-italic"></span>
                                    <span class="text-danger" id="resultEmail"></span>
                                </div>
                            </div>

                            <div class="form-group form-outline mt-4 w-100">
                                <div class="form-hover">
                                    <input type="date" id="dayWriteNews" name="birthday" placeholder="Ngày sinh"
                                           class="form-control form-control-lg" />
                                    <label for="birthday" class="form-label">Ngày sinh</label>
                                </div>
                                <span id="ErrorDay" class="error text-danger fw-bold font-italic"></span>
                            </div>
                        </div>

                        <div class="w-100">

                            <div class="form-outline mt-3 w-100 mb-0">
                                <label class="form-label h5">Giới tính</label>
                                <div class="form-hover">
                                    <select id="gender" name="gender" class="w-100 form-control form-control-lg">
                                        <!--<option value="" disabled>-- Chọn giới tính --</option>-->
                                        <option value="Nam">Nam</option>
                                        <option value="Nữ">Nữ</option>
                                        <option value="Khac">Khác</option>
                                    </select>
                                </div>
                            </div>

                            <div class="form-group form-outline mt-4 w-100">
                                <div class="validate">
                                    <input type="text" id="address" name="address" placeholder="Địa chỉ"
                                           class="form-control form-control-lg" />
                                    <label for="address" class="form-label">Địa chỉ</label>
                                    <span class="error text-danger fw-bold font-italic"></span>
                                </div>
                            </div>

                            <div class="form-group form-outline mt-4 w-100">
                                <div class="form-hover">
                                    <select id="position" name="position" class="w-100 form-control form-control-lg" >
                                        <option value="product manager">Product manager</option>
                                        <option value="order manager">Order manager</option>
                                        <option value="news manager">News manager</option>
                                    </select>
                                </div>
                                <span class="error text-danger fw-bold font-italic"></span>
                            </div>

                            <div class="form-group form-outline mt-4 w-100">
                                <div class="form-hover">
                                    <input type="date" id="daywork" name="daywork" placeholder="Ngày làm việc"
                                           class="form-control form-control-lg" />
                                    <label for="begin_work" class="form-label">Ngày làm việc</label>
                                </div>
                                <span id="dateError" class="error text-danger fw-bold font-italic"></span>
                            </div>

                        </div>
                    </div>

                    <div class="form-outline mb-3 mt-4">
                        <input type="submit" name="btnAddStaff" class="btn btn-success w-100" style="font-size: 20px" value="Tạo mới nhân viên" />
                    </div>
                </form>
            </div>
        </div>

        <!--JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
        crossorigin="anonymous"></script>

        <script>
                    $(document).ready(function () {
                        $('#user').change(function () {
                            var user = $('#user').val();
                            $.ajax({
                                type: 'POST',
                                data: {user: user},
                                url: 'StaffController',
                                success: function (result) {
                                    $('#result').html(result);

                                }

                            });

                        });


                    });

                    $(document).ready(function () {
                        $('#email').change(function () {
                            var email = $('#email').val();
                            $.ajax({
                                type: 'POST',
                                data: {email: email},
                                url: 'StaffController',
                                success: function (result) {
                                    $('#resultEmail').html(result);

                                }

                            });

                        });

                    });
                    $(document).ready(function () {
                        $('#phone').change(function () {
                            var phone = $('#phone').val();
                            $.ajax({
                                type: 'POST',
                                data: {phone: phone},
                                url: 'StaffController',
                                success: function (result) {
                                    $('#resultPhone').html(result);

                                }

                            });

                        });
                    });

        </script>

        <script src="/JS/addStaffAdmin.js"></script>

    </body>
</html>
