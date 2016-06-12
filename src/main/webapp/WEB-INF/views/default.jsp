<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="content-type" content="text/html; charset=utf-8"/>
    <link href="<c:url value="/resources/css/bootstrap.min.css" />" rel="stylesheet" type="text/css"/>
    <script src="/resources/js/jquery-2.1.4.min.js"></script>
    <script src="/resources/js/bootstrap.min.js"></script>
</head>
<body>
<div class="container">
    <div class="row">
        <div class="col-md-7">
            <tiles:insertAttribute name="menu" ignore="true"/>
        </div>
        <div class="col-md-4">
            <tiles:insertAttribute name="header" ignore="true"/>
        </div>
        <div class="col-md-1">
            <tiles:insertAttribute name="cart_info" ignore="true"/>
        </div>
    </div>
    <div class="row">
            <tiles:insertAttribute name="body" ignore="true"/>
    </div>
    <div class="row">
        <tiles:insertAttribute name="footer" ignore="true"/>
    </div>
</div>
</body>

</html>