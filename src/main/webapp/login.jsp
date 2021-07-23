<%--
  Created by IntelliJ IDEA.
  User: LPF
  Date: 2021/6/28
  Time: 16:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script type="text/javascript" src="js/jquery-3.6.0.min.js"></script>
    <script>
        $(function () {
            var id=$("#id").val();
            $("#queryBtn").bind("click",function () {
                $ajxa({
                    url:'/user/query',
                    type:'POST',
                    data:{"id":id},
                    success:function (data) {
                        alert(data);
                        $("#text1").text(data.user.username);
                        $("#text2").text(data.user.birthdayT);
                        $("#text3").text(data.user.sex);
                        $("#text4").text(data.user.adress);
                    }
                })

            })
        })
    </script>
</head>

<body>


    <p>id：<input  id="id" name="id" type="text"></p>
    <p><input id="queryBtn" type="button" value="查询"></p>
    <span id="text1"></span>
    <span id="text2"></span>
    <span id="text3"></span>
    <span id="text4"></span>


</body>
</html>
