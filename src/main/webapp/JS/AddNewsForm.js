/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */

// Lấy ngày hiện tại
var today = new Date();
var selectedDate;
var dd = String(today.getDate()).padStart(2, '0');
var mm = String(today.getMonth() + 1).padStart(2, '0'); // nếu ngày và tháng nhỏ hơn 10 thì số đầu sẽ là số 0
var yyyy = today.getFullYear();

// Format ngày thành YYYY-MM-DD (định dạng ngày của trường input type="date")
var formattedDate = yyyy + '-' + mm + '-' + dd;

// Gán giá trị ngày mặc định là ngày hôm nay
document.getElementById('dayWriteNews').value = formattedDate;

// Bắt sự kiện thay đổi của trường input
document.getElementById('dayWriteNews').addEventListener('change', function () {
    selectedDate = new Date(this.value);

    // So sánh ngày được chọn với ngày hiện tại
    if (selectedDate > today) {
        document.getElementById('dateError').innerHTML = "Ngày không thể lớn hơn ngày hiện tại.";
        document.getElementById('dayWriteNews').value = formattedDate; // Xóa giá trị của trường input
    } else {
        document.getElementById('dateError').innerHTML = "";
    }
});

// hien thi hinh anh khi chon
function displayImage(event, displayId) {
    var image = document.getElementById(displayId);
    var defaultImage = image.querySelector('.defaultImage');
    image.innerHTML = ''; // Xóa hình ảnh đang hiển thị trước đó

    var file = event.target.files[0];
    if (!file) {
        image.appendChild(defaultImage); // Hiển thị hình ảnh mặc định nếu không có file được chọn
        return;
    }

    var reader = new FileReader();
    reader.onload = function (event) {
        var img = document.createElement('img');
        img.src = event.target.result;
        img.style.maxWidth = '100%'; // Đảm bảo hình ảnh không vượt quá chiều rộng của phần tử cha
        image.appendChild(img);
    };
    reader.readAsDataURL(file);
}

function validateAddPro() {
    var proName = document.getElementById('proName').value.trim();
    var price = document.getElementById('price').value.trim();
    var realPrice = document.getElementById('realPrice').value.trim();
//    var quantity = document.getElementById('quantity').value.trim();
    var description = document.getElementById('description').value.trim();

    var errorProName = document.querySelector(".errorProName");
    var errorPrice = document.querySelector(".errorPrice");
    var errorRealPrice = document.querySelector(".errorRealPrice");
//    var errorQuantity = document.querySelector(".errorQuantity");
    var errorDescription = document.querySelector(".errorDescription");

    errorProName.innerHTML = '';
    errorPrice.innerHTML = '';
    errorRealPrice.innerHTML = '';
//    errorQuantity.innerHTML = '';
    errorDescription.innerHTML = '';

    var isValid = true;

//    if (proName === "" || price === "" ||  realPrice === "" || quantity === "" || description === "" || selectedDate > today || parseFloat(realPrice) > parseFloat(price)){
//        alert("Vui lòng nhập đầy đủ và đúng thông tin cần thiết!");
//    }
    if (proName === '') {
        errorProName.innerHTML = "Tên sản phẩm không thể bỏ trống!";
        isValid = false;
    }
    if (price === '') {
        errorPrice.innerHTML = "Giá gốc sản phẩm không thể bỏ trống!";
        isValid = false;
    }
    if (realPrice === '') {
        errorRealPrice.innerHTML = "Giá bán sản phẩm không thể bỏ trống!";
        isValid = false;
    }
    if (parseFloat(realPrice) > parseFloat(price)) {
        errorRealPrice.innerHTML = "Giá gốc phải nhỏ hơn hoặc bằng giá bán";
        isValid = false;
    }
//    if (quantity === '') {
//        errorQuantity.innerHTML = "Số lượng sản phẩm không thể bỏ trống!";
//        isValid = false;
//    }
    if (description === '') {
        errorDescription.innerHTML = "Mô tả sản phẩm không thể bỏ trống!";
        isValid = false;
    }
    return isValid;
}


function validateForm() {
    //loi o trang Add News
    var title = document.getElementById('title').value.trim();
    var title_content = document.getElementById('title_content').value.trim();
    var content1 = document.getElementById('content1').value.trim();
    var content2 = document.getElementById('content2').value.trim();
    var content3 = document.getElementById('content3').value.trim();

    var errorTitle = document.querySelector(".errorTitle");
    var errorTitle_content = document.querySelector(".errorTitle_content");
    var errorContent1 = document.querySelector(".errorContent1");
    var errorContent2 = document.querySelector(".errorContent2");
    var errorContent3 = document.querySelector(".errorContent3");
    var error = document.querySelector(".error");

    errorTitle.innerHTML = '';
    errorTitle_content.innerHTML = '';
    errorContent1.innerHTML = '';
    errorContent2.innerHTML = '';
    errorContent3.innerHTML = '';
    error.innerHTML = '';

    var isValid = true;

    // bao loi cho trang add News
    if (title.trim() === '' || title_content === '' || content1 === '' || content2 === '' || content3 === '' || selectedDate > today) {
        alert("Vui lòng nhập đầy đủ và đúng thông tin cần thiết!");
        isValid = false;
    }
    if (title.trim() === null) {
        errorTitle.innerHTML = "Tiêu đề không thể để trống!";
        isValid = false;
    }
    if (title_content.trim() === null) {
        errorTitle_content.innerHTML = "Nội dung chính không thể bỏ trống!";
        isValid = false;
    }
    if (content1 === '') {
        errorContent1.innerHTML = "Nội dung 1 không thể bỏ trống";
        isValid = false;
    }
    if (content2 === '') {
        errorContent2.innerHTML = "Nội dung 2 không thể bỏ trống";
        isValid = false;
    }
    if (content3 === '') {
        errorContent3.innerHTML = "Nội dung 3 không thể bỏ trống";
        return false;
    }
    return isValid;
}