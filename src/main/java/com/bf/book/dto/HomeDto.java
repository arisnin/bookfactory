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
	private String thirdCate; 
	private long book_num;
	private long price;
	private String intro;
	private String type;
	private long rental_price;
	private String rental_period;
	private String pub_name;
	private long pub_num;
	
	//별점
	private float star_point;
	private int star_count;
	
	public HomeDto() {}

	public HomeDto(String img_path, String bookName, String authorName, long author_num, String thirdCate,
			long book_num, long price, String intro, String type, long rental_price, String rental_period,
			String pub_name, long pub_num, float star_point, int star_count) {
		this.img_path = img_path;
		this.bookName = bookName;
		this.authorName = authorName;
		this.author_num = author_num;
		this.thirdCate = thirdCate;
		this.book_num = book_num;
		this.price = price;
		this.intro = intro;
		this.type = type;
		this.rental_price = rental_price;
		this.rental_period = rental_period;
		this.pub_name = pub_name;
		this.pub_num = pub_num;
		this.star_point = star_point;
		this.star_count = star_count;
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

	public String getIntro() {
		return intro;
	}

	public void setIntro(String intro) {
		this.intro = intro;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public long getRental_price() {
		return rental_price;
	}

	public void setRental_price(long rental_price) {
		this.rental_price = rental_price;
	}

	public String getRental_period() {
		return rental_period;
	}

	public void setRental_period(String rental_period) {
		this.rental_period = rental_period;
	}

	public String getPub_name() {
		return pub_name;
	}

	public void setPub_name(String pub_name) {
		this.pub_name = pub_name;
	}

	public long getPub_num() {
		return pub_num;
	}

	public void setPub_num(long pub_num) {
		this.pub_num = pub_num;
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

	@Override
	public String toString() {
		return "HomeDto [img_path=" + img_path + ", bookName=" + bookName + ", authorName=" + authorName
				+ ", author_num=" + author_num + ", thirdCate=" + thirdCate + ", book_num=" + book_num + ", price="
				+ price + ", intro=" + intro + ", type=" + type + ", rental_price=" + rental_price + ", rental_period="
				+ rental_period + ", pub_name=" + pub_name + ", pub_num=" + pub_num + ", star_point=" + star_point
				+ ", star_count=" + star_count + "]";
	}
	
}
