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
<title>Edit Profile</title>
<%@include file="AllComponent/Allcss.jsp"%>

</head>
<body style="background-color: #f0f1f2;">
	<%
	User u = (User) session.getAttribute("userobj");
	%>
	<c:if test="${empty userobj }">
		<c:redirect url="login.jsp"></c:redirect>
	</c:if>
	<%@include file="AllComponent/navbar.jsp"%>
	<div class="container">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-body">
						<h5 class="text-center text-primary p-1">Edit Profile</h5>
						<c:if test="${not empty succmsg}">
							<h5 class="text-center text-success">${succmsg }</h5>
							<c:remove var="succmsg" scope="session" />
						</c:if>
						<c:if test="${not empty failmsg}">
							<h5 class="text-center text-danger">${failmsg }</h5>
							<c:remove var="failmsg" scope="session" />
						</c:if>
						<form action="updateProfile" method="post">
							<input type="hidden" name="id" value="<%=u.getId()%>">
							<div class="form-group">
								<label for="exampleInputEmail1">Name</label> <input type="text"
									class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" required="required"
									value="<%=u.getName()%>" name="uname">
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">Email Address</label> <input
									type="email" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" required="required"
									value="<%=u.getEmail()%>" name="uemail">
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">Phone Number</label> <input
									type="number" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" required="required"
									value="<%=u.getPhoneno()%>" name="unumber">
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">Password</label> <input
									type="password" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" required="required"
									value="" name="upass">
							</div>



							<div>
								<button type="submit" class="btn btn-primary">Update
									Profile</button>
							</div>
						</form>

					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>