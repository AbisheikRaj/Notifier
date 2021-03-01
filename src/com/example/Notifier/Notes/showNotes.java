package com.example.Notifier.Notes;

import java.io.IOException;
import java.util.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.example.Notifier.Service.NoteService;
import com.example.Notifier.model.Notes;


@WebServlet(description = "This is a show notes servlet", urlPatterns = { "/showNotes" })
public class showNotes extends HttpServlet {
	private NoteService service;
	private static final long serialVersionUID = 1L;
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		service = new NoteService();
		List<Notes> data = service.get();
		HttpSession session = request.getSession();
		session.setAttribute("list_of_notes", data);
		response.sendRedirect("/Notifier/views/home.jsp");
	}

}
