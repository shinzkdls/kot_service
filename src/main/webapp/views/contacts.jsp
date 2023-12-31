<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>

<script>
    let contact_form = {
        init: function () {
            $('#contact_btn').prop("disabled", true);
            $('#contact_btn').css('background', '#b7b7b7');
            $("#contact_btn").click(function () {
                contact_form.send();
            });

            $('input, textarea').keyup(function () {
                var email = $('#email').val();
                var contacttitle = $('#contacttitle').val();
                var contactcontent = $('#contactcontent').val();
                if (contacttitle != '' && contactcontent != '' && email != '') {
                    $('#contact_btn').prop("disabled", false);
                    $('#contact_btn').css('background', '#e53637');
                } else {
                    $('#contact_btn').prop("disabled", true);
                    $('#contact_btn').css('background', '#b7b7b7');
                }
            });
        },
        send: function () {
            var email = $('#email').val();
            var contacttitle = $('#contacttitle').val();
            var contactcontent = $('#contactcontent').val();
            var emailCheck = document.getElementById("email");
            if (contacttitle == '') {
                $('#email').focus();
                return;
            }
            if (contactcontent == '') {
                $('#email').focus();
                return;
            }
            if (email == '') {
                $('#email').focus();
                return;
            }
            if (!(emailCheck.checkValidity())) {
                alert("유효하지 않은 이메일 주소입니다.");
                return;
            }
            $("#contact_form").attr({
                "action": "/contacts/contactimpl",
                "method": "post"
            });
            $("#contact_form").submit();
        }
    }

    $(function () {
        $("#contact").addClass("navActive");
        contact_form.init();
    });
</script>


<!-- Signup Section Begin -->
<section class="signup spad">
    <div class="container">
        <div class="row">
            <div class="col-lg-6">
                <div class="login__form" style=" padding-left: 0">
                    <h3 style="color: black">Contact</h3>
                    <form id="contact_form">
                        <div class="input__item" style="width: 100%">
                            <input type="text" placeholder="Your ID" name="custid" id="custid"
                                   value="${logincust.custid}" readonly>
                            <span class="icon_profile"></span>
                        </div>
                        <div class="input__item" style="width: 100%">
                            <input type="email" placeholder="Email address" name="email" id="email"
                                   value="${logincust.email}">
                            <span class="icon_mail"></span>
                        </div>
                        <div class="input__item" style="width: 100%">
                            <input type="text" placeholder="Title" name="contacttitle" id="contacttitle">
                            <span class="icon_comment"></span>
                        </div>
                        <div class="input__item" id="textareazone" style="width: 100%">
                            <textarea placeholder="Input content" name="contactcontent" id="contactcontent"
                                      style="width: 100%; border: none; padding: 10px;"
                                      rows="5"></textarea>
                        </div>
                        <input type="hidden" name="custname" value="${logincust.custname}">
                        <input type="hidden" name="custpin" value="${logincust.custpin}">
                        <button type="button" class="site-btn" id="contact_btn" style="margin-top: 0">Contact Now
                        </button>
                    </form>
                </div>
            </div>
            <div class="col-lg-6">
                <div class="login__form" style="padding-left: 0px;">
                    <h3 style="color: black">Answer</h3>
                    <div style=" max-height: 370px; overflow-y: scroll; overflow-x: hidden">
                        <table class="table table-bordered" id="dataTable"
                               style="background-color: #FFFFFF; border: none;">
                            <thead>
                            <tr style="background-color: #f28123; color: #FFFFFF">
                                <th style="padding-left: 50px">Title</th>
                                <th style="text-align: center">Date</th>
                                <th style="text-align: center">Answer</th>
                            </tr>
                            <colgroup>
                                <col style="width: 68%;">
                                <col style="width: 22%;">
                                <col style="width: 10%;">
                            </colgroup>
                            </thead>
                            <tbody>
                            <c:forEach var="obj" items="${mycontactlist}">
                                <tr>
                                    <c:choose>
                                        <c:when test="${obj.answer=='Y'}">
                                            <td class="input__item"><img style="width: 20px" src="/img/answer.png"><a
                                                    href="/contacts/contact_detail?contactpin=${obj.contactpin}"
                                                    style="color: black; padding-left: 30px">${obj.contacttitle}</a>
                                            </td>
                                        </c:when>
                                        <c:otherwise>
                                            <td class="input__item"><img style="width: 20px" src="/img/noanswer.png"><a
                                                    href="/contacts/contact_detail?contactpin=${obj.contactpin}"
                                                    style="color: black; padding-left: 30px">${obj.contacttitle}</a>
                                            </td>
                                        </c:otherwise>
                                    </c:choose>
                                    <td style="text-align: center;font-size: 15px">
                                        <fmt:formatDate
                                                value="${obj.contactdate}" pattern="yy-MM-dd"/></td>
                                    <td style="text-align: center">${obj.answer}</td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                        <%--                    <jsp:include page="page.jsp"/>--%>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Signup Section End -->

<style>
    #textareazone::before {
        display: none;
    }

    #dataTable td {
        border-top: 15px solid #f9f5e5;
        border-bottom: none;
        border-right: none;
        border-left: none;
    }

    #dataTable th {
        border: none;
    }

</style>