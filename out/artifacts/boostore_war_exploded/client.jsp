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
            <div class="col-md-5">
                <div class="panel panel-default" >
                    <div class="panel-heading">分类列表</div>
                    <div class="panel-body">
                        <ul>
                            <c:forEach var="category" items="${categories }">
                                <li>
                                    <a href="${pageContext.request.contextPath }/client/IndexServlet?method=listBookWithCategory&category_id=${category.id}">${category.name }</a>
                                </li>
                            </c:forEach>
                        </ul>
                    </div>
                </div>
            </div>

            <div id="bookandpage" class="col-md-7">
                <div class="panel panel-default" >
                    <div class="panel-heading">书名列表</div>
                    <div class="panel-body">
                        <ul>
                            <c:forEach var="book" items="${books}">
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
<%--
        <div id="page" class="text-center">
            <nav aria-label="Page navigation">
                <ul class="pagination">
                    <li>
                        <a href="#" aria-label="Previous">
                            <span aria-hidden="true">&laquo;</span>
                        </a>
                    </li>
                    <li><a href="#">当前第[${page.pagenum }]页</a></li>
                    <li>
                        <a href="#" aria-label="Next">
                            <span aria-hidden="true">&raquo;</span>
                        </a>
                    </li>
                </ul>
            </nav>
            &lt;%&ndash;当前第[${page.pagenum }]页 &nbsp;&nbsp;
            <c:forEach var="pagenum" begin="${page.startpage }" end="${page.endpage }">
                [<a href="${pageContext.request.contextPath }/client/IndexServlet?method=${param.method }&pagenum=${pagenum}&category_id=${param.category_id}">${pagenum }</a>]
            </c:forEach>
            &nbsp;&nbsp;
            总共[${page.totalpage }]页，共[${page.totalrecord }]条记录&ndash;%&gt;
        </div>--%>
    </div>
</div>
</body>
<%--<frameset rows="17%,*">
    <frame src="${pageContext.request.contextPath }/client/head.jsp" name="head">
    <frame src="${pageContext.request.contextPath }/client/IndexServlet?method=getAll" name="body">
</frameset>--%>
</html>
