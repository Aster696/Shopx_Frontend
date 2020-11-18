<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="sp" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="css" uri="http://www.springframework.org/tags"%>
<%@page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href='<css:url value="/css/formcontainer.css"></css:url>'/>

</head>
<body>
<jsp:include page="home.jsp"></jsp:include>
<br>
	<div>
		<div class="formcontainer">
			<form action="<sp:url value='/user/forgot'></sp:url>" method="post">
			<div>
				<center><h3>Enter your Name</h3></center>
			</div>
			<div>
				<table>
					<tr>
						<td>
							<label>Name : </label>
						</td>
						<td>
							<input type="text" name="username" placeholder="Enter your Name" size="45"/>
						</td>
					</tr>
					
				</table>
			</div>
			
			<div>
				<table>
					<tr>
						<td>
							<input type="submit" value="Get OTP" class="Submit"/>
							<input type="reset" value="Reset" class="Submit"/>
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