<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh-cn" xmlns:th="http://www.thymeleaf.org">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
    <meta name="renderer" content="webkit">
    <title>房间管理</title>
    <link rel="stylesheet" href="/static/css/pintuer.css">
    <link rel="stylesheet" href="/static/css/admin.css">
    <%-- <link rel="shortcut icon" th:href="@{../images/logo.jpg}">--%>
    <%-- <script th:src="@{../js/jquery.js}"></script>
     <script th:src="@{../js/pintuer.js}"></script>--%>
</head>
<body>
<div class="panel admin-panel">
    <div class="panel-head" id="edit"><strong><span class="icon-pencil-square-o"></span>编辑房间信息</strong></div>
    <div class="body-content">
        <form method="post" class="form-x" action="#">
            <div class="form-group">
                <div class="label">
                    <input  type="hidden" id="houseNo" value="${houseInfo.houseNo}">
                    <label>房间名称：</label>
                </div>
                <div class="field">
                    <input type="text" class="input w50"  value="${houseInfo.houseName}" value="" id="houseName" name="houseName" data-validate="required:必填"/>
                    <div class="tips"></div>
                </div>
            </div>
            <%

                List<String> list = new ArrayList<String>();

                list.add("自住房");

                list.add("出租房");

                list.add("闲置房");

                request.setAttribute("list", list);

            %>
            <div class="form-group">
                <div class="label">
                    <label>性质：</label>
                </div>
                <div class="field">
<%--                    <input type="text" class="input w50" value="${houseInfo.property}" name="property" id="property" data-validate="required:必填"/>--%>
                        <select id="property" name="property">
                            <c:forEach items="${list}" var="data">
                                <c:if test="${data==houseInfo.property}">
                                    <option value="${data}" selected=true>&nbsp;${data}&nbsp;</option>
                                </c:if>
                                <c:if test="${data!=houseInfo.property}">
                                    <option value="${data}">&nbsp;${data}&nbsp;</option>
                                </c:if>
<%--                                <c:if test="${data=houseInfo.property}"><option value="${data}">${list}</option></c:if>--%>
<%--                                <option value="${houseInfo.property}">${data}</option>--%>
                            </c:forEach>
                        </select>
                    <div class="tips"></div>
                </div>
            </div>

            <div class="form-group">
                <div class="label">
                    <label>居住人数：</label>
                </div>
                <div class="field">
<%--                    <input type="text" class="input w50" value="${houseInfo.liveNum}" name="liveNum" id="liveNum" data-validate="required:必填"/>--%>
                    <select id="liveNum" name="liveNum">

                        <c:forEach var="s"  begin="0" end="10">
                            <c:if test="${s==houseInfo.liveNum}">
                                <option value="${s}" selected=true>&nbsp;${s}&nbsp;</option>
                            </c:if>
                            <c:if test="${s!=houseInfo.liveNum}">
                                <option value="${s}">&nbsp;${s}&nbsp;</option>
                            </c:if>
                        </c:forEach>
                    </select>
                    <div class="tips"></div>
                </div>
            </div>
            <div class="form-group">
                <div class="label">
                    <label>户主户籍：</label>
                </div>
                <div class="field">
                    <input type="text" class="input w50" value="${houseInfo.register}" name="register" id="register" data-validate="required:必填"/>
                    <div class="tips"></div>
                </div>
            </div>

            <div class="form-group">
                <div class="label">
                    <label>户主：</label>
                </div>
                <div class="field">
                    <input type="text" class="input w50" value="${houseInfo.userName}" name="userName" id="userName" data-validate="required:必填"/>
                    <div class="tips"></div>
                </div>
            </div>
            <div class="form-group">
                <div class="label">
                    <label>所属楼栋：</label>
                </div>
                <div class="field">
                    <select id="buildNo" name="buildNo">
                        <c:forEach items="${buildList}" var="data">
                            <c:if test="${data.buildNo!=houseInfo.build.buildNo}"><option value="${data.buildNo}">${data.buildName}</option></c:if>
                        </c:forEach>
                        <option selected="selected" value="${houseInfo.build.buildNo}">${houseInfo.build.buildName}</option>
                    </select>
                    <%--<input type="text" class="input w50" value="" name="responsiblePerson" id="responsiblePerson" data-validate="required:必填"/>--%>
                    <div class="tips"></div>
                </div>
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
        var  URL ="${pageContext.request.contextPath}/houseInfo/edit";
        $("#house_edit").click(function () {
            var houseNo =$("#houseNo").val();
            var houseName =$("#houseName").val();
            var property =$("#property").val();
            var buildNo =$("#buildNo").val();
            var register =$("#register").val();
            var liveNum =$("#liveNum").val();
            var userName =$("#userName").val();
            var reg = /^[0-9]+.?[0-9]*/;
            if (!reg.test(liveNum)) {
                alert("居住人数必须为数字")
                return;
            }
            if(houseName == null ||houseName ==""){
                alert("房间名称不为空")
                return;
            }   if(property == null ||property ==""){
                alert("性质不为空")
                return;
            } if(liveNum == null ||liveNum ==""){
                alert("居住人数不为空")
                return;
            }if(register == null ||register ==""){
                alert("户籍不为空")
                return;
            }if(userName == null ||userName ==""){
                alert("户主不为空")
                return;
            }
            axios.post(URL,{
                houseNo: houseNo,
                houseName: houseName,
                property: property,
                register:register,
                liveNum:liveNum,
                buildNo:buildNo,
                userName:userName
            }).then(function (response) {
                alert(response.data.msg);
                var rediect_url="${pageContext.request.contextPath}/houseInfo/list";
                location.href  = rediect_url;
            }).catch(function (error) {
                console.log(error);
            });
        });
    })
</script>
</html>