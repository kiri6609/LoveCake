<%-- 
    Document   : RegisterForm
    Created on : Feb 12, 2024, 10:37:47 PM
    Author     : Dell
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Tạo tài khoản mới</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
        <link rel="stylesheet" href="CSS/validate.css"/>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/jquery.validate.min.js"></script>

    </head>

    <body>
        <section style="background-color: #e1afb9;">

            <div class="row d-flex justify-content-center align-items-center">
                <div class="col col-xl-10">
                    <div class="card" style="border-radius: 1rem;">
                        <div class="row g-0">
                            <div class="col-md-6 col-lg-6 d-none d-md-block">
                                <img class="w-100 h-100" src="images/Lovecake.png" alt="login form" class="img-fluid"
                                     style="border-radius: 1rem 0 0 1rem;" />
                            </div>
                            <div class="col-md-6 col-lg-6 d-flex align-items-center">
                                <div class="card-body p-2 p-lg-5 text-black">

                                    <form id="form" class="" method="post" action="RegisterController" enctype="multipart/form-data"
                                          onsubmit="return validateResgisterCus();">
                                        <div class="d-flex align-items-center mb-2">
                                            <span class="h1 fw-bold mb-0">Tạo tài khoản mới</span>
                                        </div>
                                        <div class="form-outline mb-2 validate">
                                            <label class="form-label">Họ và tên</label>
                                            <input type="text" id="fullname" name="fullname"
                                                   class="form-control form-control-lg" />
                                            <span class="error"></span>

                                        </div>
                                        <div class="form-outline mb-2 validate">
                                            <label class="form-label">Email</label>
                                            <input type="email" id="email" name="email"
                                                   class="form-control form-control-lg" />
                                            <span class="error"></span>
                                            <span class="text-danger" id="resultEmail"></span>
                                        </div>

                                        <div class="form-outline mb-2 validate">
                                            <label class="form-label">Số điện thoại</label>
                                            <input type="text" id="phone" name="phone"
                                                   class="form-control form-control-lg" />
                                            <span class="error"></span>
                                            <span class="text-danger" id="resultPhone"></span>

                                        </div>
                                        <div class="form-outline mb-2 validate">
                                            <label class="form-label">Ảnh đại diện</label>
                                            <input type="file" id="avatar" name="avatar"
                                                   class="form-control form-control-lg" />
                                            <span class="error"></span>

                                        </div>
                                        <div class="form-outline mb-2 validate">
                                            <label class="form-label">Tên đăng nhập</label>
                                            <input type="text" id="user" name="username"
                                                   class="form-control form-control-lg" />
                                            <span class="error"></span>
                                            <span class="text-danger" id="result"></span>

                                        </div>

                                        <div class="form-outline mb-2 validate">
                                            <label class="form-label">Mật khẩu</label>
                                            <input type="password" id="pass" name="password"
                                                   class="form-control form-control-lg" />
                                            <span class="error"></span>

                                        </div>
                                        <div class="pt-1 mb-2">
                                            <input type="submit" class="btn btn-lg btn-block" name="register"
                                                   value="Đăng ký" style="background-color: #f1a8b6;">
                                            <input type="reset" class="btn btn-lg btn-block" value="Làm mới"
                                                   style="background-color: #f1a8b6;">
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
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
                                                          url: 'RegisterController',
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
                                                          url: 'RegisterController',
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
                                                          url: 'RegisterController',
                                                          success: function (result) {
                                                              $('#resultPhone').html(result);

                                                          }

                                                      });

                                                  });
                                              });

//                                              $(document).ready(function () {
//                                                  var isValid = true;
//
//                                                  $('#user').change(function () {
//                                                      var user = $('#user').val();
//                                                      $.ajax({
//                                                          type: 'POST',
//                                                          data: {user: user},
//                                                          url: 'RegisterController',
//                                                          success: function (result) {
//                                                              if (result === "exit") {
//                                                                  $('#result').html("Username đã tồn tại.");
//                                                                  isValid = false;
//                                                              } else {
//                                                                  $('#result').html("");
////                                                                  isValid = true;
//                                                              }
//                                                          }
//                                                      });
//                                                  });
//
//                                                  $('#email').change(function () {
//                                                      var email = $('#email').val();
//                                                      $.ajax({
//                                                          type: 'POST',
//                                                          data: {email: email},
//                                                          url: 'RegisterController',
//                                                          success: function (result) {
//                                                              if (result === "exit") {
//                                                                  $('#resultEmail').html("Email đã tồn tại.");
//                                                                  isValid = false;
//                                                              } else {
//                                                                  $('#resultEmail').html("");
////                                                                  isValid = true;
//                                                              }
//                                                          }
//                                                      });
//                                                  });
//
//                                                  $('#phone').change(function () {
//                                                      var phone = $('#phone').val();
//                                                      $.ajax({
//                                                          type: 'POST',
//                                                          data: {phone: phone},
//                                                          url: 'RegisterController',
//                                                          success: function (result) {
//                                                              if (result === "exit") {
//                                                                  $('#resultPhone').html("Số điện thoại đã tồn tại.");
//                                                                  isValid = false;
//                                                              } else {
//                                                                  $('#resultPhone').html("");
////                                                                  isValid = true;
//                                                              }
//                                                          }
//                                                      });
//                                                  });
//
//                                                  $('#form').submit(function () {
//                                                      if (!isValid) {
//                                                          return false; // Ngăn chặn form submit nếu có thông tin không hợp lệ
//                                                      }
//                                                  });
//                                              });

        </script>
        <script src="/JS/validate.js"></script>

    </body>

</html>

