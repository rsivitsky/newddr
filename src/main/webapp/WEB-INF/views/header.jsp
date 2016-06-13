<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>

<spring:message code="label.login" var="login"/>
<spring:message code="label.logout" var="logout"/>
<spring:message code="label.auth_login" var="auth_login"/>
<spring:message code="label.auth_passw" var="auth_passw"/>
<spring:message code="label.auth_incorrect_login" var="auth_incorrect_login"/>
<spring:message code="label.auth_incorrect_passw" var="auth_incorrect_passw"/>
<spring:message code="label.forgot_passw" var="forgot_passw"/>
<spring:message code="label.remember_me" var="remember_me"/>

<spring:url value="/resources/img/ru.png" var="ruImgUrl"/>
<spring:url value="/resources/img/gb.png" var="gbImgUrl"/>
<spring:url var="logoutUrl" value="/j_spring_security_logout"/>
<spring:url value="/j_spring_security_check" var="loginUrl"/>
<spring:url value="/registration" var="registrationUrl"/>

<div>
    <a href="?lang=en_US" title="english"><img src="${gbImgUrl}"/></a> | <a href="?lang=ru_RU" title="русский"><img src="${ruImgUrl}"/></a>
    <sec:authorize access="!isAuthenticated()">
        <!-- DROPDOWN LOGIN STARTS HERE-->
        <button type="button" id="dropdownMenu1" data-toggle="dropdown"
                class="btn btn-default navbar-btn dropdown-toggle">
            <i class="glyphicon glyphicon-user color-blue"></i> ${login} <span class="caret"></span>
        </button>
        <ul class="dropdown-menu dropdown-menu-right">
            <li>
                <div class="container" style="width: 300px">
                    <form action="${loginUrl}" method="post">
                        <div class="form-group">
                            <div class="input-group">
                                    <span class="input-group-addon">
                                        <i class="glyphicon glyphicon-user color-blue"></i>
                                    </span>
                                <!--LOGIN-->
                                <input id="login" name="j_username"
                                       placeholder=${auth_login} class="form-control"
                                       type="login"
                                       oninvalid="this.setCustomValidity(validity.valueMissing ? '${auth_incorrect_login}' : '');"
                                       onchange="this.setCustomValidity(validity.valueMissing ? '${auth_incorrect_login}' : '');"
                                       required="">
                            </div>
                        </div>
                        <div class="divider" style="background-color: transparent"></div>
                        <div class="form-group">
                            <div class="input-group">
                                    <span class="input-group-addon">
                                        <i class="glyphicon glyphicon-lock color-blue"></i>
                                    </span>
                                <!--PASSWORD-->
                                <input id="password" name="j_password"
                                       placeholder=${auth_passw} class="form-control"
                                       type="password"
                                       oninvalid="this.setCustomValidity(validity.valueMissing ? '${auth_incorrect_passw}' : '');"
                                       onchange="this.setCustomValidity(validity.valueMissing ? '${auth_incorrect_passw}' : '');"
                                       required="">
                            </div>
                        </div>
                        <div class="divider" style="background-color: transparent"></div>
                        <div class="form-group">
                            <button type="submit" class="btn btn-primary form-control">${login}</button>
                        </div>
                        <div class="divider" style="background-color: transparent"></div>
                        <div class="form-group">
                            <input id="remember_me" name="_spring_security_remember_me"
                                   type="checkbox"/>${remember_me}
                        </div>
                        <div class="divider" style="background-color: transparent"></div>
                        <div class="form-group">
                            <a href="#">${forgot_passw}</a>
                        </div>
                        <div class="form-group">
                            Want an account?
                            <a href="${registrationUrl}">Join for free</a>
                            It's fast and easy!
                        </div>
                    </form>
                </div>
            </li>
        </ul>
    </sec:authorize>
    <sec:authorize access="isAuthenticated()">
        <br>
        <a href=${logoutUrl}>${logout}</a>
    </sec:authorize>
</div>
