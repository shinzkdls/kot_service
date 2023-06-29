<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<!doctype html>
<html lang="kor">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <title>chatting with AI</title>
</head>
<style>
    * {
        padding: 0;
        margin: 0;
        box-sizing: border-box;
    }

    a {
        text-decoration: none;
    }
    body{
        overflow-y: scroll;
        height: 100%;
    }

    .wrap {
        padding: 40px 0;
        background-color: #A8C0D6;
        min-height: 85vh;
    }

    .wrap .chat {
        display: flex;
        align-items: flex-start;
        padding: 0px 20px 20px 20px;
    }

    .wrap .chat .icon,img {
        position: relative;
        overflow: hidden;
        width: 50px;
        height: 50px;
        border-radius: 50%;
        background-color: #eee;
    }

    .wrap .chat .icon i {
        position: absolute;
        top: 10px;
        left: 50%;
        font-size: 2.5rem;
        color: #aaa;
        transform: translateX(-50%);
    }

    .wrap .chat .textbox {
        position: relative;
        display: inline-block;
        max-width: calc(100% - 70px);
        padding: 10px;
        margin-top: 7px;
        font-size: 13px;
        border-radius: 10px;
    }

    .wrap .chat .textbox::before {
        position: absolute;
        display: block;
        top: 0;
        font-size: 1.5rem;
    }

    .wrap .received .textbox {
        margin-left: 20px;
        background-color: #ddd;
    }

    .wrap .received .textbox::before {
        left: -15px;
        content: "◀";
        color: #ddd;
    }

    .wrap .sent {
        flex-direction: row-reverse;
    }

    .wrap .sent .textbox {
        margin-right: 20px;
        background-color: #F9EB54;
    }
    .wrap .sent .textbox::before {
        right: -15px;
        content: "▶";
        color: #F9EB54;
    }
    .form-container {
        display: flex;
        flex-direction: row;
        align-items: center;
        justify-content: center;
        margin-top: 20px;
        height:60px;
        position: sticky;
    }
    .test {
        position: relative;
    }

    /* Style the input field */
    .form-container input[type=text] {
        width: 70%;
        padding: 12px;
        border: none;
        border-radius: 25px;
        outline: none;
        font-size: 16px;
        background-color: #f1f1f1;
        margin-right: 10px;
    }

    /* Style the submit button */
    .form-container button {
        width: 20%;
        background-color: #4CAF50;
        color: white;
        padding: 12px;
        border: none;
        border-radius: 25px;
        cursor: pointer;
        font-size: 16px;
    }

    /* Add a hover effect to the button */
    .form-container button:hover {
        opacity: 0.8;
    }
    .time {
        font-size: 12px;
        color: #777;
    }

</style>

<script>
    let chatGPT = {
        init:function(){
            $("#questionInput").keypress(function(event) {
                // enter 시에도 실행
                if (event.which === 13) {
                    event.preventDefault();
                    scrollToBottom();
                    $("#sendBtn").click();
                }
            });


            $("#sendBtn").click(function () {
                scrollToBottom();
                // SEND 버튼을 누르면 대답 가져오기
                var question = $('#questionInput').val(); // 질문 내용 가져오기

                // 질문을 채팅창에 추가
                var senderName = "You"; // 사용자 이름
                var senderMessage = question; // 질문 내용
                var senderTime = new Date().toLocaleTimeString(); // 현재 시간
                var isSender = true; // 사용자가 보낸 메시지 여부

                var chatMessageHtml = createChatMessage(senderName, senderMessage, senderTime, isSender);

                scrollToBottom();
                $('.wrap').append(chatMessageHtml);

                // 스크롤 맨 아래로 이동
                scrollToBottom();

                // 답변 요청을 서버에 보내고 처리
                $.ajax({
                    url: '/askToGPT?q='+question,
                    success: function (data) {
                        var answer = data; // 첫 번째 대답 가져오기
                        var time2 = new Date().toLocaleTimeString(); // 현재 시간

                        // 답변을 채팅창에 추가
                        var receiverName = "Chatbot"; // 챗봇 이름
                        var receiverMessage = answer; // 답변 내용
                        var receiverTime = time2; // 답변 시간
                        var isSender = false; // 사용자가 보낸 메시지 여부

                        var chatMessageHtml = createChatMessage(receiverName, receiverMessage, receiverTime, isSender);
                        scrollToBottom();
                        $('.wrap').append(chatMessageHtml);

                        // 스크롤 맨 아래로 이동
                        scrollToBottom();

                    },
                    error: function() {
                        console.log('error');
                        hideLoading();
                    }
                });

                // 질문 입력 필드 비우기
                $('#questionInput').val('');
            });
        }
    }
    $(function(){
        chatGPT.init();
    })

    // 채팅 메시지 생성 함수
    function createChatMessage(senderName, message, time, isSender) {
        let containerClass = isSender ? "sent" : "received";
        let profile = !isSender ? '<div class="icon"><i class="fa fa-user"></i></div>':(${logincust!=null})? '<img src="/uimg/${logincust.custid}_profileimg.jpg">':'<div class="icon"><i class="fa fa-user"></i></div>';
        let messageHtml = '<div class="chat '+containerClass+'">'+profile+'<div class="textbox">'+message+'<span class="time"><br>'+time+'</span></div></div>';

        return messageHtml;
    }
    // 화면 하단이동 함수
    function scrollToBottom(){
        $('body').animate({
            scrollTop: $('body')[0].scrollHeight
        }, 1000);
    };

</script>
<body>

<div class="wrap">
    <div class="chat received">
        <div class="icon"><i class="fa fa-user"></i></div>
        <div class="textbox">안녕하세요. 반갑습니다. chat GPT입니다. <span class="time"><br>
                    <script>
                        document.write(new Date().toLocaleTimeString());
                    </script>
            </span>
        </div>
    </div>

</div>
<div class="test">
    <div class="form-container">
        <input id="questionInput" type="text" placeholder="Type your message...">
        <button id="sendBtn" type="button">Send</button>
    </div>
</div>



</body>
</html>