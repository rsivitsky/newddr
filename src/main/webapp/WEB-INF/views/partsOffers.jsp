<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<spring:url value="/part/photo" var="partPhotoUrl"/>
<spring:url value="/part/description/${part[0]}" var="partInfo"/>
<spring:message code="label.vendors" var="number_sellers"/>
<spring:message code="label.put_to_cart" var="put_to_cart"/>

<c:set var="quantity" scope="request"/>
<div class="col-md-12">
    <c:if test="${part != null}">
        <div class="row">
            <div class="col-md-4">
                <a href="${partInfo}"><img src="${partPhotoUrl}/${part[0]}" class="img-rounded" height="40"
                                           width="150"/></a>
            </div>
            <div class="col-md-4">
                <label class="control-label">${part[1]}</label>
            </div>
            <div class="col-md-4">
                <label class="control-label">${part[2]} - ${part[3]}</label>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12">
                <label class="control-label">${number_sellers}: ${part[4]}</label>
            </div>
        </div>
    </c:if>
    <c:if test="${!empty listPartsOffers}">
        <table class="table table-hover">
            <c:forEach items="${listPartsOffers}" var="partsOffer">
                <form action="/cart/add/${partsOffer.offer_id}" method="get">
                <tr>
                    <td>
                            ${partsOffer.offer_price} ${partsOffer.currency.valuta_name}
                    </td>

                    <td>
                            ${partsOffer.vendor.vendor_name}
                    </td>
                    <td>
                        <input type="number" name="quantity" value="1">
                       </td>
                    <td>

                         <%--   <a href="<c:url value="/cart/add">
                                <c:param name="offerId" value="${partsOffer.offer_id}"/>
                       </c:url>">add to your cart</a>--%>
<input type="submit">
                   </td>
               </tr>
                </form>
           </c:forEach>
       </table>
   </c:if>
</div>

