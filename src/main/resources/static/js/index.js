
function toggle() {
    var iconsElement = document.querySelector('.icons');
    if (iconsElement.style.display === 'none') {
        iconsElement.style.display = 'block';
    } else {
        iconsElement.style.display = 'none';
    }
    // Animate the icons
    $('#magicIcon').animate({right: '25px', bottom: '130px'}, 500);
    $('#chatWithAdminIcon').animate({right: '80px', bottom: '155px'}, 500);
    $('#howToUseIcon').animate({right: '140px', bottom: '130px'}, 500);
    $('#chatGPTIcon').animate({right: '155px', bottom: '65px'}, 500);
    $('#scrollToTop').animate({right: '120px', bottom: '15px'}, 500);
}

function openPopup(code) {
    // 팝업 창을 띄우는 코드
    window.open("http://127.0.0.1/chat/" + code, "popupWindow", "width=500, height=400");
}
