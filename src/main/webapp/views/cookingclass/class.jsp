<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<head>
    <script>
        let class_search = {
            init: function () {
                $('#search_btn').click(function () {
                    $('#category_form').attr({
                        method: 'get',
                        action: '/cookingclass/class'
                    });
                    $('#category_form').submit();
                });

                $('#location_li li').click(function () {
                    $('#location').val($(this).data('filter'));
                    // 폼을 서버로 제출
                    $('#category_form').attr({
                        method: 'get',
                        action: '/cookingclass/class'
                    });
                    $('#category_form').submit();

                });
                $('#type_li li').click(function () {
                    $('#type').val($(this).data('filter'));
                    $('#category_form').attr({
                        method: 'get',
                        action: '/cookingclass/class'
                    });
                    $('#category_form').submit();
                });

                $('#datepin_btn').click(function () {
                    $('.btn-group .btn').removeClass('active');
                    $(this).addClass('active');
                    if (${sortinfo.sort != 1}) {
                        $('#sort').val(1);
                    }
                    if (${sortinfo.sort == 1}) {
                        $('#sort').val(2);
                    }
                    $('#category_form').attr({
                        method: 'get',
                        action: '/cookingclass/class'
                    });
                    $('#category_form').submit();
                });

                $('#amount_btn').click(function () {
                    $('.btn-group .btn').removeClass('active');
                    $(this).addClass('active');
                    if (${sortinfo.sort != 3}) {
                        $('#sort').val(3);
                    }
                    if (${sortinfo.sort == 3}) {
                        $('#sort').val(4);
                    }
                    $('#category_form').attr({
                        method: 'get',
                        action: '/cookingclass/class'
                    });
                    $('#category_form').submit();
                });
            }
        };
        $(function () {
            $("#class").addClass("navActive");
            class_search.init();
        })

        // D-day
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
            var classDates = document.querySelectorAll('[id^="classImage"]');
            var classdatesArray = [
                <c:forEach var="obj" items="${clist.getList()}">
                {
                    classdate: "${obj.classdate.substring(0,10)}",
                    classpin: ${obj.classpin},
                    personal: parseInt("${obj.personal}"),
                    joincount: parseInt("${obj.joincount}")
                },
                </c:forEach>
            ];

            classDates.forEach(function (classDate, index) {
                var classImage = classDate;
                var imageCover = classDate.querySelector('.image-cover'); // 회색 불투명 커버 요소 선택
                var classDateStr = classDate.style.backgroundImage; // 배경 이미지 URL 추출
                var classdate = classdatesArray[index].classdate;
                var classpin = classdatesArray[index].classpin;
                var dday = calculateDday(classdate);
                var personal = classdatesArray[index].personal;
                var joincount = classdatesArray[index].joincount;

                if (dday === "종료") {
                    imageCover.style.display = 'block';
                    imageCover.style.position = 'relative';

                    var imageElement = document.createElement('img');
                    imageElement.src = '/uimg/expired.png';
                    imageElement.style.position = 'absolute';
                    imageElement.style.top = '50%';
                    imageElement.style.left = '50%';
                    imageElement.style.transform = 'translate(-50%, -50%)';
                    imageElement.style.width = '130px';
                    imageCover.appendChild(imageElement);

                    var tagid;
                    // 버튼 스타일 변경
                    if (${logincust != null}) {
                        tagid = ${logincust.custpin}+''+classpin;
                    } else {
                        tagid = "cart-btn_"+classpin;
                    }
                    var buttonElement = document.getElementById(tagid);
                    buttonElement.style.backgroundColor = '#b7b7b7';
                    buttonElement.innerHTML = '<span class="icon_check_alt2"></span> 클래스 종료';

                } else if (personal === joincount) {
                    imageCover.style.display = 'block';
                    imageCover.style.position = 'relative';

                    var imageElement = document.createElement('img');
                    imageElement.src = '/uimg/soldout.png';
                    imageElement.style.position = 'absolute';
                    imageElement.style.top = '50%';
                    imageElement.style.left = '50%';
                    imageElement.style.transform = 'translate(-50%, -50%)';
                    imageElement.style.width = '130px';
                    imageCover.appendChild(imageElement);
                } else {
                    imageCover.style.display = 'none';
                }
            });
        };
    </script>
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
<section class="normal-breadcrumb set-bg" data-setbg="/uimg/classmain.gif"></section>
<!-- Normal Breadcrumb End -->

<!-- cooking class start -->
<div class="product-section mt-50 mb-150">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <form id="category_form">
                    <div class="product-filters">
                        <!-- 지역별 검색 -->
                        <ul id="location_li" name="location_li">
                            <li class="${sortinfo.location == null || sortinfo.location eq '' ? 'active' : ''}"
                                data-filter="">지역별
                            </li>
                            <li class="${sortinfo.location eq '서울' ? 'active' : ''}" data-filter="서울">서울</li>
                            <li class="${sortinfo.location eq '인천' ? 'active' : ''}" data-filter="인천">인천</li>
                            <li class="${sortinfo.location eq '경기' ? 'active' : ''}" data-filter="경기">경기</li>
                            <li class="${sortinfo.location eq '대전' ? 'active' : ''}" data-filter="대전">대전</li>
                            <li class="${sortinfo.location eq '충청' ? 'active' : ''}" data-filter="충청">충청</li>
                            <li class="${sortinfo.location eq '부산' ? 'active' : ''}" data-filter="부산">부산</li>
                            <li class="${sortinfo.location eq '대구' ? 'active' : ''}" data-filter="대구">대구</li>
                            <li class="${sortinfo.location eq '울산' ? 'active' : ''}" data-filter="울산">울산</li>
                            <li class="${sortinfo.location eq '경상' ? 'active' : ''}" data-filter="경상">경상</li>
                            <li class="${sortinfo.location eq '광주' ? 'active' : ''}" data-filter="광주">광주</li>
                            <li class="${sortinfo.location eq '전라' ? 'active' : ''}" data-filter="전라">전라</li>
                            <li class="${sortinfo.location eq '강원' ? 'active' : ''}" data-filter="강원">강원</li>
                            <li class="${sortinfo.location eq '기타' ? 'active' : ''}" data-filter="제주">제주</li>
                        </ul>
                        <!-- 종류별 검색 -->
                        <ul id="type_li" name="type_li">
                            <li class="${sortinfo.type == null || sortinfo.type eq ''? 'active' : ''}" data-filter="">
                                종류별
                            </li>
                            <li class="${sortinfo.type eq '한식' ? 'active' : ''}" data-filter="한식">한식</li>
                            <li class="${sortinfo.type eq '양식' ? 'active' : ''}" data-filter="양식">양식</li>
                            <li class="${sortinfo.type eq '중식' ? 'active' : ''}" data-filter="중식">중식</li>
                            <li class="${sortinfo.type eq '일식' ? 'active' : ''}" data-filter="일식">일식</li>
                            <li class="${sortinfo.type eq '동남아식' ? 'active' : ''}" data-filter="동남아식">동남아식</li>
                            <li class="${sortinfo.type eq '디저트' ? 'active' : ''}" data-filter="디저트">디저트</li>
                            <li class="${sortinfo.type eq '기타' ? 'active' : ''}" data-filter="기타">기타</li>
                        </ul>
                    </div>
                    <div style="display: flex; justify-content: space-between; margin-bottom: 10px;">
                        <div style="display: flex">
                            <input class="form-control me-2" type="text" placeholder="Class Title"
                                   aria-label="Search"
                                   name="classtitle" id="classtitle" value="${sortinfo.classtitle}"
                                   style="width: 150px; border: none;">&nbsp;
                            <button id="search_btn" class="btn" type="button"
                                    style="background-color: #F28123; color: #fff; height: 31.5px; border: none;">
                                <span class="icon_search"></span>
                            </button>
                        </div>
                        <div style="display: flex">
                            <button id="datepin_btn" class="btn" type="button"
                                    style="background-color: #F28123; color: #fff; height: 31.5px; border: none;">날짜순
                            </button>&nbsp;
                            <button id="amount_btn" class="btn" type="button"
                                    style="background-color: #F28123; color: #fff; height: 31.5px; border: none;">가격순
                            </button>
                        </div>

                    </div>
                    <input type="hidden" id="location" name="location" value="${sortinfo.location}">
                    <input type="hidden" id="type" name="type" value="${sortinfo.type}">
                    <input type="hidden" id="sort" name="sort" value="${sortinfo.sort}">
                </form>
            </div>
        </div>

        <!-- cooking class list start -->
        <div class="row product-lists">
            <c:forEach var="obj" items="${clist.getList()}">
                <div class="col-lg-4 col-md-6 text-center strawberry">
                    <div class="single-product-item" style="padding-bottom: 20px">
                        <div class="product-image" style="margin-bottom: 10px">
                            <a href="/cookingclass/detail?classpin=${obj.classpin}">
                                <div id="classImage${obj.classpin}" class="class-image"
                                     style="width: 100%; height: 250px; background-image: url('/uimg/${obj.thumbnailimg}');
                                             background-size: cover; background-position: center; background-repeat: no-repeat;
                                             position: relative;">
                                    <!-- 회색 불투명 커버 -->
                                    <div class="image-cover" style="position: relative; top: 0; left: 0; width: 100%; height: 100%;
                                    background-color: rgba(0, 0, 0, 0.5); display: none;"></div>
                                </div>
                            </a>
                        </div>
                        <h3><a href="/cookingclass/detail?classpin=${obj.classpin}">${obj.classtitle}</a></h3>
                        <h5 style="margin-bottom: 10px">${obj.cooking}</h5>
                        <h5 style="color: black; font-size: 15px; margin-bottom: 10px">${obj.location}
                            / ${obj.classdate.substring(0,10)}</h5>
                        <h5 style="color: black; font-size: 15px; margin-bottom: 10px">${obj.joincount}명
                            / ${obj.personal}명</h5>
                        <h5 style="color: black; font-weight: bold" class="product-price">
                            <fmt:formatNumber value="${obj.amount}" type="currency"
                                              currencyCode="KRW" pattern="###,###원"/></h5>
                        <br>
                        <c:choose>
                            <c:when test="${logincust != null}">
                                <c:choose>
                                    <c:when test="${obj.personal == obj.joincount}">
                                        <button class="like-btn cart-btn"
                                                id="${obj.classpin}"
                                                value="${obj.joincount}"
                                                type="button"
                                                style="border: none; background-color: #b7b7b7"
                                                data-toggle="modal" data-target="#target${obj.classpin}">
                                            <span class="icon_check_alt2"></span> 모집 마감
                                        </button>
                                    </c:when>
                                    <c:when test="${obj.logincustjoin == '0'}">
                                        <button class="like-btn cart-btn"
                                                id="${logincust.custpin}${obj.classpin}"
                                                value="${obj.logincustjoin}"
                                                type="button"
                                                style="border: none; background-color: #b7b7b7"
                                                data-toggle="modal" data-target="#target${obj.classpin}">
                                            <span class="icon_check_alt2"></span> 클래스 신청
                                        </button>
                                    </c:when>
                                    <c:otherwise>
                                        <button class="like-btn cart-btn"
                                                id="${logincust.custpin}${obj.classpin}"
                                                value="${obj.logincustjoin}"
                                                type="button"
                                                style="border: none">
                                            <span class="icon_check_alt2"></span> 신청 완료
                                        </button>
                                    </c:otherwise>
                                </c:choose>
                            </c:when>
                            <c:otherwise>
                                <c:choose>
                                    <c:when test="${obj.personal == obj.joincount}">
                                        <a class="cart-btn" id="cart-btn_${obj.classpin}" href="/login"
                                        style="border: none; background-color: #b7b7b7">
                                            <span class="icon_check_alt2"></span> 모집 마감
                                        </a>
                                    </c:when>
                                    <c:otherwise>
                                        <a class="cart-btn" id="cart-btn_${obj.classpin}" href="/login">
                                            <span class="icon_check_alt2"></span> 클래스 신청
                                        </a>
                                    </c:otherwise>
                                </c:choose>
                            </c:otherwise>
                        </c:choose>
                    </div>
                    <div id="target${obj.classpin}" class="modal fade" role="dialog">
                        <div class="modal-dialog">
                            <!-- Modal content-->
                            <div class="modal-content" style="border-radius: 20px; border: none">
                                <div class="modal-header">
                                    <h5 style="font-weight: bold"><a
                                            href="/cookingclass/detail?classpin=${obj.classpin}">${obj.classtitle}</a>
                                    </h5>
                                </div>
                                <div class="modal-body" style="display: flex">
                                    <div style="width: 50%; height: 250px; background-image: url('/uimg/${obj.thumbnailimg}');
                                            background-size: cover; background-position: center; background-repeat: no-repeat;
                                            border: solid 2px #F28123; border-radius: 10%">
                                    </div>
                                    <div style="display: flex; flex-direction: column; align-self: center; margin: auto">
                                        <h3 style="margin-bottom: 10px;">${obj.cooking}</h3>
                                        <h5 style="color: black; font-size: 15px;text-align: left;"><span
                                                class="icon_check"></span>
                                            위치: ${obj.location}</h5>
                                        <h5 style="color: black; font-size: 15px;text-align: left;"><span
                                                class="icon_check"></span>
                                            일시: ${obj.classdate.substring(0,10)}</h5>
                                        <h5 style="color: black; font-size: 15px;text-align: left;"><span
                                                class="icon_check"></span>
                                            시간: ${obj.classtime}분</h5>
                                        <h5 style="color: black; font-size: 15px;text-align: left; margin-bottom: 10px"><span
                                                class="icon_check"></span>
                                            정원: ${obj.personal}</h5>
                                        <h5 style="color: black; font-weight: bold;text-align: left;"
                                            class="product-price">비용:
                                            <fmt:formatNumber value="${obj.amount}" type="currency"
                                                              currencyCode="KRW" pattern="###,###원"/></h5>
                                        <br>
                                    </div>
                                </div>
                                <div class="modal-footer">
                                    <a href="/cookingclass/detail?classpin=${obj.classpin}" class="btn btn-success"
                                       role="button">신청</a>
                                    <a href="#" class="btn" role="button" data-dismiss="modal"
                                       style="background-color: #b7b7b7; color: #FFFFFF">취소</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
        <!-- cooking class list end -->
        <!-- pagination start -->
        <div class="row">
            <div class="col-lg-12 text-center">
                <div class="pagination-wrap">
                    <ul>
                        <c:choose>
                            <c:when test="${clist.getPrePage() != 0}">
                                <li class="pagination-wrap">
                                    <a class="pagination-wrap"
                                       href="/cookingclass/class?pageNo=${clist.getPrePage()}&classtitle=${sortinfo.classtitle}&location=${sortinfo.location}&type=${sortinfo.type}&sort=${sortinfo.sort}"
                                       aria-label="Previous">
                                        <span>Prev</span>
                                    </a>
                                </li>
                            </c:when>
                            <c:otherwise>
                                <li class="pagination-wrap disabled">
                                    <a class="pagination-wrap" href="#" aria-label="Previous">
                                        <span>Prev</span>
                                    </a>
                                </li>
                            </c:otherwise>
                        </c:choose>
                        <c:forEach begin="${clist.getNavigateFirstPage() }" end="${clist.getNavigateLastPage() }"
                                   var="page">
                            <c:choose>
                                <c:when test="${clist.getPageNum() == page}">
                                    <li class="pagination-wrap active">
                                        <a class="pagination-wrap active" style="color:#FFFFFF;"
                                           href="/cookingclass/class?pageNo=${page}&classtitle=${sortinfo.classtitle}&location=${sortinfo.location}&type=${sortinfo.type}&sort=${sortinfo.sort}">${page }</a>
                                    </li>
                                </c:when>
                                <c:otherwise>
                                    <li>
                                        <a class="pagination-wrap"
                                           href="/cookingclass/class?pageNo=${page}&classtitle=${sortinfo.classtitle}&location=${sortinfo.location}&type=${sortinfo.type}&sort=${sortinfo.sort}">${page }</a>
                                    </li>
                                </c:otherwise>
                            </c:choose>
                        </c:forEach>
                        <c:choose>
                            <c:when test="${clist.getNextPage() != 0}">
                                <li class="pagination-wrap">
                                    <a class="pagination-wrap"
                                       href="/cookingclass/class?pageNo=${clist.getNextPage()}&classtitle=${sortinfo.classtitle}&location=${sortinfo.location}&type=${sortinfo.type}&sort=${sortinfo.sort}"
                                       aria-label="Next">
                                        <span>Next</span>
                                    </a>
                                </li>
                            </c:when>
                            <c:otherwise>
                                <li class="pagination-wrap disabled">
                                    <a class="pagination-wrap" href="#" aria-label="Next">
                                        <span>Next</span>
                                    </a>
                                </li>
                            </c:otherwise>
                        </c:choose>
                    </ul>

                </div>
            </div>
            <!-- pagination end -->
        </div>
    </div>
</div>
<!-- cooking class end -->
</body>