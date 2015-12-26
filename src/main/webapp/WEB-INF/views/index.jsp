<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<c:url var="editImgUrl" value="/resources/img/edit.png"/>
<c:url var="deleteImgUrl" value="/resources/img/delete.png"/>
<c:url var="addPartUrl" value="/part/add"/>
<c:url var="editPartUrl" value="/part/edit/${part.part_id}"/>
<c:url var="deletePartUrl" value="/part/remove/${part.part_id}"/>
<c:url var="editDescUrl" value="/part/descript/edit/${part.part_id}"/>
<%--<table style="border: 1px solid; width: 100%; text-align:center">--%>
<table class="table table-hover table-responsive">
<thead style="background:#d3dce3">
<tr>
    <th>#</th>
    <th>Part Name</th>
    <th colspan="2"></th>
    <th>Description</th>
</tr>
</thead>
<tbody style="background:#ccc">
<c:forEach items="${listPart}" var="part">
    <c:if test="${!empty part.part_name}">
        <tr>
            <td><c:out value="${part.part_id}"/></td>
            <td><c:out value="${part.part_name}"/></td>
            <td><a href="${editPartUrl}"><img src="${editImgUrl}"/></a></td>
            <td><a href="${deletePartUrl}"><img src="${deleteImgUrl}"/></a></td>
            <td><a href="${editDescUrl}">go to description</a></td>
        </tr>
    </c:if>
</c:forEach>
</tbody>
</table>
<br>
<sec:authorize access="isAuthenticated()">
    <p>Ваш логин: <sec:authentication property="principal.username"/></p>
</sec:authorize>
