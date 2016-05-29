<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:url var="addAction" value="/part/add"></c:url>

<div>
<form:form action="${addAction}" commandName="part" enctype="multipart/form-data">
    <table>
        <tr>
            <td>
                <form:label path="part_name">
                    <spring:message text="PartName"/>
                </form:label>
            </td>
            <td>
                    <form:input path="part_name"/>
            </td>
            <td>
                <input name="img_file" type="file"/>
            </td>

        </tr>
        <tr>
            <td>
                <c:if test="${!empty part.part_name}">
                    <input type="submit"
                           value="<spring:message text="Edit"/>"/>
                </c:if>
                <c:if test="${empty part.part_name}">
                    <input type="submit"
                           value="<spring:message text="Add"/>"/>
                </c:if>
            </td>
        </tr>
    </table>
</form:form>
</div>