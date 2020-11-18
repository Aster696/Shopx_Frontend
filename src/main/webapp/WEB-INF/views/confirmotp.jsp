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
			<form action="<sp:url value='/user/checkotp'></sp:url>" method="post">
			<div>
				<center><h3>Confirm OTP</h3></center>
			</div>
			<div>
				<table>
					<tr>
						<td>
							<label>Enter OTP : </label>
						</td>
						<td>
							<input type="text" name="userotp" placeholder="Enter OTP" size="45"/>
						</td>
					</tr>
					
					<tr>
						<td>
							<input type="hidden" name="otp" value="${otp}"/>
						</td>
					</tr>
					
				</table>
			</div>
			
			<div>
				<table>
					<tr>
						<td>
							<input type="submit" value="Check OTP" class="Submit"/>
							<a href="" type="button"><input type="button" value="Resend" class="Submit"/></a>
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