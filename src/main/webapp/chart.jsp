
<%@page import="Models.chartPro"%>
<%-- 
    Document   : chart
    Created on : Feb 29, 2024, 10:05:18 AM
    Author     : Vu Minh Uyen
--%>

<%@page import="DAOs.OrderDAO"%>
<%@page import="DAOs.StaffDAO"%>
<%@page import="DAOs.CustomerDAO"%>
<%@page import="java.util.List"%>
<%@page import="Models.Chart"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.js"></script>
    <link href="https://fonts.googleapis.com/css2?family=Lato&display=swap" rel="stylesheet">

    <link rel="stylesheet" href="../CSS/thongke.css"/>
    <title>Thống kê</title>

</head>
<body>

    <%@include file="DashBoardSlideBarVer2.jsp" %>
    <div class="col-lg-10 col-md-9 col-sm-9 min-vh-100 mt-3" style="position: absolute;
         left: 265px;
         top: 0;
         width: 80%;">
        <%
            // Gọi hàm countCustomers() từ DAO để lấy số lượng khách hàng
            CustomerDAO cdao = new CustomerDAO();
            int numberOfCustomers = cdao.countCustomers();
            StaffDAO sdao = new StaffDAO();
            int numberOfStaffs = sdao.countStaffs();
            OrderDAO odao = new OrderDAO();
            double sumMoney = odao.SumMoney();

        %>

        <div class="container">
            <div class="row">


                <style>
                    .statistic a{
                        text-decoration: none;
                    }
                </style>
                <div class="statistic">

                    <div class="sta-item sta-cus">
                        <div class="top-statistic">
                            <i class="fa-solid fa-user statistic-icon"></i>
                            <div class="statistic-infor">
                                <h4>Khách hàng</h4>
                                <span><%= numberOfCustomers%></span>
                            </div>
                        </div>
                        <div class="bot-statistic">
                            <a href="/AdminController/adminListCustomer">Xem chi tiết <i class="fa-solid fa-circle-info"></i></a>
                        </div>
                    </div>

                    <div class="sta-item sta-staff">
                        <div class="top-statistic">
                            <i class="fa-solid fa-user statistic-icon"></i>
                            <div class="statistic-infor">
                                <h4>Nhân viên</h4>
                                <span><%= numberOfStaffs%></span>
                            </div>
                        </div>
                        <div class="bot-statistic">
                            <a href="/AdminController/adminListStaff">Xem chi tiết <i class="fa-solid fa-circle-info"></i></a>
                        </div>
                    </div>

                    <div class="sta-item sta-revenue">
                        <div class="top-statistic">
                            <i class="fa-solid fa-coins statistic-icon"></i>
                            <div class="statistic-infor">
                                <h4>Doanh thu</h4>
                                <span id="customer-count"><%= sumMoney%></span> <span>đ</span>
                            </div>
                        </div>
                        <div class="bot-statistic">
                            <a href="/AdminController/adminListOrderHistory">Xem chi tiết <i class="fa-solid fa-circle-info"></i></a>
                        </div>
                    </div>
                </div>

                <!--END NAM CODE-->

            </div>
        </div>



        <!--UYÊN CODE-->


        <!--BIỂU ĐỒ 1-->

        <%         //       *******hiện nguyên bảng)********
            List<Chart> chartDataList = (List<Chart>) request.getAttribute("chartData");
            StringBuilder xValues = new StringBuilder();
            StringBuilder yValues = new StringBuilder();

            for (Chart chartData : chartDataList) {
                xValues.append("'" + chartData.getOrderDate() + "',");
                yValues.append(chartData.getTotalAmount() + ",");
            }

            if (xValues.length() > 0) {
                xValues.deleteCharAt(xValues.length() - 1);
                yValues.deleteCharAt(yValues.length() - 1);
            }

            //       *******hiện theo lựa chọn********
            //        chartDAO chartDAO = new chartDAO();
            List<Chart> chartDataListYear = odao.getCMonth();
            StringBuilder mValues = new StringBuilder();
            StringBuilder nValues = new StringBuilder();
            for (Chart chartData : chartDataListYear) {
                mValues.append("'" + chartData.getOrderDate() + "',");
                nValues.append(chartData.getTotalAmount() + ",");
            }
            mValues.deleteCharAt(mValues.length() - 1);
            nValues.deleteCharAt(nValues.length() - 1);
        %>

        <!--BIỂU ĐỒ 1-->
        <div class="row">
            <h1 style="margin-top: 50px" class='txtretroshadow'>Biểu đồ Thống kê</h1>
            <div class="col-7"  style="margin-top: 20px;margin-left: 80px;">

                <canvas id="myChart" style="width:100%;max-width:1000px;color: #99ccff"></canvas> 
            </div>
            <div class="col-4" style="margin-top: 130px;">
                <form id="chartForm" action="ChartController" method="post">
                    <div style="margin-left: 85px">
                        <marquee width="80%">Nhập thời gian bạn muốn xem thống kê.</marquee>
                    </div>
                    <div class="col-14 mb-4"  style="margin-left: 90px">
                        <label for="year" style="color: #3333ff">Năm:</label>
                        <select id="year" name="year" style="color: #3333ff" required>
                         
                            <option value="2023">2023</option>
                            <option value="2024">2024</option>
                            <option value="2025">2025</option>
                        </select>
                        <label for="month" style="color: #3333ff;margin-left: 20px">Tháng:</label>
                        <select id="month" name="month" style="color: #3333ff" required>
                            <option value="0">Chọn tháng</option>
                            <option value="1">1</option>
                            <option value="2">2</option>
                            <option value="3">3</option>
                            <option value="4">4</option>
                            <option value="5">5</option>
                            <option value="6">6</option>
                            <option value="7">7</option>
                            <option value="8">8</option>
                            <option value="9">9</option>
                            <option value="10">10</option>
                            <option value="11">11</option>
                            <option value="12">12</option>
                        </select>
                    </div>
                    <div class="col-12" >

                        <button style="margin-left: 50px;font-weight: bold" name="xemBieuDo" type="submit" class="custom-btn btn-5"><span>Biểu đồ Năm</span></button>
                        <button  style="font-weight: bold" name="xemBieuDoThang" type="submit" class="custom-btn btn-5"><span>Biểu đồ Tháng</span></button>
                        <hr>
                        <button style="margin-left: 150px;font-weight: bold" class="custom-btn btn-5"<span><a type="button" href="/ChartController/Chart" style="text-decoration: none; color: black">Biểu đồ Chung</span></button>

                    </div>

                </form>

            </div>
        </div>






        <!--BIỂU ĐỒ 2-->
        <div class="row">
            <h1 style="margin-top: 50px" class='txtretroshadow'>Biểu đồ Thống kê sản phẩm đã bán </h1>
            <div class="col-12"  style="margin-top: 20px;margin-left:40px;">

                <canvas id="myChartProduct" style="width:100%;max-width:1000px;color: #99ccff"></canvas> 
            </div>

        </div>

        <!--BIỂU ĐỒ 2-->
        <%
            List<chartPro> chartDataListProduct = (List<chartPro>) request.getAttribute("ChartDataProduct");
            StringBuilder oValues = new StringBuilder();
            StringBuilder pValues = new StringBuilder();
            System.out.println("oValue:" + oValues);
            System.out.println("pValue:" + pValues);

            for (chartPro ChartDataProduct : chartDataListProduct) {
                oValues.append("'" + ChartDataProduct.getNameOrDate() + "',");
                pValues.append(ChartDataProduct.getQuantity() + ",");
            }

            if (oValues.length() > 0) {
                oValues.deleteCharAt(oValues.length() - 1);
                pValues.deleteCharAt(pValues.length() - 1);
            }
        %>





        <!--BIỂU ĐỒ 3-->
        <div class="row">
            <h1 style="margin-top: 50px" class='txtretroshadow'>Biểu đồ Thống kê sản phẩm đã bán  qua các năm</h1>
            <div class="col-12"  style="margin-top: 20px;margin-left:80px;">

                <canvas id="myChartProductDay" style="width:100%;max-width:1000px;color: #99ccff"></canvas> 
            </div>

        </div>

        <!--BIỂU ĐỒ 3-->
        <%
            List<chartPro> chartDataListDay = (List<chartPro>) request.getAttribute("ChartDataProductDay");

            StringBuilder aValues = new StringBuilder();
            StringBuilder bValues = new StringBuilder();

            for (chartPro ChartDataProductDay : chartDataListDay) {
                aValues.append("'" + ChartDataProductDay.getNameOrDate() + "',");
                bValues.append(ChartDataProductDay.getQuantity() + ",");
            }

            if (aValues.length() > 0) {
                aValues.deleteCharAt(aValues.length() - 1);
                bValues.deleteCharAt(bValues.length() - 1);
            }
        %>






        <!--BIỂU ĐỒ 2-->
        <script>
            const oValues = [<%= oValues.toString()%>];
            const pValues = [<%= pValues.toString()%>];
            const areaColorsProName = ["rgba(255, 99, 132, 0.2)", "rgba(54, 162, 235, 0.2)", "rgba(255, 206, 86, 0.2)", "rgba(75, 192, 192, 0.2)", "rgba(153, 102, 255, 0.2)", "rgba(255, 159, 64, 0.2)"]; // Add more colors if needed

            new Chart("myChartProduct", {
                type: "bar",
                data: {
                    labels: oValues,
                    datasets: [{
                            borderColor: "red", // Màu của đường
                            backgroundColor: areaColorsProName, // Màu của vùng dưới đường
                            data: pValues
                        }]
                },

                options: {
                    legend: {display: false},
                    title: {
                        display: true,
                        text: "Biểu đồ thống kê sản phẩm đã bán."
                    }
                }
            });
        </script>




        <!--BIỂU ĐỒ 3-->
        <script>
            const aValues = [<%= aValues.toString()%>];
            const bValues = [<%= bValues.toString()%>];
            const areaColorsProInDay = ["rgba(255, 99, 132, 0.2)", "rgba(54, 162, 235, 0.2)", "rgba(255, 206, 86, 0.2)", "rgba(75, 192, 192, 0.2)", "rgba(153, 102, 255, 0.2)", "rgba(255, 159, 64, 0.2)"]; // Add more colors if needed

            new Chart("myChartProductDay", {
                type: "bar",
                data: {
                    labels: aValues,
                    datasets: [{
                            borderColor: "red", // Màu của đường
                            backgroundColor: areaColorsProInDay, // Màu của vùng dưới đường
                            data: bValues
                        }]
                },

                options: {
                    legend: {display: false},
                    title: {
                        display: true,
                        text: "Biểu đồ thống kê số lượng sản phẩm đã bán  qua các năm."
                    }
                }
            });
        </script>


        <!--******//////**********++++*********////*********BIEU DO NGAY************++++**************//////************-->
    </div>



    <!--BIỂU ĐỒ 1-->
    <script>
        const xValues = [<%= xValues.toString()%>];
        const yValues = [<%= yValues.toString()%>];
        const areaColors = ["rgba(255, 99, 132, 0.2)", "rgba(54, 162, 235, 0.2)", "rgba(255, 206, 86, 0.2)", "rgba(75, 192, 192, 0.2)", "rgba(153, 102, 255, 0.2)", "rgba(255, 159, 64, 0.2)"]; // Add more colors if needed

        new Chart("myChart", {
            type: "line",
            data: {
                labels: xValues,
                datasets: [{
                        borderColor: "red", // Màu của đường
                        backgroundColor: areaColors, // Màu của vùng dưới đường
                        data: yValues
                    }]
            },

            options: {
                legend: {display: false},
                title: {
                    display: true,
                    text: "Biểu đồ thống kê doanh thu theo ngày tháng năm."
                }
            }
        });
    </script>






    <script>
        document.addEventListener("DOMContentLoaded", function () {
            // Lấy các phần tử select
            var yearSelect = document.getElementById("year");
            var monthSelect = document.getElementById("month");

            // Lấy giá trị đã lưu trong sessionStorage
            var selectedYear = sessionStorage.getItem("selectedYear");
            var selectedMonth = sessionStorage.getItem("selectedMonth");

            // Thiết lập lại giá trị cho select năm và tháng nếu có
            if (selectedYear) {
                yearSelect.value = selectedYear;
            }
            if (selectedMonth) {
                monthSelect.value = selectedMonth;
            }

            // Lưu giá trị khi thay đổi năm
            yearSelect.addEventListener("change", function () {
                sessionStorage.setItem("selectedYear", yearSelect.value);
            });

            // Lưu giá trị khi thay đổi tháng
            monthSelect.addEventListener("change", function () {
                sessionStorage.setItem("selectedMonth", monthSelect.value);
            });
        });
    </script>
    <script>
        function animateNumber(finalNumber, duration = 5000, startNumber = 0, callback) {
            let currentNumber = startNumber
            const interval = window.setInterval(updateNumber, 17)
            function updateNumber() {
                if (currentNumber >= finalNumber) {
                    clearInterval(interval)
                } else {
                    let inc = Math.ceil(finalNumber / (duration / 17))
                    if (currentNumber + inc > finalNumber) {
                        currentNumber = finalNumber
                        clearInterval(interval)
                    } else {
                        currentNumber += inc
                    }
                    callback(currentNumber)
                }
        }
        }

        document.addEventListener('DOMContentLoaded', function () {

            animateNumber(<%= sumMoney%>, 3000, 0, function (number) {
                const formattedNumber = number.toLocaleString()
                document.getElementById('customer-count').innerText = formattedNumber
            })
        })</script>





</body>
</html>
