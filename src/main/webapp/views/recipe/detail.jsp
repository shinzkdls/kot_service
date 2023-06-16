<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script>
    let register_form = {
        init: function () {
            $("#register_btn").click(function () {

                <c:choose>
                    <c:when test="${logincust != null}">
                        register_form.send();
                    </c:when>
                    <c:otherwise>
                        alert("로그인 후 이용해주세요.")
                    </c:otherwise>
                </c:choose>

            });
        },
        send: function () {
            var recipepin = $('#recipepin').val();
            var custpin = $('#custpin').val();
            var custid = $('#custid').val();
            var nickname = $('#nickname').val();
            var content = $('#content').val();

            $("#register_form").attr({
                "action": "/recipe/commentImpl",
                "method": "post"
            });
            $("#register_form").submit();
        }
    };

    let delete_form = {
        init: function () {
            $("#delete_btn").click(function () {
                delete_form.send();
            });
        },
        send: function () {
            $("#delete_form").attr({
                "action": "/recipe/deleteImpl",
                "method": "post"
            });
            $("#delete_form").submit();
        }
    };

    let like_add = {
        init: function () {
            $('#like_btn').click(function () {
                <c:choose>
                    <c:when test="${logincust != null}">
                        like_add.send();
                    </c:when>
                    <c:otherwise>
                        alert("로그인 후 이용해주세요.");
                    </c:otherwise>
                </c:choose>
            });
        },
        send:function () {
            $('#like_form').attr({
                method: 'post',
                action: '/recipe/likeImpl'
            });
            $('#like_form').submit();
        }
    };

    let sub_add = {
        init: function () {
            $('#sub_btn').click(function () {
                <c:choose>
                    <c:when test="${logincust != null && logincust.custpin != recipedetail.custpin}">
                        sub_add.send();
                    </c:when>
                    <c:when test="${logincust == null}">
                        alert("로그인 후 이용해주세요.");
                    </c:when>
                </c:choose>
            });
        },
        send:function () {
            $('#sub_form').attr({
                method: 'post',
                action: '/recipe/subImpl'
            });
            $('#sub_form').submit();
        }
    };

    $(function () {
        register_form.init();
        delete_form.init();
        like_add.init();
        sub_add.init();
    });
</script>

<head>
    <meta charset="UTF-8">
    <meta name="description" content="Anime Template">
    <meta name="keywords" content="Anime, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Anime | Template</title>

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Oswald:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Mulish:wght@300;400;500;600;700;800;900&display=swap"
          rel="stylesheet">

    <!-- Css Styles -->
    <link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="css/elegant-icons.css" type="text/css">
    <link rel="stylesheet" href="css/plyr.css" type="text/css">
    <link rel="stylesheet" href="css/nice-select.css" type="text/css">
    <link rel="stylesheet" href="css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="css/slicknav.min.css" type="text/css">
    <link rel="stylesheet" href="css/style.css" type="text/css">
</head>

<body>

<!-- Anime Section Begin -->
<section class="anime-details spad">
    <div class="container">
        <div style="right: 0%">
            <c:choose>
                <c:when test="${logincust.custid == recipedetail.custid}">
                <div class="form-horizontal" style="display: flex; justify-content: flex-end">
                        <div class="anime__details__btn">
                            <form id="modify_form">
                                <button type="button" id="modify_btn" class="follow-btn" style="border: unset">
                                    Modify
                                </button>
                            </form>
                        </div>
                        <div class="anime__details__btn">
                            <form id="delete_form">
                                <input type="hidden" name="recipepinDel" value="${recipedetail.recipepin}">
                                <button type="button" id="delete_btn" class="follow-btn" style="border: unset">
                                    Delete
                                </button>
                            </form>
                        </div>
                </div>
                </c:when>
            </c:choose>
            <br>
        </div>
        <div class="anime__details__content">
            <div class="row">

                <div class="col-lg-4">
                    <div class="anime__details__pic set-bg">
                        <img class="anime__details__pic set-bg" src="/uimg/${recipedetail.thumbnailimg}" style="height: 80%"/>
                    </div>
                </div>
                <div class="col-lg-8">
                    <div class="anime__details__text">
                        <div class="anime__details__title">
                            <h3>${recipedetail.recipetitle}</h3>
                        </div>
<%--                        <div class="anime__details__rating">--%>
<%--                            <div class="rating">--%>
<%--                                <span>Votes</span>--%>
<%--                            </div>--%>
<%--                        </div>--%>
                        <p>조리시간 : ${recipedetail.time}분</p>
                        <p>난이도 : ${recipedetail.recipelevel}</p>
                        <div class="anime__details__widget">
                            <div class="row">
                                <div class="col-lg-6 col-md-6">
                                    <ul>
                                        <c:forEach var="String" items="${ingredientList}" begin="0" end="4">
                                            <li><span>${String.name} : ${String.quantity}</span></li>
                                        </c:forEach>
                                    </ul>
                                </div>
                                <div class="col-lg-6 col-md-6">
                                    <ul>
                                        <c:forEach var="String" items="${ingredientList}" begin="5">
                                            <li><span>${String.name} : ${String.quantity}</span></li>
                                        </c:forEach>
                                    </ul>
                                </div>
                            </div>
                        </div>

                        <div class="anime__details__btn">
                            <div class="form-horizontal" style="display: flex; justify-content: flex-start;">
                                <div style="margin-right: 40px;">
                                    <form style="width: 100px; margin: 0;" id="sub_form" class="sub_form">
                                        <input type="hidden" name="custpinmy" id="custpinmy" value="${logincust.custpin}">
                                        <input type="hidden" name="subcustpin" id="subcustpin" value="${recipedetail.custpin}">
                                        <c:choose>
                                            <c:when test="${logincust.custpin == recipedetail.custpin}">
                                                <button type="button" id="sub_btn" class="follow-btn disabled" style="border: unset; background-color: #b7b7b7;)">
                                                    Subscribe
                                                </button>
                                            </c:when>
                                            <c:otherwise>
                                                <button type="button" id="sub_btn" class="follow-btn" style="border: unset">
                                                    Subscribe
                                                </button>
                                            </c:otherwise>
                                        </c:choose>
                                    </form>
                                </div>
                                <div>
                                    <form id="like_form" class="like_form">
                                        <input type="hidden" name="custpinlike" id="custpinlike" value="${logincust.custpin}">
                                        <input type="hidden" name="recipepinlike" id="recipepinlike" value="${recipedetail.recipepin}">
                                        <c:choose>
                                            <c:when test="${logincust.custpin == recipedetail.custpin}">
                                                <button type="button" id="like_btn" class="follow-btn disabled" style="border: unset; background-color: #b7b7b7;">
                                                    Like!
                                                </button>
                                            </c:when>
                                            <c:otherwise>
                                                <button type="button" id="like_btn" class="follow-btn" style="border: unset">
                                                    Like!
                                                </button>
                                            </c:otherwise>
                                        </c:choose>
                                    </form>
                                </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">

            <div class="col-lg-8 col-md-8">
                <div class="anime__details__review">
                    <div class="section-title">
                        <h5>How to Cook?</h5>
                    </div>
                    <div>
                        <c:forEach var="obj" items="${recipeStep}">
                            <div class="card shadow border-0 rounded-4 mb-5">
                                <div class="card-body p-5">
                                    <div class="row align-items-center gx-5">
                                        <div class="col text-center text-lg-start mb-4 mb-lg-0">
                                            <div class="bg-light p-4 rounded-4">
                                                <div class="text-primary fw-bolder mb-2">
                                                    <img src="/uimg/${obj.stepimg}" alt="">
                                                </div>
                                                <div class="small fw-bolder">
                                                    <h5 style="font-family : Oswald, sans-serif; color: black;
                                                        font-weight: 600; line-height: 21px; text-transform: uppercase;">Step${obj.step}</h5>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-lg-8">
                                            <div>${obj.stepdesc}</div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </div>

            <div class="col-lg-8 col-md-8">
                <div class="anime__details__review">
                    <div class="section-title">
                        <h5>Reviews</h5>
                    </div>

                    <c:forEach var="obj" items="${recipeComment}">
                    <div class="anime__review__item">
                        <div class="anime__review__item__pic">
                            <c:choose>
                                <c:when test="${obj.profileimgname != null}">
                                    <img src="/uimg/${obj.custid}_profileimg.jpg">
                                </c:when>
                                <c:otherwise>
                                    <img src="/img/basic_profile.png">
                                </c:otherwise>
                            </c:choose>
<%--                            <img src="/uimg/${obj.custid}_profileimg.jpg" alt="">--%>
                        </div>
                        <div class="anime__review__item__text">
                            <div class="form-horizontal" style="display: flex; justify-content: space-between">
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
                                                <input type="hidden" name="recipecommentpin" value="${obj.recipecommentpin}">
                                                <input type="hidden" name="recipepin" value="${obj.recipepin}">
                                                <div class="anime__details__btn">
                                                    <button type="submit" formaction="/recipe/commentDel"
                                                            style="color: #ffffff; background-color: #f28123; font-weight: 700; letter-spacing: 2px;
                                                                text-transform: uppercase; border-radius: 4px;
                                                                border: unset">X</button>
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
                    <br>
                    <div class="anime__details__form">
                        <div class="section-title">
                            <h5>Your Comment</h5>
                        </div>
                        <div style="margin: 0; right: 10px;">
                            <form id="register_form">
                                <input type="hidden" name="recipepin" id="recipepin" value="${recipedetail.recipepin}">
                                <input type="hidden" name="custpin" id="custpin" value="${logincust.custpin}">
                                <input type="hidden" name="custid" id="custid" value="${logincust.custid}">
                                <input type="hidden" name="nickname" id="nickname" value="${logincust.nickname}">
                                <textarea name="content" id="content" placeholder="Your Comment"></textarea>
                                <button type="button" id="register_btn">Register</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Anime Section End -->

<!-- Search model Begin -->
<div class="search-model">
    <div class="h-100 d-flex align-items-center justify-content-center">
        <div class="search-close-switch"><i class="icon_close"></i></div>
        <form class="search-model-form">
            <input type="text" id="search-input" placeholder="Search here.....">
        </form>
    </div>
</div>
<!-- Search model end -->

<!-- Js Plugins -->
<script src="js/jquery-3.3.1.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/player.js"></script>
<script src="js/jquery.nice-select.min.js"></script>
<script src="js/mixitup.min.js"></script>
<script src="js/jquery.slicknav.js"></script>
<script src="js/owl.carousel.min.js"></script>
<script src="js/main.js"></script>

</body>