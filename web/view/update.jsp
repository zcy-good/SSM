<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2021/3/11
  Time: 9:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>更新</title>
</head>
<body>
<table>
    <form action="/updateEmp.do">
            <tr>
                <td>编号</td>
                <td>
                    <input type="text" name="empno" value="${emp.empno}">
                </td>
            </tr>

            <tr>
                <td>姓名</td>
                <td><input type="text" name="ename" value="${emp.ename}"></td>
            </tr>
            <tr>
                <td>职位</td>
                <td><input type="text" name="job" value="${emp.job}"></td>
            </tr>
            <tr>
                <td>经理</td>
                <td><input type="text" name="mgr" value="${emp.mgr}"></td>
            </tr>
            <tr>
                <td>入职时间</td>
                <td><input type="date" name="hiredate" value="${emp.hiredate}"></td>
            </tr>
            <tr>
                <td>工资</td>
                <td><input type="text" name="sal" value="${emp.sal}"></td>
            </tr>
            <tr>
                <td>奖金</td>
                <td><input type="text" name="comm" value="${emp.comm}"></td>
            </tr>
            <tr>
                <td>部门编号</td>
                <td><input type="text" name="deptno" value="${emp.deptno}"></td>
            </tr>
            <tr>
                <td>
                    <input type="submit" value="提交">
                </td>
            </tr>
    </form>
</table>
</body>
</html>
