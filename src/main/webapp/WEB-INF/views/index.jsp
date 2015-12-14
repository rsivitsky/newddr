<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>Spring Security</title>

  <link href="<c:url value="/css/bootstrap.css" />" rel="stylesheet">

</head>

<body>

<div class="container">

  <div class="thumbnail" style="margin-top: 20px;">
    <h1>DDR.COM</h1>
    <p class="lead">
      продажа запчастей
    </p>
    <sec:authorize access="!isAuthenticated()">
      <div class="container" style="width: 300px;">
        <c:url value="/j_spring_security_check" var="loginUrl" />
        <form action="${loginUrl}" method="post">
          <h2 class="form-signin-heading">Please sign in</h2>
          <table>
            <tr>
              <th><label for="login">Login</label></th>
              <td>
                <input type="text" class="form-control" id="login" name="j_username" placeholder="login" required autofocus>
              </td>
            </tr>
            <tr>
              <th><label for="password">Password</label></th>
              <td>
                <input type="password" class="form-control" id="password" name="j_password" placeholder="password" required>
              </td>
            </tr>
            <tr>
              <th></th>
              <td>
                <label for="remember_me"
                       class="inline">Remember me</label>
                <input id="remember_me"
                       name="_spring_security_remember_me"
                       type="checkbox"/>
                <!-- Флажок "запомнить меня" -->
              </td>
            </tr>
          </table>
          <button class="btn btn-lg btn-primary btn-block" type="submit">Sign in</button>
        </form>
      </div>
     <%-- <p><a class="btn btn-lg btn-success" href="<c:url value="/login" />" role="button">Войти</a></p>--%>
    </sec:authorize>
    <sec:authorize access="isAuthenticated()">
      <p>Ваш логин: <sec:authentication property="principal.username" /></p>
      <p><a class="btn btn-lg btn-danger" href="<c:url value="/part/list" />" role="button">part list</a></p>

    </sec:authorize>
  </div>

  <div class="footer">
    <p>© DDR 2015</p>
  </div>

</div>
</body>
</html>