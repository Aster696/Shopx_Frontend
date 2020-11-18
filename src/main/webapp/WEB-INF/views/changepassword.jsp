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
			<form action="<sp:url value='/user/updatepassword'></sp:url>" method="post">
			<div>
				<center><h3>Change Password</h3></center>
			</div>
			<div>
				<table>
					<tr>
						<td>
							<label>Password : </label>
						</td>
						<td>
							<input type="password" name="password" placeholder="Enter new password" size="45"/>
						</td>
					</tr>
				
					<tr>
						<td>
							<label>Confirm Password : </label>
						</td>
						<td>
							<input type="password" name="cpassword" placeholder="Confirm Password" size="45"/>
						</td>
					</tr>
					
				</table>
			</div>
			<div>
				<table>
					<tr>
						<td>
							<input type="submit" value="Submit" class="Submit"/>
							<a href="" type="button"><input type="reset" value="Reset" class="Submit"/></a>
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