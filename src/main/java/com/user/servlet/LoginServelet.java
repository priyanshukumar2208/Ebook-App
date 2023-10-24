package com.user.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.UserDAOImpl;
import com.DB.DBConnect;
import com.entity.User;

@WebServlet("/login")
public class LoginServelet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		try {
			UserDAOImpl dao = new UserDAOImpl(DBConnect.getConn());

			HttpSession session = req.getSession();

			String email = req.getParameter("email");
			String password = req.getParameter("passkey");
			if ("admin@pmail.com".equals(email) && "admin".equals(password)) {
				User us = new User(); // This is for Admin access
				us.setName("Admin");
				session.setAttribute("userobj", us);
				resp.sendRedirect("Admin/home.jsp");
			} else {
				// This else is for normal users whose data are present in DB
				User us = dao.login(email, password);

				if (us != null) {
					session.setAttribute("userobj", us);
					resp.sendRedirect("index.jsp");
				} else {
					session.setAttribute("failmsg", "Invalid Email and Password");
					resp.sendRedirect("login.jsp");
				}
				resp.sendRedirect("index.jsp");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}
