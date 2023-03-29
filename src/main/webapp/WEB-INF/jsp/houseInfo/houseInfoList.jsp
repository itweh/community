<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh-cn" xmlns:th="http://www.thymeleaf.org">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
    <meta name="renderer" content="webkit">
    <title>房间信息管理</title>
    <link rel="stylesheet" href="/static/css/pintuer.css">
    <link rel="stylesheet" href="/static/css/admin.css">
</head>
<body>
<form method="post" action="${pageContext.request.contextPath}/houseInfo/list" id="listform" >
    <div class="panel admin-panel">
        <div class="panel-head"><strong class="icon-reorder"> 房间信息列表</strong>
        </div>
        <div class="padding border-bottom">
            <ul class="search" style="padding-left:10px;">
                <li><a class="button border-main icon-plus-square-o" href="${pageContext.request.contextPath}/houseInfo/openHouseInfo">添加房间信息</a></li>
                <li>搜索：</li>
                <li>
                    <input type="text" placeholder="请输入搜索关键字" name="keywords" class="input" style="width:200px; line-height:17px;display:inline-block" />
                    <a href="javascript:onclick(query())" class="button border-main icon-search" > 搜索</a>
                </li>
            </ul>
        </div>
        <table class="table table-hover text-center">
            <tr>
                <th>房间名称</th>
                <th>性质</th>
                <th>居住人数</th>
                <th>户主户籍</th>
                <th>户主</th>
                <th>所属楼栋</th>
                <th>操作</th>
            </tr>
            <c:forEach items="${houseInfoList}" var="data">
                <tr>
                    <td>${data.houseName }</td>
                    <td>${data.property}</td>
                    <td>${data.liveNum}</td>
                    <td>${data.register}</td>
                    <td>${data.userName}</td>
                    <td>${data.build.buildName}</td>
                    <td>
                <div class="button-group"><a class="button border-main"  href="/houseInfo/openEdit?houseNo=${pageContext.request.contextPath}${data.houseNo}"><span
                        class="icon-edit"></span> 修改</a> <a class="button border-red" href="${pageContext.request.contextPath}/houseInfo/delete?houseNo=${pageContext.request.contextPath}${data.houseNo}"><span
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