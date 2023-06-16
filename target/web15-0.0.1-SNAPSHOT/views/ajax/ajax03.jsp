<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<style>
    #getdata > div{
        width:500px;
        border:2px solid red;
    }
</style>
<script>
    let ajax03 = {
        init:function(){
            $('#getdata > button').click(function(){
                $.ajax({
                    url:'/getdata',
                    success:function(data){
                        ajax03.display(data);
                    }
                });
            });

            setInterval(function(){
                $.ajax({
                    url:'/getdata',
                    success:function(data){
                        ajax03.display(data);
                    }
                });
            },3000);
        },
        display:function(data){
            var result = "";
            $(data).each(function(index,item){
                result += '<h4>';
                result += item.id +' '+item.pwd +' '+item.name;
                result += '</h4>';
            });
            $('#getdata > div').html(result);
        }
    };
    $(function(){
        ajax03.init();
    })
</script>
<div class="col-sm-8 text-left">
    <div class="container" id="getdata">
        <h3>AJAX03</h3>
        <button class="btn">GET DATE</button>
        <div></div>
    </div>
</div>
