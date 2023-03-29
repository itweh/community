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
    <title>留言管理</title>
    <link rel="stylesheet" href="/static/css/pintuer.css">
    <link rel="stylesheet" href="/static/css/admin.css">
</head>
<body>
<form method="post" action="${pageContext.request.contextPath}/message/list" id="listform" >
    <div class="panel admin-panel">
        <div class="panel-head"><strong class="icon-reorder"> 留言信息列表</strong>
        </div>
        <div class="padding border-bottom">
            <ul class="search" style="padding-left:10px;">
            <%--    <li><a class="button border-main icon-plus-square-o" href="${pageContext.request.contextPath}/houseInfo/openHouseInfo">添加房间信息</a></li>--%>
                <li>搜索：</li>
                <li>
                    <input type="text" placeholder="请输入搜索关键字" name="keywords" class="input" style="width:200px; line-height:17px;display:inline-block" />
                    <a href="javascript:onclick(query())" class="button border-main icon-search" > 搜索</a>
                </li>
            </ul>
        </div>
        <table class="table table-hover text-center">
            <tr>
                <th>用户名</th>
                <th>内容</th>
                <th>时间</th>
                <th>状态</th>
                <th>操作</th>
            </tr>
            <c:forEach items="${messageList}" var="data">
                <tr>
                    <td>${data.userName }</td>
                    <td>${data.content}</td>
                    <td><fmt:formatDate type="both" value="${data.createTime}" dateStyle="default"/></td>
                   <%-- <td>${data.status}</td>--%>
                    <c:if test="${data.status==0}"><td><font style="color: #0000FF">正常</font></td></c:if>
                    <c:if test="${data.status==1}"><td><font style="color: #A7F43D">警告</font>  </td></c:if>
                    <c:if test="${data.status==2}"><td><font style="color: red">非法</font></td></c:if>
                    <td>
                <div class="button-group"><a class="button border-main"  href="${pageContext.request.contextPath}/message/openReply?id=${data.id}">
                    <span
                        class="icon-edit"></span>回复</a>
                    <a class="button border-main"  href="${pageContext.request.contextPath}/message/updateStatus?id=${data.id}">
                    <span class="icon-edit"></span>警告</a>
                  <a class="button border-red" href="${pageContext.request.contextPath}/message/delete?id=${data.id}">
                    <span
                        class="icon-trash-o">
                    </span> 移除留言</a>
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