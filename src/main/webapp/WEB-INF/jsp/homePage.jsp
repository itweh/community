<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java"  import="com.weh.community.model.SysUser" %>
<!DOCTYPE HTML>
<html>
<head>
<title>欢迎来到首页</title>
<link href="/static/homePage/css/bootstrap.css" rel='stylesheet' type='text/css' />
<link href="/static/homePage/css/style.css" rel='stylesheet' type='text/css' />
<!-- Custom Theme files -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<!--webfont-->
<link href='https://fonts.googleapis.com/css?family=Oxygen:300,400,700' rel='stylesheet' type='text/css'>
<script type="text/javascript" src="/static/homePage/js/jquery-1.11.1.min.js"></script>
<script src="/static/homePage/js/jquery.easydropdown.js"></script>
</head>
<body>
<div class="bg"></div>
<div class="header">
  <div class="header_bottom">
	<div class="container">	 			
<%--		<div class="logo">--%>
<%--		  <a href="index.html"><img src="images/logo.png" alt=""/></a>--%>
<%--		</div>	--%>
		<div class="header_bottom_right">			
	        <div class="h_menu4"><!-- start h_menu4 -->
				<a class="toggleMenu" href="#">Menu</a>
				<ul class="nav">
					<c:if test="${sessionScope.sessionUser==null}"><li class="active"><a href="${pageContext.request.contextPath}/toLogin">登录</a></li></c:if>
					<c:if test="${sessionScope.sessionUser==null}"><li><a href="${pageContext.request.contextPath}/toRegister">注册</a></li></c:if>
					<c:if test="${null!=sessionScope.sessionUser}"><li><a href="#">欢迎,${sessionScope.sessionUser.getUsername()}</a></li></c:if>
					<li><a href="${pageContext.request.contextPath}/index">返回后台管理</a></li>

				<%--	<li><a href="products.html">Women</a>
						<ul>
							<li><a href="products.html">Accessories</a></li>
							<li><a href="products.html">Ethnic Apparel</a></li>
							<li><a href="products.html">Footwear</a></li>
							<li><a href="products.html">Grooming</a></li>
							<li><a href="products.html">Handbags</a></li>
							<li><a href="products.html">Jewellery</a></li>
						</ul>
					</li>--%>
					<%--<li><a href="products.html">Men</a>
						<ul>
							<li><a href="products.html">Accessories</a></li>
							<li><a href="products.html">Footwear</a></li>
							<li><a href="products.html">Apparel</a></li>
						</ul>
					</li>
					<li><a href="products.html">Clearence</a></li>--%>
				</ul>
				<script type="text/javascript" src="js/nav.js"></script>
	      </div><!-- end h_menu4 -->
	      <div class="clearfix"></div>		   
      </div>
    </div>
  </div>
</div>

    <div class="contact">
      	<div class="container">
      	   <div class="account_grid">
			   <div class="col-md-6 login-left">
			  	 <h3>社区公告</h3>
				   <div id="announcementId">

				   </div>
				<%-- <p>By creating an account with our store, you will be able to move through the checkout process faster, store multiple shipping addresses, view and track your orders in your account and more.</p>--%>
				<%-- <a class="acount-btn" href="register.html">Create an Account</a>--%>
			   </div>
			   <div class="col-md-6 login-right">
			  	<h3>留言区</h3>
				<p>请留下您的心声</p>
				   <textarea  id="replyContent" style="width: 300px;height: 100px">

				   </textarea>
				   <div>
				   <input type="submit" value="留言" id="message_btn">
				   <input type="submit" value="查看留言与回复" id="queryMessage">
				   </div>
				   <div id="messDivId">

				   </div>
			   </div>	
			   <div class="clearfix"> </div>
			 </div>
      	 </div>
      </div>
</body>
<script  src="${pageContext.request.contextPath}/static/js/jquery.js"></script>
<script src="${pageContext.request.contextPath}/static/js/pintuer.js"></script>
<script src="${pageContext.request.contextPath}/static/dist/axios.js"></script>
<script>
	var GET_ANNOUNCEMENTLST ="${pageContext.request.contextPath}/announcement/dataList";
	//留言
	var MESSAGE ="${pageContext.request.contextPath}/message/add";
	var QUERY_REPLY = "${pageContext.request.contextPath}/message/getMessage"
    var mediahtml ="";
	$(function () {
        axios.get(GET_ANNOUNCEMENTLST,{}).then(function (response) {
            $.each(response.data.data, function(key, val) {
                $("#announcementId").append(
                    "<h1>"+val.title+"<h1/>"
                    +" <p>"+val.content+" </p>"
                    );
            });
        }).catch(function (error) {
            console.log(error);
        });
        
        //点击留言
		$("#message_btn").click(function () {
		    var content =$("#replyContent").val();
            axios.post(MESSAGE,{
                content: content
            }).then(function (response) {
                alert(response.data.msg)
            }).catch(function (error) {
                console.log(error);
            });
        })
		//点击查看评论
        $("#queryMessage").click(function () {
            axios.get(QUERY_REPLY,{}).then(function (response) {
                alert(JSON.stringify(response.data.msg))
                $.each(response.data.data,function(key,val) {
                    mediahtml+='<ul><c:if test="${data.status==2||data.status==3}"><span><p  style="color:red;overflow: hidden;text-overflow:ellipsis;white-space: nowrap;max-lines: 1;line-height: 30px;" title="'+val.content+'"><a href="#" style="color: #006cfa">'+val.userName+'留言:</a>'+val.content+'</p></span></c:if>'
					+'<span><p  style="color:red;overflow: hidden;text-overflow:ellipsis;white-space: nowrap;max-lines: 1;line-height: 30px;" title="'+val.content+'"><a href="#" style="color: #006cfa">'+val.userName+'留言:</a>'+val.content+'</p></span>'
                    $.each(val.replyList,function(key1,val1) {
                        mediahtml += '<li><span><p  style="overflow: hidden;text-overflow:ellipsis;white-space: nowrap;max-lines: 1;line-height: 30px;" title="'+val1.replyContent+'"><a href="#" style="color: #006cfa">' + val1.userName + '@'+val.userName+'回复:</a>'+val1.replyContent+'</p></span></li>';
                    })
                    '</ul>';
                })
                $("#messDivId").after(mediahtml);

                $("#messDivId").remove();//拼接结束清空
            }).catch(function (error) {
                console.log(error);
            });
        })
    })
</script>
</html>		