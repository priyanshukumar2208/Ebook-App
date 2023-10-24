<%@page import="com.entity.BookOrder"%>
<%@page import="java.util.List"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.BookOrderDaoimpl"%>
<%@page import="com.entity.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin : Orders</title>
<%@include file="AdminComp/Allcss.jsp"%>
</head>
<body style="background-color: #f0f2f2">
	<%@include file="AdminComp/navbar.jsp"%>
	<c:if test="${empty userobj }">
		<c:redirect url="../login.jsp"></c:redirect>
	</c:if>
	<h3 class="text-center">Hello Admin</h3>

	<table class="table table-striped">
		<thead class="bg-primary text-white">
			<tr>
				<th scope="col">Order Id</th>
				<th scope="col">Name</th>
				<th scope="col">Email</th>
				<th scope="col">Address</th>
				<th scope="col">Phone-no</th>
				<th scope="col">Book Name</th>
				<th scope="col">Author</th>
				<th scope="col">Price</th>
				<th scope="col">Payment-Type</th>
			</tr>
		</thead>
		<tbody>
			<%
				BookOrderDaoimpl dao = new BookOrderDaoimpl(DBConnect.getConn());
				List<BookOrder> orders = dao.getOrdersAdmin();

				int totalPrice = 0;

				for (BookOrder b : orders) {
				%>
				<tr>
					<th scope="row"><%=b.getOrderId()%></th>
					<td><%=b.getUserName()%></td>
					<td><%=b.getEmail()%></td>
					<td><%=b.getFullAddress()%></td>
					<td><%=b.getPhoneNumber()%></td>
					<td><%=b.getBookName()%></td>
					<td><%=b.getAuthor()%></td>
					<td><%=b.getPrice()%></td>
					<td><%=b.getPaymentType()%></td>
				</tr>
				<%
				}
				%>
		</tbody>
	</table>
	<div style="margin-bottom: 5px;"><%@include
			file="AdminComp/footer.jsp"%></div>
</body>
</html>