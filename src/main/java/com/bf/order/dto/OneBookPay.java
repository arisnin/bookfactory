package com.bf.order.dto;

public class OneBookPay {
	private String img_path;
	private long book_num;
	private long price;
	private long rental_price;
	private String bookName;
	private String authorName;
	private long author_num;

	public OneBookPay() {
	}

	public OneBookPay(String img_path, long book_num, long price, long rental_price, String bookName, String authorName, long author_num) {
		this.img_path = img_path;
		this.book_num = book_num;
		this.price = price;
		this.rental_price = rental_price;
		this.bookName = bookName;
		this.authorName = authorName;
		this.author_num = author_num;
	}

	public String getImg_path() {
		return img_path;
	}

	public void setImg_path(String img_path) {
		this.img_path = img_path;
	}

	public long getBook_num() {
		return book_num;
	}

	public void setBook_num(long book_num) {
		this.book_num = book_num;
	}

	public long getPrice() {
		return price;
	}

	public void setPrice(long price) {
		this.price = price;
	}

	public long getRental_price() {
		return rental_price;
	}

	public void setRental_price(long rental_price) {
		this.rental_price = rental_price;
	}

	public String getBookName() {
		return bookName;
	}

	public void setBookName(String bookName) {
		this.bookName = bookName;
	}

	public String getAuthorName() {
		return authorName;
	}

	public void setAuthorName(String authorName) {
		this.authorName = authorName;
	}

	public long getAuthor_num() {
		return author_num;
	}

	public void setAuthor_num(long author_num) {
		this.author_num = author_num;
	}

	@Override
	public String toString() {
		return "OneBookPay [img_path=" + img_path + ", book_num=" + book_num + ", price=" + price + ", rental_price=" + rental_price + ", bookName=" + bookName + ", authorName=" + authorName + ", author_num=" + author_num + "]";
	}

}
