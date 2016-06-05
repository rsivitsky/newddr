<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<c:url var="editImgUrl" value="/resources/img/edit.png"/>
<c:url var="deleteImgUrl" value="/resources/img/delete.png"/>

<spring:message code="label.offer_date" var="offer_date"/>
<spring:message code="label.offer_vendor" var="offer_vendor"/>
<spring:message code="label.edit" var="edit"/>
<spring:message code="label.public_cancel" var="cancel"/>
<spring:message code="label.add" var="add"/>
<spring:message code="label.name" var="name"/>
<spring:message code="label.manufactur" var="manufactur"/>
<spring:message code="label.part_photo" var="part_photo"/>
<spring:message code="label.select_photo" var="select_photo"/>
<spring:message code="label.select_file" var="select_file"/>

<spring:url var="addAction" value="/part/add"/>
<spring:url value="/part/list" var="cancelAction"/>

<form:form action="${addAction}" commandName="part" enctype="multipart/form-data">
    <c:url var="partPhotoUrl" value="/part/photo/${part.part_id}"/>
    <table class="table table-hover table-responsive">
        <tr bgcolor="#87ceeb">
            <th>
                    ${name}
            </th>
            <th>
                    ${manufactur}
            </th>
            <th>
                    ${part_photo}
            </th>
            <th>
                    ${select_photo}
            </th>

        </tr>
        <tr>
            <td>
                <form:input path="part_name" name="part_name" cssStyle="border: none"/>
                <form:errors path="part_name" cssClass="error"/>
            </td>
            <td>
                <form:select path="manufactur.manufactur_id" name="manufactur" items="${listManufactur}"
                             itemValue="manufactur_id"
                             itemLabel="manufactur_name" cssStyle="border: none">
                </form:select>
            </td>
            <td>
                <c:if test="${!empty part.part_id}">
                    <img src="${partPhotoUrl}" class="img-rounded" height="40" width="150"/>
                </c:if>
            </td>
            <td>
                <input name="img_file" type='file'/>
            </td>
        </tr>
        <tr>
            <td colspan="12">
                <c:if test="${!empty part.part_id}">
                    <input type="submit" class="btn btn-info"
                           value="<spring:message text="${edit}"/>"/>
                </c:if>
                <c:if test="${empty part.part_id}">
                    <input type="submit" class="btn btn-info"
                           value="<spring:message text="${add}"/>"/>
                </c:if>
                <a href="${cancelAction}" class="btn btn-info" role="button">${cancel}</a>
            </td>
        </tr>
    </table>
</form:form>
<br>

<div class="col-md-12">
    <c:if test="${!empty listPart}">
        <table class="table table-hover">
            <c:forEach items="${listPart}" var="part">
                <c:url var="editPartUrl" value="/part/edit/${part.part_id}"/>
                <c:url var="deletePartUrl" value="/part/remove/${part.part_id}"/>
                <c:url var="editDescUrl" value="/part/descript/edit/${part.part_id}"/>
                <c:url var="partDescription" value="/part/description/${part.part_id}"/>
                <c:url var="partPhotoUrl" value="/part/photo/${part.part_id}"/>
                <tr>
                    <td><a href="${partDescription}"><img src="${partPhotoUrl}" class="img-rounded" height="40"
                                                          width="150"/></a>
                    <td>${part.part_name}</td>
                    <td>${part.manufactur.manufactur_name}</td>
                    <td><a href="${editPartUrl}"><img src="${editImgUrl}"/></a></td>
                    <td><a href="${deletePartUrl}"><img src="${deleteImgUrl}"/></a></td>
                    <td><a href="${editDescUrl}">go to description</a></td>
                </tr>
            </c:forEach>
        </table>
    </c:if>
</div>

