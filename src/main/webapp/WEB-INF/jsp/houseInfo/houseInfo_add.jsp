<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh-cn" xmlns:th="http://www.thymeleaf.org">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
    <meta name="renderer" content="webkit">
    <title>房间信息管理</title>
    <link rel="stylesheet"  href="/static/css/pintuer.css">
    <link rel="stylesheet"  href="/static/css/admin.css">
    <script  src="/static/js/jquery.js"></script>
    <script src="/static/js/pintuer.js"></script>
</head>
<body>
<div class="panel admin-panel">
    <div class="panel-head" id="add"><strong><span class="icon-pencil-square-o"></span>添加房间</strong></div>
    <div class="body-content">
        <form method="POST" class="form-x" action="#" >
            <div class="form-group">
                <div class="label">
                    <label>房间名称：</label>
                </div>
                <div class="field">
                    <input type="text" class="input w50" value="" name="houseName" id="houseName" data-validate="required:必填"/>
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
<%--                    <input type="text" class="input w50" value="" name="property" id="property" data-validate="required:必填"/>--%>
                    <select id="property" name="property">
                        <c:forEach items="${list}" var="data">
                            <option value="${data}">${data}</option>
                        </c:forEach>
                    </select>
<%--                    <input name="property" type="radio" value="自住房" id="property" >自住房<br>--%>
<%--                    <input name="property" type="radio" value="出租房" id="property" >出租房<br>--%>
<%--                    <input name="property" type="radio" value="闲置房" id="property" >闲置房--%>
<%--                    <div class="tips"></div>--%>
                </div>
            </div>


            <div class="form-group">
                <div class="label">
                    <label>居住人数：</label>
                </div>
                <div class="field">
<%--                    <input type="text" class="input w50" value="" name="liveNum" id="liveNum" data-validate="required:必填"/>--%>
                    <select id="liveNum" name="liveNum">

                        <c:forEach var="s"  begin="0" end="10">
                            <c:if test="${s==number.level}">
                                <option value="${s}" selected=true>&nbsp;${s}&nbsp;</option>
                            </c:if>
                            <c:if test="${s!=number.level}">
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
                    <input type="text" class="input w50" value="" name="register" id="register" data-validate="required:必填"/>
                    <div class="tips"></div>
                </div>
            </div>
            <div class="form-group">
                <div class="label">
                    <label>户主：</label>
                </div>
                <div class="field">
                    <input type="text" class="input w50" value="" name="userName" id="userName" data-validate="required:必填"/>
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
                        <option value="${data.buildNo}">${data.buildName}</option>
                        </c:forEach>
                    </select>
                    <%--<input type="text" class="input w50" value="" name="responsiblePerson" id="responsiblePerson" data-validate="required:必填"/>--%>
                    <div class="tips"></div>
                </div>
            </div>
        </form>
        <div class="form-group">
            <div class="field">
                <button class="button bg-main icon-check-square-o"  id="houseInfo_add"> 提交</button>
            </div>
        </div>
    </div>
</div>
<script src="/static/dist/axios.js"></script>
<script>

    $(function () {
        //添加
        var  URL ="${pageContext.request.contextPath}/houseInfo/add";
        $("#houseInfo_add").click(function () {
            var houseName =$("#houseName").val();
            var liveNum =$("#liveNum").val();
            var register =$("#register").val();
            var property =$("#property").val();
            var userName =$("#userName").val();
            var buildNo =$("#buildNo").val();
            // var reg=new RegExp('(([0-9]+\\.[0-9]*[1-9][0-9]*)|([0-9]*[1-9][0-9]*\\.[0-9]+)|([0-9]*[1-9][0-9]*))');
            var reg=new RegExp('((^[0-9]*$))');
            if (!reg.test(liveNum)) {
                alert("居住人数必须为数字")
                return;
            }if(houseName == null ||houseName ==""){
                alert("房间名称不为空")
                return;
            }   if(liveNum == null ||liveNum ==""){
                alert("居住人数不为空")
                return;
            } if(register == null ||register ==""){
                alert("户籍不为空")
                return;
            } if(userName == null ||userName ==""){
                alert("户主不为空")
                return;
            }if(buildNo == null ||buildNo ==""){
                alert("所属楼栋不为空")
                return;
            }if(property == null ||property ==""){
                alert("性质不为空")
                return;
            }
            axios.post(URL,{
                houseName: houseName,
                liveNum: liveNum,
                register: register,
                userName:userName,
                buildNo:buildNo,
                property:property
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

</body>
</html>