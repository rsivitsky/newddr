<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<spring:message code="label.order_date" var="booking_date"/>
<spring:message code="label.order_status" var="order_status"/>
<spring:message code="label.order_user" var="order_user"/>
<spring:message code="label.order_part" var="order_part"/>
<spring:message code="label.order_num" var="order_num"/>
<spring:message code="label.order_currency" var="order_currency"/>
<spring:message code="label.order_sum" var="order_sum"/>
<spring:message code="label.order_offer" var="order_offer"/>
<spring:message code="label.edit" var="edit"/>
<spring:message code="label.add" var="add"/>
<spring:message code="label.public_cancel" var="cancel"/>
<spring:message code="label.delete" var="delete"/>
<spring:message code="label.order_list" var="order_list"/>

<spring:url var="OrderAddUrl" value="/cart/order/save"/>

<div class="col-md-12">
    <form:form action="${OrderAddUrl}" commandName="order" method="post" enctype="multipart/form-data">
        <table class="table table-hover table-responsive">
            <tr bgcolor="#87ceeb">
                <th>
                    <span class="label label-primary">${order_part}</span>
                </th>
                <th>
                    <span class="label label-primary">${order_num}</span>
                </th>
                <th>
                    <span class="label label-primary">${order_sum}</span>
                </th>
            </tr>
            <tr>
                <td>
                        ${order.part.part_name}
                </td>
                <td>
                    <form:input path="booking_num" class="form-control" onchange="this.form.submit();"/>
                </td>
                <td><%-- ${order.booking_sum} --%>
                        ${order.booking_num*order.offer.offer_price}
                </td>
        </table>
    </form:form>
</div>