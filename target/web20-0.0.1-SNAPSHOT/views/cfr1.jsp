<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script>
    $(function () {

    });
</script>

<div class="col-sm-8 text-left">
    <div class="container">
        <div class="row content">
            <div class="col-sm-8 text-left">
                <h1>CFR1</h1>
                <h2>${result}</h2>
                <form action="/cfr1impl" method="post" enctype="multipart/form-data" id="cfr1_form" class="well"
                      style="margin-top: 30px">
                    <div class="form-group">
                        <label for="img">Image:</label>
                        <input type="file" class="form-control" id="img" placeholder="Input Image" name="img">
                    </div>
                    <div class="form-group">
                        <div class="col-sm-offset-2 col-sm-6">
                            <button type="submit" class="btn btn-default" id="cfr1_btn">Send</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>