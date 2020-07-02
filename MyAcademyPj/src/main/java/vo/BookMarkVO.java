package vo;

public class BookMarkVO {
	private int b_idx;	//즐겨찾기 일련번호
	private int a_idx;	//학원번호
	private int m_idx;	//회원번호
	private String a_name;
	private String a_owner;
	private String a_tel;
	private String a_content;
	private String a_site;
	private String a_addr;
	private String a_image_s;
	public int getB_idx() {
		return b_idx;
	}
	public String getA_name() {
		return a_name;
	}
	public void setA_name(String a_name) {
		this.a_name = a_name;
	}
	public String getA_owner() {
		return a_owner;
	}
	public void setA_owner(String a_owner) {
		this.a_owner = a_owner;
	}
	public String getA_tel() {
		return a_tel;
	}
	public void setA_tel(String a_tel) {
		this.a_tel = a_tel;
	}
	public String getA_content() {
		return a_content;
	}
	public void setA_content(String a_content) {
		this.a_content = a_content;
	}
	public String getA_site() {
		return a_site;
	}
	public void setA_site(String a_site) {
		this.a_site = a_site;
	}
	public String getA_addr() {
		return a_addr;
	}
	public void setA_addr(String a_addr) {
		this.a_addr = a_addr;
	}
	public String getA_image_s() {
		return a_image_s;
	}
	public void setA_image_s(String a_image_s) {
		this.a_image_s = a_image_s;
	}
	public void setB_idx(int b_idx) {
		this.b_idx = b_idx;
	}
	public int getA_idx() {
		return a_idx;
	}
	public void setA_idx(int a_idx) {
		this.a_idx = a_idx;
	}
	public int getM_idx() {
		return m_idx;
	}
	public void setM_idx(int m_idx) {
		this.m_idx = m_idx;
	}
}
