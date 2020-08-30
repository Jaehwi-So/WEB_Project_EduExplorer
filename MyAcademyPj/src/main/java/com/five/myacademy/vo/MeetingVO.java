package com.five.myacademy.vo;

import org.springframework.web.multipart.MultipartFile;

public class MeetingVO {
	private int meeting_idx;
	private int m_idx;
	private String meeting_subject;
	private String meeting_content;
	private String meeting_regdate;
	private String meeting_alam;
	private String meeting_photo;
	private MultipartFile m_photo;
	private String meeting_writer;
	private int a_idx;
	

	public String getMeeting_writer() {
		return meeting_writer;
	}

	public void setMeeting_writer(String meeting_writer) {
		this.meeting_writer = meeting_writer;
	}

	public int getMeeting_idx() {
		return meeting_idx;
	}

	public void setMeeting_idx(int meeting_idx) {
		this.meeting_idx = meeting_idx;
	}

	public int getM_idx() {
		return m_idx;
	}

	public void setM_idx(int m_idx) {
		this.m_idx = m_idx;
	}

	public String getMeeting_subject() {
		return meeting_subject;
	}

	public void setMeeting_subject(String meeting_subject) {
		this.meeting_subject = meeting_subject;
	}

	public String getMeeting_content() {
		return meeting_content;
	}

	public void setMeeting_content(String meeting_content) {
		this.meeting_content = meeting_content;
	}

	public String getMeeting_regdate() {
		return meeting_regdate;
	}

	public void setMeeting_regdate(String meeting_regdate) {
		this.meeting_regdate = meeting_regdate;
	}

	public String getMeeting_alam() {
		return meeting_alam;
	}

	public void setMeeting_alam(String meeting_alam) {
		this.meeting_alam = meeting_alam;
	}

	public String getMeeting_photo() {
		return meeting_photo;
	}

	public void setMeeting_photo(String meeting_photo) {
		this.meeting_photo = meeting_photo;
	}

	public MultipartFile getM_photo() {
		return m_photo;
	}

	public void setM_photo(MultipartFile m_photo) {
		this.m_photo = m_photo;
	}

	public int getA_idx() {
		return a_idx;
	}

	public void setA_idx(int a_idx) {
		this.a_idx = a_idx;
	}
	

}
