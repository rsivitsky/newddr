<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<c:url var="editImgUrl" value="/resources/img/edit.png"/>
<c:url var="deleteImgUrl" value="/resources/img/delete.png"/>

<c:url var="addAction" value="/measure/add" ></c:url>

<div>
<form:form action="${addAction}" commandName="measure">
<table>
	<tr>
		<td>
			<form:label path="measure_name">
				<spring:message text="measureName"/>
			</form:label>
		</td>
		<td>
			<form:input path="measure_name" />
		</td>
	</tr>
	<tr>
		<c:if test="${!empty measure.measure_name}">
			<input type="submit"
				   value="<spring:message text="Edit"/>" />
		</c:if>
		<c:if test="${empty measure.measure_name}">
			<input type="submit"
				   value="<spring:message text="Add"/>" />
		</c:if>
	</tr>
</table>	
</form:form>

<c:if test="${!empty listMeasure}">
	<br>
	<h3>measure list</h3>
	<table class="data">
	<tr>
		<th width="80">measure ID</th>
		<th width="120">measure Name</th>
		<th width="60">Delete</th>
	</tr>
	<c:forEach items="${listMeasure}" var="measure_item">
		<tr>
			<td>${measure_item.measure_id}</td>
			<td>${measure_item.measure_name}</td>
			<td><a href="<c:url value='/measure/edit/${measure_item.measure_id}' />" ><img src="${editImgUrl}"/></a></td>
			<td><a href="<c:url value='/measure/remove/${measure_item.measure_id}' />" ><img src="${deleteImgUrl}"/></a></td>
		</tr>
	</c:forEach>
	</table>
</c:if>
</div>
