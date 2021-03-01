package com.example.Notifier.Frontend;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;

import com.example.Notifier.Service.LoginService;
import com.example.Notifier.model.Client;


@WebServlet(description = "This is a Register Servlet", urlPatterns = { "/Register" })
public class Register extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private LoginService service;
	static final Logger logger = LogManager.getLogger(Register.class);
			
			
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		logger.info("Entering into the POST Method");
		String firstname = request.getParameter("First_Name");
		String lastname = request.getParameter("Last_Name");
		String email = request.getParameter("Email");
		String password = request.getParameter("Password");
		String country = request.getParameter("Country");
		String mobilenumber = request.getParameter("Mobile_Number");
		logger.info("Collecting Information");
		Client obj = new Client();
		obj.setFirstname(firstname);
		obj.setLastname(lastname);
		obj.setPassword(password);
		obj.setCountry(country);
		obj.setEmail(email);
		obj.setMobilenumber(mobilenumber);
		service = new LoginService();
		int accept = service.save(obj);
		if (accept == 1) {
			logger.info("Details registered successfully");
			HttpSession session = request.getSession();
			session.setAttribute("message", "Your details has been registered successfully");
			response.sendRedirect("/Notifier/Login.jsp");
		} else {
			logger.warn("Email ID already exists. Error occured");
			HttpSession session = request.getSession();
			session.setAttribute("Error", "Email ID Already Exists"); 
			response.sendRedirect("/Notifier/views/register.jsp");
		}
		
		
	}

}
