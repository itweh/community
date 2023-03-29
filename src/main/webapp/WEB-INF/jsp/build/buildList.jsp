<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
<form method="post" action="${pageContext.request.contextPath}/build/list" id="listform" >
    <div class="panel admin-panel">
        <div class="panel-head"><strong class="icon-reorder"> 楼栋信息列表</strong>
        </div>
        <div class="padding border-bottom">
            <ul class="search" style="padding-left:10px;">
                <li><a class="button border-main icon-plus-square-o" href="${pageContext.request.contextPath}/build/openBuild">添加楼栋信息</a></li>
                <li>搜索：</li>
                <li>
                    <input type="text" placeholder="请输入搜索关键字" name="keywords" class="input" style="width:200px; line-height:17px;display:inline-block" />
                    <a href="javascript:onclick(query())" class="button border-main icon-search" > 搜索</a>
                </li>
            </ul>
        </div>
        <table class="table table-hover text-center">
            <tr>
                <th>楼栋名称</th>
                <th>地址</th>
                <th>联系方式</th>
                <th>负责人</th>
                <th>操作</th>
            </tr>
            <c:forEach items="${buildList}" var="data">
                <tr>
                    <td>${data.buildName }</td>
                    <td>${data.address}</td>
                    <td>${data.telephone}</td>
                    <td>${data.responsiblePerson}</td>
                    <td>
                <div class="button-group"><a class="button border-main"  href="/build/openEdit?buildNo=${pageContext.request.contextPath}${data.buildNo}"><span
                        class="icon-edit"></span> 修改</a> <a class="button border-red" href="${pageContext.request.contextPath}/build/delete?buildNo=${pageContext.request.contextPath}${data.buildNo}"><span
                        class="icon-trash-o"></span> 删除</a></div>
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