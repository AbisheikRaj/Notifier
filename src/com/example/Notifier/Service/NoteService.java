package com.example.Notifier.Service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

import com.example.Notifier.model.Notes;

public class NoteService {	
	static final Logger logger = LogManager.getLogger(NoteService.class);
	
	Configuration cfg = new Configuration().configure().addAnnotatedClass(Notes.class);
	SessionFactory sf = cfg.buildSessionFactory();
	Session s = sf.openSession();
	
	public void save(Notes obj) {
		Transaction t = s.beginTransaction();
		s.save(obj);
		logger.info("Notes are stored in the database");
		t.commit();
	}
	
	public List<Notes> get() {
		logger.info("getting the notes from the database");
		return s.createQuery("FROM Notes").list();	
	}
	
	public void edit(Notes obj) {
		Transaction tx = s.beginTransaction();
		Notes data = (Notes) s.get(Notes.class, obj.getTitle());
		tx.commit();
		data.setTitle(obj.getTitle());
		data.setTag(obj.getTag());
		data.setStart_date(obj.getStart_date());
		data.setEnd_date(obj.getEnd_date());
		data.setRemainder_date(obj.getRemainder_date());
		data.setDescription(obj.getDescription());
		Transaction t = s.beginTransaction();
		s.update(data);
		logger.info("notes are updated");
		t.commit();
	}
	
	public void delete(String title) {
		Transaction tx = s.beginTransaction();
		Notes data = (Notes) s.get(Notes.class, title);
		tx.commit();
		Transaction t = s.beginTransaction();
		s.remove(data);
		t.commit();
	}
	
}