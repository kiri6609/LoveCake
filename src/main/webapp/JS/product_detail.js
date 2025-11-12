/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */


let listDivImg = document.querySelectorAll('.list_img div');
let next = document.querySelector('.next');
let prev = document.querySelector('.prev');
let imgWrap = document.querySelector('.img_wrap img');

let currentIndex = 0;

setCurrent(currentIndex);

function setCurrent(index) {
    currentIndex = index;
    imgWrap.src = listDivImg[currentIndex].querySelector('img').src;

    // remove all active img
    listDivImg.forEach((item) => {
        item.classList.remove('active');
    })

    // set active
    listDivImg[currentIndex].classList.add('active');
}

listDivImg.forEach((img, index) => {
    img.addEventListener('click', (e) => {
        setCurrent(index);
    })
})

next.addEventListener('click', () => {
    if (currentIndex == listDivImg.length - 1) {
        currentIndex = 0;
    } else
        currentIndex++;

    setCurrent(currentIndex);
})

prev.addEventListener('click', () => {
    if (currentIndex == 0)
        currentIndex = listDivImg.length - 1;
    else
        currentIndex--;

    setCurrent(currentIndex);
})

// FORMAT COST VND
var cost_product = document.querySelector('.cost_product');
const VND = new Intl.NumberFormat('vi-VN', {
    style: 'currency',
    currency: 'VND',
});
cost_product.innerHTML = VND.format(62000);

//VALUE QUANTITY
function defaultValue(valueQuantity) {
    console.log(valueQuantity.value);
    if (valueQuantity != null) {
        valueQuantity = 1;
    } else {
        valueQuantity = valueQuantity;
    }
} 