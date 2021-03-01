package com.example.Notifier.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

@Entity
public class Notes {
	
	@Id
	private String title;
	private String tag;
	private String start_date;
	private String end_date;
	private String remainder_date;
	private String description;
	
	
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getTag() {
		return tag;
	}
	public void setTag(String tag) {
		this.tag = tag;
	}
	public String getStart_date() {
		return start_date;
	}
	public void setStart_date(String start_date) {
		this.start_date = start_date;
	}
	public String getEnd_date() {
		return end_date;
	}
	public void setEnd_date(String end_date) {
		this.end_date = end_date;
	}
	public String getRemainder_date() {
		return remainder_date;
	}
	public void setRemainder_date(String remainder_date) {
		this.remainder_date = remainder_date;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	
	@Override
	public String toString() {
		return "Notes [ title=" + title + ", tag=" + tag + ", start_date=" + start_date
				+ ", end_date=" + end_date + ", remainder_date=" + remainder_date + ", description=" + description
				+ "]";
	}
}
