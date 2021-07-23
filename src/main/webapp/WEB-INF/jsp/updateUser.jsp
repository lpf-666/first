<%--
  Created by IntelliJ IDEA.
  User: LPF
  Date: 2021/7/2
  Time: 13:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page isELIgnored="false" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
    <title>Title</title>
</head>
<body>


<form action="/user/updateUser" method="post">
    <input type="hidden" name="id" value="${user.id}"/>
    username:<input type="text" name="username" value="${user.username}"><br/>
    birthdayT:<input type="datetime-local" name="birthdayT" value="${user.birthdayT}"><br/>
    sex:<input type="text" name="sex" value="${user.sex}"><br/>
    address:<input type="text" name="address" value="${user.address}"><br/>
    <input type="submit" value="修改">
</form>

</body>
</html>
