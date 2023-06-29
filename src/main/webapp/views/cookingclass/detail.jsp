<%@ page import="java.net.URLEncoder" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script>
    function joinInsert() {
        $('#join_form').attr({
            "action": "/cookingclass/joinImpl",
            "method": "post"
        });
        $('#join_form').submit();
    };

    function requestPay() {
        var IMP = window.IMP; // 생략 가능
        IMP.init("imp63768343"); // 예: imp00000000
        IMP.request_pay({
                pg: 'html5_inicis',
                pay_method: "card",
                merchant_uid: 'merchant_' + new Date().getTime(),
                name: "${classdetail.cooking}",
                amount: parseInt(${classdetail.amount}),
                buyer_email: "${logincust.email}",
                buyer_name: "${logincust.custname}",
                buyer_tel: "${logincust.phone}",
                buyer_addr: "${logincust.location}",
            },
            rsp => {
                if (rsp.success) {
                    alert(`결제가 완료되었습니다.`);
                    joinInsert();
                    paymentInsert();
                } else {
                    alert(`결제가 취소되었습니다.`);
                }
            });
    };

    let class_map = {
        map: null,
        geocoder: null,
        init: function () {
            var mapContainer = document.getElementById('map'),
                mapOption = {
                    center: new kakao.maps.LatLng(37.47, 126.98),
                    level: 3
                };

            var map = new kakao.maps.Map(mapContainer, mapOption);
            var geocoder = new kakao.maps.services.Geocoder();

            // 주소로 좌표를 검색
            geocoder.addressSearch('${classdetail.address}', function (result, status) {

                if (status === kakao.maps.services.Status.OK) {
                    var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

                    // 결과값으로 받은 위치를 마커로 표시
                    var marker = new kakao.maps.Marker({
                        map: map,
                        position: coords
                    });

                    // 인포윈도우로 장소에 대한 설명을 표시
                    var infowindow = new kakao.maps.InfoWindow({
                        content: '<div style="width:150px;text-align:center;padding:6px 0;">${classdetail.classtitle}</div>'
                    });
                    infowindow.open(map, marker);

                    // 지도의 중심을 결과값으로 받은 위치로 이동
                    map.setCenter(coords);
                }
            });
        }
    };

    let comment_form = {
        init: function () {
            $("#comment_btn").click(function () {
                <c:choose>
                <c:when test="${logincust != null}">
                $('#login_btn').prop("disabled", false);
                comment_form.send();
                </c:when>
                <c:otherwise>
                $('#login_btn').prop("disabled", true);
                alert("로그인 후 이용해주세요.")
                </c:otherwise>
                </c:choose>
                // register_form.send();
            });
        },
        send: function () {
            var classpin = $('#classpin').val();
            var custpin = $('#custpin').val();
            var custid = $('#custid').val();
            var nickname = $('#nickname').val();
            var content = $('#content').val();

            $("#comment_form").attr({
                "action": "/cookingclass/commentImpl",
                "method": "post"
            });
            $("#comment_form").submit();
        }
    }
    $(function () {
        $("#class").addClass("navActive");
        class_map.init();
        comment_form.init();
    });

    // calendar section.
    let nowMonth = new Date(); // 현재 달을 페이지를 로드한 날의 달로 초기화
    let today = new Date(); // 페이지를 로드한 날짜를 저장
    today.setHours(0, 0, 0, 0); // 비교 편의를 위해 today의 시간을 초기화

    var dateString = "${classdetail.classdate.substring(0,10)}";
    var classdate = new Date(dateString);

    // 달력 생성
    function buildCalendar() {
        let firstDate = new Date(nowMonth.getFullYear(), nowMonth.getMonth(), 1); // 이번달 1일
        let lastDate = new Date(nowMonth.getFullYear(), nowMonth.getMonth() + 1, 0); // 이번달 마지막날
        let tbody_Calendar = document.querySelector(".Calendar > tbody");
        document.getElementById("calYear").innerText = nowMonth.getFullYear(); // 연도 숫자 갱신
        document.getElementById("calMonth").innerText = leftPad(nowMonth.getMonth() + 1); // 월 숫자 갱신

        while (tbody_Calendar.rows.length > 0) { // 이전 출력결과가 남아있는 경우 초기화
            tbody_Calendar.deleteRow(tbody_Calendar.rows.length - 1);
        }
        let nowRow = tbody_Calendar.insertRow(); // 첫번째 행 추가

        for (let j = 0; j < firstDate.getDay(); j++) { // 이번달 1일의 요일만큼
            let nowColumn = nowRow.insertCell(); // 열 추가
        }
        for (let nowDay = firstDate; nowDay <= lastDate; nowDay.setDate(nowDay.getDate() + 1)) { // day는 날짜를 저장하는 변수, 이번달 마지막날까지 증가시키며 반복
            let nowColumn = nowRow.insertCell(); // 새 열을 추가하고
            let newDIV = document.createElement("p");
            newDIV.innerHTML = leftPad(nowDay.getDate()); // 추가한 열에 날짜 입력
            nowColumn.appendChild(newDIV);

            if (nowDay.getDay() == 6) { // 토요일인 경우
                nowRow = tbody_Calendar.insertRow(); // 새로운 행 추가
            }
            if (nowDay < today) { // 지난날인 경우
                newDIV.className = "pastDay";
            } else if (
                nowDay.getFullYear() == today.getFullYear() &&
                nowDay.getMonth() == today.getMonth() &&
                nowDay.getDate() == today.getDate()
            ) {
                newDIV.className = "today"; // 오늘인 경우

            } else if (
                nowDay.getFullYear() == classdate.getFullYear() &&
                nowDay.getMonth() == classdate.getMonth() &&
                nowDay.getDate() == classdate.getDate()
            ) {
                newDIV.className = "choiceDay"; // db 데이터의 날짜인 경우
            }
        }
    }

    // 날짜 선택
    function choiceDate(newDIV) {
        if (document.getElementsByClassName("choiceDay")[0]) {
            document
                .getElementsByClassName("choiceDay")[0]
                .classList.remove("choiceDay"); // 해당 날짜의 "choiceDay" class 제거
        }
        newDIV.classList.add("choiceDay"); // 선택된 날짜에 "choiceDay" class 추가
    }

    // 이전달 버튼 클릭
    function prevCalendar() {
        nowMonth = new Date(
            nowMonth.getFullYear(),
            nowMonth.getMonth() - 1,
            nowMonth.getDate()
        ); // 현재 달을 1 감소
        buildCalendar(); // 달력 다시 생성
    }

    // 다음달 버튼 클릭
    function nextCalendar() {
        nowMonth = new Date(
            nowMonth.getFullYear(),
            nowMonth.getMonth() + 1,
            nowMonth.getDate()
        ); // 현재 달을 1 증가
        buildCalendar(); // 달력 다시 생성
    }

    // input값이 한자리 숫자인 경우 앞에 '0' 붙혀주는 함수
    function leftPad(value) {
        if (value < 10) {
            value = "0" + value;
            return value;
        }
        return value;
    }

    // dday
    function calculateDday(classdate) {
        var currentDate = new Date();

        var year = parseInt(classdate.substring(0, 4));
        var month = parseInt(classdate.substring(5, 7));
        var day = parseInt(classdate.substring(8, 10));

        var inputDate = new Date(year, month - 1, day);
        var timeDiff = inputDate.getTime() - currentDate.getTime();
        var daysRemaining = Math.ceil(timeDiff / (1000 * 60 * 60 * 24));

        if (daysRemaining > 0) {
            return "D-" + daysRemaining;
        } else if (daysRemaining === 0) {
            return "D-Day";
        } else {
            return "종료";
        }
    }

    window.onload = function () {
        buildCalendar(); // 페이지 로드되면 buildCalendar 실행
        var classdate = "${classdetail.classdate.substring(0,10)}";
        var dday = calculateDday(classdate);
        var ddayElement = document.getElementById("dday");
        ddayElement.textContent = dday;

        var personal = parseInt("${classdetail.personal}");
        var joincount = parseInt("${classdetail.joincount}");

        if (dday === "종료") {
            console.log("Condition 1");
            document.getElementById("message").textContent = "아쉽지만 이미 종료된 클래스에요.";
            ddayElement.style.backgroundColor = "#818181";
        } else if (dday === "D-Day") {
            console.log("Condition 2");
            document.getElementById("message").textContent = "클래스 당일이에요! 호스트에게 문의하세요";
        } else if (dday === "D-1" || dday === "D-2" || dday === "D-3") {
            console.log("Condition 3");
            document.getElementById("message").textContent = "아직 늦지 않았어요. 서두르세요!";
        } else if (personal === joincount) {
            console.log("Condition 4");
            document.getElementById("message").textContent = "아쉽지만 모집이 완료된 클래스에요.";
            ddayElement.style.backgroundColor = "#818181";
        } else {
            console.log("Condition 5");
            document.getElementById("message").textContent = "우리 함께 해요!";
        }
    };
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
<!-- single article section -->
<div class="mt-50 mb-150">
    <div class="container">
        <div class="row">
            <div class="col-lg-8">
                <div class="single-article-section">
                    <div class="single-article-text" style="margin-bottom: 50px">
                        <div class="class-bg"
                             style="margin-bottom: 30px; background-image: url('/uimg/${classdetail.thumbnailimg}');background-size: cover; background-position: center; background-repeat: no-repeat;">
                        </div>
                        <h2 style="color:#F28123; font-weight: bolder">
                            [${classdetail.location}] ${classdetail.classtitle}</h2>
                    </div>
                    <div class="class-step">
                        <div class="section-title">
                            <h5>클래스 소개</h5>
                        </div>
                        <h5>${classdetail.classdesc}</h5>
                        <br><br>
                        <p><img src="https://cdn-icons-png.flaticon.com/128/2965/2965740.png"
                                style="width: 25px; margin-right: 0.5em;">수업소요시간 : ${classdetail.classtime}
                            분
                        </p>
                        <p><img src="https://cdn-icons-png.flaticon.com/128/854/854952.png"
                                style="width: 25px; margin-right: 0.5em;"> 지역
                            : ${classdetail.location}</p>
                        <p><img src="https://cdn-icons-png.flaticon.com/128/1582/1582043.png"
                                style="width: 25px; margin-right: 0.5em;"> 날짜
                            : ${classdetail.classdate.substring(0,10)}</p>
                        <p><img src="https://cdn-icons-png.flaticon.com/128/2402/2402478.png"
                                style="width: 25px; margin-right: 0.5em;"> 정원 : ${classdetail.personal} 명</p>

                    </div>
                    <div class="class-step" id="classmap">
                        <div class="section-title">
                            <h5>위치</h5>
                        </div>
                        <p>${classdetail.address}</p>
                        <div id="map" style="width:100%; height:500px; margin-top: 20px;"></div>
                    </div>
                    <div class="comments-list-wrap">
                        <div class="comment-list">
                            <div class="single-comment-body">
                                <div class="anime__details__review">
                                    <div class="section-title">
                                        <h5>댓글</h5>
                                    </div>
                                    <c:forEach var="obj" items="${classComment}">
                                        <div class="anime__review__item">
                                            <div class="anime__review__item__pic">
                                                <a href="/apply/mypage?custid=${obj.custid}">
                                                    <c:choose>
                                                        <c:when test="${obj.profileimgname != null &&  obj.profileimgname !=''}">
                                                            <img src="/uimg/${obj.custid}_profileimg.jpg">
                                                        </c:when>
                                                        <c:otherwise>
                                                            <img src="/img/basic_profile.png">
                                                        </c:otherwise>
                                                    </c:choose>
                                                </a>
                                            </div>
                                            <div class="anime__review__item__text">
                                                <div class="form-horizontal"
                                                     style="display: flex; justify-content: space-between">
                                                    <div>
                                                        <c:choose>
                                                            <c:when test="${obj.nickname != null}">
                                                                <h6>${obj.nickname}</h6>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <h6>${obj.custid}</h6>
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </div>
                                                    <div>
                                                        <c:choose>
                                                            <c:when test="${logincust.custid == obj.custid}">
                                                                <form action="/cookingclass/commentDel" method="post">
                                                                    <input type="hidden" name="classcommentpin"
                                                                           value="${obj.classcommentpin}">
                                                                    <input type="hidden" name="classpin"
                                                                           value="${obj.classpin}">
                                                                    <div class="anime__details__btn">
                                                                        <button type="submit"
                                                                                formaction="/cookingclass/commentDel"
                                                                                style="color: #ffffff; background-color: #f28123; font-weight: 700; border-radius: 4px;
                                                                    border: unset; "> X
                                                                        </button>
                                                                    </div>
                                                                </form>
                                                            </c:when>
                                                        </c:choose>
                                                    </div>
                                                </div>
                                                <div>
                                                    <p>${obj.content}</p>
                                                </div>
                                            </div>
                                        </div>
                                    </c:forEach>
                                    <div class="anime__details__form">
                                        <div class="section-title">
                                            <h5>댓글달기</h5>
                                        </div>
                                        <form id="comment_form">
                                            <input type="hidden" name="classpin" id="classpin"
                                                   value="${classdetail.classpin}">
                                            <input type="hidden" name="custpin" id="custpin"
                                                   value="${logincust.custpin}">
                                            <input type="hidden" name="custid" id="custid" value="${logincust.custid}">
                                            <input type="hidden" name="nickname" id="nickname"
                                                   value="${logincust.nickname}">
                                            <textarea name="content" id="content" placeholder="Your Comment"></textarea>
                                            <button type="button" id="comment_btn">Register</button>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-4">
                <div class="sidebar-section">
                    <div class="archive-posts">
                        <div class="section-title">
                            <h4>호스트 소개</h4>
                        </div>
                        <a href="/apply/mypage?custid=${classcust.custid}">
                            <div style="display: flex; flex-direction: row; align-items: center">
                                <c:choose>
                                    <c:when test="${classcust.profileimgname != null &&  classcust.profileimgname !=''}">
                                        <div style="width: 60px; height: 60px; background-image: url('/uimg/${classcust.profileimgname}');
                                                background-size: cover; background-position: center; background-repeat: no-repeat;
                                                margin-right: 20px; margin-bottom: 20px;
                                                border-radius: 50%">
                                        </div>
                                    </c:when>
                                    <c:otherwise>
                                        <div style="width: 60px; height: 60px; background-image: url('static/img/basic_profile.png');
                                                background-size: cover; background-position: center; background-repeat: no-repeat;
                                                margin-right: 20px; margin-bottom: 20px;
                                                border-radius: 50%">
                                        </div>
                                    </c:otherwise>
                                </c:choose>
                                <c:choose>
                                    <c:when test="${classdetail.nickname != null}">
                                        <h6 style="color: black">${classdetail.nickname}</h6>
                                    </c:when>
                                    <c:otherwise>
                                        <h6 style="color: black">${classdetail.custid}</h6>
                                    </c:otherwise>
                                </c:choose>
                            </div>
                        </a>
                        <h5 style="margin-top: 5px; color: black">${classcust.introduction}</h5>
                    </div>
                    <form id="join_form" class="join_form" style="text-align: center;">
                        <div class="single-product-form" style="margin-bottom: 30px">
                            <input type="hidden" id="classpinJoin" name="classpinJoin" value="${classdetail.classpin}">
                            <input type="hidden" id="custpinJoin" name="custpinJoin" value="${logincust.custpin}">
                            <input type="hidden" id="amount" name="amount" value="${classdetail.amount}">
                            <input type="hidden" id="joinstatus" name="joinstatus" value="1">
                            <input type="hidden" id="paymentstatus" name="paymentstatus" value="1">
                            <c:choose>
                                <c:when test="${logincust != null}">
                                    <c:choose>
                                        <c:when test="${classdetail.logincustjoin == '0'}">
                                            <button class="like-btn cart-btn"
                                                    id="${logincust.custpin}${classdetail.classpin}"
                                                    value="${classdetail.logincustjoin}"
                                                    type="button"
                                                    style="border: none; background-color: #b7b7b7"
                                                    onclick="requestPay()">
                                                <span class="icon_check_alt2"></span> 클래스 신청
                                            </button>
                                        </c:when>
                                        <c:otherwise>
                                            <button class="like-btn cart-btn"
                                                    id="${logincust.custpin}${classdetail.classpin}"
                                                    value="${classdetail.logincustjoin}"
                                                    type="button"
                                                    style="border: none">
                                                <span class="icon_check_alt2"></span> 신청 완료
                                            </button>
                                        </c:otherwise>
                                    </c:choose>
                                </c:when>
                                <c:otherwise>
                                    <a class="cart-btn" href="/login">
                                        <span class="icon_check_alt2"></span> 클래스 신청</a>
                                </c:otherwise>
                            </c:choose>
                        </div>
                    </form>
                    <div class="Calendarsection">
                        <table class="Calendar">
                            <thead>
                            <tr>
                                <td onClick="prevCalendar();" style="cursor:pointer;">&#60;</td>
                                <td colspan="5">
                                    <span id="calYear"></span>년
                                    <span id="calMonth"></span>월
                                </td>
                                <td onClick="nextCalendar();" style="cursor:pointer;">&#62;</td>
                            </tr>
                            <tr>
                                <td>일</td>
                                <td>월</td>
                                <td>화</td>
                                <td>수</td>
                                <td>목</td>
                                <td>금</td>
                                <td>토</td>
                            </tr>
                            </thead>
                            <tbody>
                            </tbody>
                        </table>
                    </div>
                    <div class="ddaysection">
                        <p id="dday"></p>
                        <p id="message" style="font-size: 15px; font-weight: bold;"></p>
                    </div>
                    <div class="section-title" style="margin-bottom: 10px">
                        <h4>공유하기</h4>
                    </div>
                    <ul class="product-share">
                        <li><a href="#" style="font-size: 30px"><span class="social_facebook_circle"></span></a></li>
                        <li><a href="#" style="font-size: 30px"><span class="social_twitter_circle"></span></a></li>
                        <li><a href="#" style="font-size: 30px"><span class="social_googleplus_circle"></span></a></li>
                        <li><a href="#" style="font-size: 30px"><span class="social_instagram_circle"></span></a></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- end single article section -->
</body>