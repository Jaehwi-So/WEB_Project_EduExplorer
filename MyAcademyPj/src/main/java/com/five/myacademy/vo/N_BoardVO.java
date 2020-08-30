package com.five.myacademy.vo;

public class N_BoardVO {
	
	private int n_idx;
	private int m_idx;
	private String n_name;
	private String n_subject;
	private String n_content;
	private String n_pwd;
	private String n_ip;
	private String n_regdate;
	private int n_readhit;
	private int del_info; //댓글 삭제 여부
	
	
	public int getDel_info() {
		return del_info;
	}
	public void setDel_info(int del_info) {
		this.del_info = del_info;
	}
	public int getN_idx() {
		return n_idx;
	}
	public void setN_idx(int n_idx) {
		this.n_idx = n_idx;
	}
	public String getN_name() {
		return n_name;
	}
	public void setN_name(String n_name) {
		this.n_name = n_name;
	}
	public String getN_subject() {
		return n_subject;
	}
	public void setN_subject(String n_subject) {
		this.n_subject = n_subject;
	}
	public String getN_pwd() {
		return n_pwd;
	}
	public void setN_pwd(String n_pwd) {
		this.n_pwd = n_pwd;
	}
	public String getN_ip() {
		return n_ip;
	}
	public void setN_ip(String n_ip) {
		this.n_ip = n_ip;
	}
	public String getN_regdate() {
		return n_regdate;
	}
	public void setN_regdate(String n_regdate) {
		this.n_regdate = n_regdate;
	}
	public int getN_readhit() {
		return n_readhit;
	}
	public void setN_readhit(int n_readhit) {
		this.n_readhit = n_readhit;
	}
	public String getN_content() {
		return n_content;
	}
	public void setN_content(String n_content) {
		this.n_content = n_content;
	}
	public int getM_idx() {
		return m_idx;
	}
	public void setM_idx(int m_idx) {
		this.m_idx = m_idx;
	}
	
	
	
	
}
