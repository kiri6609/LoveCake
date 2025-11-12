<%-- 
    Document   : EnterOTP
    Created on : Jan 7, 2024, 11:50:32 AM
    Author     : Dell
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Nhập OTP</title>
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script
        src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
        <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
        <!------ Include the above in your HEAD tag ---------->

        <link rel="stylesheet"
              href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">

        <style type="text/css">
            .form-gap {
                padding-top: 70px;
            }


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
        <div class="form-gap"></div>
        <div class="container">
            <div class="row">
                <div class="col-md-4 col-md-offset-4">
                    <div class="panel panel-default">
                        <div class="panel-body">
                            <div class="text-center">
                                <h3>
                                    <i class="fa fa-lock fa-4x"></i>
                                </h3>
                                <h2 class="text-center">Nhập OTP</h2>

                            </div>

                            <div class="panel-body">

                                <form id="register-form" action="ResetPasswordController" 
                                      class="form" method="post" onsubmit="return enterCodeReset();">

                                    <div class="form-outline validate" style="margin-bottom: 20px;">
                                        <input id="opt" name="otp" placeholder="Enter OTP" class="form-control" type="text">
                                        <span class="error text-start"></span>

                                    </div>
                                   
                                    <div class="form-outline">
                                        <input name="btnOTP"
                                               class="btn btn-lg btn-primary btn-block"
                                               value="Reset Password" type="submit">
                                    </div>
                                </form>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script>
            const opt = document.getElementById("opt");

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

            function enterCodeReset() {
                let check = true;
                if (opt.value.trim() === "") {
                    setError(opt, "Hãy nhập mã OTP!");
                    check = false;
                } else {
                    setSuccess(opt);
                }
                return check;
            }
        </script>
    </body>
</html>
