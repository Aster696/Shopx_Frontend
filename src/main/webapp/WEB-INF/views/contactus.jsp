<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">
p{
	font-size: 18px;
}
.aboutContainer{
	margin: 0 auto;
	width: 98%;
	background-color: white;
}
</style>

</head>
<body>
<jsp:include page="home.jsp"></jsp:include>
<br>
<div class="aboutContainer">
	<div>
		<center><h1>Contact</h1></center>
	</div>
	<br>
	<div>
	<center>
		<p>
			Note: This web site is just a demo project no real purchases take place on this web site. The web site may 
			take you to the original page if the link given is true.
		</p>
	</center>
		<p>	
			This web site is created using Spring and hibernate on eclipse. It does almost all the function that a simple 
			web site must do. Function like user authentication with sign up and log in page, it can add product, edit 
			product and delete product. The web site also as a Advertisement image slider at the top of the game page. if 
			a new user sign up to the web site it can send email(Email is disabled in back end of the project. so that I 
			do not send mail to unknown people while testing, you can enable it if you want). This web site can send email 
			on user Sign up, Log in, Add, Edit and Delete product and also for user applied for Advertisement.
		</p>
		<center>
			<h3>About Pages and Function</h3>
		</center>
			<h4>User accessible page</h4>
			<ul>
				<li>Home page</li>
				<li>Games page</li>
				<li>About page</li>
				<li>Contact page</li>
				<li>Empty Page</li>
				<li>Sign up page</li>
				<li>Log in page</li>
				<li>My cart Page</li>
				<li>High price function (it just leads you to games page and display game with high price)</li>
				<li>Low price function (it just leads you to games page and display game with low price)</li>
				<li>Footer is visible</li>
			</ul>
		
			<h4>Admin accessible page</h4>
			<ul>
				<li>All user accessible pages</li>
				<li>Add Game page</li>
				<li>User List page</li>
				<li>Game List page</li>
				<li>Many to Many page</li>
				<li>Advertise Game page</li>
			</ul>
			
			<h4>Other's</h4>
			<ul>
				<li>Search (products can be searched by typing in name)</li>
				<li>Forgot Password (if user forget password he/she can change password)</li>
				<li>OTP (OTP will be send to user when applied for forgot password)</li>
				<li>Sending Email (Email is disabled in back end of the project. so that I do not send mail to unknown people while testing, you can enable it if you want)</li>
			</ul>
		<br>
	</div>
</div>

<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>