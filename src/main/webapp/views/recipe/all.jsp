<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>

<script>
    let recipe_search = {
        sleep: function (ms) {
            return new Promise((resolve) => setTimeout(resolve, ms));
        },

        init: function () {
            $('#search_btn').click(function () {
                $('#category_form').attr({
                    method: 'get',
                    action: '/recipe/all'
                });
                $('#category_form').submit();
            });

            $('#ingredients1_li li').click(function () {
                $('#ingredients1').val($(this).data('filter'));
                $('#category_form').attr({
                    method: 'get',
                    action: '/recipe/all'
                });
                $('#category_form').submit();
            });

            $('#type_li li').click(function () {
                $('#type').val($(this).data('filter'));
                $('#category_form').attr({
                    method: 'get',
                    action: '/recipe/all'
                });
                $('#category_form').submit();
            });

            $('#recipelevel_li li').click(function () {
                $('#recipelevel').val($(this).data('filter'));
                $('#category_form').attr({
                    method: 'get',
                    action: '/recipe/all'
                });
                $('#category_form').submit();
            });

            $('#time_btn').click(function () {
                $('.btn-group .btn').removeClass('active');
                $(this).addClass('active');
                if (${recipesortinfo.sort != 1}) {
                    $('#sort').val(1);
                }
                if (${recipesortinfo.sort == 1}) {
                    $('#sort').val(2);
                }
                $('#category_form').attr({
                    method: 'get',
                    action: '/recipe/all'
                });
                $('#category_form').submit();
            });

            $('#views_btn').click(function () {
                $('.btn-group .btn').removeClass('active');
                $(this).addClass('active');
                if (${recipesortinfo.sort != 3}) {
                    $('#sort').val(3);
                }
                if (${recipesortinfo.sort == 3}) {
                    $('#sort').val(4);
                }
                $('#category_form').attr({
                    method: 'get',
                    action: '/recipe/all'
                });
                $('#category_form').submit();
            });

            $('.like-btn').click(function () {
                var thisbtn = $(this);
                var thisbtnid = $(this).attr('id');
                var thisval = thisbtn.val();
                var custpin = parseInt(thisbtnid.substring(0, 5));
                var recipepin = parseInt(thisbtnid.substring(5, 10));
                console.log(typeof custpin);
                console.log(typeof recipepin);
                console.log(thisbtnid.substring(0, 5));
                console.log(thisbtnid.substring(5, 10));
                if (thisval == 0) {
                    $.ajax({
                        type: 'post',
                        url: '/likeImpl',
                        data: {
                            custpin: custpin,
                            recipepin: recipepin
                        },
                        success: function (response) {
                            // 서버 응답에 대한 처리
                            console.log(response);
                            thisbtn.css('background-color', '#f28123');
                            thisbtn.val(1);
                            dblclickGood(recipepin);
                        },
                        error: function (xhr, status, error) {
                            // 에러 처리
                            console.log(error);
                        }
                    });
                }
                if (thisval == 1) {
                    $.ajax({
                        type: 'post',
                        url: '/likeDel',
                        data: {
                            custpin: custpin,
                            recipepin: recipepin
                        },
                        success: function (response) {
                            // 서버 응답에 대한 처리
                            console.log(response);
                            thisbtn.css('background-color', '#b7b7b7');
                            thisbtn.val(0);
                        },
                        error: function (xhr, status, error) {
                            // 에러 처리
                            console.log(error);
                        }
                    });
                }
            });

            async function dblclickGood(recipepin) {
                let dblclickHeart = 0;
                var heartzoneid = recipepin + '_heartzone';
                if (true) {
                    dblclickHeart++;
                    const heartImg = document.createElement("img");
                    heartImg.setAttribute("src", "/img/likeheart.png");
                    heartImg.style.width = '5px';
                    heartImg.style.userSelect = "none";
                    document.getElementById(heartzoneid).appendChild(heartImg);

                    for (let i = 0; i < 40; i++) {
                        let htsize = parseInt(heartImg.style.width) + 3;
                        heartImg.style.width = htsize + "px";
                        await recipe_search.sleep(3);
                    }

                    await recipe_search.sleep(200);

                    for (let i = 0; i < 7; i++) {
                        let htsize = parseInt(heartImg.style.width) - 3;
                        heartImg.style.width = htsize + "px";
                        await recipe_search.sleep(10);
                    }

                    await recipe_search.sleep(200);

                    for (let i = 0; i < 3; i++) {
                        let htsize = parseInt(heartImg.style.width) + 3;
                        heartImg.style.width = htsize + "px";
                        await recipe_search.sleep(10);
                    }

                    await recipe_search.sleep(700);

                    for (let i = 0; i < 33; i++) {
                        let htsize = parseInt(heartImg.style.width) - 3;
                        heartImg.style.width = htsize + "px";
                        await recipe_search.sleep(3);
                    }

                    await recipe_search.sleep(80);
                    document.getElementById(heartzoneid).removeChild(heartImg);
                    dblclickHeart--;
                }
            }

        }
    };
    $(function () {

        $("#recipe").addClass("navActive");
        recipe_search.init();

    });
</script>

<head>
    <!-- google font -->
    <%--    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,700" rel="stylesheet">--%>
    <%--    <link href="https://fonts.googleapis.com/css?family=Poppins:400,700&display=swap" rel="stylesheet">--%>
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
<section class="normal-breadcrumb set-bg" data-setbg="/uimg/recipemain.gif">
    <div class="container">
        <%--        <div class="row">--%>
        <%--            <div class="col-lg-12 text-center">--%>
        <%--                <div class="normal__breadcrumb__text">--%>
        <%--                    <h2>RECIPES ALL OVER THE WORLD</h2>--%>
        <%--                    <p>Welcome to KOLLY'S RECIPES</p>--%>
        <%--                </div>--%>
        <%--            </div>--%>
        <%--        </div>--%>
    </div>
</section>
<!-- Normal Breadcrumb End -->

<div class="product-section mt-50 mb-150">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <form id="category_form">
                    <div class="product-filters">
                        <!-- 지역별 검색 -->
                        <ul id="ingredients1_li" name="ingredients1_li">
                            <li class="${recipesortinfo.ingredients1 == null || recipesortinfo.ingredients1 eq '' ? 'active' : ''}"
                                data-filter="" style="font-size: 13px;">
                                재료별
                            </li>
                            <li class="${recipesortinfo.ingredients1 eq '소고기' ? 'active' : ''}" data-filter="소고기"
                                style="font-size: 13px; padding-left:7px ; padding-right:7px">
                                <img src="https://cdn-icons-png.flaticon.com/128/2194/2194805.png"
                                     style="width: 23px; margin-right:3px">소고기
                            </li>
                            <li class="${recipesortinfo.ingredients1 eq '돼지고기' ? 'active' : ''}" data-filter="돼지고기"
                                style="font-size: 13px; padding-left:7px ; padding-right:7px">
                                <img src="https://cdn-icons-png.flaticon.com/128/2194/2194807.png"
                                     style="width: 23px; margin-right:3px">돼지고기
                            </li>
                            <li class="${recipesortinfo.ingredients1 eq '닭고기' ? 'active' : ''}" data-filter="닭고기"
                                style="font-size: 13px; padding-left:7px ; padding-right:7px"><img
                                    src="https://cdn-icons-png.flaticon.com/128/2751/2751830.png"
                                    style="width: 23px; margin-right:3px">닭고기
                            </li>
                            <li class="${recipesortinfo.ingredients1 eq '육류' ? 'active' : ''}" data-filter="육류"
                                style="font-size: 13px; padding-left:7px ; padding-right:7px"><img
                                    src="https://cdn-icons-png.flaticon.com/128/9441/9441405.png"
                                    style="width: 23px; margin-right:3px">육류
                            </li>
                            <li class="${recipesortinfo.ingredients1 eq '채소류' ? 'active' : ''}" data-filter="채소류"
                                style="font-size: 13px; padding-left:7px ; padding-right:7px"><img
                                    src="https://cdn-icons-png.flaticon.com/128/6135/6135054.png"
                                    style="width: 23px; margin-right:3px">채소
                            </li>
                            <li class="${recipesortinfo.ingredients1 eq '생선' ? 'active' : ''}" data-filter="생선"
                                style="font-size: 13px; padding-left:7px ; padding-right:7px"><img
                                    src="https://cdn-icons-png.flaticon.com/128/6192/6192103.png"
                                    style="width: 23px; margin-right:3px">생선
                            </li>
                            <li class="${recipesortinfo.ingredients1 eq '오징어' ? 'active' : ''}" data-filter="오징어"
                                style="font-size: 13px; padding-left:7px ; padding-right:7px"><img
                                    src="https://cdn-icons-png.flaticon.com/128/7590/7590496.png"
                                    style="width: 23px; margin-right:3px">오징어
                            </li>
                            <li class="${recipesortinfo.ingredients1 eq '해물류' ? 'active' : ''}" data-filter="해물류"
                                style="font-size: 13px; padding-left:7px ; padding-right:7px"><img
                                    src="https://cdn-icons-png.flaticon.com/128/4531/4531868.png"
                                    style="width: 23px; margin-right:3px">해물
                            </li>
                            <li class="${recipesortinfo.ingredients1 eq '달걀' ? 'active' : ''}" data-filter="달걀"
                                style="font-size: 13px; padding-left:7px ; padding-right:7px"><img
                                    src="https://cdn-icons-png.flaticon.com/128/5318/5318915.png"
                                    style="width: 23px; margin-right:3px">달걀
                            </li>
                            <li class="${recipesortinfo.ingredients1 eq '쌀' ? 'active' : ''}" data-filter="쌀"
                                style="font-size: 13px; padding-left:7px ; padding-right:7px"><img
                                    src="https://cdn-icons-png.flaticon.com/128/898/898133.png"
                                    style="width: 23px; margin-right:3px">쌀
                            </li>
                            <li class="${recipesortinfo.ingredients1 eq '밀가루' ? 'active' : ''}" data-filter="밀가루"
                                style="font-size: 13px; padding-left:7px ; padding-right:7px"><img
                                    src="https://cdn-icons-png.flaticon.com/128/5029/5029282.png"
                                    style="width: 23px; margin-right:3px">밀가루
                            </li>
                            <li class="${recipesortinfo.ingredients1 eq '기타' ? 'active' : ''}" data-filter="기타"
                                style="font-size: 13px; padding-left:7px ; padding-right:7px"><img
                                    src="https://cdn-icons-png.flaticon.com/128/1488/1488266.png"
                                    style="width: 23px; margin-right:3px">기타
                            </li>
                        </ul>
                        <!-- 종류별 검색 -->
                        <ul id="type_li" name="type_li">
                            <li class="${recipesortinfo.type == null || recipesortinfo.type eq ''? 'active' : ''}"
                                data-filter="" style="font-size: 13px;">종류별
                            </li>
                            <li class="${recipesortinfo.type eq '한식' ? 'active' : ''}" data-filter="한식"
                                style="font-size: 13px; padding-left:7px ; padding-right:7px"><img
                                    src="https://cdn-icons-png.flaticon.com/128/8740/8740490.png"
                                    style="width: 23px; margin-right:3px">한식
                            </li>
                            <li class="${recipesortinfo.type eq '양식' ? 'active' : ''}" data-filter="양식"
                                style="font-size: 13px; padding-left:7px ; padding-right:7px"><img
                                    src="https://cdn-icons-png.flaticon.com/128/4825/4825193.png"
                                    style="width: 23px; margin-right:3px">양식
                            </li>
                            <li class="${recipesortinfo.type eq '중식' ? 'active' : ''}" data-filter="중식"
                                style="font-size: 13px; padding-left:7px ; padding-right:7px"><img
                                    src="https://cdn-icons-png.flaticon.com/128/2548/2548242.png"
                                    style="width: 23px; margin-right:3px">중식
                            </li>
                            <li class="${recipesortinfo.type eq '일식' ? 'active' : ''}" data-filter="일식"
                                style="font-size: 13px; padding-left:7px ; padding-right:7px"><img
                                    src="https://cdn-icons-png.flaticon.com/128/5391/5391834.png"
                                    style="width: 23px; margin-right:3px">일식
                            </li>
                            <li class="${recipesortinfo.type eq '동남아식' ? 'active' : ''}" data-filter="동남아식"
                                style="font-size: 13px; padding-left:7px ; padding-right:7px"><img
                                    src="https://cdn-icons-png.flaticon.com/128/2080/2080472.png"
                                    style="width: 23px; margin-right:3px">동남아식
                            </li>
                            <li class="${recipesortinfo.type eq '디저트' ? 'active' : ''}" data-filter="디저트"
                                style="font-size: 13px; padding-left:7px ; padding-right:7px"><img
                                    src="https://cdn-icons-png.flaticon.com/128/3259/3259016.png"
                                    style="width: 23px; margin-right:3px">디저트
                            </li>
                            <li class="${recipesortinfo.type eq '기타' ? 'active' : ''}" data-filter="기타"
                                style="font-size: 13px; padding-left:7px ; padding-right:7px"><img
                                    src="https://cdn-icons-png.flaticon.com/128/1488/1488266.png"
                                    style="width: 23px; margin-right:3px">기타
                            </li>
                        </ul>
                        <ul id="recipelevel_li" name="recipelevel_li">
                            <li class="${recipesortinfo.recipelevel == null || recipesortinfo.recipelevel eq ''? 'active' : ''}"
                                data-filter="" style="font-size: 13px;">난이도별
                            </li>
                            <li class="${recipesortinfo.recipelevel eq '1' ? 'active' : ''}" data-filter="1"
                                style="font-size: 13px; padding-left:7px ; padding-right:7px"><img
                                    src="https://cdn-icons-png.flaticon.com/128/80/80518.png"
                                    style="width: 23px; margin-right:3px">눈감고도
                            </li>
                            <li class="${recipesortinfo.recipelevel eq '2' ? 'active' : ''}" data-filter="2"
                                style="font-size: 13px; padding-left:7px ; padding-right:7px"><img
                                    src="https://cdn-icons-png.flaticon.com/128/5222/5222485.png"
                                    style="width: 23px; margin-right:3px">쉬움
                            </li>
                            <li class="${recipesortinfo.recipelevel eq '3' ? 'active' : ''}" data-filter="3"
                                style="font-size: 13px; padding-left:7px ; padding-right:7px"><img
                                    src="https://cdn-icons-png.flaticon.com/128/1791/1791342.png"
                                    style="width: 23px; margin-right:3px">할만함
                            </li>
                            <li class="${recipesortinfo.recipelevel eq '4' ? 'active' : ''}" data-filter="4"
                                style="font-size: 13px; padding-left:7px ; padding-right:7px"><img
                                    src="https://cdn-icons-png.flaticon.com/128/982/982997.png"
                                    style="width: 23px; margin-right:3px">조금어려움
                            </li>
                            <li class="${recipesortinfo.recipelevel eq '5' ? 'active' : ''}" data-filter="5"
                                style="font-size: 13px; padding-left:7px ; padding-right:7px"><img
                                    src="https://cdn-icons-png.flaticon.com/128/356/356721.png"
                                    style="width: 23px; margin-right:3px">어려움
                            </li>
                            <li class="${recipesortinfo.recipelevel eq '6' ? 'active' : ''}" data-filter="6"
                                style="font-size: 13px; padding-left:7px ; padding-right:7px"><img
                                    src="https://cdn-icons-png.flaticon.com/128/2461/2461938.png"
                                    style="width: 23px; margin-right:3px">엄청어려움
                            </li>
                            <li class="${recipesortinfo.recipelevel eq '7' ? 'active' : ''}" data-filter="7"
                                style="font-size: 13px; padding-left:7px ; padding-right:7px"><img
                                    src="/img/basic_profile.png"
                                    style="width: 23px; margin-right:3px">초고수
                            </li>
                        </ul>
                    </div>
                    <div style="display: flex; justify-content: space-between">
                        <div style="display: flex;">
                            <input class="form-control me-2" type="text" placeholder="Recipe Title"
                                   aria-label="Search"
                                   name="recipetitle" id="recipetitle" value="${recipesortinfo.recipetitle}"
                                   style="width: 150px; border: none;">&nbsp;
                            <button id="search_btn" class="btn" type="button"
                                    style="background-color: #F28123; color: #fff; height: 31.5px; border: none;"><span
                                    class="icon_search"></span>
                            </button>
                        </div>

                        <div style="display: flex;">
                            <button id="time_btn" class="btn" type="button"
                                    style="background-color: #F28123; color: #fff; height: 31.5px; border: none;">시간순
                            </button>&nbsp;
                            <button id="views_btn" class="btn" type="button"
                                    style="background-color: #F28123; color: #fff; height: 31.5px; border: none;">조회순
                            </button>
                        </div>
                    </div>
                    <input type="hidden" id="ingredients1" name="ingredients1" value="${recipesortinfo.ingredients1}">
                    <input type="hidden" id="type" name="type" value="${recipesortinfo.type}">
                    <input type="hidden" id="recipelevel" name="recipelevel" value="${recipesortinfo.recipelevel}">
                    <input type="hidden" id="sort" name="sort" value="${recipesortinfo.sort}">
                </form>
            </div>
        </div>

        <!-- cooking class list start -->
        <div class="row product-lists">
            <c:forEach var="obj" items="${rlist.getList()}">
                <div class="col-lg-4 col-md-6 text-center strawberry">
                    <div class="single-product-item" style="padding-bottom: 20px">
                        <div class="product-image" style="margin-bottom: 10px">
                            <a href="/recipe/detail?recipepin=${obj.recipepin}">
                                <div style="width: 100%; height: 250px; background-image: url('/uimg/${obj.thumbnailimg}');
                                        background-size: cover; background-position: center; background-repeat: no-repeat;
                                        display: flex; flex-direction: column">
                                    <div class="view"
                                         style="width: 25%; margin: 5px; padding-right: 5px; padding-left: 5px; height: 22px; background-color: black; border-radius: 5px; opacity: 0.7; color: #FFFFFF">
                                        <i class="fa fa-eye"></i> ${obj.views}
                                    </div>
                                    <div id="${obj.recipepin}_heartzone"
                                         style="display: flex; justify-content: center; align-content: center; margin: auto">
                                    </div>
                                </div>
                            </a>
                        </div>
                        <h3><a href="/recipe/detail?recipepin=${obj.recipepin}">${obj.recipetitle}</a></h3>
                        <h5 style="margin-bottom: 10px">${obj.cooking}</h5>
                        <h5 style="color: black; font-size: 15px; margin-bottom: 10px">${obj.type}
                            / ${obj.situation}</h5>
                        <h5 style="color: black; font-weight: bold; font-size: 15px; margin-bottom: 10px">${obj.time}분
                            / Level ${obj.recipelevel}</h5>
                        <c:choose>
                            <c:when test="${logincust != null}">
                                <c:choose>
                                    <c:when test="${obj.logincustlike == '0'}">
                                        <button class="like-btn cart-btn"
                                                id="${logincust.custpin}${obj.recipepin}"
                                                value="${obj.logincustlike}"
                                                type="button"
                                                style="border: none; background-color: #b7b7b7">
                                            <span class="icon_heart_alt"></span> 좋아요
                                        </button>
                                    </c:when>
                                    <c:otherwise>
                                        <button class="like-btn cart-btn"
                                                id="${logincust.custpin}${obj.recipepin}"
                                                value="${obj.logincustlike}"
                                                type="button"
                                                style="border: none">
                                            <span class="icon_heart_alt"></span> 좋아요
                                        </button>
                                    </c:otherwise>
                                </c:choose>
                            </c:when>
                            <c:otherwise>
                                <a class="cart-btn" href="/login">
                                    <span class="icon_heart_alt"></span> 좋아요</a>
                            </c:otherwise>
                        </c:choose>
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
                            <c:when test="${rlist.getPrePage() != 0}">
                                <li class="pagination-wrap">
                                    <a class="pagination-wrap"
                                       href="/recipe/all?pageNo=${rlist.getPrePage()}&recipetitle=${recipesortinfo.recipetitle}&type=${recipesortinfo.type}&ingredients1=${recipesortinfo.ingredients1}&recipelevel=${recipesortinfo.recipelevel}&sort=${recipesortinfo.sort}"
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
                        <c:forEach begin="${rlist.getNavigateFirstPage() }" end="${rlist.getNavigateLastPage() }"
                                   var="page">
                            <c:choose>
                                <c:when test="${rlist.getPageNum() == page}">
                                    <li class="pagination-wrap active">
                                        <a class="pagination-wrap active" style="color:#FFFFFF;"
                                           href="/recipe/all?pageNo=${page}&recipetitle=${recipesortinfo.recipetitle}&type=${recipesortinfo.type}&ingredients1=${recipesortinfo.ingredients1}&recipelevel=${recipesortinfo.recipelevel}&sort=${recipesortinfo.sort}">${page }</a>
                                    </li>
                                </c:when>
                                <c:otherwise>
                                    <li>
                                        <a class="pagination-wrap"
                                           href="/recipe/all?pageNo=${page}&recipetitle=${recipesortinfo.recipetitle}&type=${recipesortinfo.type}&ingredients1=${recipesortinfo.ingredients1}&recipelevel=${recipesortinfo.recipelevel}&sort=${recipesortinfo.sort}">${page }</a>
                                    </li>
                                </c:otherwise>
                            </c:choose>
                        </c:forEach>
                        <c:choose>
                            <c:when test="${rlist.getNextPage() != 0}">
                                <li class="pagination-wrap">
                                    <a class="pagination-wrap"
                                       href="/recipe/all?pageNo=${rlist.getNextPage()}&recipetitle=${recipesortinfo.recipetitle}&type=${recipesortinfo.type}&ingredients1=${recipesortinfo.ingredients1}&recipelevel=${recipesortinfo.recipelevel}&sort=${recipesortinfo.sort}"
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