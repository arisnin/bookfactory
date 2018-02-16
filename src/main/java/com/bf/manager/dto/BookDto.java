package com.bf.manager.dto;

public class BookDto {
	private int book_num; // --
	private String name; // --
	private String write_date; // --
	private int pub_num; // --
	private int author_num; // --
	private int illustrator_num; // --
	private int translator_num; // --
	private int price; //
	private String support; // 지원기기 --
	private String img_path; // --
	private String file_path; // 없음--
	private String file_name; // 없음--
	private long file_size; // 0--
	private int preference; // 선호개수 0--
	private int series_num; //
	private String sub_title; // --
	private double discount; // --
	private double discount2; // --
	private String type; // 종이책 전자책
	private String intro; // 책소개
	private String pub_intro; // 출판사평
	private String rental_period;
	private int rental_price;

	public int getBook_num() {
		return book_num;
	}

	public void setBook_num(int book_num) {
		this.book_num = book_num;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getWrite_date() {
		return write_date;
	}

	public void setWrite_date(String write_date) {
		this.write_date = write_date;
	}

	public int getPub_num() {
		return pub_num;
	}

	public void setPub_num(int pub_num) {
		this.pub_num = pub_num;
	}

	public int getAuthor_num() {
		return author_num;
	}

	public void setAuthor_num(int author_num) {
		this.author_num = author_num;
	}

	public int getIllustrator_num() {
		return illustrator_num;
	}

	public void setIllustrator_num(int illustrator_num) {
		this.illustrator_num = illustrator_num;
	}

	public int getTranslator_num() {
		return translator_num;
	}

	public void setTranslator_num(int translator_num) {
		this.translator_num = translator_num;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getSupport() {
		return support;
	}

	public void setSupport(String support) {
		this.support = support;
	}

	public String getImg_path() {
		return img_path;
	}

	public void setImg_path(String img_path) {
		this.img_path = img_path;
	}

	public String getFile_path() {
		return file_path;
	}

	public void setFile_path(String file_path) {
		this.file_path = file_path;
	}

	public String getFile_name() {
		return file_name;
	}

	public void setFile_name(String file_name) {
		this.file_name = file_name;
	}

	public long getFile_size() {
		return file_size;
	}

	public void setFile_size(long file_size) {
		this.file_size = file_size;
	}

	public int getPreference() {
		return preference;
	}

	public void setPreference(int preference) {
		this.preference = preference;
	}

	public int getSeries_num() {
		return series_num;
	}

	public void setSeries_num(int series_num) {
		this.series_num = series_num;
	}

	public String getSub_title() {
		return sub_title;
	}

	public void setSub_title(String sub_title) {
		this.sub_title = sub_title;
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

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getIntro() {
		return intro;
	}

	public void setIntro(String intro) {
		this.intro = intro;
	}

	public String getPub_intro() {
		return pub_intro;
	}

	public void setPub_intro(String pub_intro) {
		this.pub_intro = pub_intro;
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

	@Override
	public String toString() {
		return "BookDto [book_num=" + book_num + ", name=" + name + ", write_date=" + write_date + ", pub_num="
				+ pub_num + ", author_num=" + author_num + ", illustrator_num=" + illustrator_num + ", translator_num="
				+ translator_num + ", price=" + price + ", support=" + support + ", img_path=" + img_path
				+ ", file_path=" + file_path + ", file_name=" + file_name + ", file_size=" + file_size + ", preference="
				+ preference + ", series_num=" + series_num + ", sub_title=" + sub_title + ", discount=" + discount
				+ ", discount2=" + discount2 + ", type=" + type + ", intro=" + intro + ", pub_intro=" + pub_intro
				+ ", rental_period=" + rental_period + ", rental_price=" + rental_price + "]";
	}

}
