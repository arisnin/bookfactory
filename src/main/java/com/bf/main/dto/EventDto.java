package com.bf.main.dto;

/**
 * @author choi jung eun
 * @date 2018. 3. 4.
 * @description 이벤트 관련 dto 
 * 
 */
public class EventDto {
	private int num;
	private int f_num;
	private String type;
	private String short_img;
	private String title;
	private String time;
	private String content;
	private String detail;
	
	public EventDto() {}

	public EventDto(int num, int f_num, String type, String short_img, String title, String time, String content,
			String detail) {
		this.num = num;
		this.f_num = f_num;
		this.type = type;
		this.short_img = short_img;
		this.title = title;
		this.time = time;
		this.content = content;
		this.detail = detail;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public int getF_num() {
		return f_num;
	}

	public void setF_num(int f_num) {
		this.f_num = f_num;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getShort_img() {
		return short_img;
	}

	public void setShort_img(String short_img) {
		this.short_img = short_img;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getDetail() {
		return detail;
	}

	public void setDetail(String detail) {
		this.detail = detail;
	}

	@Override
	public String toString() {
		return "EventDto [num=" + num + ", f_num=" + f_num + ", type=" + type + ", short_img=" + short_img + ", title="
				+ title + ", time=" + time + ", content=" + content + ", detail=" + detail + "]";
	}
	
}
