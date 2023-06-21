<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>

<!-- Camera Script Begin -->
<script>
    // function blobToImage(blob) {
    //     return new Promise((resolve, reject) => {
    //         const reader = new FileReader();
    //         reader.onloadend = () => {
    //             const img = new Image();
    //             img.src = reader.result;
    //             img.onload = () => resolve(img);
    //             img.onerror = reject;
    //         };
    //         reader.onerror = reject;
    //         reader.readAsDataURL(blob);
    //     });
    // }

    let pic = {
        myVideoStream: null,
        init: function () {
            this.myVideoStream = document.querySelector('#myVideo');
        },
        getVideo: function () {
            navigator.getMedia = navigator.getUserMedia || navigator.webkitGetUserMedia || navigator.mozGetUserMedia || navigator.msGetUserMedia;
            navigator.getMedia(
                {video: true, audio: false},
                function (stream) {
                    pic.myVideoStream.srcObject = stream
                    pic.myVideoStream.play();
                },
                function (error) {
                    alert('webcam not working');
                });
        },
        takeSnapshot: function () {
            var section = document.getElementById("profileimgview")
            var div = document.getElementById("cameraDiv");
            var candiv = document.getElementById("canvasDiv");
            if (candiv.style.display === "none") {
                candiv.style.display = "block";
                div.style.display = "none";
                section.style.display = "none";
            }

            var myCanvasElement = document.querySelector('#myCanvas');
            var myCTX = myCanvasElement.getContext('2d');

            myCTX.drawImage(this.myVideoStream, 0, 0, myCanvasElement.width, myCanvasElement.height);
        },
        send: function () {
            const canvas = document.querySelector('#myCanvas');
            const imgBase64 = canvas.toDataURL('image/jpeg', 'image/octet-stream');
            const decodImg = atob(imgBase64.split(',')[1]);
            let array = [];
            for (let i = 0; i < decodImg.length; i++) {
                array.push(decodImg.charCodeAt(i));
            }
            const file = new Blob([new Uint8Array(array)], {type: 'image/jpeg'});
            const fileName = '${logincust.custid}' + '_profileimg.jpg';
            let formData = new FormData();
            formData.append('file', file, fileName);
            $('#profileimgname').val(fileName);
            $.ajax({
                type: 'post',
                url: '/saveimg/',
                enctype: 'multipart/form-data',
                cache: false,
                data: formData,
                processData: false,
                contentType: false,
                success: function (data) {
                }
            });
        }

    };
    $(function () {
        pic.init();
    });
</script>
<!-- Camera Script End -->

<script>
    function displayImage(event) {
        var reader = new FileReader();
        reader.onload = function () {
            var section = document.getElementById('profileimgview');
            section.style.backgroundImage = 'url(' + reader.result + ')';
            console.log(document.getElementById('img').files[0]);
        };
        reader.readAsDataURL(event.target.files[0]);
    }

    let profilemodify_form = {
        maxSize: 52428800, //50M
        init: function () {
            console.log("${logincust.gender}")
            if ("${logincust.gender}" == 'M') {
                $("#Malebtn").css('background', '#f28123');
            }
            if ("${logincust.gender}" == 'F') {
                $("#Femalebtn").css('background', '#f28123');
            }
            $('.nice-select:eq(0)').css({
                'width': '30%',
                'height': '50px',
            });
            $('.nice-select:eq(1)').css({
                'width': '100%',
                'height': '50px',
            });
            $('.current').css({
                'top': 4.4
            });
            $("#profilemodify_btn").click(function () {
                var inputFile = $("input[name='img']");
                var files = inputFile[0].files;
                for (var i = 0; i < files.length; i++) {
                    // 함수 호출(checkExtension)
                    if (!profilemodify_form.checkExtension(files[i].name, files[i].size)) {
                        return;
                    }
                }
                profilemodify_form.send();
            });
            $("#Malebtn").click(function () {
                $("#gender").val('M');
                $("#Malebtn").css('background', '#f28123');
                $("#Femalebtn").css('background', '#b7b7b7');
            });
            $("#Femalebtn").click(function () {
                $("#gender").val('F');
                $("#Malebtn").css('background', '#b7b7b7');
                $("#Femalebtn").css('background', '#f28123');
            });
            $('.phonezone select, .phonezone input[type="text"]').on('change', function () {
                var prefix = $('#phone_prefix').val();
                console.log(prefix);
                var middle = $('#phone_middle').val();
                var end = $('#phone_end').val();
                var phoneNumber = prefix + middle + end;
                $('#phone').val(phoneNumber);
                console.log(phoneNumber);
            });
            $('.locationzone select').on('change', function () {
                var loca = $('.selected:eq(1)').text();
                var location = loca;
                $('#location').val(location);
            });
        },
        checkExtension: function (fileName, fileSize) {
            var reg = new RegExp("(.*?)\.(exe|zip|alz)$");

            // 파일크기 제한
            // 실제파일의 크기 > 최대 크기
            if (fileSize >= this.maxSize) {
                alert("파일 사이즈 초과");
                return false;
            }

            // 확장자 제한
            // 실제파일명의 확장자와 정규식 비교
            // 정규식이면
            if (reg.test(fileName)) {
                alert("해당 종류의 파일은 업로드 할 수 없습니다.");
                return false;
            }
            return true;

        },
        send: function () {
            var password = $('#password').val();
            var email = $('#email').val();
            var emailCheck = document.getElementById("email");
            var candiv = document.getElementById("canvasDiv");
            if (candiv.style.display === "block") {
                pic.send();
            }

            if (password == '') {
                $('#password').focus();
                alert("비밀번호는 필수 입력입니다.");
                return;
            }
            if (email == '') {
                $('#email').focus();
                alert("이메일 주소는 필수 입력입니다.");
                return;
            }
            if (!(emailCheck.checkValidity())) {
                alert("유효하지 않은 이메일 주소입니다.");
                return;
            }
            $("#profilemodify_form").attr({
                method: 'post',
                action: '/apply/profilemodifyimpl',
                enctype: 'multipart/form-data'
            });
            $("#profilemodify_form").submit();
        },
    }

    $(function () {
        profilemodify_form.init();
    });
</script>

<!-- Profile Image Appear & Hidden Begin -->
<script>
    function toggleCamera() {
        var section = document.getElementById("profileimgview")
        var div = document.getElementById("cameraDiv");
        var candiv = document.getElementById("canvasDiv");
        if (div.style.display === "none") {
            div.style.display = "block";
            section.style.display = "none";
            candiv.style.display = "none";
        }
        pic.getVideo();
    }
</script>
<script>
    function toggleNoCamera() {
        var section = document.getElementById("profileimgview")
        var div = document.getElementById("cameraDiv");
        var candiv = document.getElementById("canvasDiv");
        if (section.style.display === "none") {
            section.style.display = "block";
            div.style.display = "none";
            candiv.style.display = "none";
        }
    }
</script>

<!-- Profile Image Appear & Hidden End -->


<!-- Normal Breadcrumb Begin -->


<c:choose>
    <c:when test="${logincust.profileimgname == null || logincust.profileimgname ==''}">
        <section id="profileimgview" class="normal-breadcrumb set-bg" data-setbg="/img/basic_profile.png"
                 style="width: 300px; overflow: hidden; margin: auto; border-radius: 50%; border: 5px solid #f28123; background-size: cover;background-position: center">
        </section>
    </c:when>
    <c:otherwise>
        <section id="profileimgview" class="normal-breadcrumb set-bg" data-setbg="/uimg/${logincust.profileimgname}"
                 style="width: 300px; overflow: hidden; margin: auto; border-radius: 50%; border: 5px solid #f28123; background-size: cover; background-position: center">
        </section>
    </c:otherwise>
</c:choose>

<section id="cameraDiv" class="normal-breadcrumb set-bg"
         style="display: none; position: relative;  overflow-x: hidden; width: 300px; margin: auto; border-radius: 50%; border: 5px solid #f28123; background-size: cover">
    <video id="myVideo" style="height: 100%; border-radius: 50%;  position: absolute;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);"></video>
    <input type=button class="btn" value="Take Pic" onclick="pic.takeSnapshot();"
           style="background-color: #f28123; font-weight: bold; color: #FFFFFF; position: absolute; bottom: 0; left: 50%; transform: translateX(-50%); margin-bottom: 10px;">
</section>
<section id="canvasDiv" class="normal-breadcrumb set-bg"
         style="display: none;  position: relative;  overflow-x: hidden; width: 300px; margin: auto; border-radius: 50%; border: 5px solid #f28123; background-size: cover">
    <canvas id="myCanvas" style="width: 387.2px; height: 100%; border-radius: 50%; position: absolute;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);"></canvas>
</section>

<!-- Normal Breadcrumb End -->
<!-- Signup Section Begin -->
<section class="signup spad">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="login__form">
                    <h3 style="color: #b7b7b7">My Profile</h3>
                    <form id="profilemodify_form">
                        <input type="hidden" id="profileimgname" name="profileimgname"
                               value="${logincust.profileimgname}">
                        <div style="justify-content: flex-start;">
                            <div class="input__item" style="width: 45%">
                                <input type="file" placeholder="Your ProfileImage" name="img"
                                       id="img" style="display: none" onchange="displayImage(event)"/>
                                <input type="button" value="Select Profile Image"
                                       onclick="document.getElementById('img').click(); toggleNoCamera();"
                                       style="text-align: left"/>
                                <span class="icon_image"></span>
                            </div>
                            <div class="input__item" style="width: 45%">
                                <input type="button" onclick="toggleCamera()" value="Take Profile Picture"
                                       style="text-align: left"/>
                            </div>
                        </div>
                        <div class="input__item" style="width: 90%">
                            <input type="text" placeholder="Your ID" name="custid" id="custid"
                                   value="${logincust.custid}" readonly>
                            <span class="icon_profile"></span>
                        </div>
                        <div class="input__item" style="width: 90%">
                            <input type="password" placeholder="Password" name="password" id="password">
                            <span class="icon_lock"></span>
                        </div>
                        <div class="input__item" style="width: 90%">
                            <input type="email" placeholder="Email address" name="email" id="email"
                                   value="${logincust.email}">
                            <span class="icon_mail"></span>
                        </div>
                        <div class="input__item" style="width: 90%">
                            <input type="text" placeholder="Your Name" name="custname" id="custname"
                                   value="${logincust.custname}">
                            <span class="icon_id"></span>
                        </div>
                        <div class="input__item" style="width: 90%">
                            <input type="text" placeholder="Your Nickname" name="nickname" id="nickname"
                                   value="${logincust.nickname}">
                            <span class="icon_comment_alt"></span>
                        </div>
                        <div class="input__item" style="width: 90%">
                            <input type="text" placeholder="Introduction" name="introduction" id="introduction"
                                   value="${logincust.introduction}">
                            <span class="icon_info_alt"></span>
                        </div>
                        <div class="input__item" id="genderzone" style="width: 90%">
                            <button type="button" class="site-btn" id="Malebtn"
                                    style="width: 49%;background-color: #b7b7b7">Male
                            </button>
                            <button type="button" class="site-btn" id="Femalebtn"
                                    style="width: 49%;background-color: #b7b7b7">Female
                            </button>
                            <input type="hidden" name="gender" id="gender" value="${logincust.gender}">
                        </div>
                        <div class="input__item phonezone" style="display: flex; width: 90%">
                            <select name="phone_prefix" id="phone_prefix">
                                <option value="010" ${logincust.phone !='' && logincust.phone.substring(0, 3) eq '010' ? 'selected' : ''}>
                                    010
                                </option>
                                <option value="011" ${logincust.phone !='' &&logincust.phone.substring(0, 3) eq '011' ? 'selected' : ''}>
                                    011
                                </option>
                                <option value="016" ${logincust.phone !='' &&logincust.phone.substring(0, 3) eq '016' ? 'selected' : ''}>
                                    016
                                </option>
                                <option value="017" ${logincust.phone !='' &&logincust.phone.substring(0, 3) eq '017' ? 'selected' : ''}>
                                    017
                                </option>
                                <option value="019" ${logincust.phone !='' &&logincust.phone.substring(0, 3) eq '019' ? 'selected' : ''}>
                                    019
                                </option>
                            </select>
                            <div class="input__item phonezone" style="display: flex; margin-bottom: 0; width: 90%">
                                <input type="text" pattern="[0-9]{4}" minlength="4" maxlength="4" placeholder="0000"
                                       name="phone_middle"
                                       id="phone_middle"
                                       style="width: 48%;  margin: 0 2% 0 2%; text-align: center; padding-left: 2px"
                                       value="${logincust.phone !='' ? logincust.phone.substring(3, 7)  : '0000'}">
                                <input type="text" pattern="[0-9]{4}" minlength="4" maxlength="4" placeholder="0000"
                                       name="phone_end"
                                       id="phone_end" style="width: 48%; text-align: center; padding-left: 2px"
                                       value="${logincust.phone !='' ? logincust.phone.substring(7, 11)  : '0000'}">
                            </div>
                            <input type="hidden" name="phone" id="phone" value="${logincust.phone}">
                        </div>
                        <div class="input__item locationzone" style="display: flex; width: 90%">
                            <select name="location_prefix" id="location_prefix">
                                <option value="서울" ${logincust.location eq '서울' ? 'selected' : ''}>서울</option>
                                <option value="인천" ${logincust.location eq '인천' ? 'selected' : ''}>인천</option>
                                <option value="경기" ${logincust.location eq '경기' ? 'selected' : ''}>경기</option>
                                <option value="대전" ${logincust.location eq '대전' ? 'selected' : ''}>대전</option>
                                <option value="충청" ${logincust.location eq '충청' ? 'selected' : ''}>충청</option>
                                <option value="부산" ${logincust.location eq '부산' ? 'selected' : ''}>부산</option>
                                <option value="대구" ${logincust.location eq '대구' ? 'selected' : ''}>대구</option>
                                <option value="울산" ${logincust.location eq '울산' ? 'selected' : ''}>울산</option>
                                <option value="경상" ${logincust.location eq '경상' ? 'selected' : ''}>경상</option>
                                <option value="광주" ${logincust.location eq '광주' ? 'selected' : ''}>광주</option>
                                <option value="전라" ${logincust.location eq '전라' ? 'selected' : ''}>전라</option>
                                <option value="강원" ${logincust.location eq '강원' ? 'selected' : ''}>강원</option>
                                <option value="제주" ${logincust.location eq '제주' ? 'selected' : ''}>제주</option>
                            </select>
                            <input type="hidden" name="location" id="location" value="${logincust.location}">
                        </div>

                        <button type="button" class="site-btn" id="profilemodify_btn" style="width: 90%">My Profile
                            Update Now
                        </button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Signup Section End -->

<style>
    #genderzone::before, .phonezone::before {
        display: none;
    }

</style>

