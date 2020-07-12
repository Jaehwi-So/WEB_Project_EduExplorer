package vo;

import org.springframework.web.multipart.MultipartFile;

public class AcademyNoticeVO {
	private int a_notice_idx;
	private int a_idx; //학원 게시물 인덱스
	private String a_notice_subject; //제목
	private String a_owner; //작성자
	private String a_notice_content; //게시판  
	private String a_notice_pwd; //게시판 비밀번호
	private String a_notice_ip; //ip
	private String a_notice_regdate; //등록일
	private String a_notice_photo; //사진
	private MultipartFile a_photo; //사진
	private int a_type; //학원소식일때 1
	private int m_idx; //회원번호
	
	
	public String getA_owner() {
		return a_owner;
	}
	public void setA_owner(String a_owner) {
		this.a_owner = a_owner;
	}
	public int getM_idx() {
		return m_idx;
	}
	public void setM_idx(int m_idx) {
		this.m_idx = m_idx;
	}
	public int getA_type() {
		return a_type;
	}
	public void setA_type(int a_type) {
		this.a_type = a_type;
	}
	public int getA_notice_idx() {
		return a_notice_idx;
	}
	public void setA_notice_idx(int a_notice_idx) {
		this.a_notice_idx = a_notice_idx;
	}
	public int getA_idx() {
		return a_idx;
	}
	public void setA_idx(int a_idx) {
		this.a_idx = a_idx;
	}
	public String getA_notice_subject() {
		return a_notice_subject;
	}
	public void setA_notice_subject(String a_notice_subject) {
		this.a_notice_subject = a_notice_subject;
	}
	public String getA_notice_content() {
		return a_notice_content;
	}
	public void setA_notice_content(String a_notice_content) {
		this.a_notice_content = a_notice_content;
	}
	public String getA_notice_pwd() {
		return a_notice_pwd;
	}
	public void setA_notice_pwd(String a_notice_pwd) {
		this.a_notice_pwd = a_notice_pwd;
	}
	public String getA_notice_ip() {
		return a_notice_ip;
	}
	public void setA_notice_ip(String a_notice_ip) {
		this.a_notice_ip = a_notice_ip;
	}
	public String getA_notice_regdate() {
		return a_notice_regdate;
	}
	public void setA_notice_regdate(String a_notice_regdate) {
		this.a_notice_regdate = a_notice_regdate;
	}
	public String getA_notice_photo() {
		return a_notice_photo;
	}
	public void setA_notice_photo(String a_notice_photo) {
		this.a_notice_photo = a_notice_photo;
	}
	public MultipartFile getA_photo() {
		return a_photo;
	}
	public void setA_photo(MultipartFile a_photo) {
		this.a_photo = a_photo;
	}
	
	
}
