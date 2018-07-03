<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>客户端显示订单</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/bootstrap.css">
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
                    <li><a id="logout" href="${pageContext.request.contextPath }/client/LoginOutServlet">注销</a></li>
                    <script type="text/javascript">
                        var logout = document.getElementById("logout");
                        logout.onclick=function (ev) {
                            setTimeout(function () {
                                alert("注销成功");
                            }, 500)
                        }
                    </script>
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
            <h2>订单列表</h2>
            <table width="60%" border="1" align="center" style="text-align: center;" class="table table-bordered table-hover">
                <tr>
                    <td>订单号</td>
                    <td>订单人</td>
                    <td>订单时间</td>
                    <td>订单总价</td>
                    <td>订单状态</td>
                    <td>操作</td>
                </tr>
                <c:forEach var="order" items="${userOrders}">
                    <tr>
                        <td>${order.id}</td>
                        <td>${order.user.username}</td>
                        <td><fmt:formatDate value="${order.ordertime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                        <td>${order.price}</td>
                        <td>${order.state==true?'已发货':'未发货' }</td>
                        <td>
                            <a class="btn btn-success" href="${pageContext.request.contextPath }/client/ClientOrderDetailServlet?orderid=${order.id}">查看明细</a>
                            <a class="btn btn-danger" href="#">删除</a>
                        </td>
                    </tr>
                </c:forEach>
            </table>
        </c:if>
    </div>
</div>
</body>
</html>
