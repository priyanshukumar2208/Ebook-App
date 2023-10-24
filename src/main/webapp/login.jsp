<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Ebook : Login</title>
<%@include file="AllComponent/Allcss.jsp"%>
</head>
<body style="background-color: #f0f1f2;">
	<%@include file="AllComponent/navbar.jsp"%>
	<div class="container">
		<div class="row mt-2">
			<div class="cpl-md-4 offset-md-4">
				<div class="card">
					<div class="card-body">
						<h3 class="text-center">Login</h3>
						<hr>
						<c:if test="${not empty failmsg }">
							<h5 class="text-center text-danger">${failmsg }</h5>
							<c:remove var="failmsg" scope="session" />
						</c:if>
						<c:if test="${not empty succmsg }">
							<h5 class="text-center text-danger">${succmsg }</h5>
							<c:remove var="succmsg" scope="session" />
						</c:if>

						<form action="login" method="post">
							<div class="form-group">
								<label for="exampleInputEmail1">Email address</label> <input
									type="email" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" placeholder="Enter email"
									required="required" name="email">
							</div>
							<div class="form-group">
								<label for="exampleInputPassword1">Password</label> <input
									type="password" class="form-control" id="exampleInputPassword1"
									placeholder="Password" required="required" name="passkey">
							</div>
							<div class="text-center">
								<button type="submit" class="btn btn-primary">Login</button>
								<br> <a href="register.jsp">Create Account</a>
							</div>
						</form>

					</div>
				</div>
			</div>
		</div>
	</div>
	<%@include file="AllComponent/footer.jsp"%>
</body>
</html>