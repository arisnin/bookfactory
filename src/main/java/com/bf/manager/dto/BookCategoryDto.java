package com.bf.manager.dto;

public class BookCategoryDto {

	private int num;
	private int book_num;
	private int cate1_num;
	private int cate2_num;
	private int cate3_num;

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public int getBook_num() {
		return book_num;
	}

	public void setBook_num(int book_num) {
		this.book_num = book_num;
	}

	public int getCate1_num() {
		return cate1_num;
	}

	public void setCate1_num(int cate1_num) {
		this.cate1_num = cate1_num;
	}

	public int getCate2_num() {
		return cate2_num;
	}

	public void setCate2_num(int cate2_num) {
		this.cate2_num = cate2_num;
	}

	public int getCate3_num() {
		return cate3_num;
	}

	public void setCate3_num(int cate3_num) {
		this.cate3_num = cate3_num;
	}

	@Override
	public String toString() {
		return "BookCategory [num=" + num + ", book_num=" + book_num + ", cate1_num=" + cate1_num + ", cate2_num="
				+ cate2_num + ", cate3_num=" + cate3_num + "]";
	}

}
