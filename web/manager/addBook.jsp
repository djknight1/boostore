<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>添加图书</title>
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
        <div class="col-md-10">
            <form action="${pageContext.request.contextPath}/manager/BookServlet?method=add" method="post" enctype="multipart/form-data">
                <table class="table table-bordered table-hover" frame="border" width="50%">
                    <div class="form-group">
                        <tr>
                            <td><label>图书名称</label></td>
                            <td>
                                <input class="form-control" type="text" name="name">
                            </td>
                        </tr>
                        <tr>
                            <td><label>作者</label></td>
                            <td>
                                <input class="form-control" type="text" name="author">
                            </td>
                        </tr>
                        <tr>
                            <td><label>售价</label></td>
                            <td>
                                <input class="form-control" type="text" name="price">
                            </td>
                        </tr>
                        <tr>
                            <td><label>图片</label></td>
                            <td>
                                <input class="btn btn-warning btn-block" type="file" name="file">
                            </td>
                        </tr>
                        <tr>
                            <td><label>图书描述</label></td>
                            <td>
                                <textarea style="resize: none;" class="form-control" rows="5" cols="40" name="description"></textarea>
                            </td>
                        </tr>
                        <tr>
                            <td><label>所属分类</label></td>
                            <td>
                                <select name="category_id">
                                    <c:forEach var="c" items="${categories }">
                                        <option value="${c.id }">${c.name }</option>
                                    </c:forEach>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <input class="btn btn-danger btn-block" type="reset" value="清空">
                            </td>
                            <td>
                                <input class="btn btn-success btn-block" type="submit" value="提交">
                            </td>
                        </tr>
                    </div>
                </table>
            </form>
        </div>
    </div>
</div>
</body>
</html>
