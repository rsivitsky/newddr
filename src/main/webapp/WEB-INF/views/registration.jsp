<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<style>
    .error {
        color: #ff0000;
    }
</style>

<spring:message code="label.user_firstname" var="user_firstname"/>
<spring:message code="label.user_lastname" var="user_lastname"/>
<spring:message code="label.user_login" var="user_login"/>
<spring:message code="label.user_password" var="user_password"/>
<spring:message code="label.user_email" var="user_email"/>
<spring:message code="label.user_role" var="user_role"/>
<spring:message code="label.user_vendor" var="user_vendor"/>
<spring:message code="label.edit" var="edit"/>
<spring:message code="label.add" var="add"/>
<spring:message code="label.public_cancel" var="cancel"/>
<spring:message code="label.registration_welcome" var="registration_welcome"/>

<spring:url var="addAction" value="/registration/save"/>
<spring:url value="/registration" var="cancelAction"/>

<div class="col-md-8">
    <form:form action="${addAction}" commandName="user">
        <table class="table table-hover">
            <tr bgcolor="#87ceeb">
                <td colspan="2">
                    <h3> ${registration_welcome} </h3>
                </td>
            </tr>
            <tr>
                <th>
                        ${user_firstname}
                </th>
                <td>
                    <form:input path="firstname" size="50" value=""/>
                    <form:errors path="firstname" cssClass="error"/>
                </td>
            </tr>
            <tr>
                <th>
                        ${user_lastname}
                </th>
                <td>
                    <form:input path="lastname" size="50" value=""/>
                    <form:errors path="lastname" cssClass="error"/>
                </td>
            </tr>
            <tr>
                <th>
                        ${user_login}
                </th>
                <td>
                    <form:input path="login" size="50" value=" "/>
                    <form:errors path="login" cssClass="error"/>
                </td>
            </tr>
            <tr>
                <th>
                        ${user_password}
                </th>
                <td>
                    <form:password path="password" size="50" value=" "/>
                    <form:errors path="password" cssClass="error"/>
                </td>
            </tr>
            <tr>
                <th>
                        ${user_email}
                </th>
                <td>
                    <form:input path="email" size="50" value=""/>
                    <form:errors path="email" cssClass="error"/>
                </td>
            </tr>
            <tr>
                <th>
                        ${user_role}
                </th>
                    <%-- <td>
                         <form:select path="role">
                             <form:option value="NONE" label="--- Select ---"/>
                             <form:options items="${listRolesWithoutAdmin}"/>
                         </form:select>
                     </td> --%>
                <td>
                    <form:select path="role" id="select_role" onchange="
                    {
                    if(
                       this.options[this.selectedIndex].label != 'ROLE_VENDOR')
                       {
                            document.getElementById('s_vendor').style.display = 'none';
                       }
                       else
                       {
                            document.getElementById('s_vendor').style.display = 'table-row';
                       }
                         }">
                        <form:options items="${listRolesWithoutAdmin}" itemValue="role_id" itemLabel="role_name"/>
                    </form:select>
                </td>
            </tr>
            <tr id="s_vendor" style="display: none">
                <th>
                        ${user_vendor}
                </th>
                <td>
                    <form:select path="vendor.vendor_id" id="select_vendor">
                        <form:option value="0" label="--- Select ---"/>
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
