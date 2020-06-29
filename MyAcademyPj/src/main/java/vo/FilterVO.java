package vo;

public class FilterVO {
	private String f_city;	//시,도 필터
	private String f_region;	//행정구역 필터
	private String f_addr;	//필터처리할 전체주소
	private String f_area;	//분야별 필터
	private int start;	//페이징 처리 시작
	private int end;	//페이징 처리 끝
	
	public String getF_area() {
		return f_area;
	}
	public void setF_area(String f_area) {
		this.f_area = f_area;
	}
	public String getF_city() {
		return f_city;
	}
	public void setF_city(String f_city) {
		this.f_city = f_city;
	}
	public String getF_region() {
		return f_region;
	}
	public void setF_region(String f_region) {
		this.f_region = f_region;
	}
	public String getF_addr() {
		return f_addr;
	}
	public void setF_addr(String f_addr) {
		this.f_addr = f_addr;
	}
	public int getStart() {
		return start;
	}
	public void setStart(int start) {
		this.start = start;
	}
	public int getEnd() {
		return end;
	}
	public void setEnd(int end) {
		this.end = end;
	}
	

}
