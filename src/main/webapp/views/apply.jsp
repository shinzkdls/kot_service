<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>

<script>
    let register_form = {
        init: function () {
            $('#register_btn').prop("disabled", true);
            $('#register_btn').css('background', '#b7b7b7');
            $("#register_btn").click(function () {
                register_form.send();
            });

            $('input').keyup(function () {
                var custid = $('#custid').val();
                var password = $('#password').val();
                var email = $('#email').val();
                if (custid != '' && password != '' && email != '') {
                    $('#register_btn').prop("disabled", false);
                    $('#register_btn').css('background', '#e53637');
                } else {
                    $('#register_btn').prop("disabled", true);
                    $('#register_btn').css('background', '#b7b7b7');
                }
            });

            $('#custid').keyup(function () {
                var txt_id = $(this).val();
                if (txt_id.length <= 4) {
                    $('#check_id').text('ID는 5글자 이상입니다.');
                    return;
                }
                $.ajax({
                    url: '/checkid',
                    data: {id: txt_id},
                    success: function (result) {
                        if (result == 0) {
                            $('#check_id').text('사용가능합니다.');
                        } else {
                            $('#check_id').text('사용불가능합니다.')
                        }
                    }
                });
            });
        },
        send: function () {
            var custid = $('#custid').val();
            var password = $('#password').val();
            var email = $('#email').val();
            var emailCheck = document.getElementById("email");
            if (custid.length <= 4) {
                $('#check_id').text('5자리 이상이어야 합니다.');
                $('#custid').focus();
                return;
            }
            if (password == '') {
                $('#password').focus();
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
            $("#register_form").attr({
                "action": "/apply/registerimpl",
                "method": "post"
            });
            $("#register_form").submit();
        }
    }

    $(function () {
        register_form.init();
    });
</script>

<!-- Signup Section Begin -->
<section class="signup spad">
    <div class="container">
        <div class="row">
            <div class="col-lg-6">
                <div class="login__form">
                    <h3 style="color: black;">Sign Up</h3>
                    <form id="register_form">
                        <div class="input__item" style="margin-bottom: 0">
                            <input type="text" placeholder="Your ID" name="custid" id="custid">
                            <span class="icon_profile"></span>
                        </div>
                        <div style="height: 20px"><span id="check_id"
                                                        style="color: #b7b7b7; margin-left: 50px; font-size: 12px"></span>
                        </div>
                        <div class="input__item">
                            <input type="password" placeholder="Password" name="password" id="password">
                            <span class="icon_lock"></span>
                        </div>
                        <div class="input__item">
                            <input type="email" placeholder="Email address" name="email" id="email">
                            <span class="icon_mail"></span>
                        </div>
                        <button type="button" class="site-btn" id="register_btn">Signup Now</button>
                    </form>
                    <h5 style="color: black;">Already have an account? <a href="/login">Log In!</a></h5>
                </div>
            </div>
            <div class="col-lg-6">
                <div class="login__social__links">
                    <h3 style="color: black;">Login With:</h3>
                    <ul>
                        <li><a href="#" class="facebook"><i class="fa fa-facebook"></i> Sign in With Facebook</a>
                        </li>
                        <li><a href="#" class="google"><i class="fa fa-google"></i> Sign in With Google</a></li>
                        <li><a href="#" class="twitter"><i class="fa fa-twitter"></i> Sign in With Twitter</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Signup Section End -->

