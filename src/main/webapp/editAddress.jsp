<%@page import="com.entity.User"%>
<%@page import="java.util.List"%>
<%@page import="com.mysql.cj.xdevapi.DbDoc"%>
<%@page import="com.DAO.BooksDAOImpl"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.entity.BookDtls"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit Address</title>
<%@include file="AllComponent/Allcss.jsp"%>

</head>
<body style="background-color: #f0f1f2;">
	<%
	User u = (User) session.getAttribute("userobj");
	%>
	<%@include file="AllComponent/navbar.jsp"%>
	<div class="container">
		<div class="row">
			<div class="col-md-6 offset-md-3">
				<div class="card">
					<div class="card-body">
						<h5 class="text-center text-primary p-1">Edit Address</h5>

						<c:if test="${not empty succmsg}">
							<h5 class="text-center text-success">${succmsg }</h5>
							<c:remove var="succmsg" scope="session" />
						</c:if>
						<c:if test="${not empty failmsg}">
							<h5 class="text-center text-danger">${failmsg }</h5>
							<c:remove var="failmsg" scope="session" />
						</c:if>

						<form action="updateAddress" method="post">
							<input type="hidden" value="<%=u.getId()%>" name="id">
							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="inputEmail4">Address</label> <input type="text"
										class="form-control"
										value="${(userobj.address!=null)?userobj.address:'' }"
										placeholder="Enter Address" name="uaddress">
								</div>
								<div class="form-group col-md-6">
									<label for="inputPassword4">Landmark</label> <input type="text"
										class="form-control" id="inputPassword4"
										value="${(userobj.landmark!=null)?userobj.landmark:'' }"
										placeholder="Enter Landmark" name="ulandmark">
								</div>
							</div>

							<div class="form-row">
								<div class="form-group col-md-4">
									<label for="inputEmail4">City</label> <input type="text"
										class="form-control" placeholder="Enter City"
										value="${(userobj.city!=null)?userobj.city:'' }" name="ucity">
								</div>
								<div class="form-group col-md-4">
									<label for="inputPassword4">State</label> <input type="text"
										class="form-control" placeholder="Enter State"
										value="${(userobj.state!=null)?userobj.state:'' }"
										name="ustate">
								</div>
								<div class="form-group col-md-4">
									<label for="inputPassword4">ZIP Code</label> <input type="text"
										class="form-control" placeholder="Enter ZIP Code"
										value="${(userobj.pincode!=null)?userobj.pincode:'' }"
										name="uzipcode">
								</div>
							</div>

							<div class="form-row">
								<div class="form-group col-md-8">
									<label for="inputEmail4">Enter Password</label> <input
										type="text" class="form-control" name="upassword">
								</div>
							</div>

							<div class="text-center">
								<button class="btn btn-warning">Add Address</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>