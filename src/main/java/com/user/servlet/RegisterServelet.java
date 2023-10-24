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

@WebServlet("/register")
public class RegisterServelet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			// getting values from ui in variables
			String name = req.getParameter("fname");
			String email = req.getParameter("emailadd");
			String phoneno = req.getParameter("phno");
			String password = req.getParameter("passkey");
			String checkbox = req.getParameter("check");

			// System.out.print(name + "" + email + "" + phoneno + "" + password + "" +
			// checkbox);

			// setting values we got from ui in variables
			User us = new User();
			us.setName(name);
			us.setEmail(email);
			us.setPhoneno(phoneno);
			us.setPassword(password);

			HttpSession session = req.getSession();

			if (checkbox != null) {
				UserDAOImpl dao = new UserDAOImpl(DBConnect.getConn());

				boolean checkmail = dao.checkUserExist(email);
				if (checkmail) {

					boolean f = dao.userRegister(us);

					if (f) {
						// System.out.println("User registered successfully...");
						session.setAttribute("succmsg", "User registered successfully...");
						resp.sendRedirect("register.jsp");
					} else {
						// System.out.println("Something went wrong...");
						session.setAttribute("failmsg", "Something went wrong...");
						resp.sendRedirect("register.jsp");
					}
				} else {
					session.setAttribute("failmsg", "Email already registered...");
					resp.sendRedirect("register.jsp");
				}
			} else {
				// System.out.println("Please click on Agree terms & conditions...");
				session.setAttribute("failmsg", "Please click on Agree terms & conditions...");
				resp.sendRedirect("register.jsp");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
