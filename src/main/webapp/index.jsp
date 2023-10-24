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
<title>Ebook : Main Page</title>
<%@include file="AllComponent/Allcss.jsp"%>
<style type="text/css">
.back-img {
	background: url("Img/books.jpg");
	height: 50vh;
	width: 100%;
	background-repeat: no-repeat;
	background-size: cover;
}

.crd-ho:hover {
	background-color: #fcf7f7;
}

/* toast */
#toast {
	min-width: 300px;
	position: fixed;
	bottom: 30px;
	left: 50%;
	margin-left: -125px;
	background: #333;
	padding: 10px;
	color: white;
	text-align: center;
	z-index: 1;
	font-size: 18px;
	visibility: hidden;
	box-shadow: 0px 0px 100px #000;
}

#toast.display {
	visibility: visible;
	animation: fadeIn 0.5, fadeOut 0.5s 2.5s;
}

@
keyframes fadeIn {from { bottom:0;
	opacity: 0;
}

to {
	bottom: 30px;
	opacity: 1;
}

}
@
keyframes fadeOut {form { bottom:30px;
	opacity: 1;
}

to {
	bottom: 0;
	opacity: 0;
}
}

/* toast */
</style>
</head>
<body style="background-color: #f7f7f7;">

	<c:if test="${not empty addCart }">
		<div id="toast">${addCart }</div>

		<script type="text/javascript">
		showToast();
		function showToast(content)
		{
		    $('#toast').addClass("display");
		    $('#toast').html(content);
		    setTimeout(()=>{
		        $("#toast").removeClass("display");
		    },2000)
		}	
</script>
		<c:remove var="addCart" scope="session" />
	</c:if>

	<c:if test="${empty addCart }">
		<div id="toast">${failCart }</div>

		<script type="text/javascript">
		showToast();
		function showToast(content)
		{
		    $('#toast').addClass("display");
		    $('#toast').html(content);
		    setTimeout(()=>{
		        $("#toast").removeClass("display");
		    },2000)
		}	
</script>
		<c:remove var="failCart" scope="session" />
	</c:if>

	<%
	User u = (User) session.getAttribute("userobj");
	%>

	<%@include file="AllComponent/navbar.jsp"%>
	<div class="container-fluid back-img">
		<h2 class="text-center text-danger">Ebook Management System</h2>
	</div>

	<!-- Recent book start -->
	<div class="container-fluid">
		<h3 class="text-center">Recent Books</h3>
		<div class="row">
			<%
			BooksDAOImpl dao = new BooksDAOImpl(DBConnect.getConn());
			List<BookDtls> list = dao.GetRecentBooks();
			for (BookDtls b : list) {
			%>
			<div class="col-md-3">
				<div class="card crd-ho">
					<div class="card-body text-center">
						<img alt="Book1" src="Img/<%=b.getPhoto()%>" class="img-thumblin"
							style="width: 150px; height: 200px;">
						<p><%=b.getBookName()%></p>
						<p><%=b.getAuthor()%></p>
						<p>
							Cateogries:
							<%=b.getBookCategory()%></p>
						<div class="row ml-4">

							<%
							if (u == null) {
							%>
							<a href="login.jsp" class="btn btn-danger btn-sm ml-3"><i
								class="fa-solid fa-cart-plus"></i> Add to cart</a>

							<%
							} else {
							%>
							<a href="Cart?bid=<%=b.getBookId()%>&&uid=<%=u.getId()%>&&p=index.jsp"
								class="btn btn-danger btn-sm ml-3"><i
								class="fa-solid fa-cart-plus"></i> Add to cart</a>

							<%
							}
							%>

							<a href="viewBookDetails.jsp?bid=<%=b.getBookId()%>&&p=index.jsp"
								class="btn btn-success btn-sm ml-1">View Details</a> <a href=""
								class="btn btn-danger btn-sm ml-1"><i
								class="fa-solid fa-indian-rupee-sign"></i> <%=b.getPrice()%></a>
						</div>
					</div>
				</div>
			</div>
			<%
			}
			%>





		</div>
		<div class="text-center mt-1">
			<a href="RecentBooks.jsp" class="btn btn-danger btn-sm text-white">View
				All</a>
		</div>
	</div>
	<!-- Recent book end -->
	<hr>

	<!-- New book start -->
	<div class="container-fluid">
		<h3 class="text-center">New Books</h3>
		<div class="row">

			<%
			list = dao.GetNewBooks();
			for (BookDtls b : list) {
			%>
			<div class="col-md-3">
				<div class="card crd-ho">
					<div class="card-body text-center">
						<img alt="Book1" src="Img/<%=b.getPhoto()%>" class="img-thumblin"
							style="width: 150px; height: 200px;">
						<p><%=b.getBookName()%></p>
						<p><%=b.getAuthor()%></p>
						<p>
							Cateogries:
							<%=b.getBookCategory()%></p>
						<div class="row ml-4">

							<%
							if (u == null) {
							%>
							<a href="login.jsp" class="btn btn-danger btn-sm ml-3"><i
								class="fa-solid fa-cart-plus"></i> Add to cart</a>

							<%
							} else {
							%>
							<a
								href="Cart?bid=<%=b.getBookId()%>&&uid=<%=u.getId()%>&&p=index.jsp"
								class="btn btn-danger btn-sm ml-3"><i
								class="fa-solid fa-cart-plus"></i> Add to cart</a>

							<%
							}
							%>

							<a href="viewBookDetails.jsp?bid=<%=b.getBookId()%>"
								class="btn btn-success btn-sm ml-1">View Details</a> <a href=""
								class="btn btn-danger btn-sm ml-1"><i
								class="fa-solid fa-indian-rupee-sign"></i> <%=b.getPrice()%></a>
						</div>
					</div>
				</div>
			</div>
			<%
			}
			%>


		</div>
		<div class="text-center mt-1">
			<a href="NewBooks.jsp" class="btn btn-danger btn-sm text-white">View
				All</a>
		</div>
	</div>
	<!-- New book end -->
	<hr>

	<!-- old book start -->
	<div class="container-fluid">
		<h3 class="text-center">Old Books</h3>
		<div class="row">

			<%
			list = dao.GetOldBooks();
			for (BookDtls b : list) {
			%>
			<div class="col-md-3">
				<div class="card crd-ho">
					<div class="card-body text-center">
						<img alt="Book1" src="Img/<%=b.getPhoto()%>" class="img-thumblin"
							style="width: 150px; height: 200px;">
						<p><%=b.getBookName()%></p>
						<p><%=b.getAuthor()%></p>
						<p>
							Cateogries:
							<%=b.getBookCategory()%></p>
						<div class="row ml-4">

							<%
							if (u == null) {
							%>
							<a href="login.jsp" class="btn btn-danger btn-sm ml-3"><i
								class="fa-solid fa-cart-plus"></i> Add to cart</a>

							<%
							} else {
							%>
							<a
								href="Cart?bid=<%=b.getBookId()%>&&uid=<%=u.getId()%>&&p=index.jsp"
								class="btn btn-danger btn-sm ml-3"><i
								class="fa-solid fa-cart-plus"></i> Add to cart</a>

							<%
							}
							%>

							<a href="viewBookDetails.jsp?bid=<%=b.getBookId()%>"
								class="btn btn-success btn-sm ml-1">View Details</a> <a href=""
								class="btn btn-danger btn-sm ml-1"><i
								class="fa-solid fa-indian-rupee-sign"></i> <%=b.getPrice()%></a>
						</div>
					</div>
				</div>
			</div>
			<%
			}
			%>
		</div>
		<div class="text-center mt-1">
			<a href="OldBooks.jsp" class="btn btn-danger btn-sm text-white">View
				All</a>
		</div>
	</div>
	<!-- old book end -->
	<%@include file="AllComponent/footer.jsp"%>
</body>
</html>