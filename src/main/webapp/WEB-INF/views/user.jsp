<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<spring:url var="addAction" value="/user/add"/>
<spring:url value="/user" var="cancelAction"/>
<spring:url var="editImgUrl" value="/resources/img/edit.png"/>
<spring:url var="deleteImgUrl" value="/resources/img/delete.png"/>

<spring:message code="label.user_list" var="user_list"/>
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
			<form:input path="firstname" />
		</td>
		<td>
			<form:input path="lastname" />
		</td>
		<td>
			<form:input path="login" />
		</td>
		<td>
			<form:input path="password" />
		</td>
		<td>
			<form:select path="role">
				<form:option value="NONE" label="--- Select ---"/>
				<form:options items="${listRoles}"/>
			</form:select>
		</td>
		<td>
			<form:select path="vendor.vendor_id">
				<c:if test="${empty vendor}">
					<form:option value="NONE" label="--- Select ---" />
				</c:if>
				<form:options items="${listVendors}" itemValue="vendor_id" itemLabel="vendor_name"  />
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

<c:if test="${!empty listUsers}">
	<br>
	<h3>${user_list}</h3>
	<table class="table table-hover">
	<c:forEach items="${listUsers}" var="useritem">
		<tr>
			<td>${useritem.user_id}</td>
			<td>${useritem.firstname}</td>
			<td>${useritem.lastname}</td>
			<td>${useritem.role}</td>
			<td><a href="<c:url value='/edit/${useritem.user_id}' />" title=${edit}><img src="${editImgUrl}"/></a>
			<td><a href="<c:url value='/remove/${useritem.user_id}' />" title=${delete}><img
				src="${deleteImgUrl}"/></a>
		</tr>
	</c:forEach>
	</table>
</c:if>
</div>
