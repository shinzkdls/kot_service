<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<style>
    #chat {
        background-color: white;
        border-radius: 10px;
        width: 70%;
    }

    .chat-container {

        flex-direction: column;
        align-items: center;
        justify-content: center;
        padding: 10px;
    }

    .message {
        padding: 7px 12px;
        margin-bottom: 10px;
        max-width: 500px;
        border-radius: 20px;
    }

    .received {
        background-color: #f1f0f0;
        text-align: left;
    }

    .sent {
        background-color: #e1f5fe;
        text-align: right;
    }

    .time {
        font-size: 12px;
        color: #777;
    }

</style>
<div class="container" >
    <section id="chat">
        <div class="chat-container " ></div>

        <input class="col-lg-11" type="text" style="width: 70%;" placeholder="여기에 질문하실 내용을 적어주세요" id="questionInput">
        <button class="col-lg-1" style="background-color: orange;" type="button" id="sendBtn" >버튼</button>
    </section>

</div>


<script>
    $(document).ready(function () {

        // SEND 버튼을 누르면 대답 가져오기
        $("#sendBtn").click(function () {
            var question = $('#questionInput').val(); // 질문 내용 가져오기

            // 질문을 채팅창에 추가
            var senderName = "You"; // 사용자 이름
            var senderMessage = question; // 질문 내용
            var senderTime = new Date().toLocaleTimeString(); // 현재 시간
            var isSender = true; // 사용자가 보낸 메시지 여부

            var chatMessageHtml = createChatMessage(senderName, senderMessage, senderTime, isSender);
            $('.chat-container').append(chatMessageHtml);

            // 스크롤 맨 아래로 이동
            var conversationSection = $('.container');
            conversationSection.scrollTop(conversationSection.prop("scrollHeight"));

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
                    $('.chat-container').append(chatMessageHtml);

                    // 스크롤 맨 아래로 이동
                    conversationSection.scrollTop(conversationSection.prop("scrollHeight"));

                    // 답변 내용이 화면에 다 나오지 않을 경우 스크롤을 아래로 이동
                    var itemMsgHeight = $('.item_msg').last().outerHeight();
                    var contentSmsHeight = $('.content_sms').last().outerHeight();
                    if (itemMsgHeight > contentSmsHeight) {
                        conversationSection.scrollTop(conversationSection.scrollTop() + itemMsgHeight - contentSmsHeight);
                    }
                },
                error: function() {
                    console.log('error');
                    hideLoading();
                }
            });

            // 질문 입력 필드 비우기
            $('#questionInput').val('');
        });

        // 채팅 메시지 생성 함수
        function createChatMessage(senderName, message, time, isSender) {
            var containerClass = isSender ? "sent" : "received";
            var alignClass = isSender ? "justify-content-end" : "justify-content-start";

            var messageHtml = '<div class="'+alignClass+ 'mb-4">'+
                    '<div class="message '+containerClass+'">'+
                        message+'<span class="time"><br>'+time+'</span></div></div>';

            return messageHtml;
        }


    });


</script>