package com.bf.main.dto;

/**
 * @author 박성호
 * @date 2018. 2. 28.
 * @description 메인 검색 페이지, 저자 검색 정보 저장 DTO
 */
public class SearchAuthorDto {
	// Field
	private int author_num;
	private String author_name;
	private int count;
	private String book_name;

	// Constructor
	public SearchAuthorDto() {
	}

	public SearchAuthorDto(int author_num, String author_name, int count, String book_name) {
		super();
		this.author_num = author_num;
		this.author_name = author_name;
		this.count = count;
		this.book_name = book_name;
	}

	// Getter&Setter
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

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public String getBook_name() {
		return book_name;
	}

	public void setBook_name(String book_name) {
		this.book_name = book_name;
	}

	@Override
	public String toString() {
		return "SearchAuthorDto [author_num=" + author_num + ", author_name=" + author_name + ", count=" + count + ", book_name=" + book_name + "]";
	}

}
