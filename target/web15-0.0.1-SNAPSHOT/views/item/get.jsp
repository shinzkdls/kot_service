<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script>
    let item_get = {
        init:function(){
            $('#cart_btn').click(function(){
                let cust_id = '${logincust.id}';
                let item_id = ${gitem.id};
                let cnt = $('#cnt').val();
                $.ajax({
                    url:'/addcart',
                    data:{cust_id:cust_id,item_id:item_id,cnt:cnt},
                    success:function(){
                        $('#myModal').modal();
                    }
                });
                // $('#cart_form').attr({
                //     method:'get',
                //     action:'/item/addcart'
                // });
                // $('#cart_form').submit();
            });
        }
    };
    $(function(){
        item_get.init();
    });
</script>
<div class="col-sm-8 text-left">
    <div class="container">
        <h3>Item Info</h3>
        <img src="/uimg/${gitem.imgname}">
        <h4>${gitem.id}</h4>
        <h4>${gitem.name}</h4>
        <h4>${gitem.price}</h4>
        <c:if test="${logincust != null}">
        <div class="row content">
            <div class="col-sm-6  text-left ">
            <form id="cart_form" class="form-inline well">
                <input type="hidden" name="cust_id" value="${logincust.id}">
                <input type="hidden" name="item_id" value="${gitem.id}">
                <div class="form-group">
                    <label class="control-label col-sm-2" for="cnt">Count:</label>
                    <div class="col-sm-2">
                        <input type="number" name="cnt" class="form-control" id="cnt" placeholder="Enter Count">
                    </div>
                </div>

                <div class="form-group">
                    <div class="col-sm-offset-2 col-sm-2">
                        <button id="cart_btn" type="button" class="btn btn-default">Cart</button>
                    </div>
                </div>
            </form>
        </c:if>
            </div>
        </div>
    </div>
</div>

<!-- Modal -->
<div id="myModal" class="modal fade" role="dialog">
    <div class="modal-dialog">

        <!-- Modal content-->
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
            <div class="modal-body">
                <a href="/item/allcart?id=${logincust.id}" class="btn btn-info" role="button">장바구니로이동</a>
                <a href="/item/allpage" class="btn btn-info" role="button">계속쇼핑</a>
            </div>
            <div class="modal-footer">
            </div>
        </div>

    </div>
</div>
