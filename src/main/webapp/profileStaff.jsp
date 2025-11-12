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
        <title>Hồ sơ nhân viên</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">
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


        <%@include file="DashBoardSlideBarVer2.jsp" %>
        <div class="col-lg-10 col-md-9 col-sm-9 min-vh-100 mt-3" style="position: absolute;
             left: 265px;
             top: 0;
             width: 80%;">
            <section style="background-color: #eee;">
                <div class="container py-5">
                    <div class="row">


                    </div>
                    <div class="col-lg-12">
                        <h3 style="color: rgb(247, 187, 9);" class="my-3">Thông tin</h3>
                        <div class="card mb-4">
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-sm-3">
                                        <p class="mb-0">Họ Tên</p>
                                    </div>
                                    <div class="col-sm-9">
                                        <p class="text-muted mb-0">${staff.fullname}</p>
                                    </div>
                                </div>
                                <hr>
                                <div class="row">
                                    <div class="col-sm-3">
                                        <p class="mb-0">Email</p>
                                    </div>
                                    <div class="col-sm-9">
                                        <p class="text-muted mb-0">${staff.email}</p>
                                    </div>
                                </div>
                                <hr>
                                <div class="row">
                                    <div class="col-sm-3">
                                        <p class="mb-0">SĐT</p>
                                    </div>
                                    <div class="col-sm-9">
                                        <p class="text-muted mb-0">${staff.phone_number}</p>
                                    </div>
                                </div>
                                <hr>
                                <div class="row">
                                    <div class="col-sm-3">
                                        <p class="mb-0">Tên đăng nhập</p>
                                    </div>
                                    <div class="col-sm-9">
                                        <p class="text-muted mb-0">${staff.username}</p>
                                    </div>
                                </div>

                            </div>
                        </div>


                        <!-- CHANGE PASSWORD - CODE UYEN -->

                        <div class="row">
                            <div class="col-md-12">
                                <div class="card mb-4 mb-md-0">
                                    <div class="card-body" style="text-align: center;">
                                        <p class="mb-4"><span class="font-italic me-1" style="color: rgb(247, 187, 9);">Đổi mật khẩu</span>
                                        </p>
                                        <p class="mb-1" style="font-size: .77rem;">Ấn dô đây để đổi Mật khẩu</p>
                                        <p class="mb-1" style="font-size: .77rem;">Mật khẩu gồm chữ ,số.</p>
                                    </div>
                                    <div class="d-flex justify-content-center mb-2">
                                        <a href="#changePass" type="button" class="btn" style="background-color: rgb(247, 187, 9);">Đổi mật khẩu</a>


                                    </div>
                                </div>
                            </div>
                        </div>


                        <!--//        public Staff(int staff_id, int acc_id, String username, String password, String fullnameRR,
                        //            String phone_numberRR, String emailRR, Date birthdayR, String genderRS, String addressR,
                        //            String positionRR, Date begin_workRS, Date end_workRS, int code_reset, int isDelete)-->

                        <div class="col-lg-8" id="updateProfile">
                            <h3 style="color: rgb(247, 187, 9);" class="my-3">Cập nhật hồ sơ</h3>
                        </div>
                        <div class="card mb-4">
                            <div class="card-body">
                                <form id="updateForm" action="StaffController" method="post" enctype="multipart/form-data">
                                    <span class="text-danger" id="duplicateEmailPhoneUsernameError"></span>
                                    <div class="row mb-3">
                                        <label for="fullName" class="col-sm-2 col-form-label">Họ Tên</label>
                                        <div class="col-sm-10">
                                            <input type="text" id="fullname" name="fullname" class="form-control form-control-lg" value="${staff.fullname}" />
                                            <span class="error"></span>
                                            <span class="text-danger" id="fullnameError"></span> <!-- Error message for FullName -->
                                        </div>
                                    </div>
                                    <div class="row mb-3" type="hidden">
                                        <div class="col-sm-10">
                                            <input type="hidden" id="username" name="username" class="form-control form-control-lg" value="${staff.username}" />
                                            <span class="error"></span>
                                            <span class="text-danger" id="duplicateUserError"></span>
                                            <span class="text-danger" id="duplicateEmailPhoneError"></span>
                                        </div>
                                    </div>
                                    <div class="row mb-3">
                                        <label for="email" class="col-sm-2 col-form-label">Email</label>
                                        <div class="col-sm-10">
                                            <input type="email" id="email" name="email" class="form-control form-control-lg" value="${staff.email}" />
                                            <span class="error"></span>
                                            <span class="text-danger" id="emailError"></span> <!-- Error message for Email -->
                                            <span class="text-danger" id="duplicateEmailError"></span>
                                            <span class="text-danger" id="duplicateEmailPhoneError"></span>
                                        </div>
                                    </div>
                                    <div class="row mb-3">
                                        <label for="phone" class="col-sm-2 col-form-label">SĐT</label>
                                        <div class="col-sm-10">
                                            <input type="text" id="phone" name="phone" class="form-control form-control-lg" value="${staff.phone_number}"  />
                                            <span class="error"></span>
                                            <span class="text-danger" id="phoneError"></span> <!-- Error message for Phone -->
                                            <span class="text-danger" id="duplicatePhoneError"></span>
                                        </div>
                                    </div>
                                    <div class="row mb-3">
                                        <label for="birthday" class="col-sm-2 col-form-label">Sinh nhật</label>
                                        <div class="col-sm-10">
                                            <input type="date" id="birthday" name="birthday" class="form-control form-control-lg" value="${staff.birthday}"/>
                                            <span id="dateError" class="text-danger font-italic"></span>
                                        </div>

                                    </div>
                                    <div class="row mb-3">
                                        <label for="address" class="col-sm-2 col-form-label">Địa chỉ</label>
                                        <div class="col-sm-10">
                                            <input type="text" id="address" name="address" class="form-control form-control-lg" value="${staff.address}"  />
                                            <span class="error"></span>
                                            <span class="text-danger" id="addressError"></span> <!-- Error message for Address -->
                                        </div>
                                    </div>
                                    <div class="row mb-3">
                                        <label for="position" class="col-sm-2 col-form-label">Vị trí</label>
                                        <div class="col-sm-10">
                                            <input readonly="" type="text" id="position" name="position" class="form-control form-control-lg" value="${staff.position}" />
                                        </div>
                                    </div>
                                    <div class="row mb-6">
                                        <div class="col-md-12 d-flex justify-content-end">
                                            <button name="btnUpdatefStaff" type="submit" style="background-color: rgb(247, 187, 9);" class="btn">Cập nhật</button>
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
                                <form action="StaffController" id="updatePass" method="post" enctype="multipart/form-data" >
                                    <div class="row mb-3">
                                        <label for="old" class="col-sm-2 col-form-label">Mật khẩu cũ</label>
                                        <div class="col-sm-10">
                                            <input type="password" class="form-control" id="oldPass" 
                                                   name="oldPass"  placeholder="Nhập mật khẩu cũ." >
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
                                            <button type="submit" style="background-color: rgb(247, 187, 9);" class="btn" name="btnChangePassStaff">Thay đổi</button>
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



</div>
<!-- ===END FORM== -->
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
                errorMessage = emailCk + " and " + phoneCk + " đã tồn tại!";
                out.println("document.getElementById('duplicateEmailPhoneError').innerText = '" + errorMessage + "';");
            } else if (duplicateError.equals("username")) {
                errorMessage = "Vui lòng nhập lại, " + usernameUserCk + " đã tồn tại";
                // Hiển thị thông báo trùng email
                out.println("document.getElementById('duplicateUserError').innerText = '" + errorMessage + "';");
            } else if (duplicateError.equals("email")) {
                errorMessage = "Vui lòng nhập lại, " + emailCk + " đã tồn tại";
                // Hiển thị thông báo trùng email
                out.println("document.getElementById('duplicateEmailError').innerText = '" + errorMessage + "';");
            } else if (duplicateError.equals("phone")) {
                errorMessage = "Vui lòng nhập lại, " + phoneCk + " đã tồn tại";
                // Hiển thị thông báo trùng phone
                out.println("document.getElementById('duplicatePhoneError').innerText = '" + errorMessage + "';");

            } else if (duplicateError.equals("PassError")) {
                errorMessage = "Sai mật khẩu , bạn không thể thay đổi mật khẩu!!!";
                // Hiển thị thông báo trùng phone
                out.println("document.getElementById('duplicatePassError').innerText = '" + errorMessage + "';");
            }
    %>
    // Xóa thuộc tính duplicateError khỏi session sau khi hiển thị cảnh báo
    <%
            session.removeAttribute("duplicateError");
        }
    %>
</script>


<script src="/JS/validPro.js"></script>
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
<script>
    document.addEventListener("DOMContentLoaded", function () {
        var newPInput = document.getElementById("newP");
        var confirmInput = document.getElementById("confirm");
        var errorDiv = document.getElementById("errorDiv");

        function validatePassword() {
            if (newPInput.value !== confirmInput.value) {
                errorDiv.innerHTML = "Password incorrect ";
            } else {
                errorDiv.innerHTML = "";
            }
        }

        newPInput.addEventListener("keyup", validatePassword);
        confirmInput.addEventListener("keyup", validatePassword);
    });
</script>

<script>
    var today = new Date();
    var selectedDate;
    var dd = String(today.getDate()).padStart(2, '0');
    var mm = String(today.getMonth() + 1).padStart(2, '0'); // nếu ngày và tháng nhỏ hơn 10 thì số đầu sẽ là số 0
    var yyyy = today.getFullYear();
    var countError = 0;

    function checkBirthDate() {
        selectedDate = new Date(document.getElementById('birthday').value);
        console.log(selectedDate);

        var age = today.getFullYear() - selectedDate.getFullYear();
        var month = today.getMonth() - selectedDate.getMonth();
        if (month < 0 || (month === 0 && today.getDate() < selectedDate.getDate())) {
            age--;
        }

        if (age < 18) {
            document.getElementById('dateError').innerHTML = "Nhân viên phải lớn hơn hoặc bằng 18 tuổi.";
            countError = -1;
        } else {
            document.getElementById('dateError').innerHTML = "";
            countError = 1;
        }
    }

    document.addEventListener("DOMContentLoaded", function () {

        const form = document.getElementById("updateForm");
        const fullnameInput = document.getElementById("fullname");
        const phoneInput = document.getElementById("phone");
        const emailInput = document.getElementById("email");
        const addressInput = document.getElementById("address");

        form.addEventListener("submit", function (event) {
            let isValid = true;

            // Xóa thông báo lỗi cũ
            clearErrors();

            // Kiểm tra FullName
            if (!fullnameInput.value.trim()) {
                showError(fullnameInput, "Vui lòng nhập Họ tên đầy đủ và hợp lệ.", "fullnameError");
                isValid = false;
            } else if (fullname.length > 20 || fullname.length < 6 || !/^[a-zA-Z\s]+$/.test(fullnameInput.value)) {
                showError(fullnameInput, "Họ tên không dài quá 20 kí tự và không có kí tự đặc biệt.", "fullnameError");
                isValid = false;
            }

            // Kiểm tra Email
            if (!emailInput.value.trim()) {
                showError(emailInput, "Vui lòng nhập email đầy đủ và hợp lệ.", "emailError");
                isValid = false;
            } else if (!/\S+@\S+\.\S+/.test(emailInput.value)) {
                showError(emailInput, "Vui lòng nhập email đầy đủ và hợp lệ.", "emailError");
                isValid = false;
            }

            // Kiểm tra Phone
            if (!phoneInput.value.trim()) {
                showError(phoneInput, "Vui lòng nhập Số điện thoại đầy đủ và hợp lệ.", "phoneError");
                isValid = false;
            } else if (!/(03|05|07|08|09|01[2|6|8|9])+([0-9]{8})\b/.test(phoneInput.value)) {
                showError(phoneInput, "Vui lòng nhập Số điện thoại đầy đủ và hợp lệ.", "phoneError");
                isValid = false;
            }

            // Kiểm tra Address
            if (!addressInput.value.trim()) {
                showError(addressInput, "Vui lòng nhập địa chỉ đầy đủ và hợp lệ.", "addressError");
                isValid = false;
            } else if (!/^[a-zA-Z0-9\s]+$/.test(addressInput.value)) {
                showError(addressInput, "Vui lòng nhập địa chỉ đầy đủ và hợp lệ.", "addressError");
                isValid = false;
            }
            
            checkBirthDate();
            
            console.log(countError);

            // Nếu form không hợp lệ, ngăn chặn gửi form
            if (!isValid || countError===-1) {
                event.preventDefault();
            }
        });

        // Function để hiển thị thông báo lỗi dưới trường nhập
        function showError(input, message, errorSpanId) {
            const errorSpan = document.getElementById(errorSpanId);
            errorSpan.textContent = message;
        }

        // Function để xóa thông báo lỗi
        function clearErrors() {
            const errors = document.querySelectorAll('.text-danger');
            errors.forEach(function (error) {
                error.textContent = '';
            });
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
            passOldError.textContent = 'Không được để trống phần này.';
            event.preventDefault();
        } else {
            passOldError.textContent = '';
        }

        if (newP.trim() === '') {
            passNewError.textContent = 'Không được để trống phần này.';
            event.preventDefault();
        } else if (newP.trim().length < 6 || newP.trim().length > 20) {
            passNewError.textContent = 'Độ dài của chuỗi phải từ 6 đến 20 ký tự.';
            event.preventDefault();
        } else {
            passNewError.textContent = '';
        }

        if (confirm.trim() === '') {
            passConfirmError.textContent = 'Không được để trống phần này.';
            event.preventDefault();
        } else if (confirm.trim().length < 6 || confirm.trim().length > 20) {
            passConfirmError.textContent = 'Độ dài của chuỗi phải từ 6 đến 20 ký tự.';
            event.preventDefault();
        } else {
            passConfirmError.textContent = '';
        }

    });
</script>



</html>
