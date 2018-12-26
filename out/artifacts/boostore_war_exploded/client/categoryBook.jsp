<%@ page language="java" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>前台首页</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/bootstrap.css">
    <style type="text/css">
        ul{
            list-style: none;
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
            <div id="bookandpage" class="col-md-12">
                <div class="panel panel-default" >
                    <div class="panel-heading">书名列表</div>
                    <div class="panel-body">
                        <ul>
                            <c:forEach var="book" items="${booklist}">
                                <div id="book" class="media" >
                                    <div id="image" class="media-left">
                                        <a href="#">
                                            <img style="max-width: 124px!important; height: 124px" src="${pageContext.request.contextPath }/images/${book.image}" class="media-object img-responsive">
                                        </a>
                                    </div>
                                    <div id="bookinfo" class="media-body">
                                        <ul>
                                            <li><label>书名：${book.name }</label></li>
                                            <li><label>作者：${book.author }</label></li>
                                            <li><label>售价：${book.price }</label></li>

                                            <a class="btn btn-primary" href="${pageContext.request.contextPath}/client/BuyServlet?bookid=${book.id}">加入购物车</a>

                                        </ul>
                                    </div>
                                </div>
                            </c:forEach>
                        </ul>
                    </div>
                </div>
            </div>
        </c:if>

    </div>
</div>
</body>

</html>
