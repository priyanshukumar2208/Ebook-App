package com.user.servlet;

import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.BookOrderDaoimpl;
import com.DAO.CartDAOImpl;
import com.DB.DBConnect;
import com.entity.BookOrder;
import com.entity.Cart;

@WebServlet("/order")
public class OrderServelet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			int id = Integer.parseInt(req.getParameter("id"));
			String name = req.getParameter("oname");
			String email = req.getParameter("oemail");
			String phoneno = req.getParameter("onumber");
			String address = req.getParameter("oaddress");
			String landmark = req.getParameter("olandmark");
			String city = req.getParameter("ocity");
			String state = req.getParameter("ostate");
			String zipcode = req.getParameter("ozipcode");
			String paymentType = req.getParameter("opayment");

			String fullAddress = address + "," + landmark + "," + city + "," + state + "," + zipcode;

			CartDAOImpl dao = new CartDAOImpl(DBConnect.getConn());
			List<Cart> c = dao.getBookByUser(id);

			BookOrderDaoimpl orderdao = new BookOrderDaoimpl(DBConnect.getConn());
			BookOrder o = null;

			ArrayList<BookOrder> orderList = new ArrayList<BookOrder>();
			int i = 0;

			for (Cart cart : c) {

				LocalDateTime currentDateTime = LocalDateTime.now();
				DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd-mm-yyyy-HH-mm-ss");
				String formatedDateTime = currentDateTime.format(formatter);
				Random random = new Random();

				o = new BookOrder();

				o.setOrderId("BOOK-ORD-" + formatedDateTime + "-" + random.nextInt(1000));
				o.setUserName(name);
				o.setEmail(email);
				o.setPhoneNumber(phoneno);
				o.setFullAddress(fullAddress);
				o.setBookName(cart.getBookName());
				o.setAuthor(cart.getAuthorName());
				o.setPrice(cart.getPrice());
				o.setPaymentType(paymentType);
				orderList.add(o);
				i++;
			}
			HttpSession session = req.getSession();

			if ("No_Selection".equals(paymentType)) {
				if (i == 0) {
					resp.sendRedirect("cart.jsp");
					session.setAttribute("failmsg", "Please add items...");
				} else {
					resp.sendRedirect("cart.jsp");
					session.setAttribute("failmsg", "Please select payment method...");
				}
			} else {
				if (i == 0) {
					resp.sendRedirect("cart.jsp");
					session.setAttribute("failmsg", "Please add items...");
				} else {
					boolean f = orderdao.SaveOrder(orderList);
					if (f) {
						dao.deleteCartAfterOrder(id);

						session.setAttribute("succmsg", "Order Placed Successfully...");
						resp.sendRedirect("cart.jsp");
					} else {
						session.setAttribute("failmsg", "Something went wrong...");
						resp.sendRedirect("cart.jsp");
					}
				}
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
