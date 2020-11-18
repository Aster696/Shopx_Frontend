<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="css" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>

<link rel="stylesheet" href='<css:url value="/css/home.css"></css:url>'/>
<script src='<css:url value="/js/home.js"></css:url>'></script>

</head>
<body>

<div>
<div class="mycontainer">
		<div>
			<span id="slidebar" class="slidebarCss">
				<br><a href="javascript:void(0)" onclick="closebar()" class="closebtn">&#9776;</a><br><br><br>
				<sec:authorize access="!isAuthenticated()">
					<a href="${pageContext.request.contextPath}/user/signin">Sign in</a>
					<a href="${pageContext.request.contextPath}/user/login">Log in</a>
				</sec:authorize>
				<sec:authorize access="hasAuthority('admin') and isAuthenticated()">
					<a href="${pageContext.request.contextPath}/game/addGame">Add Game</a>
					<a href="${pageContext.request.contextPath}/list/userList">Users List</a>
					<a href="${pageContext.request.contextPath}/list/gameList">Game List</a>
	<!-- 			<a href="${pageContext.request.contextPath}/list/ManyToManyList">Many to Many List</a>   -->
					<a href="${pageContext.request.contextPath}/other/AdGame">Advertise Game</a>
				</sec:authorize>
					<a href="${pageContext.request.contextPath}/other/HighToLow">High price</a>
					<a href="${pageContext.request.contextPath}/other/LowToHigh">Low price</a>
				<sec:authorize access="isAuthenticated()">
<!--				<a href="${pageContext.request.contextPath}/user/editUser/${us.id}">My Profile</a> -->
					<a href="${pageContext.request.contextPath}/logout">Logout</a>
				</sec:authorize>
			</span>
			
			<span id="slidebar" style="cursor: pointer; font-size: 25px; padding: 15px" onclick="openbar()" class="openbtn">&#9776;</span>
			<span class="Logo">Shopx</span>
			<span class="Link">		
				<a href="${pageContext.request.contextPath}/home">Home</a>
				<a href="${pageContext.request.contextPath}/game/games">Games</a>
<!-- 
				<input type="search" name="search" placeholder="Search" size="60"/><input type="submit" value="Search">
 -->
				<a href="${pageContext.request.contextPath}/aboutus">About site</a>
				<a href="${pageContext.request.contextPath}/contactus">Contact me</a>
				<a href="${pageContext.request.contextPath}/emptyPage">Empty page</a>
			</span>
			<span class="rightSide">
				<a href="${pageContext.request.contextPath}/cart/myCart">My Cart</a>
			<sec:authorize access="!isAuthenticated()">
				<a href="${pageContext.request.contextPath}/user/login">Log in</a>
			</sec:authorize>
			</span>
			
	<!-- drop down -->
			<span class="dropdown">
			  	<span>
			  		<sec:authorize access="isAuthenticated()">
						<a href="#"><button><i class='far fa-user-circle'></i> <sec:authentication property="principal.username"/> <i class="fas fa-caret-down"></i></button></a>			  	
					</sec:authorize>
				</span>
			  <span class="dropdown-content">
				    <sec:authorize access="isAuthenticated()">
						<a href="${pageContext.request.contextPath}/logout">Logout</a>
					</sec:authorize>
			  </span>
			</span>
		</div>
</div>
<br>
<div class="Link">
	<form action="${pageContext.request.contextPath}/other/search" method="post">
		<input type="search" name="search" placeholder="Search" size="70"/><input type="submit" value="Search">
	</form>
</div>
</div>

</body>
</html>