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

function validateAddProduct() {
    var proName = document.getElementById('proName').value.trim();
    var price = document.getElementById('price').value.trim();
    var realPrice = document.getElementById('realPrice').value.trim();
    var description = document.getElementById('description').value.trim();

    var mass = document.getElementById('mass').value.trim();
    var ingredient = document.getElementById('ingredient').value.trim();
    var brand = document.getElementById('brand').value.trim();

    var errorProName = document.querySelector(".errorProName");
    var errorPrice = document.querySelector(".errorPrice");

    var errorRealPrice = document.querySelector(".errorRealPrice");

    var errorDescription = document.querySelector(".errorDescription");

    var errorMass = document.querySelector(".errorMass");
    var errorIngredient = document.querySelector(".errorIngredient");
    var errorBrand = document.querySelector(".errorBrand");

    errorProName.innerHTML = '';
    errorPrice.innerHTML = '';
    errorRealPrice.innerHTML = '';


    errorDescription.innerHTML = '';

    errorMass.innerHTML = '';
    errorIngredient.innerHTML = '';
    errorBrand.innerHTML = '';

    var isValid = true;

    if (proName === '') {
        errorProName.innerHTML = "Tên sản phẩm không thể bỏ trống!";
        isValid = false;
    }
    if (price === '') {
        errorPrice.innerHTML = "Giá bán sản phẩm không thể bỏ trống!";
        isValid = false;
    }
    if (price !== '' && price <= 0) {
        errorPrice.innerHTML = "Giá bán sản phẩm không thể nhỏ hơn hoặc bằng 0!";
        isValid = false;
    }
    if (realPrice === '') {
        errorRealPrice.innerHTML = "Giá khuyến mãi sản phẩm không thể bỏ trống!";
        isValid = false;
    }
    if (realPrice !== '' && realPrice <= 0) {
        errorRealPrice.innerHTML = "Giá khuyến mãi sản phẩm không thể nhỏ hơn hoặc bằng 0!";
        isValid = false;
    }
    if (parseFloat(realPrice) > parseFloat(price)) {
        errorRealPrice.innerHTML = "Giá khuyến mãi phải nhỏ hơn hoặc bằng giá gốc";
        isValid = false;
    }

    if (description === '') {
        errorDescription.innerHTML = "Mô tả sản phẩm không thể bỏ trống!";
        isValid = false;
    }
    if (description !== '' && (description.length < 10 || description.length > 1000)) {
        errorDescription.innerHTML = "Độ dài của mô tả sản phẩm phải lớn 10 và nhỏ hơn hoặc bằng 1000 kí tự!";
        isValid = false;
    }
    if (mass === '') {
        errorMass.innerHTML = "Khối lượng sản phẩm không thể bỏ trống!";
        isValid = false;
    }
    if (mass !== '' && mass <= 0) {
        errorMass.innerHTML = "Khối lượng sản phẩm không thể nhỏ hơn hoặc bằng 0!";
        isValid = false;
    }
    if (brand === '') {
        errorBrand.innerHTML = "Thương hiệu sản phẩm không thể bỏ trống!";
        isValid = false;
    }
    if (ingredient === '') {
        errorIngredient.innerHTML = "Thành phần sản phẩm không thể bỏ trống!";
        isValid = false;
    }
    return isValid;
}
function validateAddSupplier() {
    var proName = document.getElementById('proName').value.trim();
    var email = document.getElementById('email').value.trim();
    var phone = document.getElementById('phone').value.trim();
    var address = document.getElementById('address').value.trim();


    var errorProName = document.querySelector(".errorProName");
    var errorEmail = document.querySelector(".errorEmail");

    var errorPhone = document.querySelector(".errorPhone");
    var errorAddress = document.querySelector(".errorAddress");

    errorProName.innerHTML = '';
    errorEmail.innerHTML = '';
    errorPhone.innerHTML = '';
    errorAddress.innerHTML = '';

    var isValid = true;

    if (proName === '') {
        errorProName.innerHTML = "Tên nhà cung cấp không thể bỏ trống!";
        isValid = false;
    }
    if (email === '') {
        errorEmail.innerHTML = "Email không thể bỏ trống!";
        isValid = false;
    }
    if (email !== '' && !isValidEmail(email)) {
        errorEmail.innerHTML = "Email không đúng định dạng!";
        isValid = false;
    }
    if (phone === '') {
        errorPhone.innerHTML = "Số điện thoại không thể bỏ trống";
        isValid = false;
    }
    if (phone !== '' && !isVietnamesePhoneNumber(phone)) {
        errorPhone.innerHTML = "Số điện thoại phải là số điện thoại VN!";
        isValid = false;
    }
    if (address === '') {
        errorAddress.innerHTML = "Địa chỉ nhà cung cấp không thể bỏ trống!";
        isValid = false;
    }
    if (address !== '' && (address.length < 20 || address.length > 1000)) {
        errorAddress.innerHTML = "Địa chỉ nhà cung cấp không thể nhỏ hơn 20!";
        isValid = false;
    }
    return isValid;
}
function isVietnamesePhoneNumber(number) {
    return /(03|05|07|08|09|01[2|6|8|9])+([0-9]{8})\b/.test(number);
}

function isValidEmail(email) {
    // Sử dụng regular expression để kiểm tra định dạng email
//    const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    return /^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(email);
}

function validateAddNews() {
    var title = document.getElementById('title').value.trim();
    var contentMain = document.getElementById('contentMain').value.trim();
    var dayWriteNews = document.getElementById('dayWriteNews').value.trim();
    var content1 = document.getElementById('content1').value.trim();
    var content2 = document.getElementById('content2').value.trim();
    var content3 = document.getElementById('content3').value.trim();

    var errorTitle = document.querySelector('.errorTitle');
    var errorContentMain = document.querySelector('.errorContentMain');
    var dateError = document.getElementById('dateError');
    var errorContent1 = document.querySelector(".errorContent1");
    var errorContent2 = document.querySelector(".errorContent2");
    var errorContent3 = document.querySelector(".errorContent3");

    var isValid = true;

    if (title === "") {
        errorTitle.innerText = "Vui lòng nhập tiêu đề.";
        isValid = false;
    } else {
        errorTitle.innerText = "";
    }

    if (contentMain === "") {
        errorContentMain.innerText = "Vui lòng nhập nội dung chính.";
        isValid = false;
    } else {
        errorContentMain.innerText = "";
    }

    if (dayWriteNews === "") {
        dateError.innerText = "Vui lòng chọn ngày viết.";
        isValid = false;
    } else {
        dateError.innerText = "";
    }

    if (content1 === '') {
        errorContent1.innerHTML = "Nội dung 1 không thể bỏ trống";
        isValid = false;
    }else {
        errorContent1.innerText = "";
    }
    
    if (content2 === '') {
        errorContent2.innerHTML = "Nội dung 2 không thể bỏ trống";
        isValid = false;
    }else {
        errorContent2.innerText = "";
    }
    
    if (content3 === '') {
        errorContent3.innerHTML = "Nội dung 3 không thể bỏ trống";
        return false;
    }else {
        errorContent3.innerText = "";
    }
    
    return isValid;
}
