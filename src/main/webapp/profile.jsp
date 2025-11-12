<%-- 
    Document   : profile
    Created on : Feb 21, 2024, 10:05:18 AM
    Author     : DELL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Hồ sơ Khách hàng</title>

        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/jquery.validate.min.js"></script>
        <style>
            .form-label {
                font-weight: bold;
            }

            .form-control {
                border-radius: 0;
            }


            .avatar img:hover {
                transform: scale(1.1);
                transition: transform 0.3s ease;
            }

            #back-to-top {
                position: fixed;
                bottom: 20px;
                right: 20px;
                display: block; /* Ẩn nút ban đầu */
                background-color: #f7bb09; /* Màu nền của nút */
                color: #fff; /* Màu chữ của nút */
                padding: 1px 5px;
                border-radius: 5px;
                cursor: pointer;
            }

            #back-to-top:hover {
                background-color: #ccccff; /* Màu nền của nút khi rê chuột vào */
            }



        </style>
    </head>

    <body>


        <%@include file="headOfCart.jsp" %>
        <section style="background-color: #eee;">
            <div class="container py-5">
                <div class="row">
                    <div class="col-lg-4">
                        <div class="card mb-4">
                            <div class="card-body text-center avatar">
                                <img src="${account.avatar}" alt="">
                                <!--                                <img src=""
                                                                     alt="avatar" class="normal-avatar rounded-circle img-fluid" style="width: 150px;">-->
                                <h5 class="my-3">${account.fullname}</h5>
                                <!--<p class="text-muted mb-4">Can Tho</p>-->
                                <div class="d-flex justify-content-center mb-2">
                                    <a href="#updateProfile" type="button" class="btn" style="background-color: rgb(247, 187, 9);">Cập nhật hồ sơ</a>
                                </div>
                            </div>
                        </div>


                    </div>
                    <div class="col-lg-8">
                        <h3 style="color:rgb(247, 187, 9);" class="my-3">Thông tin</h3>
                        <div class="card mb-4">
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-sm-3">
                                        <p class="mb-0">Họ Tên</p>
                                    </div>
                                    <div class="col-sm-9">
                                        <p class="text-muted mb-0">${account.fullname}</p>
                                    </div>
                                </div>
                                <hr>
                                <div class="row">
                                    <div class="col-sm-3">
                                        <p class="mb-0">Email</p>
                                    </div>
                                    <div class="col-sm-9">
                                        <p class="text-muted mb-0">${account.email}</p>
                                    </div>
                                </div>
                                <hr>
                                <div class="row">
                                    <div class="col-sm-3">
                                        <p class="mb-0">SĐT</p>
                                    </div>
                                    <div class="col-sm-9">
                                        <p class="text-muted mb-0">${account.phone_number}</p>
                                    </div>
                                </div>
                                <hr>
                                <div class="row">
                                    <div class="col-sm-3">
                                        <p class="mb-0">Tên đăng nhập</p>
                                    </div>
                                    <div class="col-sm-9">
                                        <p class="text-muted mb-0">${account.username}</p>
                                    </div>
                                </div>

                            </div>
                        </div>


                        <!-- CHANGE PASSWORD - CODE UYEN -->

                        <div class="row">
                            <div class="col-md-12">
                                <div class="card mb-4 mb-md-0">
                                    <div class="card-body" style="text-align: center;">
                                        <p class="mb-4"><span class="font-italic me-1" style="color:rgb(247, 187, 9);">Thay đổi mật khẩu</span>
                                        </p>
                                        <p class="mb-1" style="font-size: .77rem;">Ấn dô đây để đổi Mật khẩu</p>
                                        <p class="mb-1" style="font-size: .77rem;">Mật khẩu gồm chữ ,số.</p>
                                    </div>
                                    <div class="d-flex justify-content-center mb-2">
                                        <a href="#changePass" type="button" class="btn" style="background-color: rgb(247, 187, 9);">Thay đổi mật khẩu</a>
                                    </div>
                                </div>
                            </div>
                        </div>



                        <div class="col-lg-8" id="updateProfile">
                            <h3 style="color: rgb(247, 187, 9);" class="my-3">Cập nhật hồ sơ</h3>
                        </div>
                        <div class="card mb-4">
                            <div class="card-body">
                                <form id="updateForm" action="UpdateCustomerController" method="post" enctype="multipart/form-data">
                                    <div class="row mb-3">
                                        <label for="fullname" class="col-sm-2 col-form-label">Họ Tên</label>
                                        <div class="col-sm-10">
                                            <input type="text" id="fullname" name="fullname" class="form-control form-control-lg" value="${account.fullname}" />
                                            <span style="color: red" id="fullnameError" class="error"></span>
                                            <span class="text-danger"></span>
                                        </div>
                                    </div>
                                    <div class="row mb-3" type="hidden">
                                        <!--<label type="hidden" for="username" class="col-sm-2 col-form-label">UserName</label>-->
                                        <div class="col-sm-10">
                                            <input type="hidden" type="text" id="username" name="username" class="form-control form-control-lg" value="${account.username}" />
                                            <span style="color: red" id="usernameError" class="error"></span>
                                            <span class="text-danger" id="duplicateUserNameError"></span>
                                        </div>
                                    </div>
                                    <div class="row mb-3">
                                        <label for="email" class="col-sm-2 col-form-label">Email</label>
                                        <div class="col-sm-10">
                                            <input type="text" id="email" name="email" class="form-control form-control-lg" value="${account.email}" />
                                            <span style="color: red" id="emailError" class="error"></span>
                                            <span class="text-danger" id="duplicateEmailError"></span>
                                            <span class="text-danger" id="duplicateEmailPhoneError"></span>
                                        </div>
                                    </div>
                                    <div class="row mb-3">
                                        <label for="phone" class="col-sm-2 col-form-label">SĐT</label>
                                        <div class="col-sm-10">
                                            <input type="text" id="phone" name="phone" class="form-control form-control-lg" value="${account.phone_number}" />
                                            <span style="color: red" id="phoneError" class="error"></span>
                                            <span class="text-danger" id="duplicatePhoneError"></span>
                                            <span class="text-danger" id="duplicateEmailPhoneError"></span>
                                        </div>
                                    </div>

                                    <div class="row mb-3">
                                        <!--<div class="col-md-9">-->
                                            <label for="avatar" class="col-sm-2 col-form-label">Ảnh đại diện</label>
                                            <div class="col-sm-10">
                                                <input type="file" class="form-control" id="avatar" name="avatar">
                                                <input type="hidden" id="avatar_old" class="form-control" name="avatar_old" value="${account.avatar}">

                                            </div>
                                        <!--</div>-->
                                        <div class="col-md-3">
                                            <img src="${account.avatar}" alt="" style="max-width: 70%; margin-left: 150px">
                                        </div>
                                    </div>

                                    <div class="row mb-6">
                                        <div class="col-md-12 d-flex justify-content-end">
                                            <button name="btnUpdatefProfile" type="submit" style="background-color: rgb(247, 187, 9);" class="btn">Cập nhật</button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>

                        <div class="col-lg-8" id="changePass">
                            <h3 style="color: rgb(247, 187, 9);" class="my-3">Đổi mật khẩu</h3>
                        </div>
                        <div class="card mb-4">
                            <div class="card-body">
                                <form action="UpdateCustomerController" id="updatePass"  method="post" enctype="multipart/form-data" >
                                    <div class="row mb-3">
                                        <label for="old" class="col-sm-2 col-form-label">Mật khẩu cũ</label>
                                        <div class="col-sm-10">
                                            <input type="password" class="form-control" id="oldPass" value=""
                                                   name="oldPass" placeholder="Nhập mật khẩu cũ.">
                                            <div id="oldError" class="text-danger"></div>
                                            <span style="color: red" id="passOldError" class="error"></span>
                                            <span class="text-danger" id="duplicatePassError"></span>
                                        </div>
                                    </div>

                                    <div class="row mb-3">
                                        <label for="newP" class="col-sm-2 col-form-label">Mật khẩu mới</label>
                                        <div class="col-sm-10">
                                            <input type="password" class="form-control" id="newP" name="newP"
                                                   placeholder="Nhập mật khẩu mới." >
                                            <div id="errorDiv"></div>
                                            <span style="color: red" id="passNewError" class="error"></span>
                                        </div>
                                    </div>
                                    <div class="row mb-3">
                                        <label for="confirm" class="col-sm-2 col-form-label">Xác nhận Mật khẩu</label>
                                        <div class="col-sm-10">
                                            <input type="password" class="form-control" id="confirm" name="confirm"
                                                   placeholder="Nhập mật khẩu mới lại lần nữa.">
                                            <div id="errorDiv"></div>
                                            <span style="color: red" id="passConfirmError" class="error"></span>
                                        </div>
                                    </div>
                                    <div class="row mb-6">
                                        <div class="col-md-12 d-flex justify-content-end">
                                            <button type="submit" style="background-color: rgb(247, 187, 9);" class="btn" name="btnChangePass">Thay đổi</button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <a href="#" id="back-to-top" title="Go to top">↑</a>
        <footer>
            <%@include file="footerOfHome.jsp" %>
        </footer>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
        crossorigin="anonymous"></script>
        <script>
            // Kiểm tra biến session để xác định xem có hiển thị popup hay không
            var updateSuccess = <%= session.getAttribute("updateSuccess")%>;
            if (updateSuccess) {
                $('#successChangePass').modal('show'); // Hiển thị popup modal
                setTimeout(function () {
                    $('#successChangePass').modal('hide'); // Tự động ẩn popup modal sau 3 giây
                }, 3000);
            }
        </script>
        <!-- ===END FORM== -->
        <script>
            // Kiểm tra nếu có lỗi trùng lặp được trả về từ servelet
            <%
                String duplicateError = (String) session.getAttribute("duplicateError");
                String emailCk = (String) session.getAttribute("emailCk");
                String phoneCk = (String) session.getAttribute("phoneCk");
                String usernameUserCk = (String) session.getAttribute("usernameUserCk");

                if (duplicateError != null) {
                    String errorMessage = "";
                    if (duplicateError.equals("both")) {
                        errorMessage = emailCk + " and " + phoneCk + " đã tồn tại.!";
                        out.println("document.getElementById('duplicateEmailPhoneError').innerText = '" + errorMessage + "';");
                    } else if (duplicateError.equals("username")) {
                        errorMessage = "Vui lòng nhập lại, " + usernameUserCk + " đã tồn tại.";
                        // Hiển thị thông báo trùng email
                        out.println("document.getElementById('duplicateUserError').innerText = '" + errorMessage + "';");
                    } else if (duplicateError.equals("email")) {
                        errorMessage = "Vui lòng nhập lại, " + emailCk + " đã tồn tại.";
                        // Hiển thị thông báo trùng email
                        out.println("document.getElementById('duplicateEmailError').innerText = '" + errorMessage + "';");
                    } else if (duplicateError.equals("phone")) {
                        errorMessage = "Vui lòng nhập lại, " + phoneCk + " đã tồn tại.";
                        // Hiển thị thông báo trùng phone
                        out.println("document.getElementById('duplicatePhoneError').innerText = '" + errorMessage + "';");

                    } else if (duplicateError.equals("PassError")) {
                        errorMessage = "Sai mật khẩu , bạn không thể thay đổi mật khẩu!!!";
                        // Hiển thị thông báo trùng phone
                        out.println("document.getElementById('duplicatePassError').innerText = '" + errorMessage + "';");
                    }

            %>
            // Xóa thuộc tính duplicateError khỏi session sau khi hiển thị cảnh báo
            <%                    session.removeAttribute("duplicateError");
                }
            %>
        </script>
        <!--<script src="/JS/validPro.js"></script>-->
        <script>
            document.addEventListener("DOMContentLoaded", function () {
                var newPInput = document.getElementById("newP");
                var confirmInput = document.getElementById("confirm");
                var errorDiv = document.getElementById("errorDiv");

                function validatePassword() {
                    if (newPInput.value !== confirmInput.value) {
                        errorDiv.innerHTML = "Mật khẩu không khớp";
                    } else {
                        errorDiv.innerHTML = "";
                    }
                }

                newPInput.addEventListener("keyup", validatePassword);
                confirmInput.addEventListener("keyup", validatePassword);
            });
        </script>
        <script>
            document.getElementById('updateForm').addEventListener('submit', function (event) {
                var fullname = document.getElementById('fullname').value;
                var phone = document.getElementById('phone').value;
                var email = document.getElementById('email').value;
                var fullnameError = document.getElementById('fullnameError');
                var phoneError = document.getElementById('phoneError');
                var emailError = document.getElementById('emailError');

                // Kiểm tra Fullname không được để trống và không chứa kí tự đặc biệt
                if (fullname.trim() === '' || fullname.length > 20 || fullname.length < 6 || !/^[a-zA-Z\s]+$/.test(fullname)) {
                    fullnameError.textContent = 'Họ tên không dài quá 20 kí tự và không có kí tự đặc biệt.';
                    event.preventDefault();
                } else {
                    fullnameError.textContent = '';
                }
                // Kiểm tra Phone có đúng định dạng và bắt đầu bằng số 0
                if (!/(03|05|07|08|09|01[2|6|8|9])+([0-9]{8})\b/.test(phone)) {
                    phoneError.textContent = 'Vui lòng nhập Số điện thoại đầy đủ và hợp lệ.';
                    event.preventDefault();
                } else {
                    phoneError.textContent = '';
                }

                // Kiểm tra Email có đúng định dạng
                if (!/^\S+@\S+\.\S+$/.test(email)) {
                    emailError.textContent = 'Vui lòng nhập Email đầy đủ và hợp lệ.';
                    event.preventDefault();
                } else {
                    emailError.textContent = '';
                }
            });
        </script>



        <script>
            document.getElementById('updatePass').addEventListener('submit', function (event) {
                var old = document.getElementById('oldPass').value;
                var newP = document.getElementById('newP').value;
                var confirm = document.getElementById('confirm').value;

                var passOldError = document.getElementById('passOldError');
                var passNewError = document.getElementById('passNewError');
                var passConfirmError = document.getElementById('passConfirmError');

                // Kiểm tra Fullname không được để trống và không chứa kí tự đặc biệt
                if (old.trim() === '') {
                    passOldError.textContent = 'Không được để trống trường này.';
                    event.preventDefault();
                } else {
                    passOldError.textContent = '';
                }

                if (newP.trim() === '') {
                    passNewError.textContent = 'Không được để trống trường này.';
                    event.preventDefault();
                } else if (newP.trim().length < 6 || newP.trim().length > 20) {
                    passNewError.textContent = 'Độ dài của chuỗi phải từ 6 đến 20 ký tự.';
                    event.preventDefault();
                } else {
                    passNewError.textContent = '';
                }

                if (confirm.trim() === '') {
                    passConfirmError.textContent = 'Không được để trống trường này.';
                    event.preventDefault();
                } else if (confirm.trim().length < 6 || confirm.trim().length > 20) {
                    passConfirmError.textContent = 'Độ dài của chuỗi phải từ 6 đến 20 ký tự.';
                    event.preventDefault();
                } else {
                    passConfirmError.textContent = '';
                }

            });
        </script>


    </body>

</html>
