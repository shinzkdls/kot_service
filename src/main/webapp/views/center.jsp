<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<head>

    <!-- Font Awesome CSS -->
    <!-- Font Awesome CSS -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/fontawesome.min.css"
          integrity="sha512-..." crossorigin="anonymous"/>
</head>
<!-- Hero Section Begin -->
<section class="hero">
    <div class="container">
        <div class="hero__slider owl-carousel">
            <div class="hero__items set-bg" data-setbg="/uimg/${recipeBasic.thumbnailimg}">
                <div class="row">
                    <div class="col-lg-6">
                        <div class="temp">
                            <p><span class="lowest">${weather.lowest}</span></p>
                            <span class="bar">/</span>
                            <p><span class="highest">${weather.highest}</span></p>
                        </div>
                        <div class="rain">
                            <p><span>강수량</span></p>
                            <div class="rain_text">${weather.rain}</div>
                            <span>/</span>
                            <p>${weather.desc}</p>
                        </div>
                    </div>
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
                            <div class="section-title">
                                <h4>Recent Recipe by Subscribed Users</h4>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <c:choose>
                            <c:when test="${logincust == null}">
                                <div class="col-lg-8 col-md-8 col-sm-8">
                                    <div style="margin-bottom: 50px;">
                                        <p>로그인해서 구독한 스푸너의 최신 레시피를 확인하세요!
                                            <a href="/login" class="btn-outline-primary">Login</a></p>
                                    </div>
                                </div>
                            </c:when>
                            <c:otherwise>
                                <c:forEach var="obj" items="${subscribeList}">
                                    <div class="col-lg-4 col-md-6 col-sm-6">
                                        <div class="product__item">
                                            <div class="product__item__pic set-bg"
                                                 data-setbg="/uimg/${obj.thumbnailimg}">
                                                <div class="comment">
                                                    <i class="fa fa-comments"></i> 11
                                                </div>
                                                <div class="view"><i class="fa fa-eye"></i> 9141</div>
                                            </div>
                                            <div class="product__item__text">
                                                <ul>
                                                    <li>Active</li>
                                                    <li>Movie</li>
                                                </ul>
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
                <div class="Latest_class">
                    <div class="row">
                        <div class="col-lg-8 col-md-8 col-sm-8">
                            <div class="section-title">
                                <h4>최신 쿠킹 클래스</h4>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-4 col-sm-4">
                            <div class="btn__all">
                                <a href="/cookingclass/class" class="primary-btn">View All
                                    <span class="arrow_right"></span>
                                </a>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <c:forEach var="obj" items="${classList}">
                            <div class="col-lg-4 col-md-6 col-sm-6">
                                <div class="product__item">
                                    <div class="product__item__pic set-bg"
                                         data-setbg="/uimg/${obj.thumbnailimg}">
                                        <div class="comment">
                                            <i class="fa-regular fa-comment" style="color: #ffffff;"> </i>
                                        </div>
                                        <div class="view">
                                            <i class="fa-regular fa-heart" style="color: #ffffff;"></i>
                                        </div>
                                    </div>
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
                <div class="Latest_recipe">
                    <div class="row">
                        <div class="col-lg-8 col-md-8 col-sm-8">
                            <div class="section-title">
                                <h4>최신 레시피</h4>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-4 col-sm-4">
                            <div class="btn__all">
                                <a href="/recipe/all" class="primary-btn">View All <span class="arrow_right"></span></a>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <c:forEach var="obj" items="${recipeList}">
                            <div class="col-lg-4 col-md-6 col-sm-6">
                                <div class="product__item">
                                    <div class="product__item__pic set-bg"
                                         data-setbg="/uimg/${obj.thumbnailimg}">
                                        <div class="comment">
                                            <i class="fa-regular fa-comment" style="color: #ffffff;"> </i>
                                        </div>
                                        <div class="view">
                                            <i class="fa-regular fa-heart" style="color: #ffffff;"></i>
                                        </div>
                                    </div>
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
                            <h5>콜리의 BEST 요리 모음</h5>
                        </div>
                        <div class="filter__gallery">
                            <c:forEach var="recipeRanking" items="${recipeRanking}">
                                <div class="product__sidebar__view__item set-bg mix day years"
                                     data-setbg="/uimg/${recipeRanking.thumbnailimg}">
                                    <div class="ep">
                                        <i class="fa-solid fa-pen-to-square" style="color: #ffffff;"></i>
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
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Product Section End -->