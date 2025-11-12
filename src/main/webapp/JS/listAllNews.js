/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */


var listControl = document.querySelectorAll('.control');
var listImg = document.querySelectorAll('.list_img img');
var galleryImg = document.querySelector('.wrapper img');
let current = 0;

setCurrent(current);

function setCurrent(index) {
    current = index;

    galleryImg.src = listImg[current].src;

    listControl.forEach((item) => {
        item.classList.remove('active_control');
    })

    listControl[current].classList.add('active_control');
}

listControl.forEach((icon, index) => {
    icon.addEventListener('click', (e) => {
        setCurrent(index);
    })
})

var i = 0;
setInterval(() => {
    i++;

    if (i > 1) {
        i = 0;
    }
    setCurrent(i);
}, 3000);