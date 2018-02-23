package com.bf.book.dto;

/**
 * @author choi jung eun
 * @date 2018. 2. 18.
 * @description 홈 메인페이지에서 오늘의 추천도서에 필요한 dto
 * 
 *              원래질의문 잠시 리뷰문제로 바꿔서씀 SELECT b.img_path, A.NAME "authorName",
 *              b.NAME "bookName", t.NAME "thirdCate", r.star_point FROM bookm
 *              b, author A, book_category c, third_cate t, review r WHERE
 *              b.author_num = A.num AND b.book_num=c.book_num AND
 *              c.cate3_num=t.num and b.book_num=r.book_num and b.book_num>=700
 *              and b.book_num<=704;
 */
public class HomeDto {
	private String img_path;
	private String bookName;
	private String authorName;
	private long author_num;
	private String thirdCate; // 리뷰작성된거끌어와야함 잠시 null처리
	private int star_point;
	private long book_num;
	private long price;
	private String type;
	private long rental_price;
	private String rental_period;

	public String getRental_period() {
		return rental_period;
	}

	public void setRental_period(String rental_period) {
		this.rental_period = rental_period;
	}

	public long getRental_price() {
		return rental_price;
	}

	public void setRental_price(long rental_price) {
		this.rental_price = rental_price;
	}

	public HomeDto() {
	}

	public HomeDto(String img_path, String bookName, String authorName, long author_num, String thirdCate,
			int star_point, long book_num, long price, String type, long rental_price) {
		this.img_path = img_path;
		this.bookName = bookName;
		this.authorName = authorName;
		this.author_num = author_num;
		this.thirdCate = thirdCate;
		this.star_point = star_point;
		this.book_num = book_num;
		this.price = price;
		this.type = type;
		this.rental_price = rental_price;
	}

	public String getImg_path() {
		return img_path;
	}

	public void setImg_path(String img_path) {
		this.img_path = img_path;
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

	public String getThirdCate() {
		return thirdCate;
	}

	public void setThirdCate(String thirdCate) {
		this.thirdCate = thirdCate;
	}

	public int getStar_point() {
		return star_point;
	}

	public void setStar_point(int star_point) {
		this.star_point = star_point;
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

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	@Override
	public String toString() {
		return "HomeDto [img_path=" + img_path + ", bookName=" + bookName + ", authorName=" + authorName
				+ ", author_num=" + author_num + ", thirdCate=" + thirdCate + ", star_point=" + star_point
				+ ", book_num=" + book_num + ", price=" + price + ", type=" + type + ", rental_price=" + rental_price
				+ ", rental_period="+rental_period+"]";
	}

}
