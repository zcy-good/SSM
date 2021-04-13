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
    <title>Title</title>
</head>
<body>
<div style="margin: 0 auto" class="col-lg-9">
    <button type="button" class="btn btn-default btn-lg"><a href="/view/add.jsp"><span
            class="glyphicon glyphicon-plus-sign"></span></a></button>

    <form action="/list.do">
        <select name="keytype">
            <option value="ename">姓名</option>
            <option value="empno">编号</option>
            <option value="job">职位</option>
        </select>
        <input type="text" name="keyword" >
        <input type="submit" value="提交">
    </form>
</div>
<table class="table table-hover">
    <tr>
        <td><input type="checkbox" id="checkAllId" onclick="checkAll()"></td>
        <td>编号</td>
        <td>姓名</td>
        <td>职位</td>
        <td>经理</td>
        <td>入职时间</td>
        <td>工资</td>
        <td>奖金</td>
        <td>部门编号</td>
        <td>操作</td>
    </tr>

    <c:forEach items="${list}" var="emp">
        <tr>
            <td><input type="checkbox" name="empnos" value="${emp.empno}" ></td>
            <td>${emp.empno}</td>
            <td>${emp.ename}</td>
            <td>${emp.job}</td>
            <td>${emp.mgrName}</td>
            <td>${emp.hiredate}</td>
            <td>${emp.sal}</td>
            <td>${emp.comm}</td>
            <td>${emp.deptno}</td>
            <td>
                <a href="/delete.do?empno=${emp.empno}">删除</a>/
                <a href="/findOne.do?empno=${emp.empno}">编辑</a>

            </td>
        </tr>
    </c:forEach>

</table>
<%--<a class="pager-info" href="/batchDelete.do">批量删除</a>--%>
<button onclick="delAll()" >批量删除</button>

<div class="pager-info">
    <div>共有 ${pageInfo.total} 条记录，第 ${pageInfo.pageNum}/${pageInfo.pages} 页</div>
    <div>
        <ul class="pagination">
            <li class="paginate_button previous">
                <a class="${pageInfo.isFirstPage? "disabled":""}"
                   href="<c:url value="/list.do?pageNum=${pageInfo.prePage}&keytype=${map.keytype}&keyword=${map.keyword}"/>">上一页</a>
            </li>
            <c:forEach begin="1" end="${pageInfo.pages}" step="1" var="i">
                <li class="paginate_button ${i == pageInfo.pageNum ? "active":""}"><a href="<c:url value="/list.do?pageNum=${i}&keytype=${map.keytype}&keyword=${map.keyword}"/>">${i}</a></li>
            </c:forEach>
            <li class="paginate_button next">
                <a class="${pageInfo.isLastPage? "disabled":""}"
                   href="<c:url value="/list.do?pageNum=${pageInfo.nextPage}&keytype=${map.keytype}&keyword=${map.keyword}"/>">下一页</a>
            </li>
        </ul>
    </div>

</div>
    <script>
        function checkAll() {
            //获得全选框本身
            var check = document.getElementById("checkAllId");
            //获得所有员工复选框
            var allEmpnos = document.getElementsByName("empnos");
            //判断全选框本身自己是否选中
            if (check.checked){
                for (var i =0 ;i<allEmpnos.length; i++ ){
                    //让员工的复选框选中
                    allEmpnos[i].checked=true;
                }
            }else {
                for(var i=0; i<allEmpnos.length; i++ ){
                    //让所有员工取消
                    allEmpnos[i].checked=false;
                }
            }
            return false;
        }

        function delAll() {
            var allEmpnos = document.getElementsByName("empnos")
            var ids=new Array();
            for(var i=0; i<allEmpnos.length;i++){
                if (allEmpnos[i].checked){
                    ids.push(allEmpnos[i].value)
                }
            }
            if (ids.length>0){
                if(confirm("确认删除?")){
                    window.location="http://localhost:8080/batchDelete.do?empnos="+ids;
                }
            }else {
                alert("请选择要操作的项")
            }

        }
    </script>

</body>
</html>
