<%@ page language="java" contentType="text/html; charset=utf8"
		 pageEncoding="utf8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>Role Page</title>
	<style type="text/css">
		.tg  {border-collapse:collapse;border-spacing:0;border-color:#ccc;}
		.tg td{font-family:Arial, sans-serif;font-size:14px;padding:10px 5px;border-style:solid;border-width:1px;overflow:hidden;word-break:normal;border-color:#ccc;color:#333;background-color:#fff;}
		.tg th{font-family:Arial, sans-serif;font-size:14px;font-weight:normal;padding:10px 5px;border-style:solid;border-width:1px;overflow:hidden;word-break:normal;border-color:#ccc;color:#333;background-color:#f0f0f0;}
		.tg .tg-4eph{background-color:#f9f9f9}
	</style>
</head>
<body>
<h1>
	Add a Role
</h1>

<c:url var="addAction" value="/role/add" ></c:url>

<form:form action="${addAction}" commandName="role">
<table>
	<tr>
		<td>
			<form:label path="role_name">
				<spring:message text="RoleName"/>
			</form:label>
		</td>
		<td>
			<form:input path="role_name" />
		</td>
	</tr>
	<tr>
		<c:if test="${!empty role.role_name}">
			<input type="submit"
				   value="<spring:message text="Edit Role"/>" />
		</c:if>
		<c:if test="${empty role.role_name}">
			<input type="submit"
				   value="<spring:message text="Add Role"/>" />
		</c:if>
	</tr>
</table>	
</form:form>

<c:if test="${!empty listRole}">
	<br>
	<h3>Role List</h3>
	<table class="data">
	<tr>
		<th width="80">Role ID</th>
		<th width="120">Role Name</th>
		<th width="60">Delete</th>
	</tr>
	<c:forEach items="${listRole}" var="roleitem">
		<tr>
			<td>${roleitem.role_id}</td>
			<td>${roleitem.role_name}</td>
			<td><a href="<c:url value='/role/edit/${roleitem.role_id}' />" >Edit</a></td>
			<td><a href="<c:url value='/role/remove/${roleitem.role_id}' />" >Delete</a></td>
		</tr>
	</c:forEach>
	</table>
</c:if>
</body>
</html>
