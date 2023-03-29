<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" import="com.weh.community.model.Approval" %>
<!DOCTYPE html>
<html lang="zh-cn" xmlns:th="http://www.thymeleaf.org">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
    <meta name="renderer" content="webkit">
    <title>社区出入申请</title>
    <link rel="stylesheet"  href="/static/css/pintuer.css">
    <link rel="stylesheet"  href="/static/css/admin.css">
    <script  src="/static/js/jquery.js"></script>
    <script src="/static/js/pintuer.js"></script>
</head>
<body>
<div class="panel admin-panel">
    <div class="panel-head" id="add"><strong><span class="icon-pencil-square-o"></span>修改申请信息</strong></div>
    <div class="body-content">
        <form method="POST" class="form-x" action="/user/add" >
            <div class="form-group">
                <div class="label">
                    <label>申请原因：</label>
                </div>
                <div class="field">
                    <input type="hidden" id="id" value="${apply.id}">
                    <textarea class="input w50"  id="reason" data-validate="required:必填">${requestScope.apply.reason}</textarea>
                    <div class="tips"></div>
                </div>
            </div>
        </form>
        <div class="form-group">
            <div class="field">
                <button class="button bg-main icon-check-square-o"  id="apply_add"> 提交</button>
            </div>
        </div>
    </div>
</div>
<script src="/static/dist/axios.js"></script>
<script>

    $(function () {
        //修改
        var  URL ="${pageContext.request.contextPath}/apply/edit";
        $("#apply_add").click(function () {
            var  reason =$("#reason").val();
            var  id =$("#id").val();
            if(reason == null ||reason ==""){
                alert("申请原因不为空")
                return;
            }
            axios.post(URL,{
                reason: reason,
                id: id
            }).then(function (response) {
                alert(response.data.msg);
                var rediect_url="${pageContext.request.contextPath}/apply/list";
                location.href  = rediect_url;
            }).catch(function (error) {
                console.log(error);
            });
        });
    })
</script>

</body>
</html>