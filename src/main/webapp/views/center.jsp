<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<head>
    <!-- Font Awesome CSS -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/fontawesome.min.css"
          integrity="sha512-..." crossorigin="anonymous"/>
</head>
<!-- Hero Section Begin -->
<section class="hero">
    <div class="container">
        <div class="hero__slider owl-carousel">
            <div class="hero__items set-bg" data-setbg="/uimg/${recipeBasic.thumbnailimg}">
                <div class="weatherbox">
                    <img style="width: 25px; margin: 0px 5px;" src="/uimg/temp.png" alt="weather"/>&nbsp;
                    <p style="color: #2a74f8;">${weather.lowest}</p>
                    <p> / </p>
                    <p style="color: #dc0100;">${weather.highest}</p>&nbsp;&nbsp;
                    <img style="width: 25px; margin: 0px 5px;" src="/uimg/humidity.png" alt="weather"/>&nbsp;
                    <p>${weather.rain}</p>
                    <%--<p>${weather.desc}</p>--%>
                </div>
                <div class="row">
                    <div class="col-lg-6" style="background-color: rgba(128, 128, 128, 0.5);">
                        <div class="hero__text">
                            <div class="label">추천</div>
                            <h2>${recipeBasic.recipetitle}</h2>
                            <p>${recipeBasic.recipedesc}</p>
                            <a href="/recipe/detail?recipepin=${recipeBasic.recipepin}"
                            ><span>Check the recipe Now</span> </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Hero Section End -->

<!-- Product Section Begin -->
<section class="product spad">
    <div class="container">
        <div class="row">
            <div class="col-lg-8">
                <div class="subscribeList">
                    <div class="row">
                        <div class="col-lg-8 col-md-8 col-sm-8">
                        <c:choose>
                            <c:when test="${logincust == null}">
                                <div class="section-title">
                                    <h4>구독 LIST</h4>
                                </div>
                            </c:when>
                            <c:otherwise>
                                <div class="section-title">
                                    <h4>${logincust.nickname}님의 구독 LIST</h4>
                                </div>
                            </c:otherwise>
                        </c:choose>
                        </div>
                    </div>
                    <div class="row">
                        <c:choose>
                            <c:when test="${logincust == null}">
                                <div class="col-lg-8 col-md-8 col-sm-8">
                                    <div style="margin-left: 20px; margin-bottom: 50px;">
                                        <p>로그인해서 구독한 스푸너의 최신 레시피를 확인하세요!
                                            <a href="/login" class="btn-outline-primary">Login</a></p>
                                    </div>
                                </div>
                            </c:when>
                            <c:when test="${empty subscribeList}">
                                <div class="col-lg-8 col-md-8 col-sm-8">
                                    <div style="margin-left: 20px; margin-bottom: 50px;">
                                        <p>스푸너를 구독하여 최신 레시피를 확인할 수 있어요!
                                            <a href="/recipe/all?type=&ingredients1=&recipelevel=&recipetitle=" class="btn-outline-primary">레시피 보러 가기</a></p>
                                    </div>
                                </div>
                            </c:when>
                            <c:otherwise>
                                <c:forEach var="obj" items="${subscribeList}">
                                    <div class="col-lg-4 col-md-6 col-sm-6">
                                        <div class="product__item">
                                            <a href="/recipe/detail?recipepin=${obj.recipepin}">
                                                <div class="product__item__pic set-bg"
                                                     data-setbg="/uimg/${obj.thumbnailimg}">
                                                    <div class="comment">
                                                        <i class="fa-regular fa-comment" style="color: #ffffff;"> </i>
                                                    </div>
                                                    <div class="view">
                                                        <i class="fa-regular fa-heart" style="color: #ffffff;"></i>
                                                    </div>
                                                </div>
                                            </a>
                                            <div class="product__item__text">
                                                <h5>
                                                    <a href="/recipe/detail?recipepin=${obj.recipepin}">${obj.recipetitle}</a>
                                                </h5>
                                            </div>
                                        </div>
                                    </div>
                                </c:forEach>
                            </c:otherwise>
                        </c:choose>
                    </div>
                </div>
                <div class="Latest_class" style="margin-top: 50px">
                    <div class="row">
                        <div class="col-lg-8 col-md-8 col-sm-8">
                            <div class="section-title">
                                <h4>최신 쿠킹 클래스</h4>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-4 col-sm-4">
                            <div class="btn__all">
                                <a href="/cookingclass/class?location=&type=&classtitle=&sort=1" class="primary-btn">View
                                    All
                                    <span class="arrow_right"></span>
                                </a>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <c:forEach var="obj" items="${classList}">
                            <div class="col-lg-4 col-md-6 col-sm-6">
                                <div class="product__item">
                                    <a href="/cookingclass/detail?classpin=${obj.classpin}">
                                        <div class="product__item__pic set-bg"
                                             data-setbg="/uimg/${obj.thumbnailimg}">
                                            <div class="comment">
                                                <i class="fa-regular fa-comment" style="color: #ffffff;"></i>
                                            </div>
                                            <div class="view">
                                                <i class="fa-regular fa-heart" style="color: #ffffff;"></i>
                                            </div>
                                        </div>
                                    </a>
                                    <div class="product__item__text">
                                        <h5>
                                            <a href="/cookingclass/detail?classpin=${obj.classpin}">${obj.classtitle}</a>
                                        </h5>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div>
                <div class="Latest_recipe" style="margin-top: 50px">
                    <div class="row">
                        <div class="col-lg-8 col-md-8 col-sm-8">
                            <div class="section-title">
                                <h4>최신 레시피</h4>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-4 col-sm-4">
                            <div class="btn__all">
                                <a href="/recipe/all?type=&ingredients1=&recipelevel=&recipetitle=" class="primary-btn">View All
                                    <span class="arrow_right"></span></a>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <c:forEach var="obj" items="${recipeList}">
                            <div class="col-lg-4 col-md-6 col-sm-6">
                                <div class="product__item">
                                    <a href="/recipe/detail?recipepin=${obj.recipepin}">
                                        <div class="product__item__pic set-bg"
                                             data-setbg="/uimg/${obj.thumbnailimg}">
                                            <div class="comment">
                                                <i class="fa-regular fa-comment" style="color: #ffffff;"> </i>
                                            </div>
                                            <div class="view">
                                                <i class="fa-regular fa-heart" style="color: #ffffff;"></i>
                                            </div>
                                        </div>
                                    </a>
                                    <div class="product__item__text">
                                        <h5>
                                            <a href="/recipe/detail?recipepin=${obj.recipepin}">${obj.recipetitle}</a>
                                        </h5>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </div>
            <div class="col-lg-4 col-md-6 col-sm-8">
                <div class="product__sidebar">
                    <div class="product__sidebar__view">
                        <div class="section-title">
                            <h5>콜리의 <span style="color: #dc3545;">BEST</span> 요리 모음</h5>
                        </div>

                        <div class="filter__gallery">
                            <c:forEach var="recipeRanking" items="${recipeRanking}">
                                <div class="product__sidebar__view__item set-bg mix day years"
                                     data-setbg="/uimg/${recipeRanking.thumbnailimg}">
                                    <div>
                                        <img style="width: 60px; margin: 10px" src="/uimg/reciperank.png"
                                             alt="reciperank"/>
                                    </div>
                                    <div>
                                        <h5>
                                            <a href="/recipe/detail?recipepin=+${recipeRanking.recipepin}"
                                               style="padding: 5px; background-color: rgba(0,0,0, 0.5); border-radius: 5px;">
                                                    ${recipeRanking.recipetitle}
                                            </a>
                                        </h5>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                    </div>

                    <div class="product__sidebar">
                        <div class="product__sidebar__view">
                            <div class="section-title">
                                <h5>콜리의 <span style="color: #dc3545;">NOTICE</span></h5>
                            </div>
                            <table class="rwd-table" id="dataTable">
                                <tbody>
                                <tr>
                                    <th style="width: 65%;">Title</th>
                                    <th>Date</th>
                                </tr>
                                <c:forEach var="nobj" items="${nlist.getList()}">
                                    <tr>
                                        <td class="input__item" data-th="Title"><a
                                                href="/contacts/notice_detail?noticepin=${nobj.noticepin}"
                                                style="color: black;">${nobj.noticetitle}</a>
                                        </td>
                                        <td data-th="Date"><fmt:formatDate value="${nobj.noticedate}" pattern="yyyy-MM-dd"/></td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                            <jsp:include page="page.jsp"/>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    </div>
</section>
<!-- Product Section End -->