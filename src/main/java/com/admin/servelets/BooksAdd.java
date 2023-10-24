package com.admin.servelets;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.DAO.BooksDAOImpl;
import com.DB.DBConnect;
import com.entity.BookDtls;

@WebServlet("/add_books")
@MultipartConfig
public class BooksAdd extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			String bookname = req.getParameter("bname");
			String author = req.getParameter("aname");
			String price = req.getParameter("price");
			String category = req.getParameter("categories");
			String status = req.getParameter("status");

			Part part = req.getPart("bimg");
			String filename = part.getSubmittedFileName();

			BookDtls bdtls = new BookDtls(bookname, author, price, category, status, filename, "admin@pmail.com");
			// System.out.println(bdtls);

			BooksDAOImpl dao = new BooksDAOImpl(DBConnect.getConn());

			boolean b = dao.addBooks(bdtls);

			HttpSession session = req.getSession();

			if (b) {
				String path = getServletContext().getRealPath("") + "Img";
				File f = new File(path);
				part.write(path + File.separator + filename);
				System.out.println(path);

				session.setAttribute("succmsg", "Book Added Successfully");
				resp.sendRedirect("Admin/add_books.jsp");
			} else {
				session.setAttribute("failmsg", "Something went wrong!!!");
				resp.sendRedirect("Admin/add_books.jsp");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
