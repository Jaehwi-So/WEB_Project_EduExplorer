package vo;

import org.springframework.web.multipart.MultipartFile;

public class AcademyVO{

   private int a_idx;
   private String a_name; //학원명
   private int m_idx; //회원idx
   private String a_owner; //학원점주
   private String a_tel; //학원전화번호
   private String a_content; //내용
   private String a_site; //학원사이트
   private String a_post;	//우편번호
   private String a_addr; //도로명주소
   private String a_addr_detail;
   private String a_image_s; //썸네일사진
   private String a_image_l; //메인사진
   private String a_regdate; //등록일
   private MultipartFile s_photo;//사진
   private MultipartFile l_photo;//사진
   public int getA_idx() {
      return a_idx;
   }
   public void setA_idx(int a_idx) {
      this.a_idx = a_idx;
   }
   public String getA_name() {
      return a_name;
   }
   public void setA_name(String a_name) {
      this.a_name = a_name;
   }
   public int getM_idx() {
      return m_idx;
   }
   public void setM_idx(int m_idx) {
      this.m_idx = m_idx;
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
   public String getA_post() {
	   return a_post;
   }
   public void setA_post(String a_post) {
	   this.a_post = a_post;
   }
   public String getA_addr_detail() {
	   return a_addr_detail;
   }
   public void setA_addr_detail(String a_addr_detail) {
	   this.a_addr_detail = a_addr_detail;
   }    
   public String getA_image_s() {
      return a_image_s;
   }
   public void setA_image_s(String a_image_s) {
      this.a_image_s = a_image_s;
   }
   public String getA_image_l() {
      return a_image_l;
   }
   public void setA_image_l(String a_image_l) {
      this.a_image_l = a_image_l;
   }
   public String getA_regdate() {
      return a_regdate;
   }
   public void setA_regdate(String a_regdate) {
      this.a_regdate = a_regdate;
   } 
	public MultipartFile getS_photo() {
		return s_photo;
	}
	public void setS_photo(MultipartFile s_photo) {
		this.s_photo = s_photo;
	}
	public MultipartFile getL_photo() {
		return l_photo;
	}
	public void setL_photo(MultipartFile l_photo) {
		this.l_photo = l_photo;
	}

}