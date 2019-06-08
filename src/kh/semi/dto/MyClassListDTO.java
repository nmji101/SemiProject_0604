package kh.semi.dto;

public class MyClassListDTO {
	private String info_category;
	private String info_title;
	private String info_date;
	private int info_classid;
	public String getInfo_category() {
		return info_category;
	}
	public void setInfo_category(String info_category) {
		this.info_category = info_category;
	}
	public String getInfo_title() {
		return info_title;
	}
	public void setInfo_title(String info_title) {
		this.info_title = info_title;
	}
	public String getInfo_date() {
		return info_date;
	}
	public void setInfo_date(String info_date) {
		this.info_date = info_date;
	}
	public int getInfo_classid() {
		return info_classid;
	}
	public void setInfo_classid(int info_classid) {
		this.info_classid = info_classid;
	}
	public MyClassListDTO(String info_category, String info_title, String info_date, int info_classid) {
		super();
		this.info_category = info_category;
		this.info_title = info_title;
		this.info_date = info_date;
		this.info_classid = info_classid;
	}
	public MyClassListDTO() {
	}
	
	

	
	
	
}
