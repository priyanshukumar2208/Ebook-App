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

@WebServlet("/updateAddress")
public class UpdateAddressServelet extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			int id = Integer.parseInt(req.getParameter("id"));
			String address = req.getParameter("uaddress");
			String landmark = req.getParameter("ulandmark");
			String city = req.getParameter("ucity");
			String state = req.getParameter("ustate");
			String zipcode = req.getParameter("uzipcode");
			String password=req.getParameter("upassword");

			User us = new User();
			us.setId(id);
			us.setAddress(address);
			us.setLandmark(landmark);
			us.setCity(city);
			us.setState(state);
			us.setPincode(zipcode);
			us.setPassword(password);
			//System.out.println(id);
			HttpSession session = req.getSession();

			UserDAOImpl dao = new UserDAOImpl(DBConnect.getConn());
			boolean f = dao.checkPassword(id, password);
			if (f) {
				boolean uup = dao.updateAddress(us);
				if (uup) {
					session.setAttribute("succmsg", "Address updated successfully...");
					resp.sendRedirect("editAddress.jsp");
				} else {
					session.setAttribute("failmsg", "Something went wrong...");
					resp.sendRedirect("editAddress.jsp");
				}
			} else {
				session.setAttribute("failmsg", "Incorrect Password! ");
				resp.sendRedirect("editAddress.jsp");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
