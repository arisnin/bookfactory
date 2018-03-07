package com.bf.manager.dto;

/**
 * @이름: 염현우
 * @날짜: 2018. 3. 7.
 * @설명: 책검색창 
 */
public class BookSearchDto {
	private int book_num;
	private String book_name;
	private int author_num;
	private String author_name;
	private int pub_num;
	private String pub_name;

	public int getBook_num() {
		return book_num;
	}

	public void setBook_num(int book_num) {
		this.book_num = book_num;
	}

	public String getBook_name() {
		return book_name;
	}

	public void setBook_name(String book_name) {
		this.book_name = book_name;
	}

	public int getAuthor_num() {
		return author_num;
	}

	public void setAuthor_num(int author_num) {
		this.author_num = author_num;
	}

	public String getAuthor_name() {
		return author_name;
	}

	public void setAuthor_name(String author_name) {
		this.author_name = author_name;
	}

	public int getPub_num() {
		return pub_num;
	}

	public void setPub_num(int pub_num) {
		this.pub_num = pub_num;
	}

	public String getPub_name() {
		return pub_name;
	}

	public void setPub_name(String pub_name) {
		this.pub_name = pub_name;
	}

	@Override
	public String toString() {
		return "BookSearchDto [book_num=" + book_num + ", book_name=" + book_name + ", author_num=" + author_num
				+ ", author_name=" + author_name + ", pub_num=" + pub_num + ", pub_name=" + pub_name + "]";
	}

}
