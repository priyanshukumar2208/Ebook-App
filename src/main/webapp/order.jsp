<%@page import="com.entity.BookOrder"%>
<%@page import="com.DAO.BookOrderDaoimpl"%>
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
<title>Your Orders</title>
<%@include file="AllComponent/Allcss.jsp"%>

</head>
<body style="background-color: #f0f1f2;">
	<%@include file="AllComponent/navbar.jsp"%>
	<div class="container p-1">
		<h5 class="text-center text-primary"></h5>

		<table class="table table-striped mt-3">
			<thead class="bg-primary text-white">
				<tr>
					<th scope="col">Order ID</th>
					<th scope="col">Name</th>
					<th scope="col">Book Name</th>
					<th scope="col">Author</th>
					<th scope="col">Price</th>
					<th scope="col">Payment Type</th>
				</tr>
			</thead>
			<tbody>
				<%
				User u = (User) session.getAttribute("userobj");

				BookOrderDaoimpl dao = new BookOrderDaoimpl(DBConnect.getConn());
				List<BookOrder> orders = dao.getOrders(u.getEmail());

				int totalPrice = 0;

				for (BookOrder b : orders) {
				%>
				<tr>
					<th scope="row"><%=b.getOrderId()%></th>
					<td><%=b.getUserName()%></td>
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
	</div>
</body>
</html>