<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script>
    let ajax02 = {
        init:function(){
            this.keyupevent();
            this.sendevent();
        },
        keyupevent:function(){
            $('#r_form > input[name=id]').keyup(function(){
                var id = $(this).val();
                if(id.length <= 3){
                    $('#r_form > #idspan').text('ID는4자리 이상입니다.');
                    return;
                };

                $.ajax({
                    url:'/checkid',
                    data:{'id':id},
                    success:function(result){
                        if(result == 0){
                            $('#r_form > #idspan').text('사용가능합니다.');
                            $('#r_form > input[name="pwd"]').focus();
                        }else{
                            $('#r_form > #idspan').text('사용불가능합니다.');
                        }
                    }
                });
            });
        },
        sendevent:function(){}
    };

    $(function(){
        ajax02.init();
    })
</script>
<div class="col-sm-8 text-left">
    <div class="container">
        <h3>AJAX02</h3>
        <form id="r_form">
            ID<input type="text" name="id">
            <span id="idspan"></span><br>
            PWD<input type="text" name="pwd"><br>
            NAME<input type="text" name="name"><br>
            <input type="button" value="Register"><br>
        </form>
    </div>
</div>
