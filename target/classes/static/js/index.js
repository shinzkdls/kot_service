
function toggle() {
    var iconsElement = document.querySelector('.icons');
    if (iconsElement.style.display === 'none') {
        iconsElement.style.display = 'block';
    } else {
        iconsElement.style.display = 'none';
    }
    // Animate the icons. 근데 안움직임
    // $('#magicIcon').animate({right: '25px', bottom: '130px'}, 500);
    // $('#chatWithAdminIcon').animate({right: '80px', bottom: '155px'}, 500);
    // $('#howToUseIcon').animate({right: '140px', bottom: '130px'}, 500);
    // $('#chatGPTIcon').animate({right: '155px', bottom: '65px'}, 500);
    // $('#scrollToTop').animate({right: '120px', bottom: '15px'}, 500);
}

function openPopup(code) {
    window.open("http://127.0.0.1/chat/" + code, "popupWindow", "width=500, height=400");
}
