package com.five.myacademy.vo;

public class AddressVO {
	private int addr_id;	//우편번호
	private String addr_city;	//시/도	
	private String addr_region;	//군/구
	public int getAddr_id() {
		return addr_id;
	}
	public void setAddr_id(int addr_id) {
		this.addr_id = addr_id;
	}
	public String getAddr_city() {
		return addr_city;
	}
	public void setAddr_city(String addr_city) {
		this.addr_city = addr_city;
	}
	public String getAddr_region() {
		return addr_region;
	}
	public void setAddr_region(String addr_region) {
		this.addr_region = addr_region;
	}

}
