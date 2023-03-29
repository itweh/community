<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh-cn" xmlns:th="http://www.thymeleaf.org">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
    <meta name="renderer" content="webkit">
    <title>社区出入审核</title>
    <link rel="stylesheet"  href="/static/css/pintuer.css">
    <link rel="stylesheet"  href="/static/css/admin.css">
    <script  src="/static/js/jquery.js"></script>
    <script src="/static/js/pintuer.js"></script>
</head>
<body>
<div class="panel admin-panel">
    <div class="panel-head" id="add"><strong><span class="icon-pencil-square-o"></span>填写申请信息</strong></div>
    <div class="body-content">
        <form method="POST" class="form-x" action="/user/add" >
            <div class="form-group">
                <div class="label">
                    <label>申请原因：</label>
                </div>
                <div class="field">
                    <input type="hidden" id="id" value="${approval.id}">
                    <input type="text" class="input w50" value="${approval.reason}"  readonly="readonly"  id="reason" data-validate="required:必填"/>
                    <div class="tips"></div>
                </div>
            </div>
            <div class="form-group">
                <div class="label">
                    <label>申请时间：</label>
                </div>
                <div class="field">
                    <input type="text" class="input w50" value="${approval.createTime}"  readonly="readonly" id="createTime" data-validate="required:必填"/>
                    <div class="tips"></div>
                </div>
            </div>
            <div class="form-group">
                <div class="label">
                    <label>申请人：</label>
                </div>
                <div class="field">
                    <input type="text" class="input w50" value="${approval.applyUser}"  readonly="readonly"  id="applyUser" data-validate="required:必填"/>
                    <div class="tips"></div>
                </div>
            </div>
            <div class="form-group">
                <div class="label">
                    <label>审核理由：</label>
                </div>
                <div class="field">
                    <textarea type="text" class="input w50" value=""  id="approvalReason" data-validate="required:必填"></textarea>
                    <div class="tips"></div>
                </div>
            </div>
        </form>
        <div class="form-inline" style="alignment: center">

                <button class="button bg-main icon-check-square-o"  id="approval_aggree"> 同意</button>


                <button class="button bg-main icon-check-square-o"  id="approval_reject"> 不同意</button>

        </div>

    </div>
</div>
<script src="/static/dist/axios.js"></script>
<script>

    $(function () {
        //登录
        var  URL ="${pageContext.request.contextPath}/approval/update";
        $("#approval_aggree").click(function () {
            var  approvalReason =$("#approvalReason").val();
            var  id =$("#id").val();
            if(approvalReason == null ||approvalReason ==""){
                alert("审核理由不为空")
                return;
            }
            axios.post(URL,{
                approvalReason: approvalReason,
                id:id,
                status:2

            }).then(function (response) {
                alert(response.data.msg);
                var rediect_url="${pageContext.request.contextPath}/approval/list";
                location.href  = rediect_url;
            }).catch(function (error) {
                console.log(error);
            });
        });
        $("#approval_reject").click(function () {
            var  approvalReason =$("#approvalReason").val();
            var  id =$("#id").val();
            if(approvalReason == null ||approvalReason ==""){
                alert("审核理由不为空")
                return;
            }
            axios.post(URL,{
                approvalReason: approvalReason,
                id:id,
                status:3
            }).then(function (response) {
                alert(response.data.msg);
                var rediect_url="${pageContext.request.contextPath}/approval/list";
                location.href  = rediect_url;
            }).catch(function (error) {
                console.log(error);
            });
        });
    })
</script>

</body>
</html>