<%@ page language="java" pageEncoding="UTF-8" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>前台首页</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/bootstrap.css">
    <style>
        .container{
            max-width: 500px;
        }
        .box{
            width: 500px;
            height: 200px;
            margin: 80px auto;
            background-color: #eeeeee;
            border-radius: 30px;
        }
        .box h1{
            text-align: center;
            padding-top: 40px;
        }
        .box h2{
            text-align: center;
        }
    </style>
</head>

<%-- <frameset rows="17%,*">
     <frame src="${pageContext.request.contextPath }/client/head.jsp" name="head">
     &lt;%&ndash;<frame src="${pageContext.request.contextPath }/client/IndexServlet?method=getAll" name="body">&ndash;%&gt;
 </frameset>--%>

<div class="container">
    <div class="row">
        <div class="box">
            <h1>选择登陆方式</h1>
            <h2><a href="client/login.jsp" class="label label-primary ">用户登录</a></h2>
            <h2><a href="manager/login.jsp" class="label label-info">管理员登陆</a></h2>
        </div>
    </div>
</div>


</html>
