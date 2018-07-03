<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>订单明细</title>
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
                </ul>
                <script type="text/javascript">
                    var logout = document.getElementById("logout");
                    logout.onclick=function (ev) {
                        setTimeout(function () {
                            alert("注销成功");
                        }, 500)
                    }
                </script>
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
            <h3>订单明细</h3>
            <table align="center" style="text-align: center;" class="table table-bordered table-hover">
                <tr>
                    <td>书名</td>
                    <td>售价</td>
                    <td>数量</td>
                    <td>应收货款</td>
                </tr>
                <c:forEach var="orderitem" items="${order.orderitems }">
                    <tr>
                        <td>${orderitem.book.name }</td>
                        <td>${orderitem.book.price }</td>
                        <td>${orderitem.quantity }</td>
                        <td>${orderitem.price }</td>
                    </tr>
                </c:forEach>

                <tr>
                    <td>订单总价</td>
                    <td colspan="3">${order.price }</td>
                </tr>

            </table>

            <h3>收货人详细信息</h3>
            <table align="center" style="text-align: center;" class="table table-bordered table-hover">
                <tr>
                    <td>用户</td>
                    <td>电话</td>
                    <td>手机</td>
                    <td>地址</td>
                    <td>邮箱</td>
                </tr>
                <tr>
                    <td>${order.user.username }</td>
                    <td>${order.user.phone }</td>
                    <td>${order.user.cellphone }</td>
                    <td>${order.user.address }</td>
                    <td>${order.user.email }</td>
                </tr>
            </table>
        </c:if>
    </div>
</div>
</body>
</html>
