<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>显示所有书籍</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/bootstrap.css">
    <style type="text/css">
        .menu {
            display: none;
            margin-left: 10px;
        }
    </style>
    <script type="text/javascript">
        function test(e) {
            var element = document.getElementById(e);
            element.style.display = (element.style.display === 'block') ? 'none' : 'block';
        }
    </script>
</head>

<body style="text-align:center;">
<nav class="navbar navbar-inverse">
    <div class="container-fluid">
        <div class="navbar-header">
            <a class="navbar-brand" href="#">网上书店后台管理系统</a>
        </div>
        <div id="navbar">
            <ul class="nav navbar-nav navbar-right">
                <li><a href="#">LogOut</a></li>
            </ul>
            <form class="navbar-form navbar-right">
                <input type="text" class="form-control" placeholder="Search...">
                <button type="submit" class="btn btn-default">搜索</button>
            </form>
        </div>
    </div>
</nav>

<div class="container">
    <div class="row">
        <div class="col-md-2 sidebar">
            <ul class="nav nav-sidebar">
                <li>
                    <a href="#" onclick="test('menu1')">分类管理
                        <div id="menu1" class="menu">
                            <a href="${pageContext.request.contextPath }/manager/addcategory.jsp" target="right">添加分类</a><br/>
                            <a href="${pageContext.request.contextPath }/manager/CategoryServlet?method=listall" target="right">查看分类</a>
                        </div>
                    </a>
                </li>
                <br/><br/>
                <li>
                    <a href="#" onclick="test('menu2')">图书管理
                        <div id="menu2" class="menu">
                            <a href="${pageContext.request.contextPath }/manager/BookServlet?method=addUI" target="right">添加图书</a><br/>
                            <a href="${pageContext.request.contextPath }/manager/BookServlet?method=list" target="right">查看图书</a>
                        </div>
                    </a>
                </li>
                <br/><br/>
                <li>
                    <a href="#" onclick="test('menu3')">订单管理
                        <div id="menu3" class="menu">
                            <a href="${pageContext.request.contextPath }/manager/ListOrderServlet?state=false" target="right">未发货订单</a><br/>
                            <a href="${pageContext.request.contextPath }/manager/ListOrderServlet?state=true" target="right">已发货订单</a>
                        </div>
                    </a>
                </li>
            </ul>
        </div>
        <div class="col-md-10 main">
            <h2>图书信息</h2>
            <table class="table table-bordered table-hover" width="60%" align="center">
                <tr style="text-align:center">
                    <td>图书名称</td>
                    <td>作者</td>
                    <td>价格</td>
                    <td>图片</td>
                    <td>描述</td>
                    <td>操作</td>
                </tr>
                <c:forEach var="book" items="${page.list }">
                    <tr style="text-align:center">
                        <td>${book.name }</td>
                        <td>${book.author }</td>
                        <td>${book.price }</td>
                        <td>
                            <a href="${pageContext.request.contextPath }/images/${book.image}">查看图片</a>
                        </td>
                        <td>${book.description }</td>
                        <td>
                            <a class="btn btn-primary" href="#">修改</a>
                            <a class="btn btn-warning" href="#">删除</a>
                        </td>
                    </tr>
                </c:forEach>
            </table>
            <br>
            当前第[${page.pagenum}]页 &nbsp;&nbsp;
            <c:forEach var="pagenum" begin="${page.startpage }" end="${page.endpage }">
                [<a href="${pageContext.request.contextPath }/manager/BookServlet?method=list&pagenum=${pagenum}">${pagenum }</a>]
            </c:forEach>
            &nbsp;&nbsp;
            总共[${page.totalpage }]页，共[${page.totalrecord }]条记录
        </div>
    </div>
</div>
</body>
</html>
