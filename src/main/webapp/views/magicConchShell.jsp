<%--
  Created by IntelliJ IDEA.
  User: naeunlee
  Date: 2023/05/30
  Time: 1:26 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<script>

    let clickEvent = false;

    function playAnswer() {
        changeImage('/img/conch_glow.png');
        clickEvent = true;
        $.ajax({
            url: "/magic/ajax",
            success: function (res) {
                let text = (Math.random() <= 0.1) ? "굶어" : (res.title);
                tts(text);
                answerText.innerHTML = text;
                (text === "굶어") ? $("#detail_url").removeAttr("href") : detail_url.href = res.url;
            },
            error: function (request, status, error) {
                alert("오류", "오류가 발생하였습니다. 관리자에게 문의해주세요.");
            }
        });
    }

    function tts(text) {
        let data = {
            "voice": {
                languageCode: 'ko-KR',
                name: 'ko-KR-Neural2-A',
                ssmlGender: 'FEMALE'
            },
            "input": {
                "text":text
            },
            "audioConfig": {
                "audioEncoding": "mp3"
            }
        }
        $.ajax({
            type: 'POST',
            url: "https://texttospeech.googleapis.com/v1/text:synthesize?key=" + "${key}",
            data: JSON.stringify(data),
            dataType: 'JSON',
            contentType: "application/json; charset=UTF-8",
            success: function (res) {
                let audioFile = new Audio();
                let audioBlob = base64ToBlob(res.audioContent, "mp3");
                audioFile.src = window.URL.createObjectURL(audioBlob);
                audioFile.playbackRate = 0.8; //재생속도
                audioFile.addEventListener('loadedmetadata', function () {
                    let duration = (audioFile.duration)*1000; // 재생 시간(초 단위)
                    audioFile.play();
                    setTimeout(function () {
                        changeImage('/img/conch.png');
                        clickEvent = false;
                    }, duration); // 발화시간 후에 이전 이미지로 변경합니다.
                });
            },
            error: function (request, status, error) {
                alert("tts오류", "오류가 발생하였습니다. 관리자에게 문의해주세요.");
            }
        });
    };

    function base64ToBlob(base64, fileType) {
        let typeHeader = "data:application/" + fileType + ";base64,"; // base64 헤더 파일 유형 정의
        let audioSrc = typeHeader + base64;
        let arr = audioSrc.split(",");
        let array = arr[0].match(/:(.*?);/);
        let mime = (array && array.length > 1 ? array[1] : type) || type;
        // url헤더 제거하고 btye로 변환
        let bytes = window.atob(arr[1]);
        // 예외를 처리하고 0보다 작은 ASCII 코드를 0보다 큰 값으로 변환
        let ab = new ArrayBuffer(bytes.length);
        // 뷰 생성(메모리에 직접): 8비트 부호 없는 정수, 길이 1바이트
        let ia = new Uint8Array(ab);
        for (let i = 0; i < bytes.length; i++) {
            ia[i] = bytes.charCodeAt(i);
        }
        return new Blob([ab], {
            type: mime
        });
    }


    function changeImage(src) {
        var img = document.getElementById('img');
        img.src = src;
    }

    $(function () {
        $('.magicIcon').html("  "); //소라고둥 들어오면 오른쪽 아이콘 안보이게
    })

</script>

<style>

    @media (max-width: 768px) {
        #conchShellImg {
            height: 60%;
        }
    }

    @media (min-width: 768px) {
        #conchShellImg {
            height: 60%;
        }
    }

    @media (min-width: 992px) {
        #conchShellImg {
            height: 70%;
        }
    }

    @media (min-width: 1200px) {
        #conchShellImg {
            height: 80%;
        }
    }

    :root {
        --font-size-lg: clamp(2rem, 4vw, 3.5rem);
        --font-size-sm: clamp(1rem, 2vw, 1.5rem);
    }

    #forMagic h1 {
        font-size: var(--font-size-lg);
    }

    #forMagic h4 {
        font-size: var(--font-size-sm);
    }

    /*반응형 구현 end*/

    #bg {
        height: 85%;
    }

    #forMagic img {
        width: auto;
        height: 100%;
    }
    #forMagic {
        position: relative;
    }
    #conchShell {
        margin: auto;
        width: 100%;
        height: 85%;
        display: flex;
        flex-direction: column;
        align-items: center;
    }

    #detail_url {
        position: absolute;
        bottom: 25px;
    }

    #forMagic h1, h4 {
        text-align: center;
        font-family: Arial;
        font-weight: bold;
        color: white;
        text-shadow: 0px 0px 12px #565656;
    }
</style>

<div class="container">
    <div class="set-bg" data-setbg="/img/bg.jpg" id="bg">
        <div id="forMagic">
            <h1><br>Ask to the Magic Conch Shell</h1>
            <h4><br>마법의 소라고둥님, 무엇을 먹을까요?</h4>
            <div id="conchShell" >
                <a id="conchShellImg" type="button" onclick="playAnswer();">
                    <img id="img" src="/img/conch_glow.png" alt="Conch Shell" onmouseover="changeImage('/img/conch_glow.png')" onmouseout=" if (!clickEvent){changeImage('/img/conch.png');}">
                </a>
                <div id="detail_url">
                    <a href="">
                        <h1 id="answerText"></h1>
                    </a>
                </div>
            </div>
        </div>
    </div>
</div>
