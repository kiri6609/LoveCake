/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */

const email = document.getElementById("email");

const setSuccess = (element) => {
    const inputControl = element.parentElement;
    const errorDisplay = inputControl.querySelector("span");
    errorDisplay.innerText = "";
    inputControl.classList.add("success");
    inputControl.classList.remove("error");
};
const setError = (element, message) => {
    const inputControl = element.parentElement;
    const errorDisplay = inputControl.querySelector("span");
    errorDisplay.innerText = message;
    inputControl.classList.add("error");
    inputControl.classList.remove("success");
};
function enterEmail() {
    let check = true;
    const user = email.value.trim();
   
    if (user === "") {
        setError(email, "Email không được để trống!");
        check = false;
    } else if (user !== '' && !isValidEmail(user)) {
        setError(email, "Hãy nhập đúng định dạng email");
        check = false;
    } else {
        setSuccess(email);
    }

    return check;
}
function isValidEmail(email) {
    // Sử dụng regular expression để kiểm tra định dạng email
//    const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    return /^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(email);
}