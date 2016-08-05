<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<spring:message code="label.order_date" var="order_date"/>
<spring:message code="label.order_status" var="order_status"/>
<spring:message code="label.order_part" var="order_part"/>
<spring:message code="label.order_num" var="order_num"/>
<spring:message code="label.order_currency" var="order_currency"/>
<spring:message code="label.order_sum" var="order_sum"/>
<spring:message code="label.cancel" var="order_cancel"/>
<spring:message code="label.cart" var="cart"/>
<spring:message code="label.cart" var="cart"/>
<spring:message code="label.you_need_login" var="you_need_login"/>

<spring:message code="label.place_you_order" var="place_you_order"/>
<spring:message code="label.place_all_you_order" var="place_all_you_order"/>
<spring:message code="label.print_you_order" var="print_you_order"/>
<spring:message code="label.print_all_you_order" var="print_all_you_order"/>

<c:url var="cancelImgUrl" value="/resources/img/cancel.png"/>
<c:url var="editImgUrl" value="/resources/img/edit.png"/>
<c:url var="placeAllYourOrdersUrl" value="/order/place/all"/>
<c:url var="printAllYourOrdersUrl" value="/order/print/all"/>
<c:set var="status_new" scope="request" value="NEW"/>
<c:set var="status_ordered" scope="request" value="ORDERED"/>
<c:set var="status_paid" scope="request" value="PAID"/>
<c:set var="having_new_order" scope="request" value="false"/>

<div>
    <c:if test="${sessionScope.anonym!=null}">
        <div class="row">
            <div class="col-md-12" align="center" style="font-size: medium; background-color: #edffa8; color: #4547ff">
                    ${you_need_login}
            </div>
        </div>
    </c:if>
    <form method="get" role="form">
        <h3>${cart}</h3>
        <table class="table table-hover table-responsive">
            <tr>
                <th class="col-md-1">
                    <span class="label label-primary">${order_date}</span>
                </th>
                <th class="col-md-1">
                    <span class="label label-primary">${order_status}</span>
                </th>
                <th class="col-md-3">
                    <span class="label label-primary">${order_part}</span>
                </th>
                <th class="col-md-1">
                    <span class="label label-primary">${order_num}</span>
                </th>
                <th class="col-md-1">
                    <span class="label label-primary">${order_sum}</span>
                </th>
                <th class="col-md-1">
                    <span class="label label-primary">${order_currency}</span>
                </th>
                <th class="col-md-1">

                </th>
                <th class="col-md-1">

                </th>
                <th class="col-md-1">

                </th>
            </tr>
            <c:forEach items="${orderListByUser}" var="order_item">
                <c:url var="editOrderUrl" value="/cart/order/edit/${order_item.booking_id}"/>
                <c:url var="cancelOrderUrl" value="/order/cancel/${order_item.booking_id}"/>
                <c:url var="placeYourOrderUrl" value="/order/place/${order_item.booking_id}"/>
                <c:url var="printOrderInPdfUrl" value="/order/print_pdf/${order_item.booking_id}"/>
                <tr>
                    <td><fmt:formatDate pattern="dd-MM-yyyy"
                                        value="${order_item.booking_date}"/></td>
                    <td>${order_item.booking_status}</td>
                    <td>${order_item.part.part_name}</td>
                    <td><a href="${editOrderUrl}">${order_item.booking_num}</a></td>
                    <td>${order_item.booking_sum}</td>
                    <td>${order_item.offer.currency}</td>
                    <td>
                        <c:if test="${!empty order_item.booking_status}">
                            <c:if test="${order_item.booking_status==status_new}">
                                <c:set var="having_new_order" value="true"/>
                                <a href="${placeYourOrderUrl}"
                                   class="btn btn-primary glyphicon glyphicon-shopping-cart"
                                   role="button">${place_you_order}</a>
                            </c:if>
                            <c:if test="${order_item.booking_status==status_ordered || order_item.booking_status==status_ordered}">
                                <a href="${printOrderInPdfUrl}"
                                   class="btn btn-primary glyphicon glyphicon-print"
                                   role="button">${print_you_order}</a>
                            </c:if>
                        </c:if>
                    </td>
                    <c:if test="${order_item.booking_status==status_new}">
                        <td><a href="${editOrderUrl}"><img src="${editImgUrl}"/></a></td>
                        <td><a href="${cancelOrderUrl}" title=${order_cancel}><img
                                src="${cancelImgUrl}"/></a>
                        </td>
                    </c:if>
                </tr>
            </c:forEach>
            <tr>
                <td class="col-md-8">

                </td>
                <td class="col-md-1">
                    <c:if test="${having_new_order==true}">
                        <a href="${placeAllYourOrdersUrl}"
                           class="btn btn-primary glyphicon glyphicon-shopping-cart"
                           role="button">${place_all_you_order}</a>
                        <a href="${printAllYourOrdersUrl}"
                           class="btn btn-primary glyphicon glyphicon-print"
                           role="button">${print_all_you_order}</a>
                    </c:if>
                </td>
            </tr>
        </table>
    </form>
</div>