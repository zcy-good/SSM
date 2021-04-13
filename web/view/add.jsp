<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2021/3/10
  Time: 18:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link href="<c:url value="/bootstrap-3.3.7-dist/css/bootstrap.css" />" rel="stylesheet">
<html>
<head>
    <title>添加</title>
</head>
<body>
<table class="table table-bordered">
<form action="/add.do">
    <tr>
        <td>姓名</td>
        <td>职位</td>
        <td>经理</td>
        <td>入职时间</td>
        <td>工资</td>
        <td>奖金</td>
        <td>部门编号</td>
    </tr>
    <tr>
        <td><input type="text" name="ename"></td>
        <td><input type="text" name="job"></td>
        <td><input type="text" name="mgr"></td>
        <td><input type="date" name="hiredate"></td>
        <td><input type="text" name="sal"></td>
        <td><input type="text" name="comm"></td>
        <td><input type="text" name="deptno"></td>
        <td><input type="submit" value="保存"></td>
    </tr>


</form>
</table>
</body>
</html>
