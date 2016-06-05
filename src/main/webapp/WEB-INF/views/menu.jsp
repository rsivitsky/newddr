<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>

<spring:message code="label.admin" var="admin"/>
<spring:message code="label.home" var="home"/>
<spring:message code="label.about" var="about"/>
<spring:message code="label.offer" var="offer"/>
<spring:message code="label.order" var="order"/>
<spring:message code="label.vendor" var="vendor"/>
<spring:message code="label.account" var="account"/>
<spring:message code="label.measure" var="measure"/>

<spring:message code="label.manufactur" var="manufactur"/>
<spring:message code="label.part" var="part"/>
<spring:message code="label.user" var="user"/>
<spring:message code="label.specification" var="specification"/>

<spring:message code="label.description" var="description"/>

<spring:message code="label.contact_info" var="contact_info"/>

<spring:url var="partUrl" value="/part/list"/>
<spring:url var="userUrl" value="/user"/>

<spring:url var="manufacturUrl" value="/manufactur"/>
<spring:url var="vendorUrl" value="/vendor"/>
<spring:url var="measureUrl" value="/measure"/>
<spring:url var="specificationUrl" value="/specification"/>

<spring:url var="homeUrl" value="/index"/>
<spring:url var="offerUrl" value="/offers"/>
<spring:url var="orderUrl" value="/order/list"/>
<spring:url var="aboutUrl" value="#"/>

<nav>
    <nav class="navbar navbar-default">
        <ul class="nav navbar-nav">
            <li>
                <a href="/index?page=1&price_from=${sessionScope.price_from}&price_to=${sessionScope.price_to}">${home}</a>
            </li>
            <sec:authorize access="hasAnyRole('ROLE_ADMIN')">
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                        <i class="icon-th-large"></i> ${admin}
                        <b class="caret"></b>
                    </a>
                    <ul class="dropdown-menu">
                        <li><a href=${offerUrl}>${offer}</a></li>
                        <li><a href=${orderUrl}>${order}</a></li>
                        <li><a href=${userUrl}>${user}</a></li>
                        <li><a href=${partUrl}>${part}</a></li>
                        <li><a href=${measureUrl}>${measure}</a></li>

                        <li><a href=${specificationUrl}>${specification}</a></li>

                        <li><a href=${manufacturUrl}>${manufactur}</a></li>
                        <li><a href=${vendorUrl}>${vendor}</a></li>
                    </ul>
                </li>
            </sec:authorize>
            <sec:authorize access="hasAnyRole('ROLE_VENDOR')">
                <li><a href="${offerUrl}"> ${offer}</a></li>
            </sec:authorize>
            <sec:authorize access="hasAnyRole('ROLE_VENDOR')">
                <li><a href="${orderUrl}">${order}</a></li>
            </sec:authorize>
            <li class="active"><a href="${aboutUrl}">${about}</a></li>
            <sec:authorize access="isAuthenticated()">
                <li><a href="/account">${account}</a></li>
            </sec:authorize>
        </ul>
    </nav>
</nav>
