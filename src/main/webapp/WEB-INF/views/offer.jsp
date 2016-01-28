<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<spring:message code="label.offer_date" var="offer_date"/>
<spring:message code="label.offer_vendor" var="offer_vendor"/>
<spring:message code="label.offer_part" var="offer_part"/>
<spring:message code="label.offer_price" var="offer_price"/>
<spring:message code="label.offer_num" var="offer_num"/>
<spring:message code="label.offer_sum" var="offer_sum"/>
<spring:message code="label.offer_currency" var="offer_currency"/>
<spring:message code="label.offer_loadfromfile" var="loadfromfile"/>

<c:url var="editImgUrl" value="/resources/img/edit.png"/>
<c:url var="deleteImgUrl" value="/resources/img/delete.png"/>
<c:url var="addAction" value="/offers/add"/>
<c:url var="loadAction" value="/offers/load"/>

<div class="col-md-4">
    <form:form action="${loadAction}" method="post" enctype="multipart/form-data">
               <input type="file" name="offers_file" >
        <br>
        <input type="submit"
               value="<spring:message text="load"/>"/>
    </form:form>
</div>
<div class="col-md-8">
    <form:form action="${addAction}" commandName="offer">
        <table class="table table-hover table-responsive">
            <tr>
                <th>
                    <form:label path="vendor">
                        <spring:message text="${offer_vendor}"/>
                    </form:label>
                </th>
                <th>
                    <form:label path="offer_date">
                        <spring:message text="${offer_date}"/>
                    </form:label>
                </th>
                <th>
                    <form:label path="part">
                        <spring:message text="${offer_part}"/>
                    </form:label>
                </th>
                <th>
                    <form:label path="currency">
                        <spring:message text="${offer_currency}"/>
                    </form:label>
                </th>
                <th>
                    <form:label path="offer_price">
                        <spring:message text="${offer_price}"/>
                    </form:label>
                </th>
                <th>
                    <form:label path="offer_num">
                        <spring:message text="${offer_num}"/>
                    </form:label>
                </th>
                <th>
                    <form:label path="offer_sum">
                        <spring:message text="${offer_sum}"/>
                    </form:label>
                </th>
            </tr>
            <tr>
                <td>
                    <form:select path="vendor.vendor_id" name="vendor" items="${listVendor}" itemValue="vendor_id"
                                 itemLabel="vendor_name" cssStyle="border: none"/>
                </td>
                <td>
                    <form:input type="date" path="offer_date" cssStyle="border: none"/>
                </td>
                <td>
                    <form:select path="part.part_id" name="part" items="${listPart}" itemValue="part_id"
                                 itemLabel="part_name" cssStyle="border: none"/>
                </td>
                <td>
                    <form:select path="currency.valuta_id" name="currency" items="${listCurrency}" itemValue="valuta_id"
                                 itemLabel="valuta_name" cssStyle="border: none"/>
                </td>
                <td>
                    <form:input path="offer_price" cssStyle="border: none"/>
                </td>
                <td>
                    <form:input path="offer_num" name="offer_num" cssStyle="border: none"/>
                </td>
                <td>
                    <form:input path="offer_sum" name="offer_sum" cssStyle="border: none"/>
                </td>
            </tr>
            <tr>
                <td colspan="5">
                <c:if test="${!empty offer.offer_id}">
                    <input type="submit"
                           value="<spring:message text="Edit"/>"/>
                </c:if>
                <c:if test="${empty offer.offer_id}">
                    <input type="submit"
                           value="<spring:message text="Add"/>"/>
                </c:if>
                </td>
            </tr>
        </table>
    </form:form>

    <c:if test="${!empty listOffers}">
        <br>

        <h3>offer list</h3>
        <table class="table table-hover table-responsive">
            <tr>
                <th>
                    ${offer_vendor}
                </th>
                <th>
                    ${offer_date}
                </th>
                <th>
                    ${offer_part}
                </th>
                <th>
                    ${offer_currency}
                </th>
                <th>
                    ${offer_price}
                </th>
                <th>
                    ${offer_num}
                </th>
                <th>
                    ${offer_sum}
                </th>
                <th>

                </th>
                <th>

                </th>
            </tr>
            <c:forEach items="${listOffers}" var="offer_item">
                <tr>
                    <td>${offer_item.vendor.vendor_name}</td>
                    <td><fmt:formatDate pattern="dd-MM-yyyy"
                                    value="${offer_item.offer_date}" /></td>
                    <td>${offer_item.part.part_name}</td>
                    <td>${offer_item.currency.valuta_name}</td>
                    <td>${offer_item.offer_price}</td>
                    <td>${offer_item.offer_num}</td>
                    <td>${offer_item.offer_sum}</td>
                    <td><a href="<c:url value='/offers/edit/${offer_item.offer_id}' />"><img src="${editImgUrl}"/></a></td>
                    <td><a href="<c:url value='/offers/remove/${offer_item.offer_id}' />"><img src="${deleteImgUrl}"/></a></td>
                </tr>
            </c:forEach>
        </table>
    </c:if>
</div>