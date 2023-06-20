<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=186d9ac6e73cf3e121e11e749901f230"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="jquery.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
    let reciperegister_form = {
        init: function () {
            $('#register_btn').addClass('disabled');
            $('#register_btn').click(function () {
                reciperegister_form.send();
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
            $('#reciperegister_form').attr({
                method: 'post',
                action: '/cookingclass/addImpl',
                enctype: 'multipart/form-data'
            });
            $('#reciperegister_form').submit();
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
        reciperegister_form.init();
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
<section class="normal-breadcrumb set-bg" data-setbg="/uimg/classmain.jpg">
    <div class="container">
        <div class="row">
            <div class="col-lg-12 text-center">
                <div class="normal__breadcrumb__text">
                    <h2>RECIPES ALL OVER THE WORLD</h2>
                    <p>Welcome to KOLLY'S RECIPES</p>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Normal Breadcrumb End -->
<!-- recipe register section -->
<section class="anime-details spad">
    <div class="container">
        <div class="row">
            <div class="col-lg-9">
                <div class="single-article-section">
                    <div class="login__form">
                        <form id="reciperegister_form">
                            <input type="hidden" name="custpin" id="custpin" value="${logincust.custpin}">
                            <input type="hidden" name="custid" id="custid" value="${logincust.custid}">
                            <input type="hidden" name="nickname" id="nickname" value="${logincust.nickname}">
                            <div class="class-step">
                                <div class="section-title">
                                    <h5>STEP 01. 레시피 유형</h5>
                                </div>
                                <div class="class__form" style="padding-left: 0">
                                    <div class="form-group">
                                        <p><span class="highlight">레시피 종류를 입력해주세요</span></p>
                                        <label for="type">레시피 종류 : </label>
                                        <select class="form-control" id="type" name="type">
                                            <option name="type" value="한식">한식</option>
                                            <option name="type" value="양식">양식</option>
                                            <option name="type" value="중식">중식</option>
                                            <option name="type" value="일식">일식</option>
                                            <option name="type" value="동남아식">동남아식</option>
                                            <option name="type" value="디저트">디저트</option>
                                            <option name="type" value="기타">기타</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="class__form" style="padding-left: 0">
                                    <div class="form-group">
                                        <p><span class="highlight">레시피를 추천하고 싶은 상황을 입력해주세요</span></p>
                                        <label for="situation">추천 상황 : </label>
                                        <input type="text" class="form-control" id="situation"
                                               placeholder="Enter situation" name="situation">
                                    </div>
                                </div>
                            </div>
                            <div class="class-step">
                                <div class="section-title">
                                    <h5>STEP 02. 대표 재료</h5>
                                </div>
                                <div class="recipe__form" style="padding-left: 0">
                                    <div class="form-group">
                                        <p><span class="highlight">대표 재료를 선택해주세요</span></p>
                                        <label for="ingredients1">대표 재료 1 : </label>
                                        <select class="form-control" id="ingredients1" name="ingredients1">
                                            <option name="ingredients1" value="소고기">소고기</option>
                                            <option name="ingredients1" value="돼지고기">돼지고기</option>
                                            <option name="ingredients1" value="닭고기">닭고기</option>
                                            <option name="ingredients1" value="생선">생선</option>
                                            <option name="ingredients1" value="오징어">오징어</option>
                                            <option name="ingredients1" value="면">면</option>
                                            <option name="ingredients1" value="떡">떡</option>
                                            <option name="ingredients1" value="김치">김치</option>
                                        </select>
                                    </div>
                                    <div class="form-group">
                                        <label for="ingredients2">대표 재료 2 : </label>
                                        <select class="form-control" id="ingredients2" name="ingredients2">
                                            <option name="ingredients2" value="소고기">소고기</option>
                                            <option name="ingredients2" value="돼지고기">돼지고기</option>
                                            <option name="ingredients2" value="닭고기">닭고기</option>
                                            <option name="ingredients2" value="생선">생선</option>
                                            <option name="ingredients2" value="오징어">오징어</option>
                                            <option name="ingredients2" value="면">면</option>
                                            <option name="ingredients2" value="떡">떡</option>
                                            <option name="ingredients2" value="김치">김치</option>
                                        </select>
                                    </div>
                                    <div class="form-group">
                                        <label for="ingredients3">대표 재료 3 : </label>
                                        <select class="form-control" id="ingredients3" name="ingredients3">
                                            <option name="ingredients3" value="소고기">소고기</option>
                                            <option name="ingredients3" value="돼지고기">돼지고기</option>
                                            <option name="ingredients3" value="닭고기">닭고기</option>
                                            <option name="ingredients3" value="생선">생선</option>
                                            <option name="ingredients3" value="오징어">오징어</option>
                                            <option name="ingredients3" value="면">면</option>
                                            <option name="ingredients3" value="떡">떡</option>
                                            <option name="ingredients3" value="김치">김치</option>
                                        </select>
                                    </div>
                                </div>
                            </div>
                            <div class="class-step">
                                <div class="section-title">
                                    <h5>STEP 03. 레시피 소개</h5>
                                </div>
                                <div class="class__form" style="padding-left: 0">
                                    <div class="form-group">
                                        <p><span class="highlight">레시피 제목을 입력해주세요</span></p>
                                        <label for="recipetitle">레시피 제목 : </label>
                                        <input type="text" class="form-control" id="recipetitle"
                                               placeholder="Enter Recipe Title" name="recipetitle">
                                    </div>
                                    <div class="form-group">
                                        <input type="hidden" class="form-control" id="thumbnailimg" name="thumbnailimg">
                                        <p><span class="highlight">레시피를 대표하는 이미지(썸네일)에 사용될 이미지를 등록해주세요</span></p>
                                        <label for="thumbnailimg">이미지 : </label>
                                        <input type="file" class="form-control" id="img"
                                               placeholder="Input Thumbnail Image"
                                               name="img">
                                        <li>용량은 3mb 이하를 사용해 주세요</li>
                                        <li>이미지 사이즈는 750px * 500px (3:2)이에요 (비율이 맞지 않으면 이미지가 잘릴 수 있어요)</li>
                                    </div>
                                    <div class="form-group">
                                        <p><span class="highlight">레시피 소개를 입력해주세요</span></p>
                                        <label for="recipedesc">레시피 소개 : </label>
                                        <input type="text" class="form-control" id="recipedesc"
                                               placeholder="Enter recipe" name="recipedesc">
                                    </div>
                                </div>
                            </div>
                            <div class="class-step">
                                <div class="section-title">
                                    <h5>STEP 04. 레시피 관련 정보</h5>
                                </div>
                                <div class="class__form" style="padding-left: 0">
                                    <div class="form-group">
                                        <p><span class="highlight">레시피 관련 정보를 입력해주세요</span></p>
                                        <label for="cooking">요리명 : </label>
                                        <input type="text" class="form-control" id="cooking"
                                               placeholder="Enter cooking Name" name="cooking">
                                        <label for="time">소요 시간 : </label>
                                        <input type="text" class="form-control" id="time"
                                               placeholder="Enter Cooking Time" name="time">
                                        <label for="recipelevel">난이도 : </label>
                                        <input type="text" class="form-control" id="recipelevel"
                                               placeholder="Enter Recipe Level" name="recipelevel">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <input type="hidden" class="form-control" id="finishedimg" name="finishedimg">
                                    <p><span class="highlight">완성된 요리 이미지를 등록해주세요</span></p>
                                    <label for="thumbnailimg">이미지 : </label>
                                    <input type="file" class="form-control" id="fimg"
                                           placeholder="Input Cooking Image"
                                           name="fimg">
                                    <li>용량은 3mb 이하를 사용해 주세요</li>
                                    <li>이미지 사이즈는 750px * 500px (3:2)이에요 (비율이 맞지 않으면 이미지가 잘릴 수 있어요)</li>
                                </div>
                            </div>
                            <div class="class-step">
                                <div class="section-title">
                                    <h5>STEP 05. 레시피 상세 재료</h5>
                                </div>
                                <div class="class__form" style="padding-left: 0">
                                    <div class="form-group">
                                        <p><span class="highlight">레시피 상세 재료 및 수량 입력해주세요</span></p>
                                        <input type="hidden" name="ingredientnumber1" id="ingredientnumber1" value=1>
                                        <input type="hidden" name="ingredientnumber2" id="ingredientnumber2" value=2>
                                        <input type="hidden" name="ingredientnumber3" id="ingredientnumber3" value=3>
                                        <input type="hidden" name="ingredientnumber4" id="ingredientnumber4" value=4>
                                        <input type="hidden" name="ingredientnumber5" id="ingredientnumber5" value=5>
                                        <label for="name1">재료 1 : </label>
                                        <input type="text" class="form-control" id="name1"
                                               placeholder="예) 돼지고기" name="name1">
                                        <label for="quantity1">계량 정보 : </label>
                                        <input type="text" class="form-control" id="quantity1"
                                               placeholder="예) 300g" name="quantity1">
                                        <label for="name2">재료 2 : </label>
                                        <input type="text" class="form-control" id="name2"
                                               placeholder="예) 양파" name="name2">
                                        <label for="quantity2">계량 정보 : </label>
                                        <input type="text" class="form-control" id="quantity2"
                                               placeholder="예) 1/2개" name="quantity2">
                                        <label for="name3">재료 3 : </label>
                                        <input type="text" class="form-control" id="name3"
                                               placeholder="예) 식용유" name="name3">
                                        <label for="quantity3">계량 정보 : </label>
                                        <input type="text" class="form-control" id="quantity3"
                                               placeholder="예) 2T" name="quantity3">
                                        <label for="name4">재료 4 : </label>
                                        <input type="text" class="form-control" id="name4"
                                               placeholder="예) 소금" name="name4">
                                        <label for="quantity4">계량 정보 : </label>
                                        <input type="text" class="form-control" id="quantity4"
                                               placeholder="예) 2t" name="quantity4">
                                        <label for="name5">재료 5 : </label>
                                        <input type="text" class="form-control" id="name5"
                                               placeholder="예) 고추가루" name="name5">
                                        <label for="quantity5">계량 정보 : </label>
                                        <input type="text" class="form-control" id="quantity5"
                                               placeholder="예) 1T" name="quantity5">
                                    </div>
                                </div>
                            </div>
                            <div class="class-step">
                                <div class="section-title">
                                    <h5>STEP 06. 요리 순서</h5>
                                </div>
                                <div class="class__form" style="padding-left: 0">
                                    <div class="form-group">
                                        <p><span class="highlight">요리 순서를 입력해주세요</span></p>
                                        <input type="hidden" name="step1" id="step1" value=1>
                                        <input type="hidden" name="step2" id="step2" value=2>
                                        <input type="hidden" name="step3" id="step3" value=3>
                                        <input type="hidden" name="step4" id="step4" value=4>
                                        <input type="hidden" name="step5" id="step5" value=5>
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