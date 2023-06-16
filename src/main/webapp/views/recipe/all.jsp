<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>

<script>
    let recipe_search = {
        init: function () {
            $('#search_btn').click(function () {
                $('#search_form').attr({
                    method: 'post',
                    action: '/recipe/search'
                });
                $('#search_form').submit();
            });

            $('#ingredients1_li li').click(function () {
                // 선택된 지역 값을 가져옴
                ingredients1 = $(this).data('filter');
                $('#ingredients1').val(ingredients1);
                $('#type').val(type);

                // 폼을 서버로 제출
                $('#category_form').attr({
                    method: 'get',
                    action: '/recipe/searchIngreType'
                });
                $('#category_form').submit();
            });

            $('#type_li li').click(function () {
                type = $(this).data('filter');
                $('#ingredients1').val(ingredients1);
                $('#type').val(type);

                // 폼을 서버로 제출
                $('#category_form').attr({
                    method: 'post',
                    action: '/recipe/searchIngreType'
                });
                $('#category_form').submit();
            });
        }
    };
    // $(document).ready(function () {
    //     recipe_search.init();
    // });
    $(function () {
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
<section class="normal-breadcrumb set-bg" data-setbg="/uimg/recipemain.jpg">
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

<div class="product-section mt-50 mb-150">
    <div class="container">
        <div class="row">
            <div class="col" style="margin-bottom: 30px">
                <form id="search_form" class="d-flex" style="float: right;">
                    <input class="form-control me-2" type="text" placeholder="Search by Recipe Title"
                           aria-label="Search"
                           name="recipetitle" id="recipetitle" value="${recipetitle}">
                    <button id="search_btn" class="btn btn-outline" type="button"
                            style="border: 2px solid #F28123; background-color: #F28123; color: #fff;">Search
                    </button>
                </form>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12">
                <form id="category_form">
                    <div class="product-filters">
                        <!-- 지역별 검색 -->
                        <ul id="ingredients1_li" name="ingredients1_li">
                            <li class="${ingredients1 == null || ingredients1 eq '' ? 'active' : ''}" data-filter="">
                                재료별
                            </li>
                            <li class="${ingredients1 eq '소고기' ? 'active' : ''}" data-filter="소고기">소고기</li>
                            <li class="${ingredients1 eq '돼지고기' ? 'active' : ''}" data-filter="돼지고기">돼지고기</li>
                            <li class="${ingredients1 eq '닭고기' ? 'active' : ''}" data-filter="닭고기">닭고기</li>
                            <li class="${ingredients1 eq '생선' ? 'active' : ''}" data-filter="생선">생선</li>
                            <li class="${ingredients1 eq '오징어' ? 'active' : ''}" data-filter="오징어">오징어</li>
                            <li class="${ingredients1 eq '면' ? 'active' : ''}" data-filter="면">면</li>
                            <li class="${ingredients1 eq '떡' ? 'active' : ''}" data-filter="떡">떡</li>
                            <li class="${ingredients1 eq '김치' ? 'active' : ''}" data-filter="김치">김치</li>
                        </ul>
                        <!-- 종류별 검색 -->
                        <ul id="type_li" name="type_li">
                            <li class="${type == null || type eq ''? 'active' : ''}" data-filter="">종류별</li>
                            <li class="${type eq '한식' ? 'active' : ''}" data-filter="한식">한식</li>
                            <li class="${type eq '양식' ? 'active' : ''}" data-filter="양식">양식</li>
                            <li class="${type eq '중식' ? 'active' : ''}" data-filter="중식">중식</li>
                            <li class="${type eq '월남식' ? 'active' : ''}" data-filter="월남식">월남식</li>
                            <li class="${type eq '일식' ? 'active' : ''}" data-filter="일식">일식</li>
                            <li class="${type eq '카자흐식' ? 'active' : ''}" data-filter="카자흐식">카자흐식</li>
                            <li class="${type eq '기타' ? 'active' : ''}" data-filter="기타">기타</li>
                        </ul>
                    </div>
                    <input type="hidden" id="ingredients1" name="ingredients1" value="${ingredients1}">
                    <input type="hidden" id="type" name="type" value="${type}">
                </form>
            </div>
        </div>

        <section class="product spad">
            <div class="container">
                <div class="row">
                    <div class="col-lg-8">
                        <div class="trending__product">
                            <div class="row">
                                <div class="col-lg-8 col-md-8 col-sm-8">
                                    <div class="section-title">
                                        <h4>ALL Recipes</h4>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <c:forEach var="obj" items="${recipeList}">
                                    <div class="col-lg-4 col-md-6 col-sm-6">
                                        <div class="product__item">
                                            <a href="/recipe/detail?recipepin=${obj.recipepin}"
                                               data-target="#target${obj.recipepin}">
                                                <div class="product__item__pic set-bg"
                                                     data-setbg="/uimg/${obj.thumbnailimg}">
                                                </div>
                                            </a>
                                            <div class="product__item__text">
                                                <ul>
                                                    <li>Active</li>
                                                    <li>Movies</li>
                                                </ul>
                                                <h5 style="text-align: center;">
                                                    <a href="/recipe/detail?recipepin=${obj.recipepin}">${obj.recipetitle}</a>
                                                </h5>
                                            </div>
                                        </div>
                                    </div>
                                </c:forEach>
                            </div>

                            <!-- pagination start -->
                            <div class="row">
                                <div class="col-lg-12 text-center">
                                    <div class="pagination-wrap">
                                        <ul>
                                            <c:choose>
                                                <c:when test="${cpage.getPrePage() != 0}">
                                                    <li class="pagination-wrap">
                                                        <a href="/recipe/all?pageNo=${cpage.getPrePage()}"
                                                           aria-label="Previous">
                                                            <span>Prev</span>
                                                        </a>
                                                    </li>
                                                </c:when>
                                                <c:otherwise>
                                                    <li class="pagination-wrap disabled">
                                                        <a href="#" aria-label="Previous">
                                                            <span>Prev</span>
                                                        </a>
                                                    </li>
                                                </c:otherwise>
                                            </c:choose>

                                            <c:forEach begin="${cpage.getNavigateFirstPage() }"
                                                       end="${cpage.getNavigateLastPage() }" var="page">
                                                <c:choose>
                                                    <c:when test="${cpage.getPageNum() == page}">
                                                        <li class="pagination-wrap active">
                                                            <a class="pagination-wrap active"
                                                               href="/recipe/all?pageNo=${page}">${page}</a>
                                                        </li>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <li>
                                                            <a href="/recipe/all?pageNo=${page}">${page}</a>
                                                        </li>
                                                    </c:otherwise>
                                                </c:choose>
                                            </c:forEach>

                                            <c:choose>
                                                <c:when test="${cpage.getNextPage() != 0}">
                                                    <li class="pagination-wrap">
                                                        <a href="/recipe/all?pageNo=${cpage.getNextPage()}"
                                                           aria-label="Next">
                                                            <span>Next</span>
                                                        </a>
                                                    </li>
                                                </c:when>
                                                <c:otherwise>
                                                    <li class="pagination-wrap disabled">
                                                        <a href="#" aria-label="Next">
                                                            <span>Next</span>
                                                        </a>
                                                    </li>
                                                </c:otherwise>
                                            </c:choose>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                            <!-- pagination end -->


                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6 col-sm-8">
                        <div class="product__sidebar">
                            <div class="product__sidebar__view">
                                <div class="section-title">
                                    <h5>Top Views</h5>
                                </div>
                                <ul class="filter__controls">
                                    <li class="active" data-filter="*">Day</li>
                                    <li data-filter=".week">Week</li>
                                    <li data-filter=".month">Month</li>
                                    <li data-filter=".years">Years</li>
                                </ul>
                                <div class="filter__gallery">
                                    <div
                                            class="product__sidebar__view__item set-bg mix day years"
                                            data-setbg="/img/sidebar/tv-1.jpg"
                                    >
                                        <div class="ep">18 / ?</div>
                                        <div class="view"><i class="fa fa-eye"></i> 9141</div>
                                        <h5><a href="#">Boruto: Naruto next generations</a></h5>
                                    </div>
                                    <div
                                            class="product__sidebar__view__item set-bg mix month week"
                                            data-setbg="/img/sidebar/tv-2.jpg"
                                    >
                                        <div class="ep">18 / ?</div>
                                        <div class="view"><i class="fa fa-eye"></i> 9141</div>
                                        <h5>
                                            <a href="#">The Seven Deadly Sins: Wrath of the Gods</a>
                                        </h5>
                                    </div>
                                    <div
                                            class="product__sidebar__view__item set-bg mix week years"
                                            data-setbg="/img/sidebar/tv-3.jpg"
                                    >
                                        <div class="ep">18 / ?</div>
                                        <div class="view"><i class="fa fa-eye"></i> 9141</div>
                                        <h5>
                                            <a href="#"
                                            >Sword art online alicization war of underworld</a
                                            >
                                        </h5>
                                    </div>
                                    <div
                                            class="product__sidebar__view__item set-bg mix years month"
                                            data-setbg="/img/sidebar/tv-4.jpg"
                                    >
                                        <div class="ep">18 / ?</div>
                                        <div class="view"><i class="fa fa-eye"></i> 9141</div>
                                        <h5>
                                            <a href="#"
                                            >Fate/stay night: Heaven's Feel I. presage flower</a
                                            >
                                        </h5>
                                    </div>
                                    <div
                                            class="product__sidebar__view__item set-bg mix day"
                                            data-setbg="/img/sidebar/tv-5.jpg"
                                    >
                                        <div class="ep">18 / ?</div>
                                        <div class="view"><i class="fa fa-eye"></i> 9141</div>
                                        <h5>
                                            <a href="#">Fate stay night unlimited blade works</a>
                                        </h5>
                                    </div>
                                </div>
                            </div>
                            <div class="product__sidebar__comment">
                                <div class="section-title">
                                    <h5>New Comment</h5>
                                </div>
                                <div class="product__sidebar__comment__item">
                                    <div class="product__sidebar__comment__item__pic">
                                        <img src="/img/sidebar/comment-1.jpg" alt=""/>
                                    </div>
                                    <div class="product__sidebar__comment__item__text">
                                        <ul>
                                            <li>Active</li>
                                            <li>Movie</li>
                                        </ul>
                                        <h5>
                                            <a href="#">The Seven Deadly Sins: Wrath of the Gods</a>
                                        </h5>
                                        <span><i class="fa fa-eye"></i> 19.141 Viewes</span>
                                    </div>
                                </div>
                                <div class="product__sidebar__comment__item">
                                    <div class="product__sidebar__comment__item__pic">
                                        <img src="/img/sidebar/comment-2.jpg" alt=""/>
                                    </div>
                                    <div class="product__sidebar__comment__item__text">
                                        <ul>
                                            <li>Active</li>
                                            <li>Movie</li>
                                        </ul>
                                        <h5><a href="#">Shirogane Tamashii hen Kouhan sen</a></h5>
                                        <span><i class="fa fa-eye"></i> 19.141 Viewes</span>
                                    </div>
                                </div>
                                <div class="product__sidebar__comment__item">
                                    <div class="product__sidebar__comment__item__pic">
                                        <img src="/img/sidebar/comment-3.jpg" alt=""/>
                                    </div>
                                    <div class="product__sidebar__comment__item__text">
                                        <ul>
                                            <li>Active</li>
                                            <li>Movie</li>
                                        </ul>
                                        <h5><a href="#">Kizumonogatari III: Reiket su-hen</a></h5>
                                        <span><i class="fa fa-eye"></i> 19.141 Viewes</span>
                                    </div>
                                </div>
                                <div class="product__sidebar__comment__item">
                                    <div class="product__sidebar__comment__item__pic">
                                        <img src="/img/sidebar/comment-4.jpg" alt=""/>
                                    </div>
                                    <div class="product__sidebar__comment__item__text">
                                        <ul>
                                            <li>Active</li>
                                            <li>Movie</li>
                                        </ul>
                                        <h5><a href="#">Monogatari Series: Second Season</a></h5>
                                        <span><i class="fa fa-eye"></i> 19.141 Viewes</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </div>
</div>

</body>