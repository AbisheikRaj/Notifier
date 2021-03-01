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

import com.example.Notifier.Service.LoginService;
import com.example.Notifier.Service.NoteService;
import com.example.Notifier.model.Client;
import com.example.Notifier.model.Notes;


@WebServlet("/EditProfile")
public class EditProfile extends HttpServlet {
	private LoginService service;
	private NoteService serv;
	private static final long serialVersionUID = 1L;
	static final Logger logger = LogManager.getLogger(EditProfile.class);
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session1 = request.getSession();
		String email = session1.getAttribute("email").toString();
		String firstname = request.getParameter("First_Name");
		String lastname = request.getParameter("Last_Name");
		String country = request.getParameter("Country");
		String mobile = request.getParameter("Mobile_Number");
		String password = request.getParameter("Password");
		logger.info("getting the request data in EditProfile phase");
		service = new LoginService();
		Client obj = new Client();
		
		obj.setFirstname(firstname);
		obj.setLastname(lastname);
		obj.setCountry(country);
		obj.setMobilenumber(mobile);
		obj.setPassword(password);
		logger.info("Entering into the edit phase");
		service.edit(obj, email);
		logger.info("Data are edited in the database");
		serv = new NoteService();
		List<Notes> data = serv.get();
		HttpSession session = request.getSession();
		session.setAttribute("list_of_notes", data);
		session.setAttribute("username", obj.getFirstname() + " " + obj.getLastname());
		response.sendRedirect("/Notifier/views/home.jsp");
	}

}
