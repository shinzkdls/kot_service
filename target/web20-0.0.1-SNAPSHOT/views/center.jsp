<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>

<style>
  #w2 {
    width : 500px;
    border : 2px solid red;
  }
</style>



<script>
  let center = {
    init:function(){
      $.ajax({
        url:'/weather2',
        success:function(data){
          center.display(data);
        }
      });
    },display:function(data){
      //result는 배열 data임
      var result = data.response.body.items.item;
      var txt='';

      //$(result).each();배열을 돌리는것. 제이쿼리에서 each라는 함수를 제공해줌
      $(result).each(function(index, item){
        txt += '<h5>';
        txt += item.tm + ''+item.ta;
        txt += '</h5>';
      });

      $('#w2').html(txt);
    }
  };
  $(function(){
    center.init();
  });
</script>


<div class="col-sm-8 text-left">
  <h1><spring:message code="site.title"/></h1>
  <p><spring:message code="site.content"/></p>
  <hr>
  <textarea id="w1" cols="100" rows="10">${weatherinfo}</textarea>
  <hr>
  <div id="w2"></div>
</div>