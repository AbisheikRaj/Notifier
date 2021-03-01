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

@WebServlet(description = "Adding a notes servlet", urlPatterns = { "/AddNotes" })
public class AddNotes extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private NoteService service;
	private Notes note;
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String title = request.getParameter("title");
		String tag = request.getParameter("tag");
		String start_date = request.getParameter("start_date");
		String end_date = request.getParameter("end_date");
		String remainder_date = request.getParameter("remainder_date");
		String description = request.getParameter("description");
		
		System.out.println(title + " " + tag + " " + start_date);
		note = new Notes();
		note.setTitle(title);
		note.setTag(tag);
		note.setStart_date(start_date);
		note.setEnd_date(end_date);
		note.setRemainder_date(remainder_date);
		note.setDescription(description);
		
		System.out.println(note);
		service = new NoteService();
		service.save(note);
		
		List<Notes> data = service.get();
		HttpSession session = request.getSession();
		session.setAttribute("list_of_notes", data);
		session.setAttribute("success", "Your note is created successfully");
		response.sendRedirect("/Notifier/views/home.jsp");
	}

}
