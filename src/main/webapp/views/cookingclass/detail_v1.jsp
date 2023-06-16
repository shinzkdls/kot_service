<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=186d9ac6e73cf3e121e11e749901f230"></script>

<!-- single article section -->
<div class="mt-50 mb-150">
    <div class="container">
        <div class="row">
            <div class="col-lg-8">
                <div class="single-article-section">
                    <div class="single-article-text">
                        <div class="single-artcile-bg">
                            <img src="/uimg/${classdetail.thumbnailimg}" alt="">
                        </div>
                        <p class="blog-meta">
                            <span class="author"><i class="fas fa-user"></i> 작성자</span>
                            <span class="date"><i class="fas fa-calendar"></i> 작성일자</span>
                        </p>
                        <h2>클래스 소개</h2>
                        <p>${classdetail.classdesc}</p>
                    </div>
                    <div class="single-article-text" id="classmap">
                        <h2>클래스 위치</h2>
                        <div id="map" style="width:500px;height:400px;"></div>
                    </div>

                    <div class="comments-list-wrap">
                        <h3 class="comment-count-title">3 Comments</h3>
                        <div class="comment-list">
                            <div class="single-comment-body">
                                <div class="comment-user-avater">
                                    <img src="/uimg/ma6.jpg" alt="">
                                </div>
                                <div class="comment-text-body">
                                    <h4>Jenny Joe <span class="comment-date">Aprl 26, 2020</span> <a href="#">reply</a>
                                    </h4>
                                    <p>Nunc risus ex, tempus quis purus ac, tempor consequat ex. Vivamus sem magna,
                                        maximus at est id, maximus aliquet nunc. Suspendisse lacinia velit a eros
                                        porttitor, in interdum ante faucibus Suspendisse lacinia velit a eros porttitor,
                                        in interdum ante faucibus.</p>
                                </div>
                                <div class="single-comment-body child">
                                    <div class="comment-user-avater">
                                        <img src="/uimg/ma4.jpg" alt="">
                                    </div>
                                    <div class="comment-text-body">
                                        <h4>Simon Soe <span class="comment-date">Aprl 27, 2020</span> <a
                                                href="#">reply</a></h4>
                                        <p>Nunc risus ex, tempus quis purus ac, tempor consequat ex. Vivamus sem magna,
                                            maximus at est id, maximus aliquet nunc. Suspendisse lacinia velit a eros
                                            porttitor, in interdum ante faucibus.</p>
                                    </div>
                                </div>
                            </div>
                            <div class="single-comment-body">
                                <div class="comment-user-avater">
                                    <img src="/uimg/ma3.jpg" alt="">
                                </div>
                                <div class="comment-text-body">
                                    <h4>Addy Aoe <span class="comment-date">May 12, 2020</span> <a href="#">reply</a>
                                    </h4>
                                    <p>Nunc risus ex, tempus quis purus ac, tempor consequat ex. Vivamus sem magna,
                                        maximus at est id, maximus aliquet nunc. Suspendisse lacinia velit a eros
                                        porttitor, in interdum ante faucibus Suspendisse lacinia velit a eros porttitor,
                                        in interdum ante faucibus.</p>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="comment-template">
                        <h4>Leave a comment</h4>
                        <p>If you have a comment dont feel hesitate to send us your opinion.</p>
                        <form action="index.html">
                            <p>
                                <input type="text" placeholder="Your Name">
                                <input type="email" placeholder="Your Email">
                            </p>
                            <p><textarea name="comment" id="comment" cols="30" rows="10"
                                         placeholder="Your Message"></textarea></p>
                            <p><input type="submit" value="Submit"></p>
                        </form>
                    </div>
                </div>
            </div>
            <div class="col-lg-4">
                <div class="sidebar-section">
                    <div class="recent-posts">
                        <h4>${classdetail.classtitle}</h4>
                    </div>
                    <div class="archive-posts">
                        <h4>클래스 요약 설명</h4>
                        <ul>
                            <li>블라블라</li>
                            <li>블라블라</li>
                        </ul>
                    </div>
                    <div class="single-product-form">
                        <form action="index.html">
                            <input type="number" placeholder="0">
                        </form>
                        <a href="cart.html" class="cart-btn"> 클래스 신청</a>
                    </div>
                    <h4>Share:</h4>
                    <ul class="product-share">
                        <li><a href=""><i class="fab fa-facebook-f"></i></a></li>
                        <li><a href=""><i class="fab fa-twitter"></i></a></li>
                        <li><a href=""><i class="fab fa-google-plus-g"></i></a></li>
                        <li><a href=""><i class="fab fa-linkedin"></i></a></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- end single article section -->
