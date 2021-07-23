<%--
  Created by IntelliJ IDEA.
  User: LPF
  Date: 2021/7/1
  Time: 15:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page isELIgnored="false" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<head>
    <title>Title</title>
    <script type="text/javascript" src="/js/jquery-3.6.0.min.js"></script>
    <script>

    </script>
</head>
<body>

<table>
    <thead>
    <tr>
        <th>id</th>
        <th>名字</th>
        <th>生日</th>
        <th>性别</th>
        <th>地址</th>
        <th>操作</th>
        <th>fff</th>
    </tr>
    </thead>

    <tbody>
    <c:forEach  items="${userList}" var="user">
        <tr>
            <td>${user.id}</td>
            <td>${user.username}</td>
            <td><fmt:formatDate value="${user.birthdayT}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
            <td>${user.sex}</td>
            <td>${user.address}</td>
            <td>
                <a href="">更改</a> |
                <a href="">删除</a>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>

</body>
</html>
