<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="css" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="sp" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.8/css/all.css">

</head>
<body>
<jsp:include page="home.jsp"></jsp:include>

<div class="container">
<br>  <p class="text-center">More bootstrap 4 components on <a href="http://bootstrap-ecommerce.com/" target="_blank"> Bootstrap-ecommerce.com</a></p>
<hr>

<div class="card">
<table class="table table-hover shopping-cart-wrap">
<thead class="text-muted">

<tr>
  <th scope="col">Product</th>
  <th scope="col" width="120">Platform</th>
  <th scope="col" width="120">Category</th>
  <th scope="col" width="120">Rating</th>
  <th scope="col" width="120">Price</th>
  <th scope="col" width="200" class="text-right">Action</th>
</tr>
</thead>

<tbody>
<c:forEach items="${userCart}" var="uc">
<tr>
<input value="${uc.cartId}" type="hidden"/>
	<td>
		<figure class="media">
			<div class="img-wrap"><img src="http://bootstrap-ecommerce.com/main/images/items/2.jpg" class="img-thumbnail img-sm"></div>
			<figcaption class="media-body">
				<h6 class="title text-truncate">${uc.gamename}</h6>
				<dl class="param param-inline small">
				  <dt>Size: </dt>
				  <dd>50 GB</dd>
				</dl>
				<!-- 
				<dl class="param param-inline small">
				  <dt>Color: </dt>
				  <dd>Orange color</dd>
				</dl>
				 -->
			</figcaption>
		</figure> 
	</td>
	<td> 
		${uc.platform}
	</td>
	<td> 
		${uc.category}
	</td>
	<td> 
		${uc.rating}
	</td>
	<td> 
		<div class="price-wrap"> 
			<var class="price">Rs ${uc.price}</var> 
		</div> <!-- price-wrap .// -->
	</td>
	<td class="text-right"> 
		<a title="" href="" class="btn btn-outline-success" data-toggle="tooltip" data-original-title="Save to Wishlist"> <i class="fa fa-heart"></i></a> 
		<a href="${pageContext.request.contextPath}/cart/deleteCart/${uc.cartId}" class="btn btn-outline-danger"> × Remove</a>
	</td>
</tr>
</c:forEach>
</tbody>
</table>
</div> <!-- card.// -->

</div> 
<!--container end.//-->

<br><br>

<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>