package com.admin.servelets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.BooksDAOImpl;
import com.DB.DBConnect;

@WebServlet("/delete")
public class DeleteBookServelet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			int id = Integer.parseInt(req.getParameter("id"));

			BooksDAOImpl dao = new BooksDAOImpl(DBConnect.getConn());
			boolean f = dao.DeleteBook(id);
			
			HttpSession session=req.getSession();
			if (f) {
				session.setAttribute("succmsg", "Deleted Book Successfully...");
				resp.sendRedirect("Admin/all_books.jsp");
			} else {
				session.setAttribute("failmsg", "Something went wrong!");
				resp.sendRedirect("Admin/all_books.jsp");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}