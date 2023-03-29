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
    <div class="panel-head" id="add"><strong><span class="icon-pencil-square-o"></span>添加楼栋</strong></div>
    <div class="body-content">
        <form method="POST" class="form-x" action="#" >
            <div class="form-group">
                <div class="label">
                    <label>楼栋名称：</label>
                </div>
                <div class="field">
                    <input type="text" class="input w50" value="" name="buildName" id="buildName" data-validate="required:必填"/>
                    <div class="tips"></div>
                </div>
            </div>
            <div class="form-group">
                <div class="label">
                    <label>地址：</label>
                </div>
                <div class="field">
                    <input type="text" class="input w50" value="毕节市大方县碧桂园" name="address" id="address" />
                    <div class="tips"></div>
                </div>
            </div>

            <div class="form-group">
                <div class="label">
                    <label>联系电话：</label>
                </div>
                <div class="field">
                    <input type="text" class="input w50" value="" name="telephone" id="telephone" data-validate="required:必填"/>
                    <div class="tips"></div>
                </div>
            </div>

            <div class="form-group">
                <div class="label">
                    <label>负责人：</label>
                </div>
                <div class="field">
<%--                    <input type="text" class="input w50" value="" name="responsiblePerson" id="responsiblePerson" data-validate="required:必填"/>--%>
                    <select id="responsiblePerson" name="responsiblePerson">
                        <c:forEach items="${UserTypeList}" var="data">
                            <option value="${data.username}">${data.username}</option>
                        </c:forEach>
                    </select>
                    <div class="tips"></div>
                </div>
            </div>
        </form>
        <div class="form-group">
            <div class="field">
                <button class="button bg-main icon-check-square-o"  id="build_add"> 提交</button>
            </div>
        </div>
    </div>
</div>
<script src="/static/dist/axios.js"></script>
<script>

    $(function () {
        //添加
        var  URL ="${pageContext.request.contextPath}/build/add";
        $("#build_add").click(function () {
            var buildName =$("#buildName").val();
            var address =$("#address").val();
            var telephone =$("#telephone").val();
            var responsiblePerson =$("#responsiblePerson").val();

            if(buildName == null ||buildName ==""){
                alert("楼栋名称不能为空")
                return;
            }   if(address == null ||address ==""){
                alert("地址不能为空")
                return;
            } if(telephone == null ||telephone ==""){
                alert("电话不能为空")
                return;
            } if(responsiblePerson == null ||responsiblePerson ==""){
                alert("负责人不能为空")
                return;
            }
            axios.post(URL,{
                buildName: buildName,
                address: address,
                telephone: telephone,
                responsiblePerson:responsiblePerson
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