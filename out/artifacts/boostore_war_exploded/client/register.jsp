<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>注册表单</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/register.css">
    <style>
        body{
            background-color: #b8e5f8;
        }
    </style>
</head>

<body style="text-align:center;">
<form class="container container-small" action="${pageContext.request.contextPath }/client/RegisterServlet" method="post">
    <div class="form-group text-center head-title">
        <h1>注册</h1>
        <h2>现在注册，发现更大的世界</h2>
    </div>
    <div class="form-group">
        <input type="text" class="form-control" placeholder="用户名">
    </div>
    <div class="form-group">
        <input type="password" class="form-control" placeholder="请输入密码">
    </div>
    <div class="form-group">
        <input type="text" class="form-control" placeholder="手机">
    </div>
    <div class="form-group">
        <input type="text" class="form-control" placeholder="邮箱">
    </div>
    <div class="form-group">
        <input type="text" class="form-control" placeholder="住址">
    </div>
    <div class="form-group subbut">
        <button type="submit" class="btn btn-primary btn-block">注册</button>
    </div>
</form>
</body>
</html>
