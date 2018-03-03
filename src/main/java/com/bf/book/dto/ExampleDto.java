package com.bf.book.dto;

/**
 * @author choi jung eun
 * @date 2018. 3. 3.
 * @description 미리보기에 사용되는 dto
 * 
 */
public class ExampleDto {
	private int num;
	private int f_num;
	private String img;
	private String intro;
	private String list;
	
	public ExampleDto() {}

	public ExampleDto(int num, int f_num, String img, String intro, String list) {
		this.num = num;
		this.f_num = f_num;
		this.img = img;
		this.intro = intro;
		this.list = list;
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

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}

	public String getIntro() {
		return intro;
	}

	public void setIntro(String intro) {
		this.intro = intro;
	}

	public String getList() {
		return list;
	}

	public void setList(String list) {
		this.list = list;
	}

	@Override
	public String toString() {
		return "ExampleDto [num=" + num + ", f_num=" + f_num + ", img=" + img + ", intro=" + intro + ", list=" + list
				+ "]";
	}
	
}