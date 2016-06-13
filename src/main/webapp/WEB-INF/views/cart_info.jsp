<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<spring:message code="label.quantity_of_orders" var="quantity_of_orders"/>

<c:url var="basketFullUrl" value="/resources/img/shopping-basket-full.png"/>
<c:url var="basketEmptyUrl" value="/resources/img/shopping-basket.png"/>

<div class="hero-unit">
    <c:set var="cartInfo" value="${cartInfo}"/>
    <c:url var="cartInfoUrl" value="/cart/info"/>
    <c:if test="${cartInfo == null}">
        <div class="row">
            <div class="col-md-12">
                <img src="${basketEmptyUrl}" alt="shopping cart" title="empty cart"/>
            </div>
        </div>
    </c:if>

    <c:if test="${cartInfo!=null}">
        <c:if test="${cartInfo[0]==0}">
            <div class="row">
                <div class="col-md-12">
                    <img src="${basketEmptyUrl}" alt="shopping cart" title="empty cart"/>
                </div>
            </div>
        </c:if>
        <c:if test="${cartInfo[0]!=0}">
            <div class="row">
                <div class="col-md-4">
                    <a href="${cartInfoUrl}"><img src="${basketFullUrl}" alt="shopping cart"/></a>
                </div>
                <div class="col-md-8" style="vertical-align: middle" align="left">
                    <br>
                    <a href="${cartInfoUrl}" title=${cart}>${quantity_of_orders}: ${cartInfo[0]}</a>
                </div>
            </div>
        </c:if>
    </c:if>
</div>