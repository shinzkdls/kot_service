<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<style>
        #to {
                width: 400px;
                height: 200px;
                overflow: auto;
                border: 2px solid green;
        }
</style>

<script>
        let callcenter = {
                id: null,
                stompClient: null,
                init: function () {
                        this.id = $('#adm_id').text();
                        $("#connect").click(function () {
                                callcenter.connect();
                        });
                        $("#disconnect").click(function () {
                                callcenter.disconnect();
                        });
                        $("#sendto").click(function () {
                                callcenter.sendTo();
                        });
                },
                connect: function () {
                        var sid = this.id;
                        var socket = new SockJS('${adminserver}/ws');
                        this.stompClient = Stomp.over(socket);

                        this.stompClient.connect({}, function (frame) {
                                callcenter.setConnected(true);
                                console.log('Connected: ' + frame);

                                this.subscribe('/send/to/' + sid, function (msg) {
                                        $('#target').val(JSON.parse(msg.body).sendid);
                                        $("#to").prepend(
                                                "<h4>" + JSON.parse(msg.body).sendid + ":" +
                                                JSON.parse(msg.body).content1
                                                + "</h4>");
                                });
                        });
                },
                disconnect: function () {
                        if (this.stompClient !== null) {
                                this.stompClient.disconnect();
                        }
                        callcenter.setConnected(false);
                        console.log("Disconnected");
                },
                setConnected: function (connected) {
                        if (connected) {
                                $("#status").text("Connected");
                        } else {
                                $("#status").text("Disconnected");
                        }
                },
                sendTo: function () {
                        var msg = JSON.stringify({
                                'sendid': this.id,
                                'receiveid': $('#target').val(),
                                'content1': $('#totext').val()
                        });
                        this.stompClient.send('/receiveto', {}, msg);
                }
        };
        $(function () {
                callcenter.init();
        })

</script>
<!-- Begin Page Content -->
<div class="col-sm-8 text-left">
        <h1>1:1 Call Center</h1>
        <h1 id="adm_id">${logincust.id}</h1>
        <H1 id="status">Status</H1>
        <button id="connect">Connect</button>
        <button id="disconnect">Disconnect</button>

        <h3>To</h3>
        <input type="text" id="target">
        <input type="text" id="totext">
        <button id="sendto">Send</button>
        <div id="to"></div>
</div>