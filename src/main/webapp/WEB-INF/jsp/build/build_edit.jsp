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
   <%-- <link rel="shortcut icon" th:href="@{../images/logo.jpg}">--%>
   <%-- <script th:src="@{../js/jquery.js}"></script>
    <script th:src="@{../js/pintuer.js}"></script>--%>
</head>
<body>
<div class="panel admin-panel">
    <div class="panel-head" id="edit"><strong><span class="icon-pencil-square-o"></span>编辑楼栋信息</strong></div>
    <div class="body-content">
        <form method="post" class="form-x" action="#">
            <div class="form-group">
                <div class="label">
                    <input  type="hidden" id="buildNo" value="${build.buildNo}">
                    <label>楼栋名称：</label>
                </div>
                <div class="field">
                    <input type="text" class="input w50"  value="${build.buildName}" value="" id="buildName" name="buildName" data-validate="required:必填"/>
                    <div class="tips"></div>
                </div>
            </div>
            <div class="form-group">
                <div class="label">
                    <label>地址：</label>
                </div>
                <div class="field">
                    <input type="text" class="input w50" value="${build.address}" name="address" id="address" data-validate="required:必填"/>
                    <div class="tips"></div>
                </div>
            </div>

            <div class="form-group">
                <div class="label">
                    <label>联系方式：</label>
                </div>
                <div class="field">
                    <input type="text" class="input w50" value="${build.telephone}" name="telephone" id="telephone" data-validate="required:必填"/>
                    <div class="tips"></div>
                </div>
            </div>

        </form>
     <%--   按钮放在表单外就不会提交表单 了--%>
        <div class="form-group">
            <div class="field">
                <button class="button bg-main icon-check-square-o"  id="build_edit"> 提交</button>
            </div>
        </div>
    </div>
</div>
<script  src="/static/js/jquery.js"></script>
<script src="/static/js/pintuer.js"></script>
<script src="/static/dist/axios.js"></script>

<script>
    var BASE_URL ="http://localhost:8081/";
    $(function () {
        //修改
        var  URL ="${pageContext.request.contextPath}/build/edit";
        $("#build_edit").click(function () {
            var buildNo =$("#buildNo").val();
            var buildName =$("#buildName").val();
            var address =$("#address").val();
            var telephone =$("#telephone").val();
            if(buildName == null ||buildName ==""){
                alert("楼栋名称不为空")
                return;
            }   if(address == null ||address ==""){
                alert("地址不为空")
                return;
            } if(telephone == null ||telephone ==""){
                alert("联系方式不为空")
                return;
            }
            axios.post(URL,{
                buildNo: buildNo,
                buildName: buildName,
                address: address,
                telephone:telephone,

            }).then(function (response) {
                alert(response.data.msg);
                var rediect_url="${pageContext.request.contextPath}/build/list";
                location.href  = rediect_url;
            }).catch(function (error) {
                console.log(error);
            });
        });
    })
</script>
</body>
</html>