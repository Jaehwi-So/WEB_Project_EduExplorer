package vo;

public class F_BoardVO {
	
	private int f_idx;
	private int m_idx;
	private String f_name;
	private String f_subject;
	private String f_content;
	private String f_pwd;
	private String f_ip;
	private String f_regdate;
	private int f_readhit;
	private int f_ref;
	private int f_step;
	private int f_depth;
	private int del_info; //댓글 삭제 여부
	
	
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
