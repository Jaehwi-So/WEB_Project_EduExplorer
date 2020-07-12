package vo;

public class Member_LogVO {
	private int log_idx;	//인덱스
	private int m_idx;	//알림대상 m_idx
	private int log_type;	//알림 유형(f_board에 댓글:1, academy의 답글:2)
	private String log_url;	//게시물 혹은 학원 url
	private int log_ck;	//알림대상의 알림 확인 여부
	private String log_regdate;	//알림 생성일
	
	public int getLog_idx() {
		return log_idx;
	}
	public void setLog_idx(int log_idx) {
		this.log_idx = log_idx;
	}
	public int getM_idx() {
		return m_idx;
	}
	public void setM_idx(int m_idx) {
		this.m_idx = m_idx;
	}
	public int getLog_type() {
		return log_type;
	}
	public void setLog_type(int log_type) {
		this.log_type = log_type;
	}
	public String getLog_url() {
		return log_url;
	}
	public void setLog_url(String log_url) {
		this.log_url = log_url;
	}
	public int getLog_ck() {
		return log_ck;
	}
	public void setLog_ck(int log_ck) {
		this.log_ck = log_ck;
	}
	public String getLog_regdate() {
		return log_regdate;
	}
	public void setLog_regdate(String log_regdate) {
		this.log_regdate = log_regdate;
	}
	
	
}
