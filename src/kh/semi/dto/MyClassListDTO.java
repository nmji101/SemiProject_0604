package kh.semi.dto;

public class MyClassListDTO {
	private String info_category;
	private String info_title;
	private String info_explain;
	private String info_date;
	
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
	public String getInfo_explain() {
		return info_explain;
	}
	public void setInfo_explain(String info_explain) {
		this.info_explain = info_explain;
	}
	public String getInfo_date() {
		return info_date;
	}
	public void setInfo_date(String info_date) {
		this.info_date = info_date;
	}
	public MyClassListDTO(String info_category, String info_title, String info_explain, String info_date) {
		this.info_category = info_category;
		this.info_title = info_title;
		this.info_explain = info_explain;
		this.info_date = info_date;
	}
	public MyClassListDTO() {
		super();
	}

	
	
	
}
