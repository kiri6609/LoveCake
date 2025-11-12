<%-- 
    Document   : AddCusAdmin
    Created on : Feb 24, 2024, 5:57:30 PM
    Author     : Dell
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" />
        <link rel="stylesheet" href="/CSS/AddNewsForm.css"/>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/jquery.validate.min.js"></script>
        <style>
            .font-italic{
                font-style: italic;
            }
            .form-hover:hover {
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.5);
                border-radius: 0.5rem;
            }
        </style>
        <title>Thêm mới khách hàng</title>
    </head>
    <body>
        <div class="row">
            <%@include file="DashBoardSlideBarVer2.jsp" %>
            <div class="col-lg-10 col-md-9 col-sm-9 min-vh-100 mt-3" style="position: absolute;
                 left: 265px;
                 top: 0;
                 width: 80%;">
                <form method="post" action="CustomerController" class="border border-2 rounded-4 p-4 pt-2" style="margin: 0px 30px" onsubmit="return validateFormCus()" enctype="multipart/form-data">
                    <div class="text-center mb-3">
                        <span class="h3 fw-bold">Thêm mới khách hàng</span>
                    </div>

                    <div class="form-group w-100">
                        <div class="form-hover">
                            <input type="text" id="fullname" name="fullname" placeholder="Họ và tên" class="form-control form-control-lg"/>
                            <label for="fullname" class="form-label">Họ và tên</label>
                        </div>
                        <span class="errorFullname text-danger fw-bold font-italic"></span>
                    </div>

                    <div class="form-outline mt-4 w-100">
                        <div class="validate form-outline col">
                            <label class="form-label">Avatar</label>
                            <input type="file" id="avatar" name="avatar"
                                   class="form-control form-control-lg" />
                            <span class="error"></span>
                        </div>
                        <!--                        <div id="displayImage" class="mt-2 w-25">
                                                    <img src="/images/no_image.png" alt="No Image" id="defaultImage" style="max-width: 100%;">
                                                </div>-->


                        <!--                        <div class="form-outline mb-2 validate">
                                                    <label class="form-label">Avatar</label>
                                                    <input type="file" id="avatar" name="avatar"
                                                           class="form-control form-control-lg" />
                                                    <span class="error"></span>
                        
                                                </div>-->
                    </div>

                    <!--                    <div class="form-outline mt-4 w-100">
                                            <div class="validate form-outline col">
                                                <label for="avatar" class="col-sm-2 col-form-label">Avatar</label>
                                                <div class="col-sm-10">
                                                    <input type="file" class="form-control" id="newsPic" name="newsPic" onchange="displayImage(event, 'displayImage')" 
                                                           class="border form-control form-control-lg">
                                                    <input type="hidden" id="avatar_old" class="form-control" name="avatar_old" value="/images/no_image.png">
                    
                                                </div>
                                                <img src="/images/no_image.png" alt="No Image" id="defaultImage" style="max-width: 100%;">
                                            </div>
                                        </div>-->


                    <div class="form-group w-100 mt-4">
                        <div class="form-hover">
                            <input type="text" id="email" name="email" placeholder="Email" class="form-control form-control-lg"/>
                            <label for="email" class="form-label">Email</label>
                        </div>
                        <span class="errorEmail text-danger fw-bold font-italic"></span>
                        <span class="text-danger fw-bold font-italic" id="resultEmail"></span>
                    </div>
                    <div class="form-group w-100 mt-4">
                        <div class="form-hover">
                            <input type="text" id="phone" name="phone" placeholder="Số điện thoại" class="form-control form-control-lg"/>
                            <label for="Phone" class="form-label">Số điện thoại</label>

                        </div>
                        <span class="errorPhone text-danger fw-bold font-italic"></span>
                        <span class="text-danger fw-bold font-italic" id="resultPhone"></span>
                    </div>
                    <div class="form-group w-100 mt-4">
                        <div class="form-hover">
                            <input type="text" id="user" name="username" placeholder="Tên đăng nhập" class="form-control form-control-lg"/>
                            <label for="username" class="form-label">Tên đăng nhập</label>

                        </div>
                        <span class="errorUsername text-danger fw-bold font-italic"></span>
                        <span class="text-danger fw-bold font-italic" id="result"></span>
                    </div>
                    <div class="form-group w-100 mt-4">
                        <div class="form-hover">
                            <input type="password" id="pass" name="pass" placeholder="Mật khẩu" class="form-control form-control-lg"/>
                            <label for="pass" class="form-label">Mật khẩu</label>
                        </div>
                        <span class="errorPass text-danger fw-bold font-italic"></span>
                    </div>


                    <span class="error text-danger fw-bold font-italic text-center"></span>

                    <div class="form-outline mb-3 mt-4">
                        <input type="submit" name="btnAddNews" class="btn btn-success w-100" style="font-size: 20px" value="Tạo mới khách hàng"/>
                    </div>  
                </form>
            </div>
        </div>

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
                                url: 'CustomerController',
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
                                url: 'CustomerController',
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
                                url: 'CustomerController',
                                success: function (result) {
                                    $('#resultPhone').html(result);

                                }

                            });

                        });
                    });
        </script>
        <script src="/JS/AddCusAdmin.js"></script>
    </body>
</html>
