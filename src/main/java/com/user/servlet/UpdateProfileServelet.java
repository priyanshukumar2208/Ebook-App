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

@WebServlet("/updateProfile")
public class UpdateProfileServelet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			int id = Integer.parseInt(req.getParameter("id"));
			String name = req.getParameter("uname");
			String email = req.getParameter("uemail");
			String phoneno = req.getParameter("unumber");
			String password = req.getParameter("upass");

			User us = new User();
			us.setId(id);
			us.setName(name);
			us.setEmail(email);
			us.setPhoneno(phoneno);
			us.setPassword(password);
			//System.out.println(id);
			HttpSession session = req.getSession();

			UserDAOImpl dao = new UserDAOImpl(DBConnect.getConn());
			boolean f = dao.checkPassword(id, password);
			if (f) {
				boolean uup = dao.updateProfile(us);
				if (uup) {
					session.setAttribute("succmsg", "Profile updated successfully...");
					resp.sendRedirect("editProfile.jsp");
				} else {
					session.setAttribute("failmsg", "Something went wrong...");
					resp.sendRedirect("editProfile.jsp");
				}
			} else {
				session.setAttribute("failmsg", "Incorrect Password! ");
				resp.sendRedirect("editProfile.jsp");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
