<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>

<script>

</script>
<c:choose>
    <c:when test="${logincust != null && logincust.custid == mypagecust.custid}">
        <!-- Normal Breadcrumb Begin -->
        <a href="/apply/profilemodify">
            <c:choose>
                <c:when test="${mypagecust.profileimgname == null || mypagecust.profileimgname ==''}">
                    <section class="normal-breadcrumb set-bg" data-setbg="/img/basic_profile.png"
                             style="width: 300px; margin: auto; border-radius: 50%; border: 5px solid #f28123; background-size: cover">
                    </section>
                </c:when>
                <c:otherwise>
                    <section class="normal-breadcrumb set-bg" data-setbg="/uimg/${mypagecust.profileimgname}"
                             style="width: 300px; margin: auto; border-radius: 50%; border: 5px solid #f28123; background-size: cover">
                    </section>
                </c:otherwise>
            </c:choose>
        </a>
    </c:when>
    <c:otherwise>
        <c:choose>
            <c:when test="${mypagecust.profileimgname == null || mypagecust.profileimgname ==''}">
                <section class="normal-breadcrumb set-bg" data-setbg="/img/basic_profile.png"
                         style="width: 300px; margin: auto; border-radius: 50%; border: 5px solid #f28123; background-size: cover;  position: relative;">
                    <c:choose>
                        <c:when test="${logincust == null}">
                            <a href="/login">
                                <input type=button class="btn" value="Subscribe"
                                       style="background-color: #f28123; font-weight: bold; color: #FFFFFF;
                           position: absolute; bottom: 0; left: 50%; transform: translateX(-50%); margin-bottom: 10px;">
                            </a>
                        </c:when>
                        <c:otherwise>
                            <c:choose>
                                <c:when test="${substatus == 1}">
                                    <a href="/apply/delsubscribe?custpin=${logincust.custpin}&subcustid=${mypagecust.custid}">
                                        <input type=button class="btn" value="Subscribe"
                                               style="background-color: #f28123; font-weight: bold; color: #FFFFFF;
                           position: absolute; bottom: 0; left: 50%; transform: translateX(-50%); margin-bottom: 10px;">
                                    </a>
                                </c:when>
                                <c:otherwise>
                                    <a href="/apply/addsubscribe?custpin=${logincust.custpin}&subcustid=${mypagecust.custid}">
                                        <input type=button class="btn" value="Subscribe"
                                               style="background-color: #b7b7b7; font-weight: bold; color: #FFFFFF;
                           position: absolute; bottom: 0; left: 50%; transform: translateX(-50%); margin-bottom: 10px;">
                                    </a>
                                </c:otherwise>
                            </c:choose>
                        </c:otherwise>
                    </c:choose>
                </section>
            </c:when>
            <c:otherwise>
                <section class="normal-breadcrumb set-bg" data-setbg="/uimg/${mypagecust.profileimgname}"
                         style="width: 300px; margin: auto; border-radius: 50%; border: 5px solid #f28123; background-size: cover;  position: relative;">
                    <c:choose>
                        <c:when test="${logincust == null}">
                            <a href="/login">
                                <input type=button class="btn" value="Subscribe"
                                       style="background-color: #f28123; font-weight: bold; color: #FFFFFF;
                           position: absolute; bottom: 0; left: 50%; transform: translateX(-50%); margin-bottom: 10px;">
                            </a>
                        </c:when>
                        <c:otherwise>
                            <c:choose>
                                <c:when test="${substatus == 1}">
                                    <a href="/apply/delsubscribe?custpin=${logincust.custpin}&subcustid=${mypagecust.custid}">
                                        <input type=button class="btn" value="Subscribe"
                                               style="background-color: #f28123; font-weight: bold; color: #FFFFFF;
                           position: absolute; bottom: 0; left: 50%; transform: translateX(-50%); margin-bottom: 10px;">
                                    </a>
                                </c:when>
                                <c:otherwise>
                                    <a href="/apply/addsubscribe?custpin=${logincust.custpin}&subcustid=${mypagecust.custid}">
                                        <input type=button class="btn" value="Subscribe"
                                               style="background-color: #b7b7b7; font-weight: bold; color: #FFFFFF;
                           position: absolute; bottom: 0; left: 50%; transform: translateX(-50%); margin-bottom: 10px;">
                                    </a>
                                </c:otherwise>
                            </c:choose>
                        </c:otherwise>
                    </c:choose>
                </section>
            </c:otherwise>
        </c:choose>
    </c:otherwise>
</c:choose>
<!-- Anime Section Begin -->
<section class="anime-details spad">
    <div class="container">
        <div class="row">
            <div class="col-lg-8 col-md-8">
                <div class="anime__details__review">
                    <div class="section-title">
                        <h5>
                            <c:choose>
                                <c:when test="${mypagecust.nickname == null || mypagecust.nickname ==''}">
                                    ${mypagecust.custid}
                                </c:when>
                                <c:otherwise>
                                    ${mypagecust.nickname}
                                </c:otherwise>
                            </c:choose>
                            's Subscribe List</h5>
                    </div>
                    <c:forEach var="obj" items="${mysubscribelist}">
                        <div class="anime__review__item">
                            <div class="anime__review__item__pic">
                                <c:choose>
                                    <c:when test="${obj.subcustprofileimgname == null || obj.subcustprofileimgname ==''}">
                                        <a href="/apply/mypage?custid=${obj.subcustid}">
                                            <img src="/img/basic_profile.png" alt=""
                                                 style="width: 80px; height: 80px">
                                        </a>
                                    </c:when>
                                    <c:otherwise>
                                        <a href="/apply/mypage?custid=${obj.subcustid}">
                                            <img src="/uimg/${obj.subcustprofileimgname}" alt=""
                                                 style="width: 80px; height: 80px">
                                        </a>
                                    </c:otherwise>
                                </c:choose>
                            </div>
                            <a href="/apply/mypage?custid=${obj.subcustid}" style="text-decoration: none">
                                <div class="anime__review__item__text">
                                    <c:choose>
                                        <c:when test="${obj.subcustnickname == null || obj.subcustnickname ==''}">
                                            <h6>${obj.subcustid}</h6>
                                        </c:when>
                                        <c:otherwise>
                                            <h6>${obj.subcustnickname}</h6>
                                        </c:otherwise>
                                    </c:choose>
                                    <c:choose>
                                        <c:when test="${obj.subcustintroduction == null || obj.subcustintroduction ==''}">
                                            <h6>등록된 자기소개가 없습니다.</h6>
                                        </c:when>
                                        <c:otherwise>
                                            <h6>${obj.subcustintroduction}</h6>
                                        </c:otherwise>
                                    </c:choose>
                                </div>
                            </a>
                        </div>
                    </c:forEach>

                </div>
            </div>
            <div class="col-lg-4 col-md-4">
                <div class="anime__details__sidebar">
                    <div class="section-title">
                        <h5><c:choose>
                            <c:when test="${mypagecust.nickname == null || mypagecust.nickname ==''}">
                                ${mypagecust.custid}
                            </c:when>
                            <c:otherwise>
                                ${mypagecust.nickname}
                            </c:otherwise>
                        </c:choose>
                            's Recipe List</h5>
                    </div>
                    <c:forEach var="obj" items="${myrecipelist}">
                        <div class="product__sidebar__view__item set-bg" data-setbg="/uimg/${obj.thumbnailimg}">
                            <h5>
                                <a href="/recipe/detail?recipepin=${obj.recipepin}"
                                   style="padding: 5px; background-color: rgba(0,0,0, 0.5); border-radius: 5px;"
                                >${obj.recipetitle}</a>
                            </h5>
                        </div>
                    </c:forEach>
                </div>

                <div class="anime__details__sidebar">
                    <div class="section-title">
                        <h5><c:choose>
                            <c:when test="${mypagecust.nickname == null || mypagecust.nickname ==''}">
                                ${mypagecust.custid}
                            </c:when>
                            <c:otherwise>
                                ${mypagecust.nickname}
                            </c:otherwise>
                        </c:choose>
                            's Like List</h5>
                    </div>
                    <c:forEach var="obj" items="${mylikerecipelist}">
                        <div class="product__sidebar__view__item set-bg" data-setbg="/uimg/${obj.thumbnailimg}">
                            <h5>
                                <a href="/recipe/detail?recipepin=${obj.recipepin}"
                                   style="padding: 5px; background-color: rgba(0,0,0, 0.5); border-radius: 5px;">${obj.recipetitle}</a>
                            </h5>
                        </div>
                    </c:forEach>
                </div>

                <div class="anime__details__sidebar">
                    <div class="section-title">
                        <h5><c:choose>
                            <c:when test="${mypagecust.nickname == null || mypagecust.nickname ==''}">
                                ${mypagecust.custid}
                            </c:when>
                            <c:otherwise>
                                ${mypagecust.nickname}
                            </c:otherwise>
                        </c:choose>
                            's Join Class List</h5>
                    </div>
                    <c:forEach var="obj" items="${myclasslist}">
                        <div class="product__sidebar__view__item set-bg" data-setbg="/uimg/${obj.thumbnailimg}">
                            <h5>
                                <a href="/class/detail?class=${obj.classpin}"
                                   style="padding: 5px; background-color: rgba(0,0,0, 0.5); border-radius: 5px;"
                                >${obj.classtitle}</a>
                            </h5>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Anime Section End -->

