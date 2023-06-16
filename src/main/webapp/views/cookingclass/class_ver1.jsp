<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>


<script>
    let class_search = {
        init: function () {
            $('#search_btn').click(function () {
                $('#search_form').attr({
                    method: 'post',
                    action: '/cookingclass/search'
                });
                $('#search_form').submit();
            });
            $('#location li').click(function () {
                // 선택된 지역 값을 가져옴
                let location = $(this).data('filter');
                // let location = $(this).text();

                // 선택된 지역 값이 "*"(빈 문자열)인 경우 전체 데이터 조회
                if (location === "") {
                    location = "*";
                    // 폼을 서버로 제출
                    $('#category_form').attr({
                        method: 'post',
                        action: '/cookingclass/searchlocation'
                    });
                    $('#category_form').submit();
                } else {
                    // 선택된 지역 값을 폼에 설정
                    $('#location_input').val(location);

                    // 폼을 서버로 제출
                    $('#category_form').attr({
                        method: 'post',
                        action: '/cookingclass/searchlocation'
                    });
                    $('#category_form').submit();
                }
            });
            $('#type li').click(function () {
                let type = $(this).data('filter');
                // let type = $(this).text();

                if (type === "") {
                    type = "*";
                    // 폼을 서버로 제출
                    $('#category_form').attr({
                        method: 'post',
                        action: '/cookingclass/searchtype'
                    });
                    $('#category_form').submit();
                } else {
                    // 선택된 지역 값을 폼에 설정
                    $('#type_input').val(type);

                    // 폼을 서버로 제출
                    $('#type_form').attr({
                        method: 'post',
                        action: '/cookingclass/searchtype'
                    });
                    $('#category_form').submit();
                }
            });
        }
    };
    $(document).ready(function () {
        class_search.init();
        $('.product-filters ul li').click(function () {
            // 선택된 li 요소에 active 클래스를 추가하고 다른 형제 요소들의 active 클래스를 제거합니다.
            $(this).addClass('active').siblings().removeClass('active');
        });
    });
    $(function () {
        class_search.init();
    })
</script>

<!-- Normal Breadcrumb Begin -->
<section class="normal-breadcrumb set-bg" data-setbg="/uimg/classmain.jpg">
    <div class="container">
        <div class="row">
            <div class="col-lg-12 text-center">
                <div class="normal__breadcrumb__text">
                    <h2>COOKING CLASS</h2>
                    <p>Welcome to the cookingclass</p>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Normal Breadcrumb End -->

<!-- products -->
<div class="product-section mt-50 mb-150">
    <div class="container">
        <div class="row">
            <div class="col" style="margin-bottom: 30px">
                <form id="search_form" class="d-flex" style="float: right;">
                    <input class="form-control me-2" type="text" placeholder="Search by class name"
                           aria-label="Search"
                           name="classtitle" id="classtitle" value="${classtitle}">
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
                        <ul id="location" name="location">
                            <li class="${location eq '*' ? 'active' : ''}" data-filter="*">지역별</li>
                            <li class="${location eq '서울' ? 'active' : ''}" data-filter="서울">서울</li>
                            <li class="${location eq '인천' ? 'active' : ''}" data-filter="인천">인천</li>
                            <li class="${location eq '경기' ? 'active' : ''}" data-filter="경기">경기</li>
                            <li class="${location eq '대전' ? 'active' : ''}" data-filter="대전">대전</li>
                            <li class="${location eq '충청' ? 'active' : ''}" data-filter="충청">충청</li>
                            <li class="${location eq '부산' ? 'active' : ''}" data-filter="부산">부산</li>
                            <li class="${location eq '대구' ? 'active' : ''}" data-filter="대구">대구</li>
                            <li class="${location eq '울산' ? 'active' : ''}" data-filter="울산">울산</li>
                            <li class="${location eq '경상' ? 'active' : ''}" data-filter="경상">경상</li>
                            <li class="${location eq '광주' ? 'active' : ''}" data-filter="광주">광주</li>
                            <li class="${location eq '전라' ? 'active' : ''}" data-filter="전라">전라</li>
                            <li class="${location eq '강원' ? 'active' : ''}" data-filter="강원">강원</li>
                            <li class="${location eq '기타' ? 'active' : ''}" data-filter="기타">기타</li>
                        </ul>
                        <ul id="type" name="type">
                            <li class="${type eq '*' ? 'active' : ''}" data-filter="*">종류별</li>
                            <li class="${type eq '한식' ? 'active' : ''}" data-filter="#">한식</li>
                            <li class="${type eq '양식' ? 'active' : ''}" data-filter="#">양식</li>
                            <li class="${type eq '중식' ? 'active' : ''}" data-filter="#">중식</li>
                            <li class="${type eq '일식' ? 'active' : ''}" data-filter="#">일식</li>
                            <li class="${type eq '기타' ? 'active' : ''}" data-filter="#">기타</li>
                        </ul>
                    </div>
                    <input type="hidden" id="location_input" name="location" value="${location}">
                    <input type="hidden" id="type_input" name="type" value="${type}">
                </form>
            </div>
        </div>

        <div class="row product-lists">
            <c:forEach var="obj" items="${clist}">
                <div class="col-lg-4 col-md-6 text-center strawberry">
                    <div class="single-product-item">
                        <div class="product-image">
                            <a href="/cookingclass/detail"><img src="/uimg/${obj.thumbnailimg}" alt=""></a>
                        </div>
                        <h3><a href="/cookingclass/get?id=${obj.classtitle}">${obj.classtitle}</a></h3>
                        <p class="product-price">
                            <fmt:formatNumber value="${obj.amount}" type="currency"
                                              currencyCode="KRW" pattern="###,###원"/></p>
                        <a href="/cookingclass/detail" class="cart-btn"><i class="fas fa-shopping-cart"></i> 클래스 신청</a>
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
                                    <a class="pagination-wrap" href="/cookingclass/class?pageNo=${cpage.getPrePage()}"
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
                        <c:forEach begin="${cpage.getNavigateFirstPage() }" end="${cpage.getNavigateLastPage() }"
                                   var="page">
                            <c:choose>
                                <c:when test="${cpage.getPageNum() == page}">
                                    <li class="pagination-wrap active">
                                        <a class="pagination-wrap active"
                                           href="/cookingclass/class?pageNo=${page}">${page }</a>
                                    </li>
                                </c:when>
                                <c:otherwise>
                                    <li>
                                        <a class="pagination-wrap"
                                           href="/cookingclass/class?pageNo=${page}">${page }</a>
                                    </li>
                                </c:otherwise>
                            </c:choose>
                        </c:forEach>
                        <c:choose>
                            <c:when test="${cpage.getNextPage() != 0}">
                                <li class="pagination-wrap">
                                    <a class="pagination-wrap" href="/cookingclass/class?pageNo=${cpage.getNextPage()}"
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
                    </nav>
                </div>
            </div>
            <!-- pagination end -->
        </div>
    </div>
    <!-- end products -->
</div>