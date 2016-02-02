<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<spring:message code="label.producer" var="producer"/>
<spring:message code="label.price_minimum" var="price_minimum"/>
<spring:message code="label.part_photo" var="part_photo"/>
<spring:url value="/part/photo" var="partPhotoUrl"/>

<c:url var="editImgUrl" value="/resources/img/edit.png"/>
<c:url var="deleteImgUrl" value="/resources/img/delete.png"/>
<c:url var="addPartUrl" value="/part/add"/>
<c:set var="manufacturs" scope="session"/>
<div class="col-md-3">
    <form method="get" role="form" >
        <label class="control-label">${producer}</label>
        <c:forEach items="${manufacturFilterList}" var="manufacturFilter">
            <div class="checkbox col-lg-push-1">
                <c:if test="${manufacturFilter.usage!=false}">
                    <input type="checkbox" name="manufacturs" checked onclick="this.form.submit();"
                           value=${manufacturFilter.manufactur.manufactur_id}>
                </c:if>
                <c:if test="${manufacturFilter.usage==false}">
                    <input type="checkbox" name="manufacturs" onclick="this.form.submit();"
                           value=${manufacturFilter.manufactur.manufactur_id}>
                </c:if>
                    ${manufacturFilter.manufactur.manufactur_name}
            </div>
        </c:forEach>
        <label class="control-label">${price_minimum}</label>
        <div class="row" id="price_row">
            <div class="col-md-6 form-group">
                <input type="number" class="form-control" name="price_from"
                       value=${price_from}  onchange="this.form.submit();">
            </div>
            <div class="col-md-6 form-group">
                <input type="number" class="form-control" name="price_to"
                       value=${price_to} onchange="this.form.submit();">
            </div>
        </div>
    </form>
</div>
<div class="col-md-9">
    <table class="table table-hover">
        <c:forEach items="${listPart}" var="p">
            <c:if test="${!empty p[1]}">
                <tr>
                    <td><img src="${partPhotoUrl}/${p[0]}" class="img-rounded" height="40" width="150"/>
                    </td>
                    <td><c:out value="${p[1]}"/></td>
                    <td>
                        от <c:out value="${p[2]}"/> <c:out value="${p[4]}"/>
                        <br>
                        <c:out value="${p[3]}"/> предложений
                    </td>
                </tr>
            </c:if>
        </c:forEach>
    </table>
    <br>

    <sec:authorize access="hasRole('ROLE_ADMIN')">
        <p>Ваш логин: <sec:authentication property="principal.username"/></p>
    </sec:authorize>

</div>