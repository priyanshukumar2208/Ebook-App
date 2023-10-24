<%@page import="com.entity.Cart"%>
<%@page import="com.DAO.CartDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="com.entity.User"%>
<%@page import="java.util.List"%>
<%@page import="com.mysql.cj.xdevapi.DbDoc"%>
<%@page import="com.DAO.BooksDAOImpl"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.entity.BookDtls"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Your Cart</title>
<%@include file="AllComponent/Allcss.jsp"%>
</head>
<body style="background-color: #f7f7f7;">
	<%@include file="AllComponent/navbar.jsp"%>

	<c:if test="${not empty succmsg }">
		<div class="alert alert-success text-center" role="alert">${succmsg}</div>
		<c:remove var="succmsg" scope="session" />
	</c:if>
	<c:if test="${not empty failmsg }">
		<div class="alert alert-danger text-center" role="alert">${failmsg }</div>
		<c:remove var="failmsg" scope="session" />
	</c:if>


	<c:if test="${empty userobj }">
		<c:redirect url="login.jsp"></c:redirect>
	</c:if>

	<div class="container">
		<div class="row p-2">
			<div class="col-md-6">
				<div class="card bg-white">
					<div class="card-body">
						<h3 class="text-center text-success">Your Selected Items</h3>
						<table class="table table-striped">
							<thead>
								<tr>
									<th scope="col">Book Name</th>
									<th scope="col">Author</th>
									<th scope="col">Price</th>
									<th scope="col">Action</th>
								</tr>
							</thead>
							<tbody>
								<%
								User u = (User) session.getAttribute("userobj");

								CartDAOImpl dao = new CartDAOImpl(DBConnect.getConn());
								List<Cart> cart = dao.getBookByUser(u.getId());

								int totalPrice = 0;

								for (Cart c : cart) {
									totalPrice = Integer.parseInt(c.getTotalPrice());
								%>
								<tr>
									<th scope="row"><%=c.getBookName()%></th>
									<td><%=c.getAuthorName()%></td>
									<td><%=c.getPrice()%></td>
									<td><a class="btn btn-sm btn-danger"
										href="remove_book?bid=<%=c.getBid()%>&&uid=<%=c.getUid()%>&&cid=<%=c.getCid()%>">Remove</a></td>
								</tr>
								<%
								}
								%>

								<tr>
									<td>Total Price</td>
									<td></td>
									<td></td>
									<td><%=totalPrice%></td>
								</tr>

							</tbody>
						</table>
					</div>
				</div>
			</div>

			<div class="col-md-6">
				<div class="card">
					<div class="card-body">
						<h3 class="text-center text-success">Your Order Details</h3>
						<form action="order" method="post">
							<input type="hidden" name="id" value="${userobj.id }">
							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="inputEmail4">Name</label> <input type="text"
										class="form-control" value="<%=u.getName()%>"
										readonly="readonly" name="oname">
								</div>
								<div class="form-group col-md-6">
									<label for="inputPassword4">Email</label> <input type="email"
										class="form-control" value="<%=u.getEmail()%>"
										readonly="readonly" name="oemail">
								</div>
							</div>

							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="inputEmail4">Phone Number</label> <input
										type="number" class="form-control" value="<%=u.getPhoneno()%>"
										readonly="readonly" name="onumber">
								</div>
								<div class="form-group col-md-6">
									<label for="inputPassword4">Address</label> <input type="text"
										class="form-control" id="inputPassword4"
										placeholder="Password" value="${userobj.address }"
										name="oaddress">
								</div>
							</div>

							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="inputEmail4">Landmark</label> <input type="text"
										class="form-control" value="${userobj.landmark }"
										name="olandmark">
								</div>
								<div class="form-group col-md-6">
									<label for="inputPassword4">City</label> <input type="text"
										class="form-control" value="${userobj.city }" name="ocity">
								</div>
							</div>

							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="inputEmail4">State</label> <input type="text"
										class="form-control" value="${userobj.state }" name="ostate">
								</div>
								<div class="form-group col-md-6">
									<label for="inputPassword4">PinCode</label> <input type="text"
										class="form-control" value="${userobj.pincode }"
										name="ozipcode">
								</div>
							</div>

							<div class="form-group">
								<label>Payment mode</label> <select class="form-control" name="opayment">
									<option value="No_Selection" selected>---Select---</option>
									<option value="COD" >Cash on delivery</option>
								</select>
							</div>

							<div class="text-center">
								<button class="btn btn-warning">Order Now</button>
								<a href="index.jsp" class="btn btn-success">Continue
									Shopping</a>
							</div>

						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>