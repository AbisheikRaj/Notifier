package com.example.Notifier.Frontend;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

import com.example.Notifier.Service.LoginService;
import com.example.Notifier.Service.NoteService;
import com.example.Notifier.model.Client;
import com.example.Notifier.model.Notes;


@WebServlet(description = "This is a Login Page Servlet", urlPatterns = { "/Login" })
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private LoginService serv;
	private NoteService service;
	static final Logger logger = LogManager.getLogger(Login.class);
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email = request.getParameter("Email");
		String pass = request.getParameter("Password");
		logger.info("getting the request data from Login page");
		
		serv = new LoginService();
		Client obj = serv.get(email);
		HttpSession session = request.getSession();
		if (obj == null) {
			logger.warn("Invalid email id and password");
			session.setAttribute("Error", "Invalid Credential"); 
			response.sendRedirect("/Notifier/Login.jsp");
		} else {
			if (email.equals(obj.getEmail()) && pass.equals(obj.getPassword())) {
				logger.info("validation successful");
				session.setAttribute("username", obj.getFirstname() + " " + obj.getLastname());
				session.setAttribute("email", obj.getEmail());
				service = new NoteService();
				List<Notes> data = service.get();
				session.setAttribute("list_of_notes", data);
				response.sendRedirect("/Notifier/views/home.jsp");
				logger.info("redirect to the home page");
			} else {
				logger.warn("Invalid credential");
				session.setAttribute("Error", "Invalid Credential"); 
				response.sendRedirect("/Notifier/Login.jsp");
			}
		}
	}

}
