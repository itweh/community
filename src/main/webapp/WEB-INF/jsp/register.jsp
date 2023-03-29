<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <meta name="renderer" content="webkit">
    <title>登录</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/pintuer.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/admin.css">
    <script src="${pageContext.request.contextPath}/static/js/jquery.js"></script>
    <script src="${pageContext.request.contextPath}/static/js/pintuer.js"></script>
    <script src="${pageContext.request.contextPath}/static/dist/axios.js"></script>
</head>
<body>
<div class="bg"></div>
<div class="container">
    <div class="line bouncein">
        <div class="xs6 xm4 xs3-move xm4-move">
            <div style="height:150px;"></div>
            <div class="media media-y margin-big-bottom">
            </div>
            <form method="post" class="layui-form"  action="">
                <div class="panel loginbox">
                    <div class="text-center margin-big padding-big-top"><h1>请填写注册信息</h1></div>
                    <div class="panel-body" style="padding:30px; padding-bottom:10px; padding-top:10px;">
                        <div class="form-group">
                            <div class="field field-icon-right">
                                <input type="text" class="input input-big" name="username"  id="username" placeholder="登录账号"  data-validate="required:请填写账号" />
                                <span class="icon icon-user margin-small"></span>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="field field-icon-right">
                                <input type="text" class="input input-big" name="realName"  id="realName" placeholder="姓名"  data-validate="required:请填姓名" />
                                <span class="icon icon-user margin-small"></span>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="field field-icon-right">
                                <input type="password" class="input input-big" name="password" id="password" placeholder="登录密码"  data-validate="required:请填写密码" />
                                <span class="icon icon-key margin-small"></span>
                            </div>
                        </div>

                    </div>
                    <div style="alignment: center;margin-left: 20px">
<%--                        <span> <input type="radio" name="userType" checked value="0">社区管理员</span>--%>
                        <span> <input type="radio" name="userType" checked value="1">社区居民</span>
                    </div>

                </div>
            </form>
            <div style="padding:10px;"><button  class="button button-block bg-main text-big " id="login_btn"  ><span style="color: #ffffff">立即注册</span></button></div>
            <script>
                var BASE_URL ="http://localhost:8081/";
                $(function () {
                    //注冊
                    var  URL = "${pageContext.request.contextPath}/user/register";
                    $("#login_btn").click(function () {
                        var username =$("#username").val();
                        var password =$("#password").val();
                        var realName =$("#realName").val();
                        var userType =$('input:radio:checked').val();
                        if (null ==username || username =="") {
                            alert("用户名不为空!!");
                            return;

                        } if (null ==password || password =="") {
                            alert("密码不为空!!");
                            return;

                        } if (null ==realName || realName =="") {
                            alert("姓名不为空!!");
                            return;
                        }
                        axios.post(URL,{
                            username: username,
                            password: password,
                            realName: realName,
                            userType: userType
                        }).then(function (response) {
                            alert(response.data.msg)
                            var rediect_url="${pageContext.request.contextPath}/toLogin";
                            top.location.href = rediect_url;
                        }).catch(function (error) {
                            console.log(error);
                        });
                    });
                })
            </script>
            <script>
                //百度统计可去掉
             /*   var _hmt = _hmt || [];
                (function() {
                    var hm = document.createElement("script");
                    hm.src = "https://hm.baidu.com/hm.js?b393d153aeb26b46e9431fabaf0f6190";
                    var s = document.getElementsByTagName("script")[0];
                    s.parentNode.insertBefore(hm, s);
                })();*/
            </script>
        </div>
    </div>
</div>

</body>
</body>
</html>


