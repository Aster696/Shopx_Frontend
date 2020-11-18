<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<%@taglib prefix="css" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">

.listContainer{
	width: 100%;
	background-color: white;
}
.tableContainer{
	margin: 0 auto;
	max-width: 100%;
}
table, th, td{
	border: 1px solid black;
}

</style>

</head>
<body>
<jsp:include page="home.jsp"></jsp:include>
<br>
<div class="listContainer">
<br>
<div class="Link">
	<form action="${pageContext.request.contextPath}/user/searchUser" method="post">
		<input type="search" name="email" placeholder="Search" size="70"/><input type="submit" value="Search">
	</form>
</div>
<center><h3>User List</h3></center>
		<div class="tableContainer">
		<table style="width: 100%">
			<tr>
				<th>
					ID
				</th>
				<th>
					User Name
				</th>
				<th>
					Email
				</th>
				<th>
					Contact
				</th>
				<th>
					Password
				</th>
				<th>
					Authority
				</th>
				<th>
					Status
				</th>
				<th>
					Set Authority
				</th>
				<th>
					Set Status
				</th>
				<th>
					Edit User
				</th>
				<th>
					Delete User
				</th>
			</tr>
			<c:forEach items="${user}" var="us">
			<tr>
				<td>
					<c:out value="${us.id}"></c:out>
				</td>
				<td>
					<c:out value="${us.username}"></c:out>
				</td>
				<td>
					<c:out value="${us.email}"></c:out>
				</td>
				<td>
					<c:out value="${us.contact}"></c:out>
				</td>
				<td>
					<c:out value="${us.password}"></c:out>
				</td>
				<td>
					<c:out value="${us.authority}"></c:out>
				</td>
				<td>
					<c:out value="${us.status}"></c:out>
				</td>
				<td>
				<c:if test="${us.authority == 'user'}">
					<a href="${pageContext.request.contextPath}/user/setAuthority/${us.id}"><button class="btn btn-primary">Switch</button></a>
				</c:if>
				<c:if test="${us.authority == 'admin'}">
					<a href="${pageContext.request.contextPath}/user/setAuthority/${us.id}"><button class="btn btn-success">Switch</button></a>
				</c:if>
				</td>
				<td>
				<c:if test="${us.status == true}">
					<a href="${pageContext.request.contextPath}/user/setStatus/${us.id}"><button class="btn btn-success">Switch</button></a>			 
				</c:if>
				<c:if test="${us.status == false}">
					<a href="${pageContext.request.contextPath}/user/setStatus/${us.id}"><button class="btn btn-warning">Switch</button></a>			 
				</c:if>
				</td>			
				<td>
					<a href="${pageContext.request.contextPath}/user/editUser/${us.id}"><button class="btn btn-info">Edit</button></a>
				</td>
				<td>
					<a href="${pageContext.request.contextPath}/user/deleteUser/${us.id}"><button class="btn btn-danger">Delete</button></a>
				</td>
			</tr>
		</c:forEach>
		</table>
		</div>
</div>

<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>