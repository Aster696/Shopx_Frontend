<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="css" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="sp" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<link href='<css:url value="/css/diplayGame.css"></css:url>' rel="stylesheet" type="text/css">
<title>Insert title here</title>
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Open+Sans:400,700" rel="stylesheet">
</head>
<body>

<jsp:include page="home.jsp"></jsp:include>
<br>
<div class="container">
		<div class="card">
			<div class="container-fliud">
				<div class="wrapper row">
					<div class="preview col-md-6">
						
						<div class="preview-pic tab-content">
						  <div class="tab-pane active" id="pic-1"><img style="height: 600px; width: 500px" src='<sp:url value="/images/${ga.game_name}/${ga.gameimage}"></sp:url>' /></div>
						  
						</div>
						
					</div>
					<div class="details col-md-6">
					<input type="hidden" value="${ga.id}"/>
						<h3 class="product-title">${ga.game_name}</h3>
						<div class="rating">
							<div class="stars">
								<span class="fa fa-star checked"></span>
								<span class="fa fa-star checked"></span>
								<span class="fa fa-star checked"></span>
								<span class="fa fa-star"></span>
								<span class="fa fa-star"></span>
							</div>
							<span class="review-no">41 reviews</span>
						</div>
						<h6>Brand : ${ga.brand}</h6>
						<h6>Platform : ${ga.platform}</h6>
						<h6>Rating : ${ga.rating}</h6>
						<h6>Category : ${ga.category}</h6>
						<p class="product-description">Description : ${ga.description}</p>
					<c:if test="${ga.price > 0}">
						<h4 class="price">current price: <span>Rs. ${ga.price}</span></h4>
					</c:if>
					<c:if test="${ga.price == 0}">
						<h4 class="price">current price: <span>Free</span></h4>
					</c:if>
						<p class="vote"><strong>91%</strong> of buyers enjoyed this product! <strong>(87 votes)</strong></p>
						<h6>For any query Email us on : ${ga.email}</h6>
					<div class="action">
					<table>
						<tr>
							<td><a href="${ga.link}"><button class="add-to-cart btn btn-primary" type="button">Download</button></a></td>
							<td><a href="${pageContext.request.contextPath}/cart/addToCart/${ga.id}"><button class="add-to-cart btn btn-success" type="button">Add to cart</button></a></td>
							<td><button class="like btn btn-default" type="button"><span class="fa fa-star"></span></button></td>					
						</tr>
						
						<tr>
						<sec:authorize access="hasAuthority('admin') and isAuthenticated()">
							<td><a href="${pageContext.request.contextPath}/game/editgame/${ga.id}"><button class="btn btn-info" type="button">Edit</button></a></td>
							<td><a href="${pageContext.request.contextPath}/game/deletegame/${ga.id}"><button class="btn btn-danger" type="button">Delete</button></a></td>						
						</sec:authorize>
						</tr>
						
					</table>
					</div>
					</div>
				</div>
			</div>
		</div>
	</div>

<jsp:include page="footer.jsp"></jsp:include>

</body>
</html>