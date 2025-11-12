/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */

const form = document.getElementById('updateForm');

form.addEventListener('submit', function (e) {
    if (!validateResgisterCus()) {
        e.preventDefault();
    }
});

const username = document.getElementById("userN");
const password = document.getElementById("pwd");
const setSuccess = (element) => {
    const inputControl = element.parentElement;
    const errorDisplay = inputControl.querySelector('.error');
    errorDisplay.innerText = '';
    inputControl.classList.add("success");
    inputControl.classList.remove("error");
};
const setError = (element, message) => {
    const inputControl = element.parentElement;
    const errorDisplay = inputControl.querySelector(".error");
    errorDisplay.innerText = message;
    inputControl.classList.add("error");
    inputControl.classList.remove("success");
};
function validateInputs() {
    let check = 0;
    const user = username.value.trim();
    const pwd = password.value.trim();
    if (user === "") {
        setError(username, "Bắt buộc!");
        check++;
    } else if (user.length > 100) {
        setError(username, "Không hợp lệ.");
        check++;
    } else {
        setSuccess(username);
    }

    if (pwd === "") {
        setError(password, "Bắt buộc!");
        check++;
    } else {
        setSuccess(password);
    }
    return check;
}

function validateResgisterCus() {
    let check = 0;
    const email = document.getElementById("email");
    const phone = document.getElementById("phone");
    if (email.value.trim() === "") {
        setError(email, "Bắt buộc nhập!");
        check++;
    } else if (!isValidEmail(email.value.trim())) {
        setError(email, "Vui lòng nhập đúng định dạng!");
        check++;
    } else {
        setSuccess(email);
    }


    if (phone.value.trim() === "") {
        setError(phone, "Bắt buộc nhập!");
        check++;
    } else if (!isVietnamesePhoneNumber(phone.value.trim())) {
        setError(phone, "Vui lòng nhập đúng định dạng!");
        check++;
    } else {
        setSuccess(phone);
    }


    if (password.value.trim() === "") {
        setError(password, "Password is require!");
        check = false;
    } else {
        setSuccess(password);
    }

//    if (username.value.trim() === "") {
//        setError(username, "Username is require!");
//        check = false;
//    } else if (username.value.length > 100) {
//        setError(username, "Username length cannot greater than 100 character");
//        check = false;
//    } else {
//        if (usernameHidden.trim() === "This username is already existed!") {
//            setError(username, "");
//            check = false;
//        } else {
//            setSuccess(username);
//
//        }
//    }

    return (check === 0) ? true : false;
}

function checkImage(fileName) {
    const substrings = fileName.split(".");
    const ext = substrings[substrings.length - 1].toLowerCase(); // Lấy phần mở rộng và chuyển đổi thành chữ thường

    const imgExtensions = ["jpg", "png", "jpeg"];
    return imgExtensions.includes(ext);
}

function isVietnamesePhoneNumber(number) {
    return /(03|05|07|08|09|01[2|6|8|9])+([0-9]{8})\b/.test(number);
}

function isValidEmail(email) {
// Sử dụng regular expression để kiểm tra định dạng email
//    const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    return /^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(email);
}