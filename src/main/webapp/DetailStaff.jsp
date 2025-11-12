<%-- 
    Document   : DetailStaff
    Created on : Feb 25, 2024, 4:43:23 PM
    Author     : Admin
--%>

<%@page import="Models.Staff"%>
<%@page import="DAOs.StaffDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Thông tin chi tiết</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
        <link rel="stylesheet" href="/CSS/AddNewsForm.css"/>
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
            .item_detail{
                width: 100%;
                height: 50px;
                color: #3e3e3ec8;
                font-size: 14px;
                font-family: Arial, Helvetica, sans-serif;
                display: flex;
                flex-direction: row;
                align-items: center;
                border-bottom: 1px solid rgba(0, 0, 0, 0.09);
                /*border-top: 1px solid rgba(0, 0, 0, 0.09);*/
                padding: 0;
            }
            .item_detail:first-child{
                border-top: 1px solid rgba(0, 0, 0, 0.09);
            }
            .item_detail .left{
                height: 100%;
                width: 40%;
                padding-left: 30px;
                border-right: 1px solid rgba(0, 0, 0, 0.09);
                border-left: 1px solid rgba(0, 0, 0, 0.09);
                display: flex;
                align-items: center;
                justify-content: start;
            }
            .item_detail .right{
                height: 100%;
                width: 60%;
                padding-left: 30px;
                display: flex;
                align-items: center;
                justify-content: start;
                border-right: 1px solid rgba(0, 0, 0, 0.09);
            }
            .back_to_home{
                margin-top: 30px;
            }
            .back_to_home a{
                font-family: Arial, Helvetica, sans-serif;
                font-size: 15px;
                text-decoration: none;
                color: #3498db;
                background: #fff;
                border: 1px solid #3498db;
                padding: 10px;
            }
        </style>
    </head>
    <body>

        <div class="row">
            <%@include file="DashBoardSlideBarVer2.jsp" %>
            <div class="col-lg-10 col-md-9 col-sm-9 min-vh-100 px-4 ps-4 mt-3" style="flex: 1; position: absolute; width: 80%;top: 0; left: 265px;">
                <div class="text-center mb-3">
                    <span class="h3 fw-bold">Thông tin chi tiết</span>
                </div>
                <%
                    StaffDAO sdao = new StaffDAO();
                    Staff getStaff = (Staff) session.getAttribute("getStaff");
                %>
                <div class="table_detail">
                    <div class="item_detail">
                        <div class="left">Mã nhân viên</div>
                        <div class="right"><%= getStaff.getStaff_id()%></div>
                    </div>
                    <div class="item_detail">
                        <div class="left">Mã tài khoản</div>
                        <div class="right"><%= getStaff.getAcc_id()%></div>
                    </div>
                    <div class="item_detail">
                        <div class="left">Tên tài khoản</div>
                        <div class="right"><%= getStaff.getUsername()%></div>
                    </div>
                    <div class="item_detail">
                        <div class="left">Mật khẩu</div>
                        <div class="right"><%= getStaff.getPassword()%></div>
                    </div>
                    <div class="item_detail">
                        <div class="left">Họ tên</div>
                        <div class="right"><%= getStaff.getFullname()%></div>
                    </div>
                    <div class="item_detail">
                        <div class="left">Email</div>
                        <div class="right"><%= getStaff.getEmail()%></div>
                    </div>
                    <div class="item_detail">
                        <div class="left">Ngày sinh</div>
                        <div class="right"><%= getStaff.getBirthday()%></div>
                    </div>
                    <div class="item_detail">
                        <div class="left">Giới tính</div>
                        <div class="right"><%= getStaff.getGender()%></div>
                    </div>
                    <div class="item_detail">
                        <div class="left">Địa chỉ</div>
                        <div class="right"><%= getStaff.getAddress()%></div>
                    </div>
                    <div class="item_detail">
                        <div class="left">Chức vụ</div>
                        <div class="right"><%= getStaff.getPosition()%></div>
                    </div>
                    <div class="item_detail">
                        <div class="left">Ngày bắt đầu</div>
                        <div class="right"><%= getStaff.getBegin_work()%></div>
                    </div>
                    <div class="item_detail">
                        <div class="left">Ngày kết thúc</div>
                        <div class="right">
                            <%
                                if(getStaff.getEnd_work() != null){
                            %>
                            <%= getStaff.getEnd_work() %>
                            <%
                                }
                            %>
                        </div>
                    </div>
                    <div class="item_detail">
                        <div class="left">Trạng thái</div>
                        <div class="right">
                            <%
                                if (getStaff.getIsDelete() == 0) {
                            %>
                            Hiệu lực
                            <%
                            } else {
                            %>
                            Vô hiệu lực
                            <%
                                }
                            %>
                        </div>
                    </div>
                </div>
                <div class="back_to_home">
                    <a href="/AdminController/adminListStaff">Trở về</a>
                </div>
            </div>
        </div>

        <!--JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
        crossorigin="anonymous"></script>
        <script src="/JS/ValidateStaffForm.js"></script>
    </body>
</html>
