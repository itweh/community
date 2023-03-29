<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="zh-cn" xmlns:th="http://www.thymeleaf.org">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
    <meta name="renderer" content="webkit">
    <title>公告管理</title>
    <link rel="stylesheet" href="/static/css/pintuer.css">
    <link rel="stylesheet" href="/static/css/admin.css">
</head>
<body>
<form method="post" action="${pageContext.request.contextPath}/announcement/list" id="listform" >
    <div class="panel admin-panel">
        <div class="panel-head"><strong class="icon-reorder"> 公告列表</strong>
        </div>
        <div class="padding border-bottom">
            <ul class="search" style="padding-left:10px;">
                <li><a class="button border-main icon-plus-square-o" href="${pageContext.request.contextPath}/announcement/openAnnouncement">发布公告</a></li>
                <li>搜索：</li>
                <li>
                    <input type="text" placeholder="请输入搜索关键字" name="keywords" class="input" style="width:200px; line-height:17px;display:inline-block" />
                    <a href="javascript:onclick(query())" class="button border-main icon-search" > 搜索</a>
                </li>
            </ul>
        </div>
        <table class="table table-hover text-center">
            <tr>
                <th>标题</th>
                <th>公告内容</th>
                <th>创建人</th>
                <th>时间</th>
                <th>操作</th>
            </tr>
            <c:forEach items="${announcementList}" var="data">
                <tr>
                    <td>${data.title }</td>
                    <td>${data.content}</td>
                    <td>${data.userName}</td>
                    <td><fmt:formatDate type="date" value="${data.createTime}" dateStyle="default"/></td>
                    <td>
                <div class="button-group"><a class="button border-main"  href="/announcement/openEdit?announcementId=${pageContext.request.contextPath}${data.announcementId}"><span
                        class="icon-edit"></span> 修改</a> <a class="button border-red" href="${pageContext.request.contextPath}/announcement/delete?announcementId=${pageContext.request.contextPath}${data.announcementId}"><span
                        class="icon-trash-o"></span> 删除</a></div>
                    </td>
                </tr>
            </c:forEach>
           <%-- </tr>--%>
        </table>

    </div>

<%--    <div class="pagelist"> <span class="current"> 当前页:第[[${pageNum+1}]]页</span> <a th:href="@{../user/list(pageNum=0)}">[首页]</a>&nbsp;&nbsp;--%>
<%--        <a th:if="${not pages.isFirst()}" th:href="@{../user/list(pageNum=${pages.number-1})}">[上页]</a>&nbsp;&nbsp;--%>
<%--        <a th:if="${not pages.isLast()}" th:href="@{../user/list(pageNum=${pages.number+1})}">[下页]</a>&nbsp;&nbsp;--%>
<%--        <a th:href="@{../user/list(pageNum=${pages.totalPages-1})}">[末页]</a></div>--%>
</form>
<script src="${pageContext.request.contextPath}/static/js/jquery.js"></script>
<script src="${pageContext.request.contextPath}/static/js/jquery-1.4.4.min.js"></script>
<script src="${pageContext.request.contextPath}/static/js/pintuer.js"></script>
<script type="text/javascript">
    function query(){
        $("#listform").submit();
    }
</script>
</body>
</html>