<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <script src="/webjars/sockjs-client/sockjs.min.js"></script>
    <script src="/webjars/stomp-websocket/stomp.min.js"></script>

    <meta charset="UTF-8"/>
    <meta name="description" content="Anime Template"/>
    <meta name="keywords" content="Anime, unica, creative, html"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <meta http-equiv="X-UA-Compatible" content="ie=edge"/>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
    <script src="https://apis.google.com/js/platform.js" async defer></script>
    <script type="text/javascript"
            src="//dapi.kakao.com/v2/maps/sdk.js?appkey=186d9ac6e73cf3e121e11e749901f230&libraries=services"></script>
    <title>Kolly on the Table</title>

    <!-- Google Font -->
    <link
            href="https://fonts.googleapis.com/css2?family=Oswald:wght@300;400;500;600;700&display=swap"
            rel="stylesheet"
    />
    <link
            href="https://fonts.googleapis.com/css2?family=Mulish:wght@300;400;500;600;700;800;900&display=swap"
            rel="stylesheet"
    />

    <!-- Css Styles -->
    <link rel="stylesheet" href="/css/bootstrap.min.css" type="text/css"/>
    <link rel="stylesheet" href="/bootstrap/css/bootstrap.css" type="text/css"/>
    <link rel="stylesheet" href="/css/font-awesome.min.css" type="text/css"/>
    <link rel="stylesheet" href="/css/elegant-icons.css" type="text/css"/>
    <link rel="stylesheet" href="/css/plyr.css" type="text/css"/>
    <link rel="stylesheet" href="/css/nice-select.css" type="text/css"/>
    <link rel="stylesheet" href="/css/owl.carousel.min.css" type="text/css"/>
    <link rel="stylesheet" href="/css/slicknav.min.css" type="text/css"/>
    <link rel="stylesheet" href="/css/style.css" type="text/css"/>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <style>
        #preloder {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .search-model-form {
            display: flex;
            justify-content: center;
            align-items: center;
        }


        .floating-wrapper[data-v-ea12492a]:hover {
            width: 75px;
            height: 75px;
            animation-play-state: paused;
        }
        .floating-wrapper[data-v-ea12492a] {
            opacity: 0;
            position: fixed;
            top: auto;
            left: auto;
            right: 70px;
            bottom: 70px;
            width: 74px;
            height: 74px;
            z-index: 99;
            border-radius: 50%;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            animation: action 2s infinite alternate; /* 2s animation + 1s delay = 3s total */
        }

        @keyframes action {
            0%, 100% {
                transform: scale(1);
            }
            25%, 75% {
                transform: scale(1.1);
            }
            12.5%, 62.5% {
                animation-timing-function: steps(1);
            }
            37.5%, 87.5% {
                animation-timing-function: steps(1);
            }
        }
        .eachIconDiv {
            width: 50px;
            height: 50px;
            border-radius: 50%;
            background-color: #ffffff;
            position: relative;
            z-index: 11;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }

        .eachIconDiv img {
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
        }
        #magicIcon {
            position: fixed;
            right: 25px;
            bottom: 130px;
        }
        #chatWithAdminIcon {
            position: fixed;
            right: 80px;
            bottom: 155px;
        }
        #howToUseIcon {
            position: fixed;
            right: 140px;
            bottom: 130px;
        }
        #chatGPTIcon {
            position: fixed;
            right: 155px;
            bottom: 65px;
        }
        #scrollToTop {
            position: fixed;
            right: 120px;
            bottom: 15px;
        }

        .chatLink:hover {
            cursor: pointer;
        }

        .navActive {
            background-color: #F28123;
            color: white !important;
        }  /*활성화 menu 색 지정 */
    </style>
</head>

<body>
<%--우측 아이콘--%>
<div data-v-ea12492a="" class="floating-wrapper" style="opacity: 1; transform: scale(1);">
    <div data-v-ea12492a="" class="button-trigger" onclick="toggle()">
        <img data-v-ea12492a="" src="/img/floating_c.png" alt="아이콘"></div>
</div>

<div class="icons" style="display:none;">
    <div class="eachIconDiv" id="magicIcon" >
        <a href="/magic">
            <img src="/img/conch.png" alt="Conch Shell">
        </a>
        </div>
    <div class="eachIconDiv " id="chatWithAdminIcon" >
        <a class="chatLink" onclick="openPopup('chatWithAdmin')">
            <img src="https://cdn-icons-gif.flaticon.com/11186/11186861.gif" style="width: 30px; margin-right:3px">
        </a>
    </div>
    <div class="eachIconDiv" id="howToUseIcon" >
        <a class="chatLink" onclick="openPopup('howToUse')">
            <img src="https://cdn-icons-gif.flaticon.com/11184/11184177.gif" style="width: 30px; margin-right:3px">
        </a>
    </div>
    <div class="eachIconDiv" id="chatGPTIcon" >
        <a class="chatLink" onclick="openPopup('chatGPT')">
            <img src="https://cdn-icons-gif.flaticon.com/11184/11184172.gif" style="width: 30px; margin-right:3px">
        </a>
    </div>
    <div class="eachIconDiv" id="scrollToTop">
        <a href="#" class="btn back-to-top chatLink" >
            <img src="https://cdn-icons-gif.flaticon.com/10522/10522219.gif" style="width: 30px; margin-right:3px">
        </a>
    </div>
</div>
<%--우측 하단 아이콘 end--%>

<!-- Page Preloder -->
<div id="preloder" class="search-model-form">
    <form class="search-model-form">
        <%--        <iframe src="https://giphy.com/embed/vOOjguTG3XUKNxfd7R" width="300" height="300" frameBorder="0"--%>
        <%--                class="giphy-embed" allowFullScreen></iframe>--%>
        <img style="width: 220px;" src="/img/loading.gif">
    </form>
</div>

<!-- Header Section Begin -->
<header class="header">
    <div class="container">
        <div class="row">
            <div class="col-lg-2">
                <div class="header__logo">
                    <a href="/">
                        <img style="width: 125px;height: auto" src="/img/logo.png" alt="logo"/>
                    </a>
                </div>
            </div>
            <div class="col-lg-8">
                <div class="header__nav">
                    <nav class="header__menu mobile-menu">
                        <ul>
                            <li><a id="recipe" href="/recipe/all?type=&ingredients1=&recipelevel=&recipetitle=&sort=0">Recipe</a>
                            </li>
                            <li><a id="class" href="/cookingclass/class?location=&type=&classtitle=&sort=1">Class</a>
                            </li>
                            <li><a id="contact" href="/contacts">Contact</a></li>
                            <c:choose>
                                <c:when test="${logincust != null}">
                                    <li><a id="register">Register</a>
                                        <ul class="dropdown">
                                            <li><a href="/recipe/add">Recipe</a></li>
                                            <li><a href="/cookingclass/add">Class</a></li>
                                        </ul>
                                    </li>
                                </c:when>
                            </c:choose>
                        </ul>
                    </nav>
                </div>
            </div>
            <div class="col-lg-2">
                <div class="header__right">
                    <c:choose>
                        <c:when test="${logincust == null}">
                            <a href="/login" style="font-family: Cafe24Ssurround; color: black">Login</a>&nbsp;
                            <a href="/apply" style="font-family: Cafe24Ssurround; color: black">Apply</a>
                        </c:when>
                        <c:otherwise>
                            <a href="/login/logout" style="font-family: Cafe24Ssurround; color: black">Logout</a>&nbsp;
                            <c:choose>
                                <c:when test="${logincust.profileimgname == null || logincust.profileimgname ==''}">
                                    <a href="/apply/mypage?custid=${logincust.custid}">
                                        <img src="/img/basic_profile.png" alt=""
                                             style="width: 25px; height: 25px; border-radius: 50%">
                                    </a>
                                </c:when>
                                <c:otherwise>
                                    <a href="/apply/mypage?custid=${logincust.custid}">
                                        <img src="/uimg/${logincust.profileimgname}" alt=""
                                             style="width: 25px; height: 25px; border-radius: 50%">
                                    </a>
                                </c:otherwise>
                            </c:choose>
                            <a href="/apply/mypage?custid=${logincust.custid}"
                               style="font-family: Cafe24Ssurround; color: black">
                                    ${logincust.custid}
                            </a>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>
        </div>
        <div id="mobile-menu-wrap"></div>
    </div>
</header>
<!-- Header End -->


<!--  Main Center Start -->
<c:choose>
    <c:when test="${center == null}">
        <jsp:include page="center.jsp"/>
    </c:when>
    <c:otherwise>
        <jsp:include page="${center}.jsp"/>
    </c:otherwise>
</c:choose>

<!--  Main Center End -->

<!-- Footer Section Begin -->
<footer class="footer">
    <div class="container">
        <div class="row">
            <div class="col-lg-2">
                <div class="footer__logo">
                    <a href="/"><img style="width: 125px" src="/img/logo.png" alt=""/></a>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-10">
                    <p>
                        <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                        Copyright &copy;
                        <script>
                            document.write(new Date().getFullYear());
                        </script>
                        CHOJANG SPOON All rights reserved
                        <i class="fa fa-heart" aria-hidden="true"></i> from
                        <a href="https://www.kbstar.com" target="_blank">KB국민은행</a>
                    </p>
                </div>
            </div>
        </div>
    </div>

</footer>
<!-- Footer Section End -->

<!-- Search model Begin -->
<div class="search-model">
    <div class="h-100 d-flex align-items-center justify-content-center">
        <div class="search-close-switch"><i class="icon_close"></i></div>
        <form class="search-model-form">
            <iframe src="https://giphy.com/embed/vOOjguTG3XUKNxfd7R" width="300" height="300" frameBorder="0"
                    class="giphy-embed" allowFullScreen></iframe>
        </form>
    </div>
</div>
<!-- Search model end -->

<!-- Js Plugins -->
<script src="/js/jquery-3.3.1.min.js"></script>
<script src="/js/bootstrap.min.js"></script>
<script src="/js/player.js"></script>
<script src="/js/jquery.nice-select.min.js"></script>
<script src="/js/mixitup.min.js"></script>
<script src="/js/jquery.slicknav.js"></script>
<script src="/js/owl.carousel.min.js"></script>
<script src="/js/main.js"></script>
<script src="jquery.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<%--index js--%>
<script src="/js/index.js"></script>
<%--fontawesome icon--%>
<script src="https://kit.fontawesome.com/b115a141fc.js" crossorigin="anonymous"></script>


</body>


</html>
