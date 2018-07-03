<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>显示订单</title>
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
                            <a href="${pageContext.request.contextPath }/manager/addcategory.jsp"
                               target="right">添加分类</a><br/>
                            <a href="${pageContext.request.contextPath }/manager/CategoryServlet?method=listall"
                               target="right">查看分类</a>
                        </div>
                    </a>
                </li>
                <br/><br/>
                <li>
                    <a href="#" onclick="test('menu2')">图书管理
                        <div id="menu2" class="menu">
                            <a href="${pageContext.request.contextPath }/manager/BookServlet?method=addUI"
                               target="right">添加图书</a><br/>
                            <a href="${pageContext.request.contextPath }/manager/BookServlet?method=list"
                               target="right">查看图书</a>
                        </div>
                    </a>
                </li>
                <br/><br/>
                <li>
                    <a href="#" onclick="test('menu3')">订单管理
                        <div id="menu3" class="menu">
                            <a href="${pageContext.request.contextPath }/manager/ListOrderServlet?state=false"
                               target="right">未发货订单</a><br/>
                            <a href="${pageContext.request.contextPath }/manager/ListOrderServlet?state=true"
                               target="right">已发货订单</a>
                        </div>
                    </a>
                </li>
            </ul>
        </div>
        <div class="col-md-10 main">
            <h2>订单列表</h2>
            <table class="table table-hover table-bordered" width="60%" border="1" align="center" style="text-align: center;">
                <tr>
                    <td>订单号</td>
                    <td>订单人</td>
                    <td>订单时间</td>
                    <td>订单总价</td>
                    <td>订单状态</td>
                    <td>操作</td>
                </tr>
                <c:forEach var="order" items="${orders }">
                    <tr>
                        <td>${order.id }</td>
                        <td>${order.user.username }</td>
                        <td>${order.ordertime }</td>
                        <td>${order.price }</td>
                        <td>${order.state==true?'已发货':'未发货' }</td>
                        <td>
                            <a class="btn btn-primary" href="${pageContext.request.contextPath }/manager/OrderDetailServlet?orderid=${order.id}">查看明细</a>
                            <a class="btn btn-warning" href="#">删除</a>
                        </td>
                    </tr>
                </c:forEach>

            </table>
        </div>
    </div>
</div>
</body>
</html>
