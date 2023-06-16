<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<style>
    #map02 > #map{
        width:400px;
        height: 400px;
        border: 2px solid red;
    }
</style>
<script>
    let map02 = {
        map:null,
        init:function(){
            this.display();
            $('#s_btn').click(function(){
                map02.go(37.5722099 ,126.9768146);
            });
            $('#b_btn').click(function(){
                map02.go(35.1938469 ,129.1536102);
            });
            $('#j_btn').click(function(){
                map02.go(33.2471736 ,126.5521947);
            });
        },
        display:function(){
            var mapContainer = document.querySelector('#map02 > #map');
            var mapOption =  {
                center: new kakao.maps.LatLng(37.5399212 ,127.057933), // 지도의 중심좌표
                level: 5 // 지도의 확대 레벨
            };
            map = new kakao.maps.Map(mapContainer, mapOption);

            var mapTypeControl = new kakao.maps.MapTypeControl();
            map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);
            var zoomControl = new kakao.maps.ZoomControl();
            map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);

            var markerPosition  = new kakao.maps.LatLng(37.5399212 ,127.057933);
            var marker = new kakao.maps.Marker({
                position: markerPosition
            });
            marker.setMap(map);
        },
        go:function(lat,lng){
            var moveLatLon = new kakao.maps.LatLng(lat,lng);
            map.panTo(moveLatLon);

            var markerPosition  = new kakao.maps.LatLng(lat,lng);
            var marker = new kakao.maps.Marker({
                position: markerPosition
            });
            marker.setMap(map);
        }
    };
    $(function(){
        map02.init();
    })
</script>
<div class="col-sm-8 text-left">
    <div class="container" id="map02">
        <h3>MAP02</h3>
        <button id="s_btn" type="button" class="btn btn-primary">Seoul</button>
        <button id="b_btn" type="button" class="btn btn-primary">Busan</button>
        <button id="j_btn" type="button" class="btn btn-primary">Jeju</button>
        <div id="map"></div>
    </div>
</div>
