<%@page import="com.entity.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="com.DAO.BooksDAOImpl"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.entity.BookDtls"%>
<%@page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Recent Books</title>
<style type="text/css">
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
<%@include file="AllComponent/Allcss.jsp"%>
<body>
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
	<div class="container-fluid">
		<div class="row p-3">

			<%
			BooksDAOImpl dao = new BooksDAOImpl(DBConnect.getConn());
			List<BookDtls> list = dao.GetAllRecentBooks();
			for (BookDtls b : list) {
			%>
			<div class="col-md-3">
				<div class="card crd-ho mt-2">
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
							<a href="Cart?bid=<%=b.getBookId()%>&&uid=<%=u.getId()%>&&p=RecentBooks.jsp"
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
	</div>
</body>
</html>