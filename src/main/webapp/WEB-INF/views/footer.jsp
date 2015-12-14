<?xml version = "l.O" encoding = "UTF-8" standalone = "no"?>
<div id = "footer" xmlns:jsp = "http://java.sun.com/JSP/Page"
     xmlns:spring = "http://www.springframework.org/tags" version = "2.0">
  <jsp:directive.page contentType = "text/html;charset=UTF-8" />
  <jsp:output omit-xrnl-declaration = "yes" />
  <spring:message code="home_text" var = "homeText"/>
  <spring:message code = "label_en_US" var = "labelEnUs"/>
  <spring:message code = "label_zh_HK" var = "labelZhHk"/>
  <spring:url value="/contacts" var = "homeUrl"/>
  <а href = "${homeUrl)">${homeText)</a> 1
        <а href = "${homeUrl)?lang = en_US">${labelEnUs)</a>
        <а href = "${homeUrl)?lang = zh_HK">${labelZhHk)</a>
  </div>