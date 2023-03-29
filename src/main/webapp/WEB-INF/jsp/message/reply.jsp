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
    <title>留言回复</title>
    <link rel="stylesheet" href="/static/css/pintuer.css">
    <link rel="stylesheet" href="/static/css/admin.css">
</head>
<body>
<div class="panel admin-panel">
    <div class="panel-head" id="edit"><strong><span class="icon-pencil-square-o"></span>留言信息</strong></div>
    <div class="body-content">
        <form method="post" class="form-x" action="#">
            <div class="form-group">
                <div class="label">
                    <input  type="hidden" id="messageId" value="${message.id}">
                    <label>留言内容：</label>
                </div>
                <div class="field">
                    <input type="text" class="input w50" readonly="readonly" value="${message.content}" value="" id="content" name="content" data-validate="required:必填"/>
                    <div class="tips"></div>
                </div>
            </div>
            <div class="form-group">
                <div class="label">
                    <label>留言时间：</label>
                </div>
                <div class="field">
                    <fmt:formatDate type="date" value="${message.createTime}" dateStyle="default"/>
                   <%-- <input type="text" class="input w50" readonly="readonly" value="${message.createTime}" value="" id="replyTime" name="replyTime" data-validate="required:必填"/>--%>
                    <div class="tips"></div>
                </div>
            </div>
            <div class="form-group">
                <div class="label">
                    <label>回复内容：</label>
                </div>
                <div class="field">
                    <textarea type="text" class="input w50"  name="replyContent" id="replyContent" data-validate="required:必填"></textarea>
                    <div class="tips"></div>
                </div>
            </div>

            <div class="form-group">
                <div class="label">
                    <label>回复记录：</label>
                </div>
                <table class="table table-hover text-center">
                    <tr>
                        <th>回复时间</th>
                        <th>回复内容</th>
                        <th>回复人</th>
                    </tr>
                    <c:forEach items="${message.replyList}" var="data">
                        <tr>
                            <td> <fmt:formatDate type="both" value="${data.replyTime}"  dateStyle="default"/></td>
                            <td>${data.replyContent}</td>
                            <td>${data.userName}</td>
                        </tr>
                    </c:forEach>
                </table>
            </div>
        </form>
     <%--   按钮放在表单外就不会提交表单 了--%>
        <div class="form-group">
            <div class="field">
                <button class="button bg-main icon-check-square-o"  id="house_edit"> 提交</button>
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
        //登录
        var  URL ="${pageContext.request.contextPath}/message/reply";
        $("#house_edit").click(function () {
            var replyContent =$("#replyContent").val();
            var messageId =$("#messageId").val();
            if(replyContent == null ||replyContent ==""){
                alert("回复内容不为空")
                return;
            }
            axios.post(URL,{
                replyContent: replyContent,
                messageId:messageId
            }).then(function (response) {
                alert(response.data.msg);
                var rediect_url="${pageContext.request.contextPath}/message/list";
                location.href  = rediect_url;
            }).catch(function (error) {
                console.log(error);
            });
        });
    })
</script>
</html>