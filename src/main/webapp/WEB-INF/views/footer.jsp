<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<%@taglib prefix="css" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link href='<css:url value="/css/footer.css"></css:url>' rel="stylesheet">

</head>
<body>
<br>

<div class="footerContainer">
	<div>
	<center>
		<div>
			<a href="#" class="Padding">Created by: Aster</a>
		</div>
		<div>
			<a href="${pageContext.request.contextPath}/aboutus" class="Padding">About Web site</a>
		</div>
		<div>
			<a href="${pageContext.request.contextPath}/contactus" class="Padding">Contact me</a>
		</div>
		<div>
			<label>Email: asterrebeiro69@gmail.com</label>
		</div>
	</center>
	</div>
	<br><br>
	<div class="Bottom">
	<center>
		<span>
			<a href="#">FaceBook</a>
			<a href="#">Twitter</a>
			<a href="#">Instagram</a>
			<a href="#">What's app</a>
		</span>
	</center>
	</div>
</div>

</body>
</html>