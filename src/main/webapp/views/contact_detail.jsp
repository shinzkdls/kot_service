<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>

<!-- Anime Section Begin -->
<section class="anime-details spad">
    <div class="container">
        <div class="anime__details__content">
            <div class="row">
                <div class="col-lg-3">
                    <div class="anime__details__pic set-bg" data-setbg="/img/contact.gif"
                         style="background-size: 100%; background-position: center center;">
                    </div>
                </div>
                <div class="col-lg-9">
                    <div class="anime__details__text">
                        <c:if test="${contactdetail.answer == 'Y'}">
                            <div class="section-title">
                                <h4 style="margin-bottom: 20px">RE: ${contactdetail.contacttitle}</h4>
                                <span><fmt:formatDate value="${contactdetail.answerdate}"
                                                      pattern="yyyy-MM-dd hh:mm:ss"/></span>
                            </div>
                            <div style="height: 150px; background-color: #FFFFFF; margin-bottom: 50px; padding: 10px; border-radius: 10px; border: #b7b7b7 1px solid">
                                <p>${contactdetail.answercontent}</p>
                            </div>
                        </c:if>
                        <div class="section-title">
                            <h4 style="margin-bottom: 20px">${contactdetail.contacttitle}</h4>
                            <span><fmt:formatDate value="${contactdetail.contactdate}"
                                                  pattern="yyyy-MM-dd hh:mm:ss"/></span>
                        </div>
                        <div style="height: 150px; background-color: #FFFFFF; margin-bottom: 20px; padding: 10px;  border-radius: 10px; border: #b7b7b7 1px solid">
                            <p>${contactdetail.contactcontent}</p>
                        </div>
                        <div class="anime__details__btn">
                            <a href="/contacts" class="follow-btn">To List</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Anime Section End -->
