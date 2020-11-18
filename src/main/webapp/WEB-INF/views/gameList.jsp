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

<link href='<css:url value="/css/List.css"></css:url>' rel="stylesheet"/>

</head>
<body>
<jsp:include page="home.jsp"></jsp:include>
<br>
<div class="listContainer">
<center><h3>Game List</h3></center>
		<div class="tableContainer">
		<table style="width: 100%;">
			<tr>
				<th>
					ID
				</th>
				<th>
					Game Name
				</th>
				<th>
					Company Email
				</th>
				<th>
					Brand
				</th>
				<th>
					Platform
				</th>
				<th>
					Rating
				</th>
				<th>
					Category
				</th>
				<th>
					Advertisement
				</th>
				<th>
					Description
				</th>
				<th>
					Link
				</th>
				<th>
					Price
				</th>
				<th>
					Set ADs
				</th>
				<th>
					Edit
				</th>
				<th>
					Delete
				</th>
			</tr>
			<c:forEach items="${game}" var="ga">
			<tr>
				<td>
					<c:out value="${ga.id}"></c:out>
				</td>
				<td>
					<c:out value="${ga.game_name}"></c:out>
				</td>
				<td>
					<c:out value="${ga.email}"></c:out>
				</td>
				<td>
					<c:out value="${ga.brand}"></c:out>
				</td>
				<td>
					<c:out value="${ga.platform}"></c:out>
				</td>
				<td>
					<c:out value="${ga.rating}"></c:out>
				</td>
				<td>
					<c:out value="${ga.category}"></c:out>
				</td>
				<td>
					<c:out value="${ga.adauthority}"></c:out>
				</td>
				<td>
					<c:out value="${ga.description}"></c:out>
				</td>
				<td>
					<c:out value="${ga.link}"></c:out>
				</td>
				<td>
					<c:out value="${ga.price}"></c:out>
				</td>
				<td>
				<c:if test="${ga.adauthority == 'notpayed'}">
					<a href="${pageContext.request.contextPath}/game/addAd/${ga.id}"><button class="btn btn-primary">Add</button></a>
				</c:if>
				<c:if test="${ga.adauthority == 'payed'}">
					<a href="${pageContext.request.contextPath}/game/addAd/${ga.id}"><button class="btn btn-warning">Remove</button></a>
				</c:if>
				</td>
				<td>
					<a href="${pageContext.request.contextPath}/game/editgame/${ga.id}"><button class="btn btn-info" type="button">Edit</button></a>
				</td>
				<td>
					<a href="${pageContext.request.contextPath}/game/deletegame/${ga.id}"><button class="btn btn-danger" type="button">Delete</button></a>
				</td>
			</tr>
		</c:forEach>
		</table>
		</div>
</div>

<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>