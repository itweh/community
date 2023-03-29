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
    <title>社区审核出入列表</title>
    <link rel="stylesheet" href="/static/css/pintuer.css">
    <link rel="stylesheet" href="/static/css/admin.css">
</head>
<body>
<form method="post" action="${pageContext.request.contextPath}/approval/list" id="listform" >
    <div class="panel admin-panel">
        <div class="panel-head"><strong class="icon-reorder"> 审核列表</strong>
        </div>
        <div class="padding border-bottom">
            <ul class="search" style="padding-left:10px;">
              <%--  <li><a class="button border-main icon-plus-square-o" href="${pageContext.request.contextPath}/announcement/openAnnouncement">发布公告</a></li>--%>
                <li>搜索：</li>
                <li>
                    <input type="text" placeholder="请输入搜索关键字" name="keywords" class="input" style="width:200px; line-height:17px;display:inline-block" />
                    <a href="javascript:onclick(query())" class="button border-main icon-search" > 搜索</a>
                </li>
            </ul>
        </div>
        <table class="table table-hover text-center">
            <tr>
                <th>申请人</th>
                <th>申请时间</th>
                <th>申请原因</th>
                <th>审核人</th>
                <th>审核理由</th>
                <th>审核时间</th>
                <th>状态</th>
                <th>操作</th>
            </tr>
            <c:forEach items="${approvalList}" var="data">
                <tr>
                    <td>${data.applyUser }</td>
                    <td><fmt:formatDate type="date" value="${data.createTime}" dateStyle="default"/></td>
                    <td>${data.reason}</td>
                    <td>${data.approvalUser}</td>
                    <td>${data.approvalReason}</td>
                    <td><fmt:formatDate type="date" value="${data.approvalTime}" dateStyle="default"/></td>
                    <c:if test="${data.status==0}"> <td>新建</td></c:if>
                    <c:if test="${data.status==1}"> <td><font style="color: #0000FF">审核中</font></td></c:if>
                    <c:if test="${data.status==2}"> <td><font style="color: #0000FF">审核通过</font></td></c:if>
                    <c:if test="${data.status==3}"> <td><font style="color: red">审核不通过</font></td></c:if>
                    <td>
                <div class="button-group"><a class="button border-main"  href="/approval/openApproval?id=${data.id}"><span
                        class="icon-edit"></span> 审核</a>
                   </div>
                    </td>
                </tr>
            </c:forEach>
           <%-- </tr>--%>
        </table>

    </div>

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