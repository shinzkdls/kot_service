<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>

<!-- pagination start -->
<div class="text-center">
    <ul style="display: flex; flex-grow: 0;   list-style-type: none; justify-content: space-around">
        <c:choose>
            <c:when test="${nlist.getPrePage() != 0}">
                <li>
                    <a href="/${target}?pageNo=${nlist.getPrePage()}" style="color: #b7b7b7; font-size: 20px"><</a>
                </li>
            </c:when>
            <c:otherwise>
                <li class="disabled">
                    <a href="#" style="color: #b7b7b7; font-size: 20px"><</a>
                </li>
            </c:otherwise>
        </c:choose>

        <c:forEach begin="${nlist.getNavigateFirstPage() }" end="${nlist.getNavigateLastPage() }"
                   var="page">
            <c:choose>
                <c:when test="${nlist.getPageNum() == page}">
                    <li class="active">
                        <a href="/${target}?pageNo=${page}" style="color: #b7b7b7; font-size: 20px">${page}</a>
                    </li>
                </c:when>
                <c:otherwise>
                    <li>
                        <a href="/${target}?pageNo=${page}" style="color: #b7b7b7; font-size: 20px">${page}</a>
                    </li>
                </c:otherwise>
            </c:choose>

        </c:forEach>
        <c:choose>
            <c:when test="${nlist.getNextPage() != 0}">
                <li>
                    <a href="/${target}?pageNo=${nlist.getNextPage()}" style="color: #b7b7b7; font-size: 20px">></a>
                </li>
            </c:when>
            <c:otherwise>
                <li class="disabled">
                    <a href="#" style="color: #b7b7b7; font-size: 20px">></a>
                </li>
            </c:otherwise>
        </c:choose>

    </ul>
</div>
<!-- pagination end -->
