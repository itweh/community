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
<div class="panel admin-panel">
    <div class="panel-head" id="edit"><strong><span class="icon-pencil-square-o"></span>编辑公告信息</strong></div>
    <div class="body-content">
        <form method="post" class="form-x" action="../user/add">
            <div class="form-group">
                <div class="label">
                    <input  type="hidden" id="announcementId" value="${announcement.announcementId}">
                    <label>标题：</label>
                </div>
                <div class="field">
                    <input type="text" class="input w50" value="${announcement.title}" value="" name="title"  id="title" data-validate="required:必填"/>
                    <div class="tips"></div>
                </div>
            </div>
            <div class="form-group">
                <div class="label">
                    <label>公告内容：</label>
                </div>
                <div class="field">
<%--                    <input type="text" class="input w50" value="${announcement.content}" name="content" id="content" data-validate="required:必填"/>--%>
                    <textarea name="content" cols="30" rows="3" id="content">
                        ${announcement.content}
                    </textarea>
                    <div class="tips"></div>
                </div>
            </div>
        </form>
        <div class="form-group">
            <div class="field">
                <button class="button bg-main icon-check-square-o"  id="announcement_edit"> 提交</button>
            </div>
        </div>
    </div>
</div>
<script  src="/static/js/jquery.js"></script>
<script src="/static/js/pintuer.js"></script>
<script src="/static/dist/axios.js"></script>
</body>
<script>
    var BASE_URL ="http://localhost:8081/";
    $(function () {
        //修改
        var  URL ="${pageContext.request.contextPath}/announcement/edit";
        $("#announcement_edit").click(function () {
            var announcementId =$("#announcementId").val();
            var title =$("#title").val();
            var content =$("#content").val();
            // if(title == null ||username ==""){
            //     alert("标题不为空")
            //     return;
            // }
            // if(content == null ||content ==""){
            //     alert("内容不为空")
            //     return;
            // }

            axios.post(URL,{
                announcementId: announcementId,
                title: title,
                content: content
            }).then(function (response) {
                alert(response.data.msg);
                var rediect_url="${pageContext.request.contextPath}/announcement/list";
                location.href  = rediect_url;
            }).catch(function (error) {
                console.log(error);
            });
        });
    })
</script>
</html>