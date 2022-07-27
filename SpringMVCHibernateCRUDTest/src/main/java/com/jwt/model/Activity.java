package com.jwt.model;

import java.sql.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Activity {


	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int activity_ID;
	private String activity_name;	
	private Date activity_start; 
	private Date activity_end;	
	private String activity_content; 
	
	
	public Integer getActivity_ID() {
		return activity_ID;
	}

	public void setActivity_ID(Integer activity_ID) {
		this.activity_ID = activity_ID;
	}

	public String getActivity_name() {
		return activity_name;
	}

	public void setActivity_name(String activity_name) {
		this.activity_name = activity_name;
	}

	public Date getActivity_start() {
		return activity_start;
	}

	public void setActivity_start(Date activity_start) {
		this.activity_start = activity_start;
	}

	public Date getActivity_end() {
		return activity_end;
	}

	public void setActivity_end(Date activity_end) {
		this.activity_end = activity_end;
	}

	public String getActivity_content() {
		return activity_content;
	}

	public void setActivity_content(String activity_content) {
		this.activity_content = activity_content;
	}
		
}