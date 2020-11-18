<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="sp" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="css" uri="http://www.springframework.org/tags"%>
<%@page isELIgnored="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href='<css:url value="/css/formcontainer.css"></css:url>'/>

</head>
<body>
<jsp:include page="home.jsp"></jsp:include>

	<div>
	<br>
		<div class="formcontainer">
			<form action="<sp:url value='/loginaction'></sp:url>" method="post">
			<div>
				<center><h3>Log in</h3></center>
			</div>
			<div>
				<table>
					<tr>
						<td>
							<label>Name : </label>
						</td>
						<td>
							<input type="text" name="username" placeholder="Enter your Email" size="45"/>
						</td>
					</tr>
				
					<tr>
						<td>
							<label>Password : </label>
						</td>
						<td>
							<input type="password" name="password" placeholder="Enter your Password" size="45"/>
						</td>
					</tr>
					
				</table>
			</div>
			<div>
				<a href="${pageContext.request.contextPath}/user/enterusername">Froget Password</a>
			</div>
			<div>
				<table>
					<tr>
						<td>
							<input type="submit" value="Log in" class="Submit"/>
							<a href="${pageContext.request.contextPath}/user/signin" type="button" class="Submit"><input type="button" value="Sign in"/></a>
						</td>
					</tr>
				</table>
			</div>
			</form>
		</div>
	</div>

<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>