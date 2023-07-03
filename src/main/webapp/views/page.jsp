<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>

<!-- pagination start -->
<div class="pagination-wrap">
    <ul style="display: flex; flex-grow: 0; list-style-type: none; justify-content: space-around">
        <c:choose>
            <c:when test="${nlist.getPrePage() != 0}">
                <li class="pagination-wrap">
                    <a  class="pagination-wrap" href="/${target}?pageNo=${nlist.getPrePage()}" style="color: #b7b7b7; font-size: 15px"><</a>
                </li>
            </c:when>
            <c:otherwise>
                <li class="pagination-wrap disabled">
                    <a class="pagination-wrap" href="#" style="color: #b7b7b7; font-size: 15px"><</a>
                </li>
            </c:otherwise>
        </c:choose>

        <c:forEach begin="${nlist.getNavigateFirstPage() }" end="${nlist.getNavigateLastPage() }"
                   var="page">
            <c:choose>
                <c:when test="${nlist.getPageNum() == page}">
                    <li class="pagination-wrap active">
                        <a class="pagination-wrap active" href="/${target}?pageNo=${page}" style="color: #b7b7b7; font-size: 15px">${page}</a>
                    </li>
                </c:when>
                <c:otherwise>
                    <li>
                        <a class="pagination-wrap" href="/${target}?pageNo=${page}" style="color: #b7b7b7; font-size: 15px">${page}</a>
                    </li>
                </c:otherwise>
            </c:choose>

        </c:forEach>
        <c:choose>
            <c:when test="${nlist.getNextPage() != 0}">
                <li class="pagination-wrap">
                    <a class="pagination-wrap" href="/${target}?pageNo=${nlist.getNextPage()}" style="color: #b7b7b7; font-size: 15px">></a>
                </li>
            </c:when>
            <c:otherwise>
                <li class="pagination-wrap disabled">
                    <a class="pagination-wrap" href="#" style="color: #b7b7b7; font-size: 15px">></a>
                </li>
            </c:otherwise>
        </c:choose>

    </ul>
</div>
<!-- pagination end -->
