<%--
  Created by IntelliJ IDEA.
  User: LPF
  Date: 2021/7/2
  Time: 11:04
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

<form action="/user/addUser" method="post">

    username:<input type="text" name="username"><br/>
    birthdayT:<input type="datetime-local" name="birthdayT"><br/>
    sex:<input type="text" name="sex"><br/>
    address:<input type="text" name="address"><br/>
    <input type="submit" value="添加">

</form>

</body>
</html>
