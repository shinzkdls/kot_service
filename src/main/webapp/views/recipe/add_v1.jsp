<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<style>
    .hidden {
        display: none;
    }

    .input__item {
        position: relative;
        width: 370px;
        margin-bottom: 20px;
    }

    .input__item:before {
        position: absolute;
        left: 50px;
        top: 10px;
        height: 30px;
        width: 1px;
        background: #b7b7b7;
        content: "";
    }

    .input__item input {
        height: 50px;
        width: 100%;
        font-size: 15px;
        color: #b7b7b7;
        background: #ffffff;
        border: none;
        padding-left: 76px;
    }

    .input__item input::-webkit-input-placeholder {
        color: #b7b7b7;
    }

    .input__item input::-moz-placeholder {
        color: #b7b7b7;
    }

    .input__item input:-ms-input-placeholder {
        color: #b7b7b7;
    }

    .input__item input::-ms-input-placeholder {
        color: #b7b7b7;
    }

    .input__item input::placeholder {
        color: #b7b7b7;
    }

    .input__item span {
        color: #b7b7b7;
        font-size: 20px;
        position: absolute;
        left: 15px;
        top: 13px;
    }
</style>

<head>
    <meta charset="UTF-8">
    <meta name="description" content="Anime Template">
    <meta name="keywords" content="Anime, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Anime | Template</title>

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Oswald:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Mulish:wght@300;400;500;600;700;800;900&display=swap"
          rel="stylesheet">

    <!-- Css Styles -->
    <link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="css/elegant-icons.css" type="text/css">
    <link rel="stylesheet" href="css/plyr.css" type="text/css">
    <link rel="stylesheet" href="css/nice-select.css" type="text/css">
    <link rel="stylesheet" href="css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="css/slicknav.min.css" type="text/css">
    <link rel="stylesheet" href="css/style.css" type="text/css">
</head>

<script>
    let recipe_add = {
        init:function(){
            $('#register_btn').click(function(){
                recipe_add.send();
            });
        },
        send:function(){
            $('#register_form').attr({
                method:'post',
                action:'/recipe/addImpl',
                enctype: 'multipart/form-data'
            });
            $('#register_form').submit();

            $('#ingredient_form').attr({
                method:'post',
                action:'/recipe/addImpl'
            });
            $('#ingredient_form').submit();
        }
    };
    $(function(){
        recipe_add.init();
    });
</script>

<script>
    function toggleDivDisplay() {
        var div = document.getElementById('myDiv2');
        var btn = document.getElementById('myBtn2');
        div.classList.toggle('hidden');
        btn.classList.toggle('hidden');
        if (!div.classList.contains('hidden')) {
            var input1 = document.getElementById('name2');
            var input2 = document.getElementById('quantity2');
            input1.value = ''; // 입력값 초기화
            input2.value = ''; // 입력값 초기화
        }
    };

    function toggleDivDisplay2() {
        var div = document.getElementById('myDiv3');
        var btn = document.getElementById('myBtn3');
        div.classList.toggle('hidden');
        btn.classList.toggle('hidden');
        if (!div.classList.contains('hidden')) {
            var input1 = document.getElementById('name3');
            var input2 = document.getElementById('quantity3');
            input1.value = ''; // 입력값 초기화
            input2.value = ''; // 입력값 초기화
        }
    };

</script>

<body>
<!-- Normal Breadcrumb Begin -->
<section class="normal-breadcrumb set-bg" data-setbg="/uimg/recipemain.jpg">
    <div class="container">
        <div class="row">
            <div class="col-lg-12 text-center">
                <div class="normal__breadcrumb__text">
                    <h2>RECIPES ALL OVER THE WORLD</h2>
                    <p>Welcome to KOLLY'S RECIPES</p>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Normal Breadcrumb End -->
<!-- Anime Section Begin -->
<section class="anime-details spad">
    <div class="container">
        <div class="anime__details__content">
            <div class="row">
                <div class="col-lg-9">
                    <div class="anime__details__text">

                        <div class="login__form" style="padding-left: 0">

                            <form id="register_form" class="register_form">

                                <input type="hidden" name="custpin" id="custpin" value="${logincust.custpin}">
                                <input type="hidden" name="custid" id="custid" value="${logincust.custid}">
                                <input type="hidden" name="nickname" id="nickname" value="${logincust.nickname}">

                                <div class="section-title">
                                    <h5>STEP 01. TITLE</h5>
                                </div>
                                <div class="input__item">
                                    <input type="text" name="recipetitle" id="recipetitle" placeholder="Enter Recipe Title">
                                </div>
                                <br>
                                <div class="section-title">
                                    <h5>STEP 02. TYPE</h5>
                                </div>
                                <div class="input__item">
                                    <input type="text" name="type" id="type" placeholder="Enter Recipe Type"><br>
                                </div>
                                <br>
                                <div class="section-title">
                                    <h5>STEP 03. SITUAITION</h5>
                                </div>
                                <div class="input__item">
                                    <input type="text" name="situation" id="situation" placeholder="Enter Recipe Situation"><br>
                                </div>
                                <br>
                                <div class="section-title">
                                    <h5>STEP 04. INGREDIENTS</h5>
                                </div>
                                <div class="form-horizontal" style="display: flex; justify-content: space-between">
                                <div class="input__item" style="margin-right: 10px">
                                    <input type="text" name="ingredients1" id="ingredients1" placeholder="Enter Ingredient 1">
                                </div>
                                <div class="input__item" style="margin-right: 10px">
                                    <input type="text" name="ingredients2" id="ingredients2" placeholder="Enter Ingredient 2">
                                </div>
                                <div class="input__item">
                                    <input type="text" name="ingredients3" id="ingredients3" placeholder="Enter Ingredient 3">
                                </div>
                                </div>
                                <br>
                                <div class="section-title">
                                    <h5>STEP 05. COOKING NAME</h5>
                                </div>
                                <div class="input__item">
                                    <input type="text" name="cooking" id="cooking" placeholder="Enter Cooking Name">
                                </div>
                                <br>
                                <div class="section-title">
                                    <h5>STEP 06. COOKING TIME</h5>
                                </div>
                                <div class="input__item">
                                    <input type="number" name="time" id="time" placeholder="Enter Cooking Time">
                                </div>
                                <br>
                                <div class="section-title">
                                    <h5>STEP 07. COOKING LEVEL</h5>
                                </div>
                                <div class="input__item">
                                    <input type="number" name="recipelevel" id="recipelevel" placeholder="Enter Cooking Level">
                                </div>
                                <br>
                                <div class="section-title">
                                    <h5>STEP 08. COOKING DESCRIPTION</h5>
                                </div>
                                <div class="input__item">
                                    <input type="text" name="recipedesc" id="recipedesc" placeholder="Enter Recipe Description">
                                </div>
                                <br>
<%--                                <div class="form-group">--%>
<%--                                    <label class="control-label col-sm-2">Thumbnail Image:</label>--%>
                                <div class="section-title">
                                    <h5>STEP 09. COOKING IMAGE</h5>
                                </div>
                                <div class="input__item">
                                    <input type="file" class="form-control" id="img" name="img"
                                           placeholder="Input Thumbnail Image">
                                    <input type="hidden" class="form-control" id="finishedimg" name="finishedimg">
                                </div>
<%--                                <div>--%>
<%--                                    <label class="control-label col-sm-2">Finished Image:</label>--%>
<%--                                    <div class="col-sm-10">--%>
<%--                                        <input type="file" class="form-control" id="finishedimg" name="finishedimg"--%>
<%--                                               placeholder="Input Finished Image">--%>
<%--                                    </div>--%>
<%--                                </div>--%>
                                <br>
                            </form>
                        </div>
                        <div>

                                <div class="section-title">
                                    <h5>INGREDIENTS</h5>
                                </div>


                                <div style="display: flex; justify-content: flex-start;">
                                    <div>
                                        <form id="ingredient_form">

                                            <div id="myDiv1">
                                                <input type="hidden" name="ingredientnumber1" id="ingredientnumber1" value=1>을
                                                <div class="form-horizontal" style="display: flex; justify-content: flex-start;">
                                                    <div class="input__item" style="margin-right: 10px; width: 80%;">
                                                        <input type="text" name="name1" id="name1" placeholder="Enter Ingredient">
                                                    </div>
                                                    <div class="input__item" style="margin-right: 20px; width: 80%;">
                                                        <input type="text" name="quantity1" id="quantity1" placeholder="Enter Quantity">
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="hidden" id="myDiv2">
                                                <input type="hidden" name="ingredientnumber2" id="ingredientnumber2" value=2>
                                                <div class="form-horizontal" style="display: flex; justify-content: flex-start">
                                                    <div class="input__item" style="margin-right: 10px; width: 80%;">
                                                        <input type="text" name="name2" id="name2" placeholder="Enter Ingredient">
                                                    </div>
                                                    <div class="input__item" style="margin-right: 20px; width: 80%;">
                                                        <input type="text" name="quantity2" id="quantity2" placeholder="Enter Quantity">
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="hidden" id="myDiv3">
                                                <input type="hidden" name="ingredientnumber3" id="ingredientnumber3" value=3>
                                                <div class="form-horizontal" style="display: flex; justify-content: flex-start">
                                                    <div class="input__item" style="margin-right: 10px; width: 80%;">
                                                        <input type="text" name="name3" id="name3" placeholder="Enter Ingredient">
                                                    </div>
                                                    <div class="input__item" style="margin-right: 20px; width: 80%;">
                                                        <input type="text" name="quantity3" id="quantity3" placeholder="Enter Quantity">
                                                    </div>
                                                </div>
                                            </div>

                                        </form>
                                    </div>
                                    <div style="display: flex; flex-direction: column;">
                                        <div class="anime__details__btn" style="width: 76px; height: 70px;">
                                            <button class="follow-btn" onclick="toggleDivDisplay()" style="border: unset; margin: 0; height: 50px">
                                                ADD
                                            </button>
                                        </div>
                                        <div class="anime__details__btn hidden" id="myBtn2" style="width: 76px; height: 70px;">
                                            <button class="follow-btn" onclick="toggleDivDisplay2()" style="border: unset; margin: 0; height: 50px">
                                                ADD
                                            </button>
                                        </div>
                                        <div class="anime__details__btn hidden" id="myBtn3" style="width: 76px; height: 70px;">
                                            <button class="follow-btn" onclick="toggleDivDisplay3()" style="border: unset; margin: 0; height: 50px">
                                                ADD
                                            </button>
                                        </div>
                                    </div>
                                </div>

                        <%--                                            </div>--%>


<%--                                    <div class="hidden" id="myDiv4">--%>
<%--                                        <input type="hidden" name="ingredientnumber4" id="ingredientnumber4" value=4>--%>
<%--                                        <div class="form-horizontal" style="display: flex; justify-content: flex-start">--%>
<%--                                            <div class="input__item" style="margin-right: 10px">--%>
<%--                                                <input type="text" name="name4" id="name4" placeholder="Enter Recipe Ingredient">--%>
<%--                                            </div>--%>
<%--                                            <div class="input__item" style="margin-right: 20px">--%>
<%--                                                <input type="text" name="quantity4" id="quantity4" placeholder="Enter Ingredient Quantity">--%>
<%--                                            </div>--%>
<%--                                            <div class="anime__details__btn" style="display: flex; justify-content: flex-end">--%>
<%--                                                <button class="follow-btn" onclick="toggleDivDisplay4()" style="border: unset; margin: 0; height: 50px">--%>
<%--                                                    ADD--%>
<%--                                                </button>--%>
<%--                                            </div>--%>
<%--                                        </div>--%>
<%--                                    </div>--%>

<%--                                    <div class="hidden" id="myDiv5">--%>
<%--                                        <input type="hidden" name="ingredientnumber5" id="ingredientnumber5" value=5>--%>
<%--                                        <div class="form-horizontal" style="display: flex; justify-content: flex-start">--%>
<%--                                            <div class="input__item" style="margin-right: 10px">--%>
<%--                                                <input type="text" name="name5" id="name5" placeholder="Enter Recipe Ingredient">--%>
<%--                                            </div>--%>
<%--                                            <div class="input__item" style="margin-right: 20px">--%>
<%--                                                <input type="text" name="quantity5" id="quantity5" placeholder="Enter Ingredient Quantity">--%>
<%--                                            </div>--%>
<%--                                            <div class="anime__details__btn" style="display: flex; justify-content: flex-end">--%>
<%--                                                <button class="follow-btn" onclick="toggleDivDisplay5()" style="border: unset; margin: 0; height: 50px">--%>
<%--                                                    ADD--%>
<%--                                                </button>--%>
<%--                                            </div>--%>
<%--                                        </div>--%>
<%--                                    </div>--%>
<%--                                    </form>--%>



                                <div class="anime__details__btn" style="display: flex; justify-content: flex-end">
                                    <button type="button" id="register_btn" class="follow-btn" style="border: unset;">
                                        Register
                                    </button>
                                </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Anime Section End -->

<!-- Search model Begin -->
<div class="search-model">
    <div class="h-100 d-flex align-items-center justify-content-center">
        <div class="search-close-switch"><i class="icon_close"></i></div>
        <form class="search-model-form">
            <input type="text" id="search-input" placeholder="Search here.....">
        </form>
    </div>
</div>
<!-- Search model end -->

<!-- Js Plugins -->
<script src="js/jquery-3.3.1.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/player.js"></script>
<script src="js/jquery.nice-select.min.js"></script>
<script src="js/mixitup.min.js"></script>
<script src="js/jquery.slicknav.js"></script>
<script src="js/owl.carousel.min.js"></script>
<script src="js/main.js"></script>

</body>