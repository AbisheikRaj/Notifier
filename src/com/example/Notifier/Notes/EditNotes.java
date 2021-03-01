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


@WebServlet("/EditNotes")
public class EditNotes extends HttpServlet {
	private NoteService service;
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String title = request.getParameter("title");
		String tag = request.getParameter("tag");
		String start_date = request.getParameter("start_date");
		String end_date = request.getParameter("end_date");
		String remainder_date = request.getParameter("remainder_date");
		String description = request.getParameter("description");
		service = new NoteService();
		Notes note = new Notes();
		note.setTitle(title);
		note.setTag(tag);
		note.setStart_date(start_date);
		note.setEnd_date(end_date);
		note.setRemainder_date(remainder_date);
		note.setDescription(description);
		service.edit(note);
		
		List<Notes> data = service.get();
		HttpSession session = request.getSession();
		session.setAttribute("list_of_notes", data);
		response.sendRedirect("/Notifier/views/home.jsp");
	}

}
