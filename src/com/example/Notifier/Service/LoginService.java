package com.example.Notifier.Service;

import javax.servlet.http.HttpSession;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

import com.example.Notifier.model.Client;
import com.example.Notifier.model.Notes;

public class LoginService {
	static final Logger logger = LogManager.getLogger(LoginService.class);
	Configuration cfg = new Configuration().configure().addAnnotatedClass(Client.class);
	SessionFactory sf = cfg.buildSessionFactory();
	Session s = sf.openSession();
	
	public int save(Client obj) {
		try {
			Transaction tx = s.beginTransaction();
			s.save(obj);
			logger.info("User data are stored Successfully");
			tx.commit();
			return 1;
		} catch(Exception e) {
			logger.warn("Email id already exist");
			return 0;
		}
	}
	
	public Client get(String email) {
		try {
			Transaction tx = s.beginTransaction();
			Client c = (Client) s.get(Client.class, email);
			logger.info("getting the user data");
			tx.commit();
			return c;
		} catch(Exception e) {
			logger.warn("Email id does not exist");
			return null;
		}
	}
	
	public void edit(Client obj, String email) {
		Transaction tx = s.beginTransaction();
		Client data = (Client) s.get(Client.class, email);
		logger.info("getting the data");
		tx.commit();
		data.setFirstname(obj.getFirstname());
		data.setLastname(obj.getLastname());
		data.setCountry(obj.getCountry());
		data.setMobilenumber(obj.getMobilenumber());
		data.setPassword(obj.getPassword());
		Transaction t = s.beginTransaction();
		s.update(data);
		logger.info("Data updated");
		t.commit();
	}
	

}
