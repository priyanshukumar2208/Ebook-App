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
<title>Help Line</title>
<%@include file="AllComponent/Allcss.jsp"%>

</head>
<body style="background-color: #f0f1f2;">
	<%@include file="AllComponent/navbar.jsp"%>
	<div class="container">
		<div class="row">
			<div class="col-md-4 offset-md-4 text-center">
				<div class="card">
					<div class="card-body">
						<div class="text-success ">
							<i class="fa-solid fa-square-phone fa-5x"></i>
						</div>
						<h3>24 * 7 Service</h3>
						<h4>Help Line Number</h4>
						<h5>+01828 3849 3937</h5>
						<a href="index.jsp" class="btn btn-primary">Home</a>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>