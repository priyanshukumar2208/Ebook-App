<%@page import="com.entity.BookDtls"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.BooksDAOImpl"%>
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
						<h4 class="text-center">Edit Books</h4>
						
						<%
						int id=Integer.parseInt(request.getParameter("id"));
						BooksDAOImpl dao=new BooksDAOImpl(DBConnect.getConn());
						BookDtls b =dao.getBookByID(id);
						%>
						<form action="../edit_book" method="post">
						<input type="Hidden" name="id" value="<%=b.getBookId()%>">
							<div class="form-group">
								<label for="exampleInputEmail1">Book Name*</label> <input
									type="text" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" required="required" name="bname"
									value="<%= b.getBookName()%>">
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">Author's Name*</label> <input
									type="text" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" required="required" name="aname"
									value="<%=b.getAuthor()%>">
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">Price*</label> <input
									type="number" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" required="required" name="price"
									value="<%=b.getPrice()%>">
							</div>
							<div class="form-group">
								<label for="inputState">Book Status</label> <select
									id="inputState" name="status" class="form-control">
									<%
									if("Active".equals(b.getStatus())){%>
										<option value="Active"  selected="selected">Active</option>
										<option value="Inactive">Inactive</option>
									<%}else{%>
										<option value="Inactive" selected="selected">Inactive</option>
										<option value="Active">Active</option>
									<%}
									%>
								</select>
							</div>
							<div>
								<button type="submit" class="btn btn-primary">Update</button>
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