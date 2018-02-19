package com.bf.book.dto;

/**
 * @author choi jung eun
 * @date 2018. 2. 18.
 * @description  신간보기 dto 
 */

public class NewBookDto {
	private long book_num;
	private String img_path;
	private String book_name;
	private int star_point;	//별점
	
	private long author_num;
	private String author_name;	//작가, 일러, 번역 이름
	private long illur_num;
	private String illur_name;
	private long trans_num;
	private String trans_name;
	
	private long pub_num;
	private String publisher_name;	//출판사이름
	private String third_cate_name;
	private String intro;
	private double discount;
	private double discount2;
	private long price;
	private long rental_price;
	
	public NewBookDto() {}

	public NewBookDto(long book_num, String img_path, String book_name, int star_point, long author_num,
			String author_name, long illur_num, String illur_name, long trans_num, String trans_name, long pub_num,
			String publisher_name, String third_cate_name, String intro, double discount, double discount2, long price,
			long rental_price) {
		this.book_num = book_num;
		this.img_path = img_path;
		this.book_name = book_name;
		this.star_point = star_point;
		this.author_num = author_num;
		this.author_name = author_name;
		this.illur_num = illur_num;
		this.illur_name = illur_name;
		this.trans_num = trans_num;
		this.trans_name = trans_name;
		this.pub_num = pub_num;
		this.publisher_name = publisher_name;
		this.third_cate_name = third_cate_name;
		this.intro = intro;
		this.discount = discount;
		this.discount2 = discount2;
		this.price = price;
		this.rental_price = rental_price;
	}

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

	public String getPublisher_name() {
		return publisher_name;
	}

	public void setPublisher_name(String publisher_name) {
		this.publisher_name = publisher_name;
	}

	public String getThird_cate_name() {
		return third_cate_name;
	}

	public void setThird_cate_name(String third_cate_name) {
		this.third_cate_name = third_cate_name;
	}

	public String getIntro() {
		if(intro.indexOf("<br>")>=0) {
			intro=intro.substring(intro.indexOf("<br>"));
		}
		
		return intro.replaceAll("<br>", "");
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

	@Override
	public String toString() {
		return "NewBookDto [book_num=" + book_num + ", img_path=" + img_path + ", book_name=" + book_name
				+ ", star_point=" + star_point + ", author_num=" + author_num + ", author_name=" + author_name
				+ ", illur_num=" + illur_num + ", illur_name=" + illur_name + ", trans_num=" + trans_num
				+ ", trans_name=" + trans_name + ", pub_num=" + pub_num + ", publisher_name=" + publisher_name
				+ ", third_cate_name=" + third_cate_name + ", intro=" + intro + ", discount=" + discount
				+ ", discount2=" + discount2 + ", price=" + price + ", rental_price=" + rental_price + "]";
	}
	
}
