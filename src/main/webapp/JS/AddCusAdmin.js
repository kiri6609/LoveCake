/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */


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

// xóa hiển thị hình ảnh đã chọn 
//function deleteImage() {
//    var img = document.getElementById('displayImage');
//    img.innerHTML = '';
//}



function validateFormCus() {
    var fullname = document.getElementById('fullname').value.trim();
    var email = document.getElementById('email').value.trim();
    var phone = document.getElementById('phone').value.trim();
    var username = document.getElementById('user').value.trim();
    var password = document.getElementById('pass').value.trim();
    //loi o trang Add News

    var errorFullname = document.querySelector(".errorFullname");
    var errorEmail = document.querySelector(".errorEmail");
    var errorPhone = document.querySelector(".errorPhone");
    var errorUsername = document.querySelector(".errorUsername");
    var errorPass = document.querySelector(".errorPass");


    errorFullname.innerHTML = '';
    errorEmail.innerHTML = '';
    errorPhone.innerHTML = '';
    errorUsername.innerHTML = '';
    errorPass.innerHTML = '';


    let isValid = true;

    // bao loi cho trang add News
    
    if (fullname === '') {
        errorFullname.innerHTML = "Họ và tên không thể để trống!";
        isValid = false;
    }
//    if (fullname!=='' && (fullname.length < 10 || fullname.length > 200)) {
//        errorFullname.innerHTML = "Độ dài của họ và tên phải lớn hơn 10 và nhỏ hơn hoặc bằng 200 kí tự!";
//        isValid = false;
//    }
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
    
    if (username === '') {
        errorUsername.innerHTML = "Tên đăng nhập không thể bỏ trống";
        isValid = false;
    }
//    if (username !== '' && (username.length < 10 || username.length > 100)) {
//        errorUsername.innerHTML = "Độ dài của tên đăng nhập phải lớn hơn 10 và nhỏ hơn hoặc bằng 100 kí tự!";
//        isValid = false;
//    }

    if (password === '') {
        errorPass.innerHTML = "Mật khẩu không thể bỏ trống";
        return false;

    }

    if (password !== '' && (password.length < 6 || password.length > 20)) {
        errorPass.innerHTML = "Độ dài của mật khẩu phải lớn hơn 6 và nhỏ hơn hoặc bằng 20 kí tự!";
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