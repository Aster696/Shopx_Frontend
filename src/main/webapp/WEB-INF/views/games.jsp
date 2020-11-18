<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="css" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="sp" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link href='<css:url value="/css/games.css"></css:url>' rel="stylesheet" type="text/css">

<!-- ============ -->
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
</head>
<body>
<jsp:include page="home.jsp"></jsp:include>

<div>
	<h2 class="w3-center">Shopx</h2>

	<div class="w3-content w3-display-container">
	<c:forEach items="${games}" var="ga">
		<c:if test="${ga.adauthority=='payed'}">
		<a href="${pageContext.request.contextPath}/game/games/${ga.id}">
	  		<img class="mySlides" src="<sp:url value="/images/${ga.game_name}/${ga.gameimage}"></sp:url>" width="100%" height="500"/>
		</a>
		</c:if>
	</c:forEach>
<!-- 	  
	  <img class="mySlides" src="https://cnet1.cbsistatic.com/img/l8RbnOsHzo6C0fHx-A7yGCDZxGI=/1200x675/2019/09/18/c07d7cfa-5cc7-4d64-a3bb-aabf6b778dcc/call-of-duty-mobile.jpg" width="100%" height="700">
	  <img class="mySlides" src="https://www.callofduty.com/content/dam/atvi/callofduty/cod-touchui/kronos/common/social-share/social-share-image.jpg" width="100%" height="700">
	  <img class="mySlides" src="https://image-cdn.essentiallysports.com/wp-content/uploads/20200515001421/ad3f96dfd21531e24ab72c3821a01049c8484982.jpg" width="100%" height="700">
	  <img class="mySlides" src="https://static1-www.millenium.gg/articles/4/15/59/4/@/162522-1304499-doom-eternal-soundtrack-ost-orig-1-amp_main_media_schema-1.jpg" width="100%" height="700">
 -->
	  <button class="w3-button w3-black w3-display-left" onclick="plusDivs(-1)">&#10094;</button>
	  <button class="w3-button w3-black w3-display-right" onclick="plusDivs(1)">&#10095;</button>
	</div>
	
	<script type="text/javascript">
	var slideIndex = 1;
	showDivs(slideIndex);
	
	function plusDivs(n) {
	  showDivs(slideIndex += n);
	}
	
	function showDivs(n) {
	  var i;
	  var x = document.getElementsByClassName("mySlides");
	  if (n > x.length) {slideIndex = 1}
	  if (n < 1) {slideIndex = x.length}
	  for (i = 0; i < x.length; i++) {
	    x[i].style.display = "none";  
	  }
	  x[slideIndex-1].style.display = "block";  
	}
	</script>
</div>

<div class="container">
<center><h3>Games</h3></center>
	<div class="row">
	<c:forEach items="${games}" var="ga">
		<div class="col-md-3 col-sm-6">
            <div class="product-grid">
                <div class="product-image">
                    <a href="${pageContext.request.contextPath}/game/games/${ga.id}">
                        <img class="pic-1" style="height: 350px" src='<sp:url value="/images/${ga.game_name}/${ga.gameimage}"></sp:url>' />
                        
                    </a>
                    
                    <span class="product-new-label">Sale</span>
                    <span class="product-discount-label">20%</span>
                </div>
                <ul class="rating">
                    <li class="fa fa-star"></li>
                    <li class="fa fa-star"></li>
                    <li class="fa fa-star"></li>
                    <li class="fa fa-star"></li>
                    <li class="fa fa-star disable"></li>
                </ul>
                <div class="product-content">
                    <h3 class="title"><a href="${pageContext.request.contextPath}/game/games/${ga.id}">Name : ${ga.game_name}</a></h3>
                <c:if test="${ga.price > 0}">
                    <div class="price">Rs. ${ga.price}
                        
                    </div>
                </c:if>
                <c:if test="${ga.price == 0}">
                	<div class="price"> Free
                        
                    </div>
                </c:if>
                
                </div>
            </div>
        </div>
    </c:forEach>
	</div>
</div>
<br>

<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>