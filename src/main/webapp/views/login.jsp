<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<script>
    let login_form = {
        init: function () {
            $('#login_btn').prop("disabled", true);
            $('#login_btn').css('background', '#b7b7b7');
            $("#login_btn").click(function () {
                login_form.send();
            });
            $('input').keyup(function () {
                var custid = $('#custid').val();
                var password = $('#password').val();
                if (custid != '' && password != '') {
                    $('#login_btn').prop("disabled", false);
                    $('#login_btn').css('background', '#f28123');
                } else {
                    $('#login_btn').prop("disabled", true);
                    $('#login_btn').css('background', '#b7b7b7');
                }
            });
        },
        send: function () {
            var custid = $('#custid').val();
            var password = $('#password').val();
            $.ajax({
                url: '/loginimpl',
                data: {custid: custid, password: password},
                success: function (result) {
                    if (result == 1) {
                        $("#login_form").attr({
                            "action": "/login/loginsuccess",
                            "method": "post"
                        });
                        $("#login_form").submit();
                    } else {
                        alert("일치하는 계정 정보가 없습니다.")
                    }
                }
            });
        }
    }

    $(function () {
        login_form.init();
    });

</script>

<!-- Login Section Begin -->
<section class="login spad">
    <div class="container">
        <div class="row">
            <div class="col-lg-6">
                <div class="login__form">
                    <h3 style="color: black">Login</h3>
                    <form id="login_form">
                        <div class="input__item">
                            <input type="text" placeholder="Your ID" name="custid" id="custid" >
                            <span class="icon_profile"></span>
                        </div>
                        <div class="input__item">
                            <input type="password" placeholder="Password" name="password" id="password">
                            <span class="icon_lock"></span>
                        </div>
                        <button type="button" class="site-btn" id="login_btn">Login Now</button>
                    </form>
                    <h5 style="color: black; font-size: 15px;margin-top: 36px">Dont’t Have An
                        Account? <a href="/apply" style="color: #f28123; font-weight: bold">Sign Up!</a></h5>
                </div>
            </div>
            <div class="col-lg-6" style="display: flex; justify-content: center; align-content: center">
                <img src="/img/login.gif">
            </div>
        </div>
    </div>
</section>
<!-- Login Section End -->

