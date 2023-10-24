package com.user.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.BooksDAOImpl;
import com.DAO.CartDAOImpl;
import com.DB.DBConnect;
import com.entity.BookDtls;
import com.entity.Cart;

@WebServlet("/Cart")
public class CartServelet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		try {

			int bid = Integer.parseInt(req.getParameter("bid"));
			int uid = Integer.parseInt(req.getParameter("uid"));
			String page = req.getParameter("p");

			BooksDAOImpl dao = new BooksDAOImpl(DBConnect.getConn());
			BookDtls b = dao.getBookByID(bid);

			Cart c = new Cart();
			c.setBid(bid);
			c.setUid(uid);
			c.setAuthorName(b.getAuthor());
			c.setBookName(b.getBookName());
			c.setPrice(b.getPrice());
			c.setTotalPrice(b.getPrice());

			CartDAOImpl cartdao = new CartDAOImpl(DBConnect.getConn());
			boolean f = cartdao.addToCart(c);

			HttpSession session = req.getSession();

			if (f) {
				session.setAttribute("addCart", "Added Book Seccessfully Into Cart...");
				session.setAttribute("cartobj", c);
				resp.sendRedirect(page);
			} else {
				session.setAttribute("failCart", "Something went wrong...");
				resp.sendRedirect("NewBooks.jsp");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}
