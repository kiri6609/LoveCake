<%-- 
    Document   : registerStaffForm
    Created on : Feb 13, 2024, 3:53:03 PM
    Author     : Dell
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Tạo tài khoản nhân viên</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" />
    </head>

    <body>
        <div class="row">
            <%@include file="SlideBarDashBoard.jsp" %>
            <div class="col-lg-10 col-md-9 col-sm-9 min-vh-100 mt-3">
                <form class="pb-2">
                    <div class="text-center mb-2 pb-1">
                        <span class="h4 fw-bold mb-0">Tạo tài khoản nhân viên</span>
                    </div>
                    <div class="form-outline mb-2">
                        <label class="form-label">Họ và tên</label>
                        <input type="text" id="fullName" name="fullName"
                               class="form-control form-control-lg" />

                    </div>
                    <div class="form-outline mb-2">
                        <label class="form-label">Email</label>
                        <input type="email" id="email" name="email"
                               class="form-control form-control-lg" />

                    </div>
                    <div class="form-outline mb-2">
                        <label class="form-label">Giới tính</label>
                        <br/>
                        <input type="radio" class="gender" id="Male" name="rdoGender"
                               value="Nam"/>Nam
                        <br/>
                        <input type="radio" class="gender" id="FeMale" name="rdoGender"
                               value="Nữ"/>Nữ
                    </div>
                    <div class="form-outline mb-2">
                        <label class="form-label">Ngày sinh</label>
                        <input type="date" id="" name=""
                               class="form-control form-control-lg" />
                    </div>
                    <div class="form-outline mb-2">
                        <label class="form-label">Địa chỉ</label>
                        <input type="text" id="" name=""
                               class="form-control form-control-lg" />
                    </div>
                    <div class="form-outline mb-2">
                        <label class="form-label">Chức vụ</label>
                        <select id="id">
                            <option value="first">Quản lý sản phẩm</option>
                            <option value="second">Quản lý đơn hàng</option>
                            <option value="third">Quản lý thông tin</option>
                        </select>

                    </div>
                    <div class="form-outline mb-2">
                        <label class="form-label">Ngày bắt đầu làm việc</label>
                        <input type="date" id="" name=""
                               class="form-control form-control-lg" />
                    </div>
                    <div class="form-outline mb-2">
                        <label class="form-label">Ngày kết thúc làm việc</label>
                        <input type="date" id="" name=""
                               class="form-control form-control-lg" />
                    </div>

                    <div class="form-outline mb-2">
                        <label class="form-label">Tên đăng nhập</label>
                        <input type="text" id="phone" name="phoneNumber"
                               class="form-control form-control-lg" />

                    </div>

                    <div class="form-outline mb-2">
                        <label class="form-label">Mật khẩu</label>
                        <input type="password" id="password" name="password"
                               class="form-control form-control-lg" />

                    </div>
                    <div class="pt-1 mb-2">
                        <input type="submit" class="btn btn-lg btn-block" name="btnLogin"
                               value="Create" style="background-color: #f1a8b6;">
                        <input type="reset" class="btn btn-lg btn-block" value="Reset"
                               style="background-color: #f1a8b6;">
                    </div>
                </form>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
        crossorigin="anonymous"></script>
    </body>

</html>
