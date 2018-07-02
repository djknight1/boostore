<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>后台首页</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/bootstrap.css">
    <style type="text/css">
        .menu{
            display:none;
            margin-left:10px;
        }
    </style>
    <script type="text/javascript">
        function test(e){
            var element = document.getElementById(e);
            element.style.display = (element.style.display === 'block')? 'none':'block';
        }
    </script>
</head>

<body>
<nav class="navbar navbar-inverse">
    <div class="container-fluid">
        <div class="navbar-header">
            <a class="navbar-brand" href="#">网上书店后台管理系统</a>
        </div>
        <div id="navbar">
            <ul class="nav navbar-nav navbar-right">
                <li><a href="#">管理员名字</a></li>
                <li><a href="#">退出</a></li>
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
                            <a href="${pageContext.request.contextPath }/manager/addcategory.jsp">添加分类</a><br/>
                            <a href="${pageContext.request.contextPath }/manager/CategoryServlet?method=listall">查看分类</a>
                        </div>
                    </a>
                </li>
                <br/><br/>
                <li>
                    <a href="#" onclick="test('menu2')">图书管理
                        <div id="menu2" class="menu">
                            <a href="${pageContext.request.contextPath }/manager/BookServlet?method=addUI">添加图书</a><br/>
                            <a href="${pageContext.request.contextPath }/manager/BookServlet?method=list">查看图书</a>
                        </div>
                    </a>
                </li>
                <br/><br/>
                <li>
                    <a href="#" onclick="test('menu3')">订单管理
                        <div id="menu3" class="menu">
                            <a href="${pageContext.request.contextPath }/manager/ListOrderServlet?state=false">未发货订单</a><br/>
                            <a href="${pageContext.request.contextPath }/manager/ListOrderServlet?state=true">已发货订单</a>
                        </div>
                    </a>
                </li>
            </ul>
        </div>
        <div class="col-md-10 main">
            <h2>欢迎使用</h2>
            <h1>网上书店后台管理系统</h1>
        </div>
    </div>
</div>
</body>

<%--<frameset rows="15%,*">
    <frame src="./manager/head.jsp" name="head">
    <frameset cols="15%,*">
        <frame src="/manager/left.jsp" name="left">
        <frame src="/manager/right.jsp" name="right">
    </frameset>
</frameset>--%>
</html>
