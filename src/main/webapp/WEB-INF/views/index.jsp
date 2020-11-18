<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="css" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="sp" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

</head>
<body>
<jsp:include page="home.jsp"></jsp:include>

<h2 class="w3-center">Shopx</h2>

<div class="w3-content w3-display-container">
<!--  
	<c:forEach items="${games}" var="ga">
		<c:if test="${ga.adauthority=='payed'}">
	  		<img class="mySlides" src="<sp:url value="/images/${ga.game_name}/${ga.gameimage}"></sp:url>" width="100%" height="600"/>
		</c:if>
	</c:forEach>
-->

	  <img class="mySlides" src="https://www.callofduty.com/content/dam/atvi/callofduty/cod-touchui/kronos/common/social-share/social-share-image.jpg" width="100%" height="600"/>
	  <img class="mySlides" src="https://steamcdn-a.akamaihd.net/steam/apps/319510/capsule_616x353.jpg?t=1447363301" width="100%" height="600"/>
	  <img class="mySlides" src="https://image-cdn.essentiallysports.com/wp-content/uploads/20200515001421/ad3f96dfd21531e24ab72c3821a01049c8484982.jpg" width="100%" height="600"/>
	  <img class="mySlides" src="https://static1-www.millenium.gg/articles/4/15/59/4/@/162522-1304499-doom-eternal-soundtrack-ost-orig-1-amp_main_media_schema-1.jpg" width="100%" height="600"/>

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

<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>
