<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>

<script>
    let comment_form = {

        sleep: function (ms) {
            return new Promise((resolve) => setTimeout(resolve, ms));
        },
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
                var heartzoneid = recipepin + '_zone';
                if (true) {
                    dblclickHeart++;
                    const heartImg = document.createElement("img");
                    heartImg.setAttribute("src", "/img/likeheart.png");
                    heartImg.style.width = '5px';
                    heartImg.style.userSelect = "none";
                    document.getElementById(heartzoneid).appendChild(heartImg);

                    for (let i = 0; i < 40; i++) {
                        let htsize = parseInt(heartImg.style.width) + 5;
                        heartImg.style.width = htsize + "px";
                        await comment_form.sleep(5);
                    }

                    await comment_form.sleep(30);

                    for (let i = 0; i < 7; i++) {
                        let htsize = parseInt(heartImg.style.width) - 5;
                        heartImg.style.width = htsize + "px";
                        await comment_form.sleep(30);
                    }

                    await comment_form.sleep(30);

                    for (let i = 0; i < 3; i++) {
                        let htsize = parseInt(heartImg.style.width) + 5;
                        heartImg.style.width = htsize + "px";
                        await comment_form.sleep(30);
                    }

                    await comment_form.sleep(700);

                    for (let i = 0; i < 36; i++) {
                        let htsize = parseInt(heartImg.style.width) - 5;
                        heartImg.style.width = htsize + "px";
                        await comment_form.sleep(3);
                    }

                    await comment_form.sleep(80);
                    document.getElementById(heartzoneid).removeChild(heartImg);
                    dblclickHeart--;
                }
            }
        },
        send: function () {
            var recipepin = $('#recipepin').val();
            var custpin = $('#custpin').val();
            var custid = $('#custid').val();
            var nickname = $('#nickname').val();
            var content = $('#content').val();

            $("#comment_form").attr({
                "action": "/recipe/commentImpl",
                "method": "post"
            });
            $("#comment_form").submit();
        }
    }
    $(function () {
        $("#recipe").addClass("navActive");
        comment_form.init();
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
<!-- single article section -->
<div class="mt-50 mb-150">
    <div class="container">
        <div class="row">
            <div class="col-lg-8">
                <div class="single-article-section">
                    <div class="single-article-text" style="margin-bottom: 50px">
                        <div class="class-bg"
                             style="margin-bottom: 30px; background-image: url('/uimg/${recipedetail.thumbnailimg}');background-size: cover; background-position: center; background-repeat: no-repeat;
                                     display: flex; justify-content: center; align-content: center">
                            <div id="${recipedetail.recipepin}_zone"
                                 style="display: flex; justify-content: center; align-content: center; margin: auto"></div>
                        </div>
                        <h2 style="color:#F28123; font-weight: bolder">
                            [${recipedetail.type}] ${recipedetail.recipetitle}</h2>
                    </div>
                    <div class="class-step">
                        <div class="section-title">
                            <h5>레시피 소개</h5>
                        </div>
                        <h5>${recipedetail.recipedesc}</h5>
                        <br><br>
                        <div class="section-title">
                            <h5>레시피 재료</h5>
                        </div>
                        <c:forEach var="obj" items="${ingredientList}">
                            <p><img src="https://cdn-icons-png.flaticon.com/128/2713/2713579.png"
                                    style="width: 25px"> ${obj.name} / ${obj.quantity}
                            </p>
                        </c:forEach>
                        <br><br>
                        <div class="section-title">
                            <h5>조리 순서</h5>
                        </div>
                        <c:forEach var="obj" items="${recipeStep}">
                            <div class="card shadow border-0 rounded-4 mb-5">
                                <div class="card-body p-2">
                                    <div class="row align-items-center gx-5">
                                        <div class="col text-center text-lg-start mb-4 mb-lg-0">
                                            <div class="rounded-4">
                                                <img src="/uimg/${obj.stepimg}" alt="">
                                            </div>
                                        </div>
                                        <div class="col-lg-8">
                                            <h3 style="color: black;
                                                        font-weight: 600; line-height: 21px; text-transform: uppercase;">
                                                Step ${obj.step}</h3>
                                            <br>
                                            <div>${obj.stepdesc}</div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>


                    </div>

                    <div class="comments-list-wrap">
                        <div class="comment-list">
                            <div class="single-comment-body">
                                <div class="anime__details__review">
                                    <div class="section-title">
                                        <h5>댓글</h5>
                                    </div>

                                    <c:forEach var="obj" items="${recipeComment}">
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
                                                                <form action="/recipe/commentDel" method="post">
                                                                    <input type="hidden" name="recipecommentpin"
                                                                           value="${obj.recipecommentpin}">
                                                                    <input type="hidden" name="recipepin"
                                                                           value="${obj.recipepin}">
                                                                    <div class="anime__details__btn">
                                                                        <button type="submit"
                                                                                formaction="/recipe/commentDel"
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
                                            <input type="hidden" name="recipepin" id="recipepin"
                                                   value="${recipedetail.recipepin}">
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
                            <h4 style="color: #008000">호스트 소개</h4>
                        </div>
                        <a href="/apply/mypage?custid=${recipecust.custid}">
                            <div style="display: flex; flex-direction: row; align-items: center">
                                <c:choose>
                                    <c:when test="${recipecust.profileimgname != null &&  recipecust.profileimgname !=''}">
                                        <div style="width: 60px; height: 60px; background-image: url('/uimg/${recipecust.profileimgname}');
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
                                    <c:when test="${recipecust.nickname != null}">
                                        <h6 style="color: black">${recipecust.nickname}</h6>
                                    </c:when>
                                    <c:otherwise>
                                        <h6 style="color: black">${recipecust.custid}</h6>
                                    </c:otherwise>
                                </c:choose>
                            </div>
                        </a>
                        <h5 style="margin-top: 5px; color: black">${recipecust.introduction}</h5>
                    </div>
                    <div class="single-product-form" style="margin-bottom: 30px; text-align: center;">
                        <c:choose>
                            <c:when test="${logincust != null}">
                                <c:choose>
                                    <c:when test="${recipedetail.logincustlike == '0'}">
                                        <button class="like-btn cart-btn"
                                                id="${logincust.custpin}${recipedetail.recipepin}"
                                                value="${recipedetail.logincustlike}"
                                                type="button"
                                                style="border: none; background-color: #b7b7b7; width: 80%;">
                                            <span class="icon_heart_alt"></span> 레시피 찜
                                        </button>
                                    </c:when>
                                    <c:otherwise>
                                        <button class="like-btn cart-btn"
                                                id="${logincust.custpin}${recipedetail.recipepin}"
                                                value="${recipedetail.logincustlike}"
                                                type="button"
                                                style="border: none; width: 80%;">
                                            <span class="icon_heart_alt"></span> 레시피 찜
                                        </button>
                                    </c:otherwise>
                                </c:choose>
                            </c:when>
                            <c:otherwise>
                                <a href="/login" class="btn cart-btn" id="recipe-btn" style="width: 80%;"><span
                                        class="icon_heart_alt"></span> 레시피 찜</a>
                            </c:otherwise>
                        </c:choose>
                    </div>

                    <div class="section-title" style="margin-bottom: 10px; margin-top: 30px">
                        <h4>이 레시피를 좋아하는 스푸너들이 좋아하는 다른 레시피</h4>
                    </div>
                    <c:forEach var="obj" items="${recommendlist}">
                        <div class="product__sidebar__view__item set-bg"
                             data-setbg="/uimg/${obj.thumbnailimg}" style="margin-bottom: 30px">
                            <h5>
                                <a href="/recipe/detail?recipepin=${obj.recipepin}"
                                   style="padding: 5px; background-color: rgba(0,0,0, 0.5); border-radius: 5px; font-size: 15px">${obj.recipetitle}</a>
                            </h5>
                        </div>
                    </c:forEach>
                    <div class="section-title" style="margin-bottom: 10px">
                        <h4 style="color: #008000">공유하기</h4>
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