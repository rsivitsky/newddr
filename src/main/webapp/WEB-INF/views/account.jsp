<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<spring:url var="addAction" value="/user/add"/>
<spring:url value="/account" var="cancelAction"/>
<spring:url var="editImgUrl" value="/resources/img/edit.png"/>
<spring:url var="deleteImgUrl" value="/resources/img/delete.png"/>

<spring:message code="label.edit" var="edit"/>
<spring:message code="label.delete" var="delete"/>
<spring:message code="label.add" var="add"/>
<spring:message code="label.public_cancel" var="cancel"/>

<spring:message code="label.user_firstname" var="user_firstname"/>
<spring:message code="label.user_lastname" var="user_lastname"/>
<spring:message code="label.user_login" var="user_login"/>
<spring:message code="label.user_password" var="user_password"/>
<spring:message code="label.user_role" var="user_role"/>
<spring:message code="label.user_vendor" var="user_vendor"/>

<c:set var="vendor" value="${user.vendor.vendor_name}"/>

<div>
    <form:form action="${addAction}" commandName="user">
        <table class="table table-hover">
            <tr bgcolor="#87ceeb">
                <th>
                        ${user_firstname}
                </th>
                <th>
                        ${user_lastname}
                </th>
                <th>
                        ${user_login}
                </th>
                <th>
                        ${user_password}
                </th>
                <th>
                        ${user_role}
                </th>
                <th>
                        ${user_vendor}
                </th>
            </tr>
            <tr>
                <td>
                    <form:input path="firstname"/>
                </td>
                <td>
                    <form:input path="lastname"/>
                </td>
                <td>
                    <form:input path="login"/>
                </td>
                <td>
                    <form:input path="password"/>
                </td>
                <td>
                    <form:select path="role.role_id">
                        <c:if test="${empty role}">
                            <form:option value="NONE" label="--- Select ---"/>
                        </c:if>
                        <form:options items="${listRoles}" itemValue="role_id" itemLabel="role_name"/>
                    </form:select>
                </td>
                <td>
                    <form:select path="vendor.vendor_id">
                        <c:if test="${empty vendor}">
                            <form:option value="NONE" label="--- Select ---"/>
                        </c:if>
                        <form:options items="${listVendors}" itemValue="vendor_id" itemLabel="vendor_name"/>
                    </form:select>
                </td>
            </tr>
            <tr>
                <td colspan="6">
                    <c:if test="${!empty user.firstname}">
                        <input type="submit" class="btn btn-info"
                               value="<spring:message text="${edit}"/>"/>
                    </c:if>
                    <c:if test="${empty user.firstname}">
                        <input type="submit" class="btn btn-info"
                               value="<spring:message text="${add}"/>"/>
                    </c:if>
                    <a href="${cancelAction}" class="btn btn-info" role="button">${cancel}</a>
                </td>
            </tr>
        </table>
    </form:form>
</div>
