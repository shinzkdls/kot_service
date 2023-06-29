<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">

    <script src="/webjars/sockjs-client/sockjs.min.js"></script>
    <script src="/webjars/stomp-websocket/stomp.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">

    <title>chatting with Admin</title>
</head>
<body>

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
        padding: 10px 0;
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
    #header {
        display: flex;
        align-items: center;
        height: 40px;
        padding: 5px 0 0 15px;
        background-color: #A8C0D9;
    }

</style>

<script>
    let websocket = {
        id:null,
        stompClient:null,
        init:function(){
            this.id = $('#cust_id').text();
            if(this.id==""){
                var answer = '<h4>로그아웃 상태입니다.</h4>' ;// 첫 번째 대답 가져오기
                answer += "로그인이 되어있지 않으면 전체 공지만 볼 수 있고 답변은 받을 수 없습니다. <a href='http://127.0.0.1/login/' target='_blank'>로그인</a> 후 이용해 주세요."; // 첫 번째 대답 가져오기
                var time2 = new Date().toLocaleTimeString(); // 현재 시간
                var receiverMessage = answer; // 답변 내용
                var receiverTime = time2; // 답변 시간
                var isSender = false; // 사용자가 보낸 메시지 여부
                var chatMessageHtml = createChatMessage(receiverMessage, receiverTime, isSender);
                $('.wrap').append(chatMessageHtml);
            }
            $("#totext").keypress(function(event) { // enter 시에도 실행
                if (event.which === 13) {
                    event.preventDefault();
                    scrollToBottom();
                    $("#sendto").click();
                }
            });
            $("#sendto").click(function() {
                scrollToBottom();
                // SEND 버튼을 누르면 대답 가져오기
                var question = $('#totext').val(); // 질문 내용 가져오기
                // 질문을 채팅창에 추가
                var senderMessage = question; // 질문 내용
                var senderTime = new Date().toLocaleTimeString(); // 현재 시간
                var isSender = true; // 사용자가 보낸 메시지 여부
                var chatMessageHtml = createChatMessage(senderMessage, senderTime, isSender);
                scrollToBottom();
                $('.wrap').append(chatMessageHtml);
                var answer = '<h4>자동 응답입니다.</h4>' ;// 첫 번째 대답 가져오기
                answer += "기다려 주세요. 순차적으로 답변드리겠습니다. 채팅방을 나가실 경우 질문을 다시 해주세요."; // 첫 번째 대답 가져오기
                var time2 = new Date().toLocaleTimeString(); // 현재 시간
                var receiverMessage = answer; // 답변 내용
                var receiverTime = time2; // 답변 시간
                var isSender = false; // 사용자가 보낸 메시지 여부
                var chatMessageHtml = createChatMessage(receiverMessage, receiverTime, isSender);
                scrollToBottom();
                $('.wrap').append(chatMessageHtml);

                websocket.sendTo();
            });
        },
        connect:function(){
            var sid = this.id;
            var socket = new SockJS('http://127.0.0.1:8088/ws');
            this.stompClient = Stomp.over(socket);

            this.stompClient.connect({}, function(frame) {
                console.log('Connected: ' + frame);
                this.subscribe('/send', function(msg) {
                    var answer = '<h4>전체 공지입니다.</h4>' ;// 첫 번째 대답 가져오기
                    answer += JSON.parse(msg.body).content1; // 첫 번째 대답 가져오기
                    var time2 = new Date().toLocaleTimeString(); // 현재 시간

                    var receiverMessage = answer; // 답변 내용
                    var receiverTime = time2; // 답변 시간
                    var isSender = false; // 사용자가 보낸 메시지 여부

                    var chatMessageHtml = createChatMessage(receiverMessage, receiverTime, isSender);
                    scrollToBottom();
                    $('.wrap').append(chatMessageHtml);
                });
                this.subscribe('/send/to/'+sid, function(msg) {
                    var answer = JSON.parse(msg.body).content1; // 첫 번째 대답 가져오기
                    var time2 = new Date().toLocaleTimeString(); // 현재 시간

                    var receiverMessage = answer; // 답변 내용
                    var receiverTime = time2; // 답변 시간
                    var isSender = false; // 사용자가 보낸 메시지 여부

                    var chatMessageHtml = createChatMessage(receiverMessage, receiverTime, isSender);
                    scrollToBottom();
                    $('.wrap').append(chatMessageHtml);
                });
            });
        },
        sendTo:function(){
            var msg = JSON.stringify({
                'sendid' : this.id,
                'receiveid' : "admin1",
                'content1' : $('#totext').val()
            });
            $('#totext').val('');
            this.stompClient.send('/receiveto', {}, msg);
        }
    };
    $(function(){
        websocket.init();
    })

    // 채팅 메시지 생성 함수
    function createChatMessage(message, time, isSender) {
        let containerClass = isSender ? "sent" : "received";
        let profile = !isSender ? '<img src="/uimg/kbstar_profileimg.jpg">':(${logincust!=null})? '<img src="/uimg/${logincust.custid}_profileimg.jpg">':'<div class="icon"><i class="fa fa-user"></i></div>';
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
<!-- Begin Page Content -->
<div id="header">
    <div>관리자와 1:1 대화 </div>
</div>
<h1 id="cust_id" style="display: none">${logincust.custid}</h1>
<div class="wrap">
    <div class="chat received">
        <img src="/uimg/kbstar_profileimg.jpg">
        <div class="textbox">1:1 채팅을 요청하셨습니다. 채팅 내용은 저장되지 않습니다.<span class="time"><br>
                    <script>
                        document.write(new Date().toLocaleTimeString());
                    </script>
            </span>
        </div>
    </div>
</div>
</div>
<div class="test">
    <div class="form-container">
        <input id="totext" type="text" placeholder="Type your message...">
        <button id="sendto" type="button">Send</button>
    </div>
</div>
</body>
</html>