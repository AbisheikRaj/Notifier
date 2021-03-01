package com.example.Notifier.Frontend;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.apache.log4j.LogManager;

import com.example.Notifier.Service.LoginService;
import com.example.Notifier.model.Client;


@WebServlet("/edit_validation")
public class edit_validation extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private LoginService service;
	static final Logger logger = LogManager.getLogger(edit_validation.class);
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String email = session.getAttribute("email").toString();
		String password = request.getParameter("Password");
		service = new LoginService();
		Client obj = service.get(email);
		logger.info("getting the data in edit_validation phase");
		if (password.equals(obj.getPassword())) {
			logger.info("password matched");
			response.sendRedirect("/Notifier/views/EditProfile.jsp");
		} else {
			logger.warn("password does not match");
			logger.warn("returning to home page");
			HttpSession sess = request.getSession();
			sess.setAttribute("validation_message", "Invalid Password");
			response.sendRedirect("/Notifier/views/home.jsp");
		}
		
	}

}
