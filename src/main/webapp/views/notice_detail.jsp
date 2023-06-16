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
                    <div class="anime__details__pic set-bg" data-setbg="/img/ager.png"
                         style="background-size: 100%; background-position: center center;">
                    </div>
                </div>
                <div class="col-lg-9">
                    <div class="anime__details__text">
                        <div class="anime__details__title">
                            <h3>${noticedetail.noticetitle}</h3>
                            <span><fmt:formatDate value="${noticedetail.noticedate}"
                                                  pattern="yyyy-MM-dd hh:mm:ss"/></span>
                        </div>
                        <div style="height: 250px">
                            <p>${noticedetail.noticecontent}</p>
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
