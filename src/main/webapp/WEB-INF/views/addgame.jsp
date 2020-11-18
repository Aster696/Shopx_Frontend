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
	<c:if test="${ga==null}">
		<sp:form modelAttribute="game" action="${pageContext.request.contextPath}/game/addGame" method="post" enctype="multipart/form-data">
			<center><h3>Add Game</h3></center>
			<table>
				<tr>
					<td>
						<label>Name : </label>
					</td>
					<td>
						<sp:input type="text" path="game_name" placeholder="Enter the Name of the Game" size="45"/><br>
						<sp:errors path="game_name"/>
					</td>
				</tr>
			
				<tr>
					<td>
						<label>Email : </label>
					</td>
					<td>
						<sp:input type="email" path="email" placeholder="Enter Email of your Company" size="45"/><br>
						<sp:errors path="email"/>
					</td>
				</tr>
			
				<tr>
					<td>
						<label>Brand : </label>
					</td>
					<td>
						<sp:input type="text" path="brand" placeholder="Enter your Brand name" size="45"/><br>
						<sp:errors path="brand"/>
					</td>
				</tr>
			
				<tr>
					<td>
						<label>Platform : </label>
					</td>
					<td>
						<sp:select path="platform" title="Select a platform">
							<sp:option value="PC">PC</sp:option>
							<sp:option value="PlayStation">PlayStation</sp:option>
							<sp:option value="Xbox">Xbox</sp:option>
						</sp:select>	
					</td>
				</tr>
			
				<tr>
					<td>
						<label>Rating : </label>
					</td>
					<td>
						<sp:select path="rating" title="Select the age rating of the game">
							<sp:option value="3+">3+</sp:option>
							<sp:option value="7+">7+</sp:option>
							<sp:option value="12+">12+</sp:option>
							<sp:option value="16+">16+</sp:option>
							<sp:option value="18+">18+</sp:option>
						</sp:select>
					</td>
				</tr>
				
				<tr>
					<td>
						<label>Category : </label>
					</td>
					<td>
						<sp:select path="category" title="Select the Category of the game">
							<sp:option value="Action">Action</sp:option>
							<sp:option value="Action-Adventure">Action-Adventure</sp:option>
							<sp:option value="Adventure Games">Adventure</sp:option>
							<sp:option value="Horror">Horror</sp:option>
							<sp:option value="Role-Playing Games">Role-Playing</sp:option>
							<sp:option value="Simulation Games">Simulation</sp:option>
							<sp:option value="Strategy Games">Strategy</sp:option>
							<sp:option value="Sports Games">Sports</sp:option>
							<sp:option value="Puzzle Games">Puzzle</sp:option>
							<sp:option value="Idle Games">Idle</sp:option>
						</sp:select>
					</td>
				</tr>
				
				<tr>
					<td>
						<label>Advertisement : </label>
					</td>
					<td>
						<sp:select path="adauthority" title="for Adervertisement(extra charges are aplied) please mail us ">
							<sp:option value="notpayed">Not Payed</sp:option>
						</sp:select>
					</td>
				</tr>
				
				<tr>
					<td>
						<label>Select Image : </label>
					</td>
					<td>
						<input type="file" name="image" accept="image/*" placeholder="upload Image"/>
					</td>
				</tr>
			
				<tr>
					<td>
						<label>Description : </label>
					</td>
					<td>
						<sp:textarea path="description" placeholder="Enter the Game Description" style="resize: none;" rows="3" cols="48"></sp:textarea><br>
						<sp:errors path="description"/>
					</td>
				</tr>
				
				<tr>
					<td>
						<label>Link : </label>
					</td>
					<td>
						<sp:input type="text" path="link" placeholder="Enter game website Link" size="45"/><br>
						<sp:errors path="link"/>
					</td>
				</tr>
			
				<tr>
					<td>
						<label>Quantity : </label>
					</td>
					<td>
						<sp:input type="tel" path="quantity" placeholder="Enter the quantity" size="45"/><br>
						<sp:errors path="quantity"/>
					</td>
				</tr>
			
				<tr>
					<td>
						<label>Price : </label>
					</td>
					<td>
						<sp:input type="number" path="price" placeholder="Enter the Price" size="45"/><br>
						<sp:errors path="price"/>
					</td>
				</tr>
			</table>
			
			<table>
				<tr>
					<td>
						<input type="submit" value="Add Game" class="Submit"/>
						<input type="reset" value="Cancel" class="Submit"/>
					</td>
				</tr>
			</table>
			
		</sp:form>
	</c:if>
	
	<!-- To edit data -->
	
	<c:if test="${ga!=null}">
		<sp:form modelAttribute="ga" action="${pageContext.request.contextPath}/game/updategame/${ga.id}" method="post" enctype="multipart/form-data">
			<center><h3>Edit Game Details</h3></center>
			<table>
				<tr>
					<td>
						<label>ID : <c:out value="${ga.id}"></c:out></label>
						<sp:input path="id" type="hidden"/>
						
					</td>
				</tr>
			
				<tr>
					<td>
						<label>Name : </label>
					</td>
					<td>
						<sp:input type="text" path="game_name" placeholder="Enter the Name of the Game" size="45" minlength="1" maxlength="225"/>
						<sp:errors path="game_name"/>
					</td>
				</tr>
			
				<tr>
					<td>
						<label>Email : </label>
					</td>
					<td>
						<sp:input type="email" path="email" placeholder="Enter Email of your Company" size="45" minlength="1" maxlength="225"/>
						<sp:errors path="email"/>
					</td>
				</tr>
			
				<tr>
					<td>
						<label>Brand : </label>
					</td>
					<td>
						<sp:input type="text" path="brand" placeholder="Enter your Brand name" size="45" minlength="1" maxlength="500"/>
						<sp:errors path="brand"/>
					</td>
				</tr>
			
				<tr>
					<td>
						<label>Platform : </label>
					</td>
					<td>
						<sp:select path="platform" title="Select a platform">
							<sp:option value="PC">PC</sp:option>
							<sp:option value="PlayStation">PlayStation</sp:option>
							<sp:option value="Xbox">Xbox</sp:option>
						</sp:select>	
					</td>
				</tr>
			
				<tr>
					<td>
						<label>Rating : </label>
					</td>
					<td>
						<sp:select path="rating" title="Select the age rating of the game">
							<sp:option value="3+">3+</sp:option>
							<sp:option value="7+">7+</sp:option>
							<sp:option value="12+">12+</sp:option>
							<sp:option value="16+">16+</sp:option>
							<sp:option value="18+">18+</sp:option>
						</sp:select>
					</td>
				</tr>
				
				<tr>
					<td>
						<label>Category : </label>
					</td>
					<td>
						<sp:select path="category" title="Select the Category of the game">
							<sp:option value="Action">Action</sp:option>
							<sp:option value="Action-Adventure">Action-Adventure</sp:option>
							<sp:option value="Adventure Games">Adventure</sp:option>
							<sp:option value="Horror">Horror</sp:option>
							<sp:option value="Role-Playing Games">Role-Playing</sp:option>
							<sp:option value="Simulation Games">Simulation</sp:option>
							<sp:option value="Strategy Games">Strategy</sp:option>
							<sp:option value="Sports Games">Sports</sp:option>
							<sp:option value="Puzzle Games">Puzzle</sp:option>
							<sp:option value="Idle Games">Idle</sp:option>
						</sp:select>
					</td>
				</tr>
				
				<tr>
					<td>
						<label>Advertisement : </label>
					</td>
					<td>
						<c:out value="${ga.adauthority}"></c:out>
						<sp:input path="adauthority" type="hidden"/>
					</td>
				</tr>
				
<!-- 			
				<tr>
					<td>
						<label>Advertisement : </label>
					</td>
					<td>
						<sp:select path="adauthority" title="Adervertisement purpose">
							<sp:option value="notpayed">Not Payed</sp:option>
							<sp:option value="payed">Payed</sp:option>
						</sp:select>
					</td>
				</tr>
 -->				

				<tr>
					<td>
						<label>Select Image : </label>
					</td>
					<td>
						<input type="file" name="image" accept="image/*" placeholder="upload Image"/>
					</td>
				</tr>
		
				<tr>
					<td>
						<label>Description : </label>
					</td>
					<td>
						<sp:textarea path="description" placeholder="Enter the Game Description" style="resize: none;" rows="3" cols="48" minlength="1"></sp:textarea>
						<sp:errors path="description"/>
					</td>
				</tr>
				
				<tr>
					<td>
						<label>Link : </label>
					</td>
					<td>
						<sp:input type="text" path="link" placeholder="Enter game website Link" size="45" minlength="1"/>
						<sp:errors path="link"/>
					</td>
				</tr>
			
				<tr>
					<td>
						<label>Quantity : </label>
					</td>
					<td>
						<sp:input type="tel" path="quantity" placeholder="Enter the quantity" size="45"/>
						<sp:errors path="quantity"/>
					</td>
				</tr>
			
				<tr>
					<td>
						<label>Price : </label>
					</td>
					<td>
						<sp:input type="number" path="price" placeholder="Enter the Price" size="45"/>
						<sp:errors path="price"/>
					</td>
				</tr>
			</table>
			
			<table>
				<tr>
					<td>
						<input type="submit" value="Update" class="Submit"/>
						<input type="reset" value="Cancel" class="Submit"/>
					</td>
				</tr>
			</table>
			
		</sp:form>
	</c:if>
	
	</div>
</div>

<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>