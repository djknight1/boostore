<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>订单明细</title>
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
            <h3>订单明细</h3>
            <table class="table table-bordered table-hover" width="50%" align="center" style="text-align: center;">
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
            <table class="table table-bordered table-hover" width="50%" align="center" style="text-align: center;">
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
            <a class="btn btn-primary btn-block" href="${pageContext.request.contextPath }/manager/ConfirmOrderServlet?orderid=${order.id}">确认发货</a>
        </div>
    </div>
</div>

</body>
</html>
