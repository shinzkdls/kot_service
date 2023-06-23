<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=186d9ac6e73cf3e121e11e749901f230"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="jquery.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
    $(document).ready(function () {
        $("#biz_image").on('change', function () {
            var fileName = $(this).val();
            $(".upload-name").val(fileName);
        });
    });

    function setThumbnail(event) {
        var reader = new FileReader();

        reader.onload = function (event) {
            var img = document.createElement("img");
            img.setAttribute("src", event.target.result);
            img.setAttribute("class", "image_container");
            document.querySelector("div#image_container").appendChild(img);
        };
        reader.readAsDataURL(event.target.files[0]);
    }


    let classregister_form = {
        init: function () {
            $('#register_btn').addClass('disabled');
            $('#register_btn').click(function () {
                classregister_form.send();
            });

            $('input').keyup(function () {
                var type = $('#type').val();
                var classtitle = $('#classtitle').val();
                var thumbnailimg = $('#thumbnailimg').val();
                var cooking = $('#cooking').val();
                var personal = $('#personal').val();
                var classtime = $('#classtime').val();
                var location = $('#location').val();
                var address = $('#address').val();
                var classdesc = $('#classdesc').val();
                var amount = $('#amount').val();
                console.log($('#classdate').val());
                if (type != '' && classtitle != '' && thumbnailimg != ''
                    && cooking != '' && personal != '' && classtime != ''
                    && location != '' && address != '' && classdesc != ''
                    && amount != '') {
                    $('#register_btn').removeClass('disabled');
                }
            });
        },
        send: function () {
            $('#classregister_form').attr({
                method: 'post',
                action: '/cookingclass/addImpl',
                enctype: 'multipart/form-data'
            });
            $('#classregister_form').submit();
        }
    };

    function sample4_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function (data) {
                var roadAddr = data.roadAddress; // 도로명 주소 변수

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('zipcode').value = data.zonecode;
                document.getElementById("address1").value = roadAddr;
            }
        }).open();
    }


    $(function () {
        classregister_form.init();
    });
</script>
<head>
    <!-- google font -->
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,700" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Poppins:400,700&display=swap" rel="stylesheet">
    <!-- fontawesome -->
    <link rel="stylesheet" href="/css/all.min.css">
    <!-- bootstrap -->
    <link rel="stylesheet" href="/bootstrap/css/bootstrap.min.css">
    <!-- owl carousel -->
    <link rel="stylesheet" href="/css/owl.carousel.css">
    <!-- magnific popup -->
    <link rel="stylesheet" href="/css/magnific-popup.css">
    <!-- animate css -->
    <link rel="stylesheet" href="/css/animate.css">
    <!-- mean menu css -->
    <link rel="stylesheet" href="/css/meanmenu.min.css">
    <!-- main style -->
    <link rel="stylesheet" href="/css/main.css">
    <!-- responsive -->
    <link rel="stylesheet" href="/css/responsive.css">
    <link rel="stylesheet" href="/css/style.css" type="text/css"/>
</head>
<body>
<!-- Normal Breadcrumb Begin -->
<section class="normal-breadcrumb set-bg" data-setbg="/uimg/classmain.gif">
    <div class="container">
    </div>
</section>
<!-- Normal Breadcrumb End -->
<!-- class register section -->
<section class="anime-details spad">
    <div class="container">
        <div class="row">
            <div class="col-lg-9">
                <div class="single-article-section">
                    <div class="login__form">
                        <div class="class-step">
                            <div class="section-title">
                                <h5>STEP 01. 호스트 인증</h5>
                            </div>
                            <form action="/ocrimpl" method="post" enctype="multipart/form-data" id="ocr_form"
<%--                                  class="well"--%>
                                  style="margin-top: 30px">
<%--                            <form id="ocr_form" class="ocr_form">--%>
                                <p><span class="highlight">사업자 등록증으로 호스트님을 인증해주세요</span></p>
                                <div class="filebox" style="align-items: center;">

                                    <input class="upload-name" aria-label="Search"
                                           value="사업자등록증을 등록해주세요"
                                           placeholder="사업자등록증을 등록해주세요">
                                    <label for="bizimg">파일 찾기</label>
                                    <input type="file" name="bizimg"
                                           id="bizimg" onchange="setThumbnail(event);">
                                </div>
                                <div style="display: flex;">

                                    <div style="width: 40%;">
                                        <div id="image_container" class="image_container set-bg"
                                             data-setbg="/uimg/${ncp.getBizimg().getOriginalFilename()}"
                                             style="max-width: 100%; max-height: 100%;">
                                        </div>
                                    </div>
                                    <div id="result_container" style="margin-top:20px; width: 60%; align-content:center;">
                                        <div style="margin-left: 30px;">
                                            <p>사업자번호 : ${result.biznum}</p>
                                            <p>사업자이름 : ${result.bizname}</p>
                                            <p>대표자이름: ${result.bizowner}</p>
                                            <p>개업년월일: ${result.bizdate}</p>
                                            <p>사업자주소: ${result.bizadd}</p>
                                        </div>
                                    </div>
                                </div>
                                <button id="ocr_btn" class="ocr_btn" type="submit"
                                        style="background-color: #F28123; color: #fff; ">인증
                                </button>
                            </form>
                        </div>
                        <form id="classregister_form">
                            <input type="hidden" name="custpin" id="custpin" value="${logincust.custpin}">
                            <input type="hidden" name="custid" id="custid" value="${logincust.custid}">
                            <input type="hidden" name="nickname" id="nickname" value="${logincust.nickname}">

                            <div class="class-step" >
                                <div class="section-title">
                                    <h5>STEP 02. 클래스 유형</h5>
                                    <div class="form-group" style="margin-top: 30px;">
                                        <div class="form-check-category">
                                            <fieldset>
                                                <label>
                                                    <input type="radio" id="type1" name="type" value="한식" checked/>&nbsp
                                                    <span>한식</span>
                                                </label>
                                                <label>
                                                    <input type="radio" id="type2" name="type" value="양식"/>&nbsp
                                                    <span>양식</span>
                                                </label>
                                                <label>
                                                    <input type="radio" id="type3" name="type" value="중식"/>&nbsp
                                                    <span>중식</span>
                                                </label>
                                                <label>
                                                    <input type="radio" id="type4" name="type" value="일식"/>&nbsp
                                                    <span>일식</span>
                                                </label>
                                                <label>
                                                    <input type="radio" id="type5" name="type" value="기타"/>&nbsp
                                                    <span>기타</span>
                                                </label>
                                            </fieldset>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="class-step">
                                <div class="section-title">
                                    <h5>STEP 03. 클래스 소개</h5>
                                </div>
                                <div class="class__form" style="padding-left: 0">
                                    <div class="form-group">
                                        <p><span class="highlight"> 클래스 제목을 입력해주세요 </span></p>
                                        <label for="classtitle">클래스명 : </label>
                                        <input type="text" class="form-control" id="classtitle"
                                               placeholder="Enter classtitle" name="classtitle">
                                    </div>
                                    <div class="form-group">
                                        <input type="hidden" class="form-control" id="thumbnailimg" name="thumbnailimg">
                                        <p><span class="highlight">클래스를 대표하는 이미지(썸네일)에 사용될 이미지를 등록해주세요</span></p>
                                        <label for="thumbnailimg">이미지 : </label>
                                        <input type="file" class="form-control" id="img"
                                               placeholder="Input Thumbnail Image"
                                               name="img">
                                        <li>용량은 3mb 이하를 사용해 주세요</li>
                                        <li>이미지 사이즈는 750px * 500px (3:2)이에요 (비율이 맞지 않으면 이미지가 잘릴 수 있어요)</li>
                                    </div>
                                    <div class="form-group">
                                        <p><span class="highlight">클래스 관련 정보를 입력해주세요</span></p>
                                        <label for="cooking">요리명 : </label>
                                        <input type="text" class="form-control" id="cooking"
                                               placeholder="Enter cooking" name="cooking">
                                        <label for="personal">참여 인원 : </label>
                                        <input type="text" class="form-control" id="personal"
                                               placeholder="Enter personal" name="personal">
                                        <label for="classtime">소요 시간 : </label>
                                        <input type="text" class="form-control" id="classtime"
                                               placeholder="Enter classtime" name="classtime">
                                    </div>
                                    <div class="form-group">
                                        <p><span class="highlight">클래스 위치 정보를 입력해주세요</span></p>
                                        <div>
                                            <label for="location">클래스 지역 : </label>
                                            <select class="form-control" id="location" name="location">
                                                <option value="">지역</option>
                                                <option name="location" value="서울">서울</option>
                                                <option name="location" value="인천">인천</option>
                                                <option name="location" value="경기">경기</option>
                                                <option name="location" value="대전">대전</option>
                                                <option name="location" value="충청">충청</option>
                                                <option name="location" value="부산">부산</option>
                                                <option name="location" value="대구">대구</option>
                                                <option name="location" value="울산">울산</option>
                                                <option name="location" value="경상">경상</option>
                                                <option name="location" value="광주">광주</option>
                                                <option name="location" value="전라">전라</option>
                                                <option name="location" value="강원">강원</option>
                                                <option name="location" value="제주">제주</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="address">클래스 주소 : </label>
                                        <input type="hidden" name="address" id="address" value="">
                                        <div class="input-group mb-3">
                                            <input type="text" class="form-control" id="zipcode" name="zipcode"
                                                   placeholder="우편번호"
                                                   style="margin-right: 10px">
                                            <div class="input-group-append">
                                                <input type="button" onclick="sample4_execDaumPostcode()"
                                                       value="우편번호 찾기"><br>
                                            </div>
                                        </div>
                                        <input type="text" class="form-control" id="address1" name="address1"
                                               placeholder="도로명주소">
                                        <span id="guide" style="color:#999;display:none"></span>
                                    </div>
                                    <div class="form-group">
                                        <input type="text" class="form-control" id="address2" name="address2"
                                               placeholder="상세주소">
                                    </div>
                                    <div class="form-group">
                                        <p><span class="highlight">클래스 상세 내용을 입력해주세요</span></p>
                                        <label for="classdesc">클래스 상세 내용 : </label>
                                        <input type="text" class="form-control" id="classdesc"
                                               placeholder="Enter classdesc" name="classdesc">
                                    </div>
                                </div>
                            </div>
                            <div class="class-step">
                                <div class="section-title">
                                    <h5>STEP 04. 금액 및 일정</h5>
                                </div>
                                <div class="class__form" style="padding-left: 0">
                                    <div class="form-group">
                                        <p><span class="highlight">원데이 클래스 수강료를 입력해주세요</span></p>
                                        <label for="amount">수강료 : </label>
                                        <input type="text" class="form-control" id="amount"
                                               placeholder="Enter amount" name="amount">
                                    </div>
                                    <div class="form-group">
                                        <p><span class="highlight">원데이 클래스 일정을 입력해주세요</span></p>
                                        <label for="classdate">수업일자 : </label>
                                        <input type="date" class="form-control" id="classdate"
                                               placeholder="Enter classdate" name="classdate">
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <div class="anime__details__btn" style="display: flex; justify-content: flex-end">
            <button type="button" id="register_btn" class="follow-btn" style="border: unset;">
                Register
            </button>
        </div>
    </div>
</section>
<!-- end class register section -->
</body>