/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */


const username = document.getElementById('username');
const password = document.getElementById('password');
const fullname = document.getElementById('fullname');
const phone = document.getElementById('phone');
const email = document.getElementById('email');
const address = document.getElementById('address');
const birthday = document.getElementById('birthday');
const position = document.getElementById('position');
const begin_work = document.getElementById('begin_work');

// Lấy ngày hiện tại
var today = new Date();
var selectedDate;
var dd = String(today.getDate()).padStart(2, '0');
var mm = String(today.getMonth() + 1).padStart(2, '0'); // nếu ngày và tháng nhỏ hơn 10 thì số đầu sẽ là số 0
var yyyy = today.getFullYear();

// Format ngày thành YYYY-MM-DD (định dạng ngày của trường input type="date")
var formattedDate = yyyy + '-' + mm + '-' + dd;

// Gán giá trị ngày mặc định là ngày hôm nay
begin_work.value = formattedDate;

// Bắt sự kiện thay đổi của trường input
begin_work.addEventListener('change', function () {
    selectedDate = new Date(this.value);

    if (selectedDate > today) {
        setError(begin_work, "Ngày bắt đầu không thể lớn hơn ngày hiện tại!");
        begin_work.value = formattedDate; // Xóa giá trị của trường input
    } else {
        setSuccess(begin_work);
    }
});



const form = document.getElementById('staffForm');
const listUsername = document.querySelectorAll('.listUsername');

//REGISTER VALIDATE
form.addEventListener('submit', function (e) {
    if(!validateInputs()){
        e.preventDefault();
    }
});

const setError = (element, message) => {
    const inputControl = element.parentElement.parentElement;
    const errorDisplay = inputControl.querySelector('.error');

    errorDisplay.innerText = message;
    inputControl.classList.add('error');
    inputControl.classList.remove('success');
};

const setSuccess = element => {
    const inputControl = element.parentElement.parentElement;
    const errorDisplay = inputControl.querySelector('.error');

    errorDisplay.innerText = '';
    inputControl.classList.add('success');
    inputControl.classList.remove('error');
};

const isValidPhone = phone => {
    const re = /(84|0[3|5|7|8|9])+([0-9]{8})\b/g;
    return re.test(phone.value.trim());
};

const isValidEmail = email => {
    const re = /^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
    return re.test(email.value.trim());
};

const isValidUsername = username => {
    var count = 0;
    for (var i = 0; i < listUsername.length; i++) {
        if (username === listUsername[i].value) {
            count++;
        }
    }
//    true is valid and false is invalid
    return (count === 0) ? true : false;
};

function validateInputs() {
    const usernameValue = username.value.trim();
    const passwordValue = password.value.trim();
    const fullnameValue = fullname.value.trim();
    const phoneValue = phone.value.trim();
    const emailValue = email.value.trim();
    const addressValue = address.value.trim();
    var isValid = true;
    var count1 = 0
    if (usernameValue === '') {
        setError(username, 'Hãy điền tên tài khoản');
        isValid = false;
    }
    if (!isValidUsername(usernameValue)) {
        setError(username, 'Tên tài khoản đã được đăng ký');
        isValid = false;
    } else {
        setSuccess(username);
    }

    if (passwordValue === '') {
        setError(password, 'Hãy điền mật khẩu');
        isValid = false;
    } 
    if (passwordValue.length < 8) {
        setError(password, 'Mật khẩu phải lớn hơn 8 ký tự');
        isValid = false;
    } else {
        setSuccess(password);
    }

    if (fullnameValue === '') {
        setError(fullname, 'Hãy điền họ và tên đầy đủ');
        isValid = false;
    } else {
        setSuccess(fullname);
    }

    if (phoneValue === '') {
        setError(phone, 'Hãy điền số điện thoại');
        isValid = false;
    } 
    if (!isValidPhone(phoneValue)) {
        setError(phone, 'Số điện thoại không hợp lệ. Hãy điền số điện thoại Việt Nam');
        isValid = false;
    } else {
        setSuccess(phone);
    }

    if (emailValue === '') {
        setError(email, 'Hãy điền địa chỉ email');
        isValid = false;
    } 
    if (emailValue !== '' &&!isValidEmail(emailValue)) {
        setError(email, 'Địa chỉ email không hợp lệ');
        isValid = false;
    } else {
        setSuccess(email);
    }

    if (addressValue === '') {
        setError(address, 'Hãy điền địa chỉ cụ thể');
        isValid = false;
    } else {
        setSuccess(address);
    }

    return isValid;
}
;
