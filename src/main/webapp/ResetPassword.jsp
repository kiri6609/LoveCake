<%-- 
    Document   : ResetPassword
    Created on : Jan 7, 2024, 12:08:04 PM
    Author     : Dell
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Quên mật khẩu</title>
        <link
            href='https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css'
            rel='stylesheet'>
        <link
            href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.0.3/css/font-awesome.css'
            rel='stylesheet'>
        <script type='text/javascript'
        src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>
        <style type="text/css">

            .validate.success input {
                border-color: #09c372;
            }

            /* display error message */
            .validate .error {
                color: #ff3860;
                font-size: smaller;
                /* height: 10px; */
            }

        </style>
    </head>
    <body>
        <div>
            <!-- Container containing all contents -->
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-12 col-md-9 col-lg-7 col-xl-6 mt-5">
                        <!-- White Container -->
                        <div class="container bg-white rounded mt-2 mb-2 px-0">
                            <!-- Main Heading -->
                            <div class="row justify-content-center align-items-center pt-3">
                                <h1>
                                    <strong>Quên mật khẩu</strong>
                                </h1>
                            </div>
                            <div class="pt-3 pb-3">
                                <form class="form-horizontal" action="" method="POST" action="ResetPasswordController"
                                      onsubmit="return enterNewPass();">
                                    <!-- User Name Input -->
                                    <div class="form-group row justify-content-center px-3">
                                        <div class="col-9 px-0 validate">
                                            <input type="password" name="password" placeholder="New Password"
                                                   class="form-control border-info placeicon" id="newPass">
                                            <span class="error"></span>
                                        </div>
                                    </div>
                                    <!-- Password Input -->
                                    <div class="form-group row justify-content-center px-3">
                                        <div class="col-9 px-0 validate">
                                            <input type="password" name="confPassword"
                                                   placeholder="Confirm New Password"
                                                   class="form-control border-info placeicon" id="confirmPass">
                                            <span class="error"></span>
                                        </div>
                                    </div>

                                    <!-- Log in Button -->
                                    <div class="form-group row justify-content-center">
                                        <div class="col-3 px-3 mt-3">
                                            <input type="submit" value="Reset"
                                                   class="btn btn-block btn-info" name="btnReset">
                                        </div>
                                    </div>
                                </form>
                            </div>
                            <!-- Alternative Login -->
                            <div class="mx-0 px-0 bg-light">

                                <!-- Horizontal Line -->
                                <div class="px-4 pt-5">
                                    <hr>
                                </div>
                                <!-- Register Now -->
                                <div class="pt-2">
                                    <div class="row justify-content-center">
                                        <h5>
                                            Bạn chưa có tài khoản?<span><a href="/RegisterController"
                                                                           class="text-danger">Đăng kí ngay!</a></span>
                                        </h5>
                                    </div>
                                    <div
                                        class="row justify-content-center align-items-center pt-4 pb-5">
                                        <div class="col-4">

                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script type='text/javascript'
        src='https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.bundle.min.js'></script>

        <script>
            const newPass = document.getElementById("newPass");
            const confirmPass = document.getElementById("confirmPass");

            const setSuccess = (element) => {
                const inputControl = element.parentElement;
                const errorDisplay = inputControl.querySelector("span");
                errorDisplay.innerText = "";
                inputControl.classList.add("success");
                inputControl.classList.remove("error");
            };
            const setError = (element, message) => {
                const inputControl = element.parentElement;
                const errorDisplay = inputControl.querySelector("span");
                errorDisplay.innerText = message;
                inputControl.classList.add("error");
                inputControl.classList.remove("success");
            };

            function enterNewPass() {
                let check = true;
                if (newPass.value.trim() === "") {
                    setError(newPass, "Please enter new password!");
                    check = false;
                } else {
                    setSuccess(newPass);
                }
                if (confirmPass.value.trim() === "") {
                    setError(confirmPass, "Please enter confirm password!");
                    check = false;
                } else {
                    setSuccess(confirmPass);
                }
                if (confirmPass.value.trim() !== "" && newPass.value.trim() !== "") {
                    if (confirmPass.value.trim() !== newPass.value.trim()) {
                        setError(confirmPass, "Your new password and confirm password not same!");
                        check = false;
                    } 
                }

                return check;
            }
        </script>
    </body>
</html>
