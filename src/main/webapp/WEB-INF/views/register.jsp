<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="sp" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="css" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
	<c:if test="${us==null}">
		<sp:form modelAttribute="user" action="${pageContext.request.contextPath}/user/signin" method="post">
		<div>
			<center><h3>Sign up</h3></center>
		</div>
		<br>
		<div>
			<table>
				<tr>
					<td>
						<label>Name : </label>
					</td>
					<td>
						<sp:input type="text" path="username" placeholder="Enter your Name" size="45"/><br>
						<sp:errors path="username"/>				
					</td>
				</tr>
			
				<tr>
					<td>
						<label>Email : </label>
					</td>
					<td>
						<sp:input type="email" path="email" placeholder="Enter your Email" size="45"/><br>
						<sp:errors path="email"/>
					</td>
				</tr>
			
				<tr>
					<td>
						<label>Contact : </label>
					</td>
					<td>
						<sp:input type="tel" path="contact" placeholder="Enter your Contact" size="45" maxlength="10"/><br>
						<sp:errors path="contact"/>
					</td>
				</tr>
			
				<tr>
					<td>
						<label>Password : </label>
					</td>
					<td>
						<sp:input type="password" path="password" placeholder="Enter your Password" size="45" minlength="8" maxlength="20"/><br>
				 		<sp:errors path="password"/>
					</td>
				</tr>
				
				<tr>
					<td>
						
					</td>
					<td>
						<sp:input path="authority" type="hidden" value="user" size="45"/>
					</td>
				</tr>
				
				<tr>
					<td>
						
					</td>
					<td>
						<sp:input path="status" type="hidden" value="true" size="45"/>
					</td>
				</tr>
				
			</table>
		</div>
		<div>
			<table>
				<tr>
					<td>
						<input type="submit" value="Sign in" class="Submit"/>
						<a href="${pageContext.request.contextPath}/user/login" type="button" class="Submit"><input type="button" value="Log in"/></a>
					</td>
				</tr>
			</table>
		</div>	
		</sp:form>
	</c:if>
	
	<c:if test="${us!=null}">
		<sp:form modelAttribute="us" action="${pageContext.request.contextPath}/user/updateUser" method="post">
		<div>
			<center><h3>Sign up</h3></center>
		</div>
		<br>
		<div>
			<table>
				
				<tr>
					<td>
						<label></label>
					</td>
					<td>
						<sp:input type="hidden" path="id" placeholder="Enter your Name" size="45"/>						
					</td>
				</tr>
				
				<tr>
					<td>
						<label>Name : </label>
					</td>
					<td>
						<sp:input type="text" path="username" placeholder="Enter your Name" size="45"/><br>
						<sp:errors path="username"/>				
					</td>
				</tr>
			
				<tr>
					<td>
						<label>Email : </label>
					</td>
					<td>
						<c:out value="${us.email}"></c:out>
						<sp:input type="hidden" path="email" placeholder="Enter your Email" size="45"/><br>
						<sp:errors path="email"/>
					</td>
				</tr>
			
				<tr>
					<td>
						<label>Contact : </label>
					</td>
					<td>
						<sp:input type="tel" path="contact" placeholder="Enter your Contact" size="45" maxlength="10"/><br>
						<sp:errors path="contact"/>
					</td>
				</tr>
			
				<tr>
					<td>
						<label>Edit Password : </label>
					</td>
					<td>
						<a href="#"><button class="btn btn-info">Change Password</button></a>
						<sp:input type="hidden" path="password" placeholder="Enter your Password" size="45" minlength="8" maxlength="20"/><br>
				 		<sp:errors path="password"/>
					</td>
				</tr>
				
				<tr>
					<td>
						
					</td>
					<td>
						<sp:input path="authority" type="hidden" size="45"/>
					</td>
				</tr>
				
				<tr>
					<td>
						
					</td>
					<td>
						<sp:input path="status" type="hidden" size="45"/>
					</td>
				</tr>
				
			</table>
		</div>
		<div>
			<table>
				<tr>
					<td>
						<input type="submit" value="Update" class="Submit"/>
						<input type="reset" value="Reset" class="Submit"/>
					</td>
				</tr>
			</table>
		</div>	
		</sp:form>
	</c:if>
	
	</div>
</div>

<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>