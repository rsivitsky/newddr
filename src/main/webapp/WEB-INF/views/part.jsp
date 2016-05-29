<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<c:url var="editImgUrl" value="/resources/img/edit.png"/>
<c:url var="deleteImgUrl" value="/resources/img/delete.png"/>

<div class="col-md-12">
    <c:if test="${!empty listPart}">
        <table class="table table-hover">
            <c:forEach items="${listPart}" var="part">
                <c:url var="editPartUrl" value="/part/edit/${part[1]}"/>
                <c:url var="deletePartUrl" value="/part/remove/${part[1]}"/>
                <c:url var="editDescUrl" value="/part/descript/edit/${part[1]}"/>
                <c:url var="partDescription" value="/part/description/${part[1]}"/>
                <c:url var="partPhotoUrl" value="/part/photo/${part[1]}"/>
                <tr>
                    <td><a href="${partDescription}"><img src="${partPhotoUrl}" class="img-rounded" height="40" width="150"/></a>
                    <td>${part[0]}</td>
                    <td>${part[1]}</td>
                    <td><a href="${editPartUrl}"><img src="${editImgUrl}"/></a></td>
                    <td><a href="${deletePartUrl}"><img src="${deleteImgUrl}"/></a></td>
                    <td><a href="${editDescUrl}">go to description</a></td>
                </tr>
            </c:forEach>
        </table>
    </c:if>
</div>

