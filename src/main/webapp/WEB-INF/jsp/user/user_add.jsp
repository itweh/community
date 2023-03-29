<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh-cn" xmlns:th="http://www.thymeleaf.org">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
    <meta name="renderer" content="webkit">
    <title>用户管理</title>
    <link rel="stylesheet"  href="/static/css/pintuer.css">
    <link rel="stylesheet"  href="/static/css/admin.css">
    <script  src="/static/js/jquery.js"></script>
    <script  src="/static/js/jquery.js"></script>
    <script  src="/static/js/jquery-1.4.4.min.js"></script>
    <script src="/static/js/pintuer.js"></script>
</head>
<body>
<div class="panel admin-panel">
    <div class="panel-head" id="add"><strong><span class="icon-pencil-square-o"></span>新增用户信息</strong></div>
    <div class="body-content">
        <form method="POST" class="form-x" action="/user/add" >
            <div class="form-group">

                <div class="label">
                    <label>用户名：</label>
                </div>
                <div class="field">
                    <input type="text" class="input w50" value="" name="username" id="username" data-validate="required:必填"/>
                    <div class="tips"></div>
                </div>
            </div>
            <div class="form-group">
                <div class="label">
                    <label>姓名：</label>
                </div>
                <div class="field">
                    <input type="text" class="input w50" value="" name="realName" id="realName" data-validate="required:必填"/>
                    <div class="tips"></div>
                </div>
            </div>
            <div class="form-group">
                <div class="label">
                    <label>密码：</label>
                </div>
                <div class="field">
                    <input type="password" class="input w50" value="" name="password"  id="password" data-validate="required:必填"/>
                    <div class="tips"></div>
                </div>
            </div>
            <div class="form-group">
                <div class="label">
                    <label>用户类型：</label>
                </div>
                <div class="field">
                    <input type="radio"  value="0" name="userType" data-validate="required:必填"/> 社区管理员
                    <div class="tips"></div>
                </div>
                <div class="field">
                    <input type="radio"  value="1" checked="checked" name="userType" data-validate="required:必填"/>社区居民
                    <div class="tips"></div>
                </div>
            </div>
        </form>
        <div class="form-group">
            <div class="label">
                <label></label>
            </div>
            <div class="field">
                <button class="button bg-main icon-check-square-o"  id="user_add"> 提交</button>
            </div>
        </div>
    </div>
</div>
<script src="/static/dist/axios.js"></script>
<script>

    var BASE_URL ="http://localhost:8081/";
    $(function () {
        //登录
        var  URL = "${pageContext.request.contextPath}/add/user";
        $("#user_add").click(function () {
            var username =$("#username").val();
            var password =$("#password").val();
            var realName =$("#realName").val();
            var userType =$('input:radio:checked').val();
            if(username == null ||username ==""){
                alert("用户名不为空")
                return;
            }   if(password == null ||password ==""){
                alert("密码不为空")
                return;
            }   if(realName == null ||realName ==""){
                alert("姓名不为空")
                return;
            }

            axios.post(URL,{
                username: username,
                password: password,
                realName: realName,
                userType:userType
            }).then(function (response) {
                alert(response.data.msg);
                var rediect_url="${pageContext.request.contextPath}/user/list";
                location.href = rediect_url;
            }).catch(function (error) {
                console.log(error);
            });
        });
    })
</script>

</body>
</html>