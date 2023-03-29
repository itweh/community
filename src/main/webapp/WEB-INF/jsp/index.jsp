<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java"  import="com.weh.community.model.SysUser" %>
<!DOCTYPE html>
<%--<html lang="zh-cn" xmlns:th="http://www.thymeleaf.org">--%>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <meta name="renderer" content="webkit">
    <title>社区管理系统</title>
    <link rel="stylesheet" href="/static/css/admin.css" >
    <link rel="stylesheet" href="/static/css/pintuer.css">
    <script src="/static/js/jquery.js"></script>
    <script src="/static/js/jquery-1.4.4.min.js"></script>
    <script src="/static/js/pintuer.js"></script>
</head>
<body style="background-color:#f2f9fd;">
<div class="header bg-main">
    <div class="logo margin-big-left fadein-top">
        <h1>社区管理系统</h1>
    </div>
    <div class="head-l" ><a href="" target="_blank" style="color:#FFF" ><span class="icon-user" ></span> 欢迎,${sessionScope.sessionUser.getUsername()}</span> </a>&nbsp;&nbsp;<a class="button button-little bg-green" href="${pageContext.request.contextPath}/" target="_blank" ><span class="icon-home"></span> 首页</a> &nbsp;&nbsp;<a class="button button-little bg-red" href="${pageContext.request.contextPath}/logout"><span class="icon-power-off"></span> 退出登录</a> </div>
</div>
<div class="leftnav">
    <div class="leftnav-title"><strong><span class="icon-list"></span>系统功能</strong></div>
    <h2><span class="icon-user"></span>基础数据管理</h2>
    <ul style="display:block">
        <c:if test="${sessionScope.sessionUser.getUserType()=='0'}"><li><a   href="${pageContext.request.contextPath}/user/list" target="right"><span class="icon-caret-right"></span>用户管理</a></li></c:if>
        <c:if test="${sessionScope.sessionUser.getUserType()=='0'}"> <li><a  href="${pageContext.request.contextPath}/announcement/list" target="right"><span class="icon-caret-right"></span>公告管理</a></li></c:if>
        <c:if test="${sessionScope.sessionUser.getUserType()=='0'}"> <li><a   href="${pageContext.request.contextPath}/build/list" target="right"><span class="icon-caret-right"></span>楼栋信息管理</a></li></c:if>
        <c:if test="${sessionScope.sessionUser.getUserType()=='0'}"><li><a   href="${pageContext.request.contextPath}/houseInfo/list" target="right"><span class="icon-caret-right"></span>房间信息管理</a></li></c:if>
        <c:if test="${sessionScope.sessionUser.getUserType()=='0'}"><li><a   href="${pageContext.request.contextPath}/message/list" target="right"><span class="icon-caret-right"></span>留言管理</a></li></c:if>
        <c:if test="${sessionScope.sessionUser.getUserType()=='1'}"><li><a   href="${pageContext.request.contextPath}/apply/list" target="right"><span class="icon-caret-right"></span>出入申请</a></li></c:if>
        <c:if test="${sessionScope.sessionUser.getUserType()=='0'}"><li><a   href="${pageContext.request.contextPath}/approval/list" target="right"><span class="icon-caret-right"></span>出入申请审核</a></li></c:if>
        <c:if test="${null!=sessionScope.sessionUser}"><li><a   href="${pageContext.request.contextPath}/user/openUpdate?id=${sessionScope.sessionUser.getId()}" target="right"><span class="icon-caret-right"></span>个人信息修改</a></li></c:if>
    </ul>

</div>
<%--返回上一个页面--%>
<%--<script type="text/javascript">--%>
<%--        function backAndFresh(){--%>
<%--        var url =document.referrer;--%>
<%--        window.location=url;--%>
<%--    }--%>
<%--</script>--%>
<%--<script language=javascript>--%>
<%--    function go()--%>
<%--    {--%>
<%--        window.history.go(-1);--%>
<%--    }--%>
<%--    setTimeout("go()",3000);--%>
<%--</script>--%>
<%--<ul class="bread">--%>
<%--&lt;%&ndash;    <input class="btn btn-default" onclick="backAndFresh()" type="button" value="返回" />&ndash;%&gt;--%>
<%--    <input type="button" value="返回" οnclick="history.go(-1)" />--%>
<%--</ul>--%>
<div class="admin">
    <iframe scrolling="auto" rameborder="0" src="/static/welcome.html" name="right" width="100%" height="100%"></iframe>
</div>
</body>
</html>
