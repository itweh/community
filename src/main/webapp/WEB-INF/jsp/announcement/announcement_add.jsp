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
    <link rel="stylesheet"  href="/static/css/pintuer.css">
    <link rel="stylesheet"  href="/static/css/admin.css">
    <script  src="/static/js/jquery.js"></script>
    <script src="/static/js/pintuer.js"></script>
</head>
<body>
<div class="panel admin-panel">
    <div class="panel-head" id="add"><strong><span class="icon-pencil-square-o"></span>新增公告</strong></div>
    <div class="body-content">
        <form method="POST" class="form-x" action="/user/add" >
            <div class="form-group">
                <div class="label">
                    <label>标题：</label>
                </div>
                <div class="field">
                    <input type="text" class="input w50" value="" name="title" id="title" data-validate="required:必填"/>
                    <div class="tips"></div>
                </div>
            </div>
            <div class="form-group">
                <div class="label">
                    <label>公告内容：</label>
                </div>
                <div class="field">
                    <textarea name="content" cols="30" rows="3" id="content" value="">
<%--                    <input type="text" class="input w50" value="" data-validate="required:必填" />--%>
<%--                    <input type="text" class="input w50" value="" name="content" id="content" data-validate="required:必填" height="80%" width="50%"/>--%>
                    </textarea>
<%--                    <textarea name="eduhistory" cols="30" rows="3" align="center"><%= bean.getEduhistory()%></textarea>--%>
                    <div class="tips"></div>
                </div>
            </div>
        </form>
        <div class="form-group">
            <div class="field">
                <button class="button bg-main icon-check-square-o"  id="announcement_add"> 提交</button>
            </div>
        </div>
    </div>
</div>
<script src="/static/dist/axios.js"></script>
<script>

    $(function () {
        //添加
        var  URL ="${pageContext.request.contextPath}/announcement/add";
        $("#announcement_add").click(function () {1
            var content =$("#content").val();
            var title =$("#title").val();

            if(title == null ||title ==""){
                alert("标题不为空")
                return;
            }   if(content == null ||content ==""){
                alert("内容不为空")
                return;
            }

            axios.post(URL,{
                content: content,
                title: title
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
</body>
</html>