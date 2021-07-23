
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    <title>Title</title>
    <script type="text/javascript" src="./js/jquery-3.6.0.min.js"></script>
    <script type="text/javascript" src="./jquery-ztree/3.5.12/js/jquery.ztree.core-3.5.min.js"></script>
    <script type="text/javascript" src="./jquery-ztree/3.5.12/js/jquery.ztree.all-3.5.min.js"></script>
    <link rel="stylesheet" type="text/css" href="./jquery-ztree/3.5.12/css/zTreeStyle/metro.css" />
    <link rel="stylesheet" type="text/css" href="./jquery-ztree/3.5.12/css/zTreeStyle/zTreeStyle.css" />
    <link rel="stylesheet" type="text/css" href="./jquery-ztree/3.5.12/css/zTreeStyle/zTreeStyle.min.css" />

</head>
<body>
<h2>form表单打开另一页面</h2>
<form action="/user/query" method="post">
    id:<input type="text" name="id" >
    <input type="submit" value="查询">
</form>

<h2>表单测试</h2>
<form action="/user/test" method="post">
    test:<input type="text" name="test" >
    <input type="submit" value="test">
</form>

<h2>ajax查询</h2>
<p>id：<input  id="id" name="id" type="text"></p>
<p><input id="queryBtn" onclick="query()" type="button" value="查询"></p>

<h1>列表</h1>
<a href="/user/toAddPage">添加</a>
<table>
    <thead>
    <tr>
        <th>id</th>
        <th>名字</th>
        <th>生日</th>
        <th>性别</th>
        <th>地址</th>
        <th>操作</th>
    </tr>
    </thead>
    <tbody id="userlist">

    </tbody>
</table>

<div id="menuTree" class="ztree" style="margin-top:3px;float:left;"></div>

<script type="text/javascript">
    $(document).ready(function () {
        $.ajax({
            url: "user/findAll",
            type: "post",
            success: function (data) {
                var data = $.parseJSON(data);
                $('#userlist').html("");
                for (var i = 0; i < data.length; i++) {
                    $('#userlist').append(
                        "           <tr>" +
                        "                        <td>" + data[i].id + "</td>" +
                        "                        <td>" + data[i].username + "</td>" +
                        "                        <td>" + data[i].birthdayT + "</td>\n" +
                        "                        <td>" + data[i].sex + "</td>\n" +
                        "                        <td>" + data[i].address + "</td>\n" +
                        "                        <td>" +
                        "                        <td>" +
                        "                          <a href='user/toUpdatePage?id="+data[i].id+"'> 修改</a>"+
                        "                          <a href='user/deleteUser/"+data[i].id+"'> 删除</a>"+
                        "                        </td>"+
                        "           </tr> ")

                }

                }
        });
    });



    function query() {
        var id = $("#id").val();
        //alert(id);
        $.ajax({
            url: "user/query1",
            type: "post",
            data: {"id":id},
            // dataType: "json",
            success:function (data) {
                var data = $.parseJSON(data);
                console.log(data.username)
                $('#userlist').html("");
                $('#userlist').append(
                        "           <tr>" +
                        "                        <td>" + data.id + "</td>" +
                        "                        <td>" + data.username + "</td>" +
                        "                        <td>" + data.birthdayT + "</td>\n" +
                        "                        <td>" + data.sex + "</td>\n" +
                        "                        <td>" + data.address + "</td>\n" +
                        "                        <td>" +
                        "                          <a href=''> 修改</a>"+
                        "                          <a href=''> 删除</a>"+
                        "                        </td>"+
                        "           </tr> ")

            }
        })
    }


    $(document).ready(function(){

        var setting = {check:{enable:true,nocheckInherit:true},view:{selectedMulti:false},
            data:{simpleData:{enable:true}},callback:{beforeClick:function(id, node){
                    tree.checkNode(node, !node.checked, true, true);
                    return false;
                }}};

        // 用户-菜单
        <%--var zNodes=[--%>
        <%--        <c:forEach items="${menuList}" var="menu">{id:"${menu.id}", pId:"${not empty menu.parent.id?menu.parent.id:0}", name:"${not empty menu.parent.id?menu.name:'权限列表'}"},--%>
        <%--    </c:forEach>];--%>
        <%--// 初始化树结构--%>

        var zNodes = [
            {id:1, pId:0, name: "父节点1"},
            {id:11, pId:1, name: "子节点1"},
            {id:12, pId:1, name: "子节点2"},
            {id:2, pId:0, name: "父节点2"},
            {id:21, pId:2, name: "子节点1"},
            {id:22, pId:2, name: "子节点2"},
            {id:23, pId:2, name: "子节点3"},
        ];

        var tree = $.fn.zTree.init($("#menuTree"), setting, zNodes);
        // 不选择父节点
        //tree.setting.check.chkboxType = { "Y" : "ps", "N" : "s" };
        tree.setting.check.chkboxType = { "Y" : "ps", "N" : "ps" };
        //tree.setting.check.chkStyle = "checkbox";
        // 默认选择节点
        <%--var ids = "${role.menuIds}".split(",");--%>
        <%--for(var i=0; i<ids.length; i++) {--%>
        <%--    var node = tree.getNodeByParam("id", ids[i]);--%>
        <%--    try{tree.checkNode(node, true, false);}catch(e){}--%>
        <%--}--%>
        // 默认展开全部节点
        tree.expandAll(true);
        tree.checkAllNodes(true);
        var nodes = tree.getCheckedNodes(true);
        //alert($.parseJSON(nodes));

    });


</script>

</body>
</html>