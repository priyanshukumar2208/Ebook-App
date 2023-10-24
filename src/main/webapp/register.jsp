<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Ebook : Registration</title>
<%@include file="AllComponent/Allcss.jsp"%>
</head>
<body style="background-color: #f0f1f2;">
	<%@include file="AllComponent/navbar.jsp"%>
	<div class="container p-2">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-body">
						<h4 class="text-center">Registration Page</h4>
						<c:if test="${not empty succmsg }">
							<p class="text-center test-success">${succmsg}</p>
							<!-- c:remove tag - It does not support runtime expressions as attributes. 
							Instead, it expects static values for its attributes. -->
							<c:remove var="succmsg" />
						</c:if>
						<c:if test="${not empty failmsg }">
							<p class="text-center test-danger">${failmsg}</p>
							<c:remove var="failmsg" />
						</c:if>

						<hr>
						<form Action="register" method="post">
							<div class="form-group">
								<label for="exampleInputEmail1">Enter Full Name</label> <input
									type="text" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" placeholder="Enter Full Name"
									required="required" name="fname">
							</div>

							<div class="form-group">
								<label for="exampleInputEmail1">Email address</label> <input
									type="email" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" placeholder="Enter email"
									required="required" name="emailadd">
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">Phone Number</label> <input
									type="number" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" placeholder="Enter Phone Number"
									required="required" name="phno">
							</div>

							<div class="form-group">
								<label for="exampleInputPassword1">Password</label> <input
									type="password" class="form-control" id="exampleInputPassword1"
									placeholder="Enter Password" required="required" name="passkey">
							</div>
							<div class="form-check">
								<input type="checkbox" class="form-check-input"
									id="exampleCheck1" name="check"> <label
									class="form-check-label" for="exampleCheck1">Agree
									terms & conditions out</label>
							</div>
							<button type="submit" class="btn btn-primary">Submit</button>
						</form>

					</div>
				</div>
			</div>
		</div>
	</div>
	<div style="margin-bottom: 5ps;"><%@include
			file="AllComponent/footer.jsp"%></div>
</body>
</html>