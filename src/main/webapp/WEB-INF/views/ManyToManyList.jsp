<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<%@taglib prefix="css" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link href='<css:url value="/css/List.css"></css:url>' rel="stylesheet"/>

</head>
<body>
<jsp:include page="home.jsp"></jsp:include>
<br>
many to many list

<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>