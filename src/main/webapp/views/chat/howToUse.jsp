<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<style>
    .chat-container {
        width: 300px;
        border: 1px solid #ccc;
        padding: 10px;
        overflow-y: auto;
        max-height: 300px;
    }

    .message {
        margin-bottom: 10px;
        padding: 8px;
        border-radius: 5px;
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
<div id="container">

    <div class="chat-container">
        <div class="message received">
            <p>Hello, how are you?</p>
            <span class="time">10:30 AM</span>
        </div>
        <div class="message sent">
            <p>I'm good, thank you!</p>
            <span class="time">10:32 AM</span>
        </div>
        <!-- 추가적인 메시지들을 여기에 추가할 수 있습니다 -->
    </div>

</div>

