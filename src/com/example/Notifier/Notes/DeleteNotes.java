package com.example.Notifier.Notes;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.example.Notifier.Service.NoteService;
import com.example.Notifier.model.Notes;


@WebServlet("/DeleteNotes")
public class DeleteNotes extends HttpServlet {
	private NoteService service;
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String title = request.getParameter("title");
		service = new NoteService();
		service.delete(title);
		List<Notes> data = service.get();
		HttpSession session = request.getSession();
		session.setAttribute("list_of_notes", data);
		response.sendRedirect("/Notifier/views/home.jsp");
	}

}
