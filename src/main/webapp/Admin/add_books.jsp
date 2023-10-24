<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin : Add Books</title>
<%@include file="AdminComp/Allcss.jsp"%>
</head>
<body style="background-color: #f0f2f2">
	<%@include file="AdminComp/navbar.jsp"%>
	<c:if test="${empty userobj }">
		<c:redirect url="../login.jsp"></c:redirect>
	</c:if>
	<div class="container">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-body">
						<h4 class="text-center">Add Books</h4>
						<c:if test="${not empty succmsg }">
							<p class="text-center text-success">${succmsg}</p>
							<c:remove var="succmsg" />
						</c:if>
						<c:if test="${not empty failmsg }">
							<p class="text-center test-danger">${failmsg}</p>
							<c:remove var="failmsg" />
						</c:if>
						<form action="../add_books" method="post"
							enctype="multipart/form-data">
							<div class="form-group">
								<label for="exampleInputEmail1">Book Name*</label> <input
									type="text" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" required="required" name="bname">
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">Author's Name*</label> <input
									type="text" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" required="required" name="aname">
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">Price*</label> <input
									type="number" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" required="required" name="price">
							</div>
							<div class="form-group">
								<label for="inputState">Book Category</label> <select
									id="inputState" name="categories" class="form-control">
									<option selected="selected">---select---</option>
									<option value="New Book">New Book</option>
									<option value="Old Book">Old Book</option>
								</select>
							</div>
							<div class="form-group">
								<label for="inputState">Book Status</label> <select
									id="inputState" name="status" class="form-control">
									<option selected="selected">---select---</option>
									<option value="Available">Active</option>
									<option value="Unavailable">Inactive</option>
								</select>
							</div>
							<div class="form-group">
								<label for="exampleFormControlFile1">Upload Photo</label> <input
									name="bimg" type="file" class="form-control-file"
									id="exampleFormControlFile1">
							</div>


							<div>
								<button type="submit" class="btn btn-primary">Add</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div style="margin-bottom: 5px; margin-top: 5px;"><%@include
			file="AdminComp/footer.jsp"%></div>
</body>
</html>