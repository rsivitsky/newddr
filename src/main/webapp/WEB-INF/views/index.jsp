<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<spring:message code="label.producer" var="producer"/>
<spring:message code="label.price_minimum" var="price_minimum"/>
<spring:message code="label.part_photo" var="part_photo"/>
<spring:message code="label.cart_num" var="cart_num"/>
<spring:message code="label.cart_sum" var="cart_sum"/>
<spring:url value="/part/photo" var="partPhotoUrl"/>

<c:set var="manufacturs" scope="session"/>
<c:if test="${sessionScope.price_from==null}">
    <c:set var="price_from" value="0.0" scope="session"/>
</c:if>
<c:if test="${sessionScope.price_to==null}">
    <c:set var="price_to" value="0.0" scope="session"/>
</c:if>

<div class="col-md-3">
    <form method="get" role="form">
        <label class="control-label">${producer}</label>
        <c:forEach items="${manufacturFilterList}" var="manufacturFilter">
            <div class="checkbox col-lg-push-1">
                <c:if test="${manufacturFilter.usage}">
                    <input type="checkbox" name="manufacturs" checked onclick="this.form.submit();"
                           value=${manufacturFilter.manufactur.manufactur_id}>
                </c:if>
                <c:if test="${!manufacturFilter.usage}">
                    <input type="checkbox" name="manufacturs" onclick="this.form.submit();"
                           value=${manufacturFilter.manufactur.manufactur_id}>
                </c:if>
                    ${manufacturFilter.manufactur.manufactur_name}
            </div>
        </c:forEach>
        <br>
        <label class="control-label">${price_minimum}</label>
        <div class="row" id="price_row">
            <div class="col-md-6 form-group">
                <input type="number" class="form-control" name="price_from"
                       value=${sessionScope.price_from}  onchange="this.form.submit();">
            </div>
            <div class="col-md-6 form-group">
                <input type="number" class="form-control" name="price_to"
                       value=${sessionScope.price_to} onchange="this.form.submit();">
            </div>
        </div>
    </form>

    <%--<div>
        <c:if test="${cartInfo!=null}">
            <div class="row">
                <div class="col-md-6">
                    <span class="label label-primary">${cart_num}</span>
                </div>
                <div class="col-md-6">
                    <span class="label label-primary">${cart_sum}</span>
                </div>
            </div>
            <div class="row">
                <div class="col-md-6">
                    <span class="label label-primary">"${cartInfo[0]}"</span>
                </div>
                <div class="col-md-6">
                    <span class="label label-primary">${cartInfo[1]}</span>
                </div>
            </div>
        </c:if>
        <c:if test="${cartInfo==null}">
            <div class="row">
                <div class="col-md-6">
                    <span class="label label-primary">${cart_num}</span>
                </div>
                <div class="col-md-6">
                    <span class="label label-primary">${cart_sum}</span>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    empty cart
                </div>
            </div>
        </c:if>
    </div>--%>
</div>
<div class="col-md-9">
    <table class="table table-hover">
        <c:forEach items="${listPart}" var="part">
            <c:url var="offersInfo" value="/offers/partinfo/${part[2]}"/>
            <c:url var="partDescription" value="/part/description/${part[2]}"/>
            <c:if test="${!empty part[1]}">
                <tr>
                    <td><a href="${partDescription}"><img src="${partPhotoUrl}/${part[2]}" class="img-rounded"
                                                          height="40" width="150"/></a>
                    </td>
                    <td><a href="${partDescription}"><c:out value="${part[3]}"/></a></td>
                    <td>
                        <a href="${offersInfo}">от <c:out value="${part[0]}"/> <c:out value="${part[4]}"/></a>
                        <br>
                        <a href="${offersInfo}"><c:out value="${part[1]}"/> предложений</a>
                    </td>
                </tr>
            </c:if>
        </c:forEach>
    </table>
    <br>

    <%--For displaying Previous link except for the 1st page --%>
    <div class="container">
        <div class="row">
            <div class="col-md-1">
                <c:if test="${page != 1}">
                    <a href="/index?page=${page-1}&price_from=${sessionScope.price_from}&price_to=${sessionScope.price_to}">Previous</a>
                </c:if>
            </div>
        </div>
        <%--For displaying Page numbers.
        The when condition does not display a link for the current page--%>
        <div class="row">
            <div class="col-md-10">
                <ul class="pagination">
                    <c:forEach begin="1" end="${noOfPages}" var="i">
                        <c:choose>
                            <c:when test="${page eq i}">
                                <li class="active"><a
                                        href="/index?page=${i}&price_from=${sessionScope.price_from}&price_to=${sessionScope.price_to}">${i}</a>
                                </li>
                            </c:when>
                            <c:otherwise>
                                <li>
                                    <a href="/index?page=${i}&price_from=${sessionScope.price_from}&price_to=${sessionScope.price_to}">${i}</a>
                                </li>
                            </c:otherwise>
                        </c:choose>
                    </c:forEach>
                </ul>
            </div>
        </div>

        <%--For displaying Next link --%>
        <div class="row">
            <div class="col-md-1">
                <c:if test="${page lt noOfPages}">
                    <a href="/index?page=${page+1}&price_from=${sessionScope.price_from}&price_to=${sessionScope.price_to}">Next</a>
                </c:if>
            </div>
        </div>
    </div>

</div>
