<%-- 
    Document   : LoginForm
    Created on : Feb 12, 2024, 10:37:37 PM
    Author     : Dell
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Trang đăng nhập</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
        <link rel="stylesheet" href="CSS/validate.css"/>
    </head>

    <body>
        <section class="vh-100" style="background-color: #e1afb9;">
            <div class="container py-5 h-100">
                <div class="row d-flex justify-content-center align-items-center h-100">
                    <div class="col col-xl-10">
                        <div class="card" style="border-radius: 1rem;">
                            <div class="row g-0">
                                <div class="col-md-6 col-lg-6 d-none d-md-block">
                                    <img class="w-100 h-100" src="images/Lovecake.png" alt="login form" class="img-fluid"
                                         style="border-radius: 1rem 0 0 1rem;" />
                                </div>
                                <div class="col-md-6 col-lg-6 d-flex align-items-center">
                                    <div class="card-body p-4 p-lg-5 text-black">

                                        <form method="post" action="LoginController" onsubmit="return validateInputs();">

                                            <div class="d-flex align-items-center mb-3 pb-1">
                                                <span class="h1 fw-bold mb-0">Đăng nhập</span>
                                            </div>

                                            <div class="form-outline mb-4 validate">
                                                <label class="form-label">Tên đăng nhập</label>
                                                <input type="text" id="userN" name="txtUS"
                                                       class="form-control form-control-lg" />
                                                 <span class="error"></span>

                                            </div>

                                            <div class="form-outline mb-4 validate">
                                                <label class="form-label">Mật khẩu</label>
                                                <input type="password" id="pwd" name="txtPwd"
                                                       class="form-control form-control-lg" />
                                                 <span class="error"></span>

                                            </div>
                                            <div class="pt-1 mb-4">
                                                <p class="text-danger">${fail}</p>
                                            </div>
                                            <div class="pt-1 mb-4">
                                                <input type="submit" class="btn btn-lg btn-block" name="btnLogin"
                                                       value="Đăng nhập" style="background-color: #f1a8b6;">
                                            </div>

                                            <a class="small text-muted" href="/ResetPasswordController">Quên mật khẩu?</a>
                                            <p class="mb-5 pb-lg-2" style="color: #393f81;">Bạn Không có tài khoản? <a
                                                    href="/RegisterController" style="color: #393f81;">Tạo tài khoản</a></p>
                                        </form>

                                    </div>
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
        <script src="${pageContext.request.contextPath}/JS/validate.js"></script>
    </body>

</html>
