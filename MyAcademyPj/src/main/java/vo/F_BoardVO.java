package vo;

public class F_BoardVO {
	
	private int f_idx;	//게시글 인덱스
	private int m_idx;	//작성자 인덱스
	private String f_name;	//작성자 이름(별명)
	private String f_subject;	//게시글 제목
	private String f_content;	//게시글 내용
	private String f_pwd;	//게시글 비밀번호(불필요)
	private String f_ip;	//게시글 ip
	private String f_regdate;	//게시글 작성일
	private int f_readhit;	//조회수
	private int f_ref;	//루트 게시글
	private int f_step;	//순서
	private int f_depth;	//깊이
	private int del_info; //삭제 여부
	
	
	public int getDel_info() {
		return del_info;
	}
	public void setDel_info(int del_info) {
		this.del_info = del_info;
	}
	public int getF_idx() {
		return f_idx;
	}
	public void setF_idx(int f_idx) {
		this.f_idx = f_idx;
	}
	public String getF_name() {
		return f_name;
	}
	public void setF_name(String f_name) {
		this.f_name = f_name;
	}
	public String getF_subject() {
		return f_subject;
	}
	public void setF_subject(String f_subject) {
		this.f_subject = f_subject;
	}
	public String getF_pwd() {
		return f_pwd;
	}
	public void setF_pwd(String f_pwd) {
		this.f_pwd = f_pwd;
	}
	public String getF_ip() {
		return f_ip;
	}
	public void setF_ip(String f_ip) {
		this.f_ip = f_ip;
	}
	public String getF_regdate() {
		return f_regdate;
	}
	public void setF_regdate(String f_regdate) {
		this.f_regdate = f_regdate;
	}
	public int getF_readhit() {
		return f_readhit;
	}
	public void setF_readhit(int f_readhit) {
		this.f_readhit = f_readhit;
	}
	public int getF_ref() {
		return f_ref;
	}
	public void setF_ref(int f_ref) {
		this.f_ref = f_ref;
	}
	public int getF_step() {
		return f_step;
	}
	public void setF_step(int f_step) {
		this.f_step = f_step;
	}
	public int getF_depth() {
		return f_depth;
	}
	public void setF_depth(int f_depth) {
		this.f_depth = f_depth;
	}
	public String getF_content() {
		return f_content;
	}
	public void setF_content(String f_content) {
		this.f_content = f_content;
	}
	public int getM_idx() {
		return m_idx;
	}
	public void setM_idx(int m_idx) {
		this.m_idx = m_idx;
	}
	
	
	
	

}
