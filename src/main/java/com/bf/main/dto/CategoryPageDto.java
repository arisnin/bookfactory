package com.bf.main.dto;

/**
 * @author 박성호
 * @date 2018. 2. 26.
 * @description
 */
public class CategoryPageDto {
	// Field
	private long book_num; // 책번호
	private String img_path; // 이미지경로
	private String book_name; // 제목
	private int star_point; // 별점 평균
	private int star_count; // 별점 평가수

	private long author_num; // 작가 번호
	private String author_name; // 작가 이름
	private long illur_num; // 일러 번호
	private String illur_name; // 일러 이름
	private long trans_num; // 역자 번호
	private String trans_name; // 역자 이름

	private long pub_num; // 출판사 번호
	private String pub_name; // 출판사 이름
	private int third_cate_num; // 소분류 카테고리 번호
	private String third_cate_name; // 소분류 카테고리 이름
	private String intro; // 책소개

	private double discount; // 할인율1
	private double discount2; // 할인율2
	private String rental_period; //
	private int rental_price; // 가격(대여)
	private int price; // 가격(구매)

	// Constructor
	public CategoryPageDto() {
	}

	public CategoryPageDto(long book_num, String img_path, String book_name, int star_point, int star_count, long author_num, String author_name, long illur_num, String illur_name, long trans_num, String trans_name, long pub_num, String pub_name, int third_cate_num, String third_cate_name, String intro, double discount, double discount2, String rental_period, int rental_price, int price) {
		this.book_num = book_num;
		this.img_path = img_path;
		this.book_name = book_name;
		this.star_point = star_point;
		this.star_count = star_count;
		this.author_num = author_num;
		this.author_name = author_name;
		this.illur_num = illur_num;
		this.illur_name = illur_name;
		this.trans_num = trans_num;
		this.trans_name = trans_name;
		this.pub_num = pub_num;
		this.pub_name = pub_name;
		this.third_cate_num = third_cate_num;
		this.third_cate_name = third_cate_name;
		this.intro = intro;
		this.discount = discount;
		this.discount2 = discount2;
		this.rental_period = rental_period;
		this.rental_price = rental_price;
		this.price = price;
	}

	// Getter & Setter
	public long getBook_num() {
		return book_num;
	}

	public void setBook_num(long book_num) {
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

	public int getStar_point() {
		return star_point;
	}

	public void setStar_point(int star_point) {
		this.star_point = star_point;
	}

	public int getStar_count() {
		return star_count;
	}

	public void setStar_count(int star_count) {
		this.star_count = star_count;
	}

	public long getAuthor_num() {
		return author_num;
	}

	public void setAuthor_num(long author_num) {
		this.author_num = author_num;
	}

	public String getAuthor_name() {
		return author_name;
	}

	public void setAuthor_name(String author_name) {
		this.author_name = author_name;
	}

	public long getIllur_num() {
		return illur_num;
	}

	public void setIllur_num(long illur_num) {
		this.illur_num = illur_num;
	}

	public String getIllur_name() {
		return illur_name;
	}

	public void setIllur_name(String illur_name) {
		this.illur_name = illur_name;
	}

	public long getTrans_num() {
		return trans_num;
	}

	public void setTrans_num(long trans_num) {
		this.trans_num = trans_num;
	}

	public String getTrans_name() {
		return trans_name;
	}

	public void setTrans_name(String trans_name) {
		this.trans_name = trans_name;
	}

	public long getPub_num() {
		return pub_num;
	}

	public void setPub_num(long pub_num) {
		this.pub_num = pub_num;
	}

	public String getPub_name() {
		return pub_name;
	}

	public void setPub_name(String pub_name) {
		this.pub_name = pub_name;
	}

	public int getThird_cate_num() {
		return third_cate_num;
	}

	public void setThird_cate_num(int third_cate_num) {
		this.third_cate_num = third_cate_num;
	}

	public String getThird_cate_name() {
		return third_cate_name;
	}

	public void setThird_cate_name(String third_cate_name) {
		this.third_cate_name = third_cate_name;
	}

	public String getIntro() {
		return intro;
	}

	public void setIntro(String intro) {
		this.intro = intro;
	}

	public double getDiscount() {
		return discount;
	}

	public void setDiscount(double discount) {
		this.discount = discount;
	}

	public double getDiscount2() {
		return discount2;
	}

	public void setDiscount2(double discount2) {
		this.discount2 = discount2;
	}

	public String getRental_period() {
		return rental_period;
	}

	public void setRental_period(String rental_period) {
		this.rental_period = rental_period;
	}

	public int getRental_price() {
		return rental_price;
	}

	public void setRental_price(int rental_price) {
		this.rental_price = rental_price;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	@Override
	public String toString() {
		return "CategoryPageDto [book_num=" + book_num + ", img_path=" + img_path + ", book_name=" + book_name + ", star_point=" + star_point + ", star_count=" + star_count + ", author_num=" + author_num + ", author_name=" + author_name + ", illur_num=" + illur_num + ", illur_name=" + illur_name + ", trans_num=" + trans_num + ", trans_name=" + trans_name + ", pub_num=" + pub_num + ", pub_name=" + pub_name + ", third_cate_num=" + third_cate_num + ", third_cate_name=" + third_cate_name + ", intro=" + intro + ", discount=" + discount + ", discount2=" + discount2 + ", rental_period=" + rental_period + ", rental_price=" + rental_price + ", price=" + price + "]";
	}
}
