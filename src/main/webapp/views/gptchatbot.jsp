<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
    .spinner-container {
        position: fixed;
        top: 50%;
        left: 50%;
        transform: translate(-50%, -50%);
    }
</style>

<div class="container">
    <div id="content">
        <!-- Start main_haeder -->
        <header class="header_tab head_conversation border-b border-b-solid border-snow">
            <div class="main_haeder multi_item">
                <div class="em_side_right">
<%--                    <a class="btn bg-transparent rounded-circle justify-content-start" href="/mypage">--%>
                        <i class="tio-chevron_left"></i>
                    </a>
                </div>
                <div class="item_userChat ml-0">
                    <div class="media" style="padding: 30px;">
                        <img class="img-user" src="/img/kollyWater.png" alt="" style="width:25%; height: 15%;">
                        <div class="media-body my-auto" style="text-align: right;">
                            <div class="txt">
                                <h3 style="color: black; margin-bottom: 10px;">What Do You Want To Know?</h3>
                                <h1>Kolly Knows Everything!</h1>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="em_side_right">
                    <!-- Can you add something here.. -->
                </div>
            </div>
        </header>
        <!-- End.main_haeder -->

        <section class="emPage__conversation padding-t-70 padding-b-80">
            <div class="item_user">
                <div class="media">
                    <div class="imgProfile">
<%--                        <img src="/img/kolly.png" alt="">--%>
                    </div>
                    <div class="media-body">
                        <div class="content_sms">
                            <p class="item_msg">
                            </p>
                            <div class="time"></div>
                        </div>
                    </div>
                </div>
            </div>
            <div>
                <div class="bk_footer_input emBK__buttonsShare" style="text-align: center;">
<%--                    <button type="button" class="btn btn_upload p-0" data-toggle="modal" data-target="#mdllButtons">사진 버튼--%>
<%--                        <div class="icon bg-snow rounded-10">--%>
<%--                            <i class="ri-attachment-line size-20"></i>--%>
<%--                        </div>--%>
<%--                    </button>--%>
                    <div class="form-group m-4" style="text-align: center;">
                        <input type="text" style="width: 70%;" placeholder="여기에 질문하실 내용을 적어주세요" id="questionInput">
                        <button style="background-color: orange;" type="button" class="btn btn_defSend rounded-10" id="sendBtn" style="width: 500px">버튼
                            <svg id="Iconly_Bulk_Send" data-name="Iconly/Bulk/Send" xmlns="http://www.w3.org/2000/svg"
                                 width="20" height="20" viewBox="0 0 20 20">
                                <g id="Send" transform="translate(1.667 1.667)">
                                    <path id="Fill_1" data-name="Fill 1"
                                          d="M16.19.482A1.615,1.615,0,0,0,14.581.065L1.173,3.939A1.6,1.6,0,0,0,.02,5.2,1.863,1.863,0,0,0,.855,6.94L5.048,9.5a1.09,1.09,0,0,0,1.341-.159l4.8-4.8a.613.613,0,0,1,.883,0,.629.629,0,0,1,0,.883l-4.809,4.8A1.092,1.092,0,0,0,7.1,11.565l2.562,4.208a1.668,1.668,0,0,0,1.592.774,1.62,1.62,0,0,0,1.358-1.15L16.59,2.09a1.619,1.619,0,0,0-.4-1.608"
                                          transform="translate(0 0)" fill="#fff"/>
                                    <path id="Combined_Shape" data-name="Combined Shape"
                                          d="M3.97,6.355a.625.625,0,0,1,0-.883L5.108,4.333a.625.625,0,1,1,.884.884L4.854,6.355a.625.625,0,0,1-.883,0ZM3.317,3.2a.625.625,0,0,1,0-.884L4.455,1.176a.625.625,0,0,1,.884.884L4.2,3.2a.625.625,0,0,1-.883,0ZM.183,2.2a.625.625,0,0,1,0-.884L1.321.182a.625.625,0,0,1,.884.884L1.066,2.2a.625.625,0,0,1-.884,0Z"
                                          transform="translate(0.217 9.952)" fill="#fff" opacity="0.4"/>
                                </g>
                            </svg>
                        </button>
                    </div>
                </div>
            </div>
        </section>
    </div>


    <!-- Modal Buttons Share -->
    <div class="modal transition-bottom -inside screenFull defaultModal mdlladd__rate fade" id="mdllButtons_share"
         tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content rounded-15">

                <div class="modal-body rounded-15 p-0">
                    <div class="emBK__buttonsShare icon__share padding-20">
                        <button type="button" class="btn" data-sharer="facebook" data-hashtag="hashtag"
                                data-url="https://orinostudio.com/nepro/">
                            <div class="icon bg-facebook rounded-10">
                                <i class="tio-facebook_square"></i>
                            </div>
                        </button>
                        <button type="button" class="btn" data-sharer="telegram" data-title="Checkout Nepro!"
                                data-url="https://orinostudio.com/nepro/" data-to="+44555-5555">
                            <div class="icon bg-telegram rounded-10">
                                <i class="tio-telegram"></i>
                            </div>
                        </button>
                        <button type="button" class="btn" data-sharer="skype"
                                data-url="https://orinostudio.com/nepro/" data-title="Checkout Nepro!">
                            <div class="icon bg-skype rounded-10">
                                <i class="tio-skype"></i>
                            </div>
                        </button>
                        <button type="button" class="btn" data-sharer="linkedin"
                                data-url="https://orinostudio.com/nepro/">
                            <div class="icon bg-linkedin rounded-10">
                                <i class="tio-linkedin_square"></i>
                            </div>
                        </button>
                        <button type="button" class="btn" data-sharer="twitter" data-title="Checkout Nepro!"
                                data-hashtags="pwa, Nepro, template, mobile, app, shopping, ecommerce"
                                data-url="https://orinostudio.com/nepro/">
                            <div class="icon bg-twitter rounded-10">
                                <i class="tio-twitter"></i>
                            </div>
                        </button>
                        <button type="button" class="btn" data-sharer="whatsapp" data-title="Checkout Nepro!"
                                data-url="https://orinostudio.com/nepro/">
                            <div class="icon bg-whatsapp rounded-10">
                                <i class="tio-whatsapp_outlined"></i>
                            </div>
                        </button>
                    </div>

                </div>
            </div>
        </div>
    </div>

    <!-- Modal Content -->
    <div class="modal transition-bottom screenFull defaultModal mdlladd__rate fade" id="mdllButtons" tabindex="-1"
         aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header border-0 p-2 justify-content-center">
                    <!-- header -->
                </div>
                <div class="modal-body px-0 ">
                    <div class="em__pkLink env-pb">
                        <ul class="nav__list emBK__buttonsShare  mb-0">
                            <li>
                                <button type="button" class="btn item-link">
                                    <input type="file">
                                    <div class="group">
                                        <div class="icon bg-primary">
                                            <svg id="Iconly_Curved_Paper_Plus" data-name="Iconly/Curved/Paper Plus"
                                                 xmlns="http://www.w3.org/2000/svg" width="20" height="20"
                                                 viewBox="0 0 20 20">
                                                <g id="Paper_Plus" data-name="Paper Plus"
                                                   transform="translate(3.042 2.292)">
                                                    <path id="Stroke_1" data-name="Stroke 1"
                                                          d="M13.758,4.625,9.033.125A15.166,15.166,0,0,0,6.992,0C1.75,0,0,1.933,0,7.708s1.75,7.708,6.992,7.708,7-1.925,7-7.708A17.538,17.538,0,0,0,13.758,4.625Z"
                                                          transform="translate(0)" fill="none" stroke="#fff"
                                                          stroke-linecap="round" stroke-linejoin="round"
                                                          stroke-miterlimit="10" stroke-width="1.5"/>
                                                    <path id="Stroke_3" data-name="Stroke 3"
                                                          d="M0,0V2.217a2.8,2.8,0,0,0,2.8,2.8H5.262"
                                                          transform="translate(8.57 0.069)" fill="none" stroke="#fff"
                                                          stroke-linecap="round" stroke-linejoin="round"
                                                          stroke-miterlimit="10" stroke-width="1.5"/>
                                                    <path id="Stroke_5" data-name="Stroke 5" d="M4.083.5H0"
                                                          transform="translate(4.802 8.026)" fill="none" stroke="#fff"
                                                          stroke-linecap="round" stroke-linejoin="round"
                                                          stroke-miterlimit="10" stroke-width="1.5"/>
                                                    <path id="Stroke_7" data-name="Stroke 7" d="M.5,4.083V0"
                                                          transform="translate(6.344 6.484)" fill="none" stroke="#fff"
                                                          stroke-linecap="round" stroke-linejoin="round"
                                                          stroke-miterlimit="10" stroke-width="1.5"/>
                                                </g>
                                            </svg>
                                        </div>
                                        <span class="path__name">Documents</span>
                                    </div>
                                    <div class="group">
                                        <span class="short__name"></span>
                                        <i class="tio-chevron_right -arrwo"></i>
                                    </div>
                                </button>
                            </li>
                            <li>
                                <button type="button" class="btn item-link">
                                    <input type="file" capture="user" accept="image/*">
                                    <div class="group">
                                        <div class="icon bg-yellow">
                                            <svg id="Iconly_Curved_Camera" data-name="Iconly/Curved/Camera"
                                                 xmlns="http://www.w3.org/2000/svg" width="20" height="20"
                                                 viewBox="0 0 20 20">
                                                <g id="Camera" transform="translate(2.741 2.535)">
                                                    <path id="Stroke_2" data-name="Stroke 2"
                                                          d="M5.242,2.621A2.621,2.621,0,1,0,2.621,5.242,2.621,2.621,0,0,0,5.242,2.621Z"
                                                          transform="translate(4.882 5.259)" fill="none" stroke="#fff"
                                                          stroke-linecap="round" stroke-linejoin="round"
                                                          stroke-miterlimit="10" stroke-width="1.5"/>
                                                    <path id="Stroke_4" data-name="Stroke 4"
                                                          d="M7.5,14.3c6.7,0,7.5-2.009,7.5-6.361,0-3.051-.4-4.683-2.945-5.385a1.606,1.606,0,0,1-.7-.445C11.02,1.736,10.773.6,9.955.252a12.063,12.063,0,0,0-4.905,0c-.8.329-1.065,1.484-1.4,1.855a1.6,1.6,0,0,1-.7.445C.4,3.254,0,4.886,0,7.937,0,12.29.8,14.3,7.5,14.3Z"
                                                          transform="translate(0)" fill="none" stroke="#fff"
                                                          stroke-linecap="round" stroke-linejoin="round"
                                                          stroke-miterlimit="10" stroke-width="1.5"/>
                                                    <path id="Stroke_11" data-name="Stroke 11" d="M.5.5H.5"
                                                          transform="translate(11.1 4.465)" fill="none" stroke="#fff"
                                                          stroke-linecap="round" stroke-linejoin="round"
                                                          stroke-miterlimit="10" stroke-width="1.5"/>
                                                </g>
                                            </svg>
                                        </div>
                                        <span class="path__name">Camera</span>
                                    </div>
                                    <div class="group">
                                        <span class="short__name"></span>
                                        <i class="tio-chevron_right -arrwo"></i>
                                    </div>
                                </button>
                            </li>
                            <li>
                                <button type="button" class="btn item-link">
                                    <input type="file">
                                    <div class="group">
                                        <div class="icon bg-red">
                                            <svg id="Iconly_Curved_Image" data-name="Iconly/Curved/Image"
                                                 xmlns="http://www.w3.org/2000/svg" width="20" height="20"
                                                 viewBox="0 0 20 20">
                                                <g id="Image" transform="translate(2.292 2.292)">
                                                    <path id="Stroke_1" data-name="Stroke 1"
                                                          d="M0,3.092S.677,1.727,1.662,1.727,3.15,2.873,4.242,2.873,6.557,0,7.793,0,9.917,1.992,9.917,1.992"
                                                          transform="translate(2.767 8.332)" fill="none" stroke="#fff"
                                                          stroke-linecap="round" stroke-linejoin="round"
                                                          stroke-miterlimit="10" stroke-width="1.5"/>
                                                    <path id="Stroke_3" data-name="Stroke 3"
                                                          d="M2.6,1.3A1.3,1.3,0,1,1,1.3,0,1.3,1.3,0,0,1,2.6,1.3Z"
                                                          transform="translate(3.562 3.997)" fill="none" stroke="#fff"
                                                          stroke-linecap="round" stroke-linejoin="round"
                                                          stroke-miterlimit="10" stroke-width="1.5"/>
                                                    <path id="Stroke_5" data-name="Stroke 5"
                                                          d="M0,7.708c0,5.781,1.927,7.708,7.708,7.708s7.708-1.927,7.708-7.708S13.489,0,7.708,0,0,1.927,0,7.708Z"
                                                          transform="translate(0 0)" fill="none" stroke="#fff"
                                                          stroke-linecap="round" stroke-linejoin="round"
                                                          stroke-miterlimit="10" stroke-width="1.5"/>
                                                </g>
                                            </svg>
                                        </div>
                                        <span class="path__name">Gallery</span>
                                    </div>
                                    <div class="group">
                                        <span class="short__name"></span>
                                    </div>
                                </button>
                            </li>

                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>


<script>
    $(document).ready(function () {

        var loadingCount = 0; // 로딩 중인 요청 수를 추적하는 변수 추가

        // SEND 버튼을 누르면 대답 가져오기
        $("#sendBtn").click(function () {
            console.log("질문하기 버튼 눌림");
            let question = $("#questionInput").val();
            console.log("질문하기: "+ question);
            $("#questionInput").val(""); // 질문 초기화
            getAnswer(question);
        });


        // 스피너 숨기기 함수
        function hideLoading() {
            loadingCount--; // 로딩 완료시 카운트 감소
            if (loadingCount === 0) {
                $('.spinner-container').hide(); // 모든 요청이 완료되었을 때만 로딩바 숨기기
            }
        }

        // 스피너 표시 함수
        function showLoading() {
            loadingCount++; // 로딩 시작시 카운트 증가
            $('.spinner-container').show();
        }


        function getAnswer(question){

            let time1 = new Date().toLocaleTimeString(); // 현재 시간 가져오기

            // 내 질문 먼저 표출
            var conversationItemUserMe = $('<div class="item_user __me">').appendTo('.emPage__conversation');
            var mediaMe = $('<div class="media">').appendTo(conversationItemUserMe);
            // 질문과 시간을 세로로 정렬
            var mediaBodyMe = $('<div class="media-body flex-column">').appendTo(mediaMe);
            var contentSmsMe = $('<div class="content_sms">').appendTo(mediaBodyMe);
            $('<p class="item_msg">').text(question).appendTo(contentSmsMe);
            var timeMe = $('<div class="time">').appendTo(contentSmsMe);
            $('<span>').text(time1).appendTo(timeMe);
            $('<div class="icon ml-1">').append('<i class="ri-check-double-line color-primary size-18"></i>').appendTo(timeMe);

            // 스피너 추가
            $('<div class="spinner-container">').appendTo(mediaMe);
            $('<div class="spinner-border color-primary" role="status">').appendTo(mediaMe.find('.spinner-container'));
            $('<span class="sr-only spinner">').appendTo(mediaMe.find('.spinner-container'));

            showLoading(); // 로딩바 표시

            // gpt에게 물어보기
            $.ajax({
                type   : "GET",
                url     : '/gptchatting?question=' + question,
                dataType: 'json',
                success : function (data) {
                    hideLoading();
                    console.log(data);
                    var answer = data[0].answer;  // 첫 번째 대답 가져오기
                    var time2 = new Date().toLocaleTimeString(); // 현재 시간 가져오기

                    // 대화 내용 표시
                    var conversationItemUser = $('<div class="item_user">').appendTo('.emPage__conversation');
                    var media = $('<div class="media">').appendTo(conversationItemUser);
                    $('<div class="imgProfile">').append('<img style="width:60px; height:60px;" src="/img/kollyGood.png" alt="">').appendTo(media);
                    var mediaBody = $('<div class="media-body">').appendTo(media);
                    var contentSms = $('<div class="content_sms">').appendTo(mediaBody);
                    var itemMsg = $('<p class="item_msg">').text(answer).appendTo(contentSms);
                    $('<div class="time">').text(time2).appendTo(contentSms);

                    // 스크롤 맨 아래로 이동
                    var conversationSection = $('.emPage__conversation');
                    conversationSection.scrollTop(conversationSection.prop("scrollHeight"));

                    // 답변 내용이 화면에 다 나오지 않을 경우 스크롤을 아래로 이동
                    var itemMsgHeight = itemMsg.outerHeight();
                    var contentSmsHeight = contentSms.outerHeight();
                    if (itemMsgHeight > contentSmsHeight) {
                        conversationSection.scrollTop(conversationSection.scrollTop() + itemMsgHeight - contentSmsHeight);
                    }
                },
                error   : function () {
                    console.log('error');
                    hideLoading();
                }
            });

        }


    });


</script>