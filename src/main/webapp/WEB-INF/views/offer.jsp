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
<spring:message code="label.offer_list" var="offer_list"/>
<spring:message code="label.edit" var="edit"/>
<spring:message code="label.delete" var="delete"/>
<spring:message code="label.add" var="add"/>
<spring:message code="label.user_dont_have_vendor" var="user_dont_have_vendor"/>
<spring:message code="label.public_cancel" var="cancel"/>

<spring:url var="editImgUrl" value="/resources/img/edit.png"/>
<spring:url var="deleteImgUrl" value="/resources/img/delete.png"/>
<spring:url var="addAction" value="/offers/add"/>
<spring:url var="loadAction" value="/offers/load"/>
<spring:url value="/offers" var="cancelAction"/>

<div class="col-md-4">
    <form:form action="${loadAction}" method="post" enctype="multipart/form-data">
        <c:if test="${user.vendor==null}">
            <h12 style="background-color: #ff69b4"> ${user_dont_have_vendor} </h12>
        </c:if>
        <input type="file" name="offers_file">
        <br>
        <input type="submit"
               value="<spring:message text="load"/>"/>
    </form:form>

</div>

<div class="col-md-8">
    <form:form action="${addAction}" commandName="offer">
        <table class="table table-hover table-responsive">
            <tr bgcolor="#87ceeb">
                <sec:authorize access="hasRole('ROLE_ADMIN')">
                    <th>
                        ${offer_vendor}
                    </th>
                </sec:authorize>
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
            </tr>
            <tr>
                <sec:authorize access="hasRole('ROLE_ADMIN')">
                    <td>
                        <form:select path="vendor.vendor_id" name="vendor" items="${listVendor}" itemValue="vendor_id"
                                     itemLabel="vendor_name" cssStyle="border: none"/>
                    </td>
                </sec:authorize>
                <td>
                    <form:input type="date" path="offer_date" cssStyle="border: none"/>
                </td>
                <td>
                    <form:select path="part.part_id" name="part" items="${listPart}" itemValue="part_id"
                                 itemLabel="part_name" cssStyle="border: none"/>
                </td>
                <td>
                    <form:select path="currency">
                        <form:option value="NONE" label="--- Select ---"/>
                        <form:options items="${listCurrency}"/>
                    </form:select>
                </td>
                <td>
                    <form:input path="offer_price" cssStyle="border: none"/>
                </td>
                <td>
                    <form:input path="offer_num" name="offer_num" cssStyle="border: none"/>
                </td>
                <td style="width: auto">
                    <form:input path="offer_sum" readonly="true" name="offer_sum" cssStyle="border: none"/>
                </td>
            </tr>
            <tr>
                <td colspan="5">
                    <c:if test="${!empty offer.offer_id}">
                        <input type="submit" class="btn btn-info"
                               value="<spring:message text="${edit}"/>"/>
                    </c:if>
                    <c:if test="${empty offer.offer_id}">
                        <input type="submit" class="btn btn-info"
                               value="<spring:message text="${add}"/>"/>
                    </c:if>
                    <a href="${cancelAction}" class="btn btn-info" role="button">${cancel}</a>
                </td>
            </tr>
        </table>
    </form:form>

    <c:if test="${!empty listOffers}">
        <br>

        <h3>${offer_list}</h3>
        <table class="table table-hover table-responsive">
            <tr bgcolor="#87ceeb" >
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
                                        value="${offer_item.offer_date}"/></td>
                    <td>${offer_item.part.part_name}</td>
                    <td>${offer_item.currency}</td>
                    <td>${offer_item.offer_price}</td>
                    <td>${offer_item.offer_num}</td>
                    <td>${offer_item.offer_sum}</td>
                    <td><a href="<c:url value='/offers/edit/${offer_item.offer_id}' />" title=${edit}><img
                            src="${editImgUrl}"/></a></td>
                    <td><a href="<c:url value='/offers/remove/${offer_item.offer_id}' />" title=${delete}><img
                            src="${deleteImgUrl}"/></a></td>
                </tr>
            </c:forEach>
        </table>
    </c:if>
</div>