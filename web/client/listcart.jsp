<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>购物车显示列表</title>
    <link rel="stylesheet" href="">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/bootstrap.css">
    <style>
        .container {
            max-width: 800px;
        }
    </style>
</head>

<body>

<nav class="navbar navbar-default">
    <div class="container-fluid">
        <div class="navbar-header">
            <a class="navbar-brand" href="${pageContext.request.contextPath }/client.jsp">网上书店</a>
        </div>

        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse">
            <ul class="nav navbar-nav">
                <li><a href="${pageContext.request.contextPath }/client/listcart.jsp">购物车</a></li>
                <li><a href="${pageContext.request.contextPath }/client/clientlistorder.jsp">订单</a></li>
            </ul>
            <form class="navbar-form navbar-left">
                <div class="form-group">
                    <input type="text" class="form-control" placeholder="搜索任意内容">
                </div>
                <button type="submit" class="btn btn-default">搜索！</button>
            </form>
            <c:if test="${user==null }">
                <ul class="nav navbar-nav navbar-right">
                    <li><a href="${pageContext.request.contextPath}/client/login.jsp">登录</a></li>
                    <li><a href="${pageContext.request.contextPath}/client/register.jsp">注册</a></li>
                </ul>
            </c:if>
            <c:if test="${user!=null }">
                <ul class="nav navbar-nav navbar-right">
                    <li><a href="#">${user.getUsername() }</a></li>
                    <li><a href="${pageContext.request.contextPath }/client/LoginOutServlet">注销</a></li>
                </ul>
            </c:if>
        </div>
    </div>
</nav>
<div class="container">
    <div class="row">
        <c:if test="${user == null }">
            <div class="jumbotron">
                <h2 class="text-center text-danger">对不起，请先登录！</h2>
            </div>
        </c:if>
        <c:if test="${user != null }">
            <h2>购物车列表</h2>
            <table align="center" style="text-align: center;" class="table table-bordered table-hover">
                <tr>
                    <td>书名</td>
                    <td>作者</td>
                    <td>单价</td>
                    <td>数量</td>
                    <td>小计</td>
                    <td>操作</td>
                </tr>
                <c:forEach var="me" items="${cart.map }">
                    <tr>
                        <td>${me.value.book.name }</td>
                        <td>${me.value.book.author }</td>
                        <td>${me.value.book.price }</td>
                        <td>${me.value.quantity }</td>
                        <td>${me.value.price }</td>
                        <td>
                            <a class="btn btn-danger" href="#">删除</a>
                        </td>
                    </tr>
                </c:forEach>

                <tr>
                    <td colspan="1">总价</td>
                    <td colspan="5">${cart.price }</td>
                </tr>
            </table>
            <a class="btn btn-warning btn-lg btn-block" href="${pageContext.request.contextPath }/client/OrderServlet">购买</a>
        </c:if>
    </div>
</div>

</body>
</html>