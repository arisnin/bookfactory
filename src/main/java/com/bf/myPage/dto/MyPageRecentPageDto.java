package com.bf.myPage.dto;

public class MyPageRecentPageDto {
	private int book_num;
	private String img_path;
	private String book_name;
	private String author_name;
	private float star_point;
	private int star_count;
	private int author_num;
	
	public MyPageRecentPageDto(){}

	public MyPageRecentPageDto(int book_num, String img_path, String book_name,
			String author_name, float star_point, int star_count, int author_num) {
		this.book_num = book_num;
		this.img_path = img_path;
		this.book_name = book_name;
		this.author_name = author_name;
		this.star_point = star_point;
		this.star_count = star_count;
		this.author_num = author_num;
	}

	public int getBook_num() {
		return book_num;
	}

	public void setBook_num(int book_num) {
		this.book_num = book_num;
	}

	public String getImg_path() {
		return img_path;
	}

	public void setImg_path(String img_path) {
		this.img_path = img_path;
	}

	public String getBook_name() {
		return book_name;
	}

	public void setBook_name(String book_name) {
		this.book_name = book_name;
	}

	public String getAuthor_name() {
		return author_name;
	}

	public void setAuthor_name(String author_name) {
		this.author_name = author_name;
	}

	public float getStar_point() {
		return star_point;
	}

	public void setStar_point(float star_point) {
		this.star_point = star_point;
	}

	public int getStar_count() {
		return star_count;
	}

	public void setStar_count(int star_count) {
		this.star_count = star_count;
	}

	public int getAuthor_num() {
		return author_num;
	}

	public void setAuthor_num(int author_num) {
		this.author_num = author_num;
	}

	@Override
	public String toString() {
		return "MyPageRecentPageDto [book_num=" + book_num + ", img_path="
				+ img_path + ", book_name=" + book_name + ", author_name="
				+ author_name + ", star_point=" + star_point + ", star_count="
				+ star_count + ", author_num=" + author_num + "]";
	}
}
