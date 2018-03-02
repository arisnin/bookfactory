package com.bf.book.dto;

/**
 * @author 최정은
 * @date 2018. 2. 21.
 * @description 
 * 
 */
public class DetailDto {
	//책 카테고리 따로 dto 뺌. 중복인애들있어서 이리만들음
	private int second_num_1;
	private int second_num_2;
	private int second_num_3;
	private String second_name_1;
	private String second_name_2;
	private String second_name_3;
	
	private int third_num_1;
	private int third_num_2;
	private int third_num_3;
	private String third_name_1;
	private String third_name_2;
	private String third_name_3;
	
	//책 상단 정보
	private long book_num;
	private String book_name;
	private String book_sub_title;
	private String write_date;
	
	private long pub_num;
	private String pub_name;
	private long author_num;
	private String author_name;
	private long illu_num;
	private String illu_name;
	private long trans_num;
	private String trans_name;
	
	private double discount;
	private double discount2;
	private long book_price;
	private long rental_price;
	private String rental_period;
	
	//연재관련 테이블 번호
	private long preference;
	private long series_num;
	private String support;
	private String img_path;
	
	//파일관련
	private String file_path;
	private String file_name;
	private long file_size;
	
	private String type;
	private String intro;
	private String pub_intro;
	
	//이벤트 정보는 어떻게 들어갈지모름
	
	//별점정보
	private float star_point;
	private int star_count;
	
	//저자프로필정보는 따로 dto 뺀다.
	public DetailDto() {}

	public DetailDto(int second_num_1, int second_num_2, int second_num_3, String second_name_1, String second_name_2,
			String second_name_3, int third_num_1, int third_num_2, int third_num_3, String third_name_1,
			String third_name_2, String third_name_3, long book_num, String book_name, String book_sub_title,
			String write_date, long pub_num, String pub_name, long author_num, String author_name, long illu_num,
			String illu_name, long trans_num, String trans_name, double discount, double discount2, long book_price,
			long rental_price, String rental_period, long preference, long series_num, String support, String img_path,
			String file_path, String file_name, long file_size, String type, String intro, String pub_intro,
			float star_point, int star_count) {
		this.second_num_1 = second_num_1;
		this.second_num_2 = second_num_2;
		this.second_num_3 = second_num_3;
		this.second_name_1 = second_name_1;
		this.second_name_2 = second_name_2;
		this.second_name_3 = second_name_3;
		this.third_num_1 = third_num_1;
		this.third_num_2 = third_num_2;
		this.third_num_3 = third_num_3;
		this.third_name_1 = third_name_1;
		this.third_name_2 = third_name_2;
		this.third_name_3 = third_name_3;
		this.book_num = book_num;
		this.book_name = book_name;
		this.book_sub_title = book_sub_title;
		this.write_date = write_date;
		this.pub_num = pub_num;
		this.pub_name = pub_name;
		this.author_num = author_num;
		this.author_name = author_name;
		this.illu_num = illu_num;
		this.illu_name = illu_name;
		this.trans_num = trans_num;
		this.trans_name = trans_name;
		this.discount = discount;
		this.discount2 = discount2;
		this.book_price = book_price;
		this.rental_price = rental_price;
		this.rental_period = rental_period;
		this.preference = preference;
		this.series_num = series_num;
		this.support = support;
		this.img_path = img_path;
		this.file_path = file_path;
		this.file_name = file_name;
		this.file_size = file_size;
		this.type = type;
		this.intro = intro;
		this.pub_intro = pub_intro;
		this.star_point = star_point;
		this.star_count = star_count;
	}

	public int getSecond_num_1() {
		return second_num_1;
	}

	public void setSecond_num_1(int second_num_1) {
		this.second_num_1 = second_num_1;
	}

	public int getSecond_num_2() {
		return second_num_2;
	}

	public void setSecond_num_2(int second_num_2) {
		this.second_num_2 = second_num_2;
	}

	public int getSecond_num_3() {
		return second_num_3;
	}

	public void setSecond_num_3(int second_num_3) {
		this.second_num_3 = second_num_3;
	}

	public String getSecond_name_1() {
		return second_name_1;
	}

	public void setSecond_name_1(String second_name_1) {
		this.second_name_1 = second_name_1;
	}

	public String getSecond_name_2() {
		return second_name_2;
	}

	public void setSecond_name_2(String second_name_2) {
		this.second_name_2 = second_name_2;
	}

	public String getSecond_name_3() {
		return second_name_3;
	}

	public void setSecond_name_3(String second_name_3) {
		this.second_name_3 = second_name_3;
	}

	public int getThird_num_1() {
		return third_num_1;
	}

	public void setThird_num_1(int third_num_1) {
		this.third_num_1 = third_num_1;
	}

	public int getThird_num_2() {
		return third_num_2;
	}

	public void setThird_num_2(int third_num_2) {
		this.third_num_2 = third_num_2;
	}

	public int getThird_num_3() {
		return third_num_3;
	}

	public void setThird_num_3(int third_num_3) {
		this.third_num_3 = third_num_3;
	}

	public String getThird_name_1() {
		return third_name_1;
	}

	public void setThird_name_1(String third_name_1) {
		this.third_name_1 = third_name_1;
	}

	public String getThird_name_2() {
		return third_name_2;
	}

	public void setThird_name_2(String third_name_2) {
		this.third_name_2 = third_name_2;
	}

	public String getThird_name_3() {
		return third_name_3;
	}

	public void setThird_name_3(String third_name_3) {
		this.third_name_3 = third_name_3;
	}

	public long getBook_num() {
		return book_num;
	}

	public void setBook_num(long book_num) {
		this.book_num = book_num;
	}

	public String getBook_name() {
		return book_name;
	}

	public void setBook_name(String book_name) {
		this.book_name = book_name;
	}

	public String getBook_sub_title() {
		return book_sub_title;
	}

	public void setBook_sub_title(String book_sub_title) {
		this.book_sub_title = book_sub_title;
	}

	public String getWrite_date() {
		return write_date;
	}

	public void setWrite_date(String write_date) {
		this.write_date = write_date;
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

	public long getIllu_num() {
		return illu_num;
	}

	public void setIllu_num(long illu_num) {
		this.illu_num = illu_num;
	}

	public String getIllu_name() {
		return illu_name;
	}

	public void setIllu_name(String illu_name) {
		this.illu_name = illu_name;
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

	public long getBook_price() {
		return book_price;
	}

	public void setBook_price(long book_price) {
		this.book_price = book_price;
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

	public long getPreference() {
		return preference;
	}

	public void setPreference(long preference) {
		this.preference = preference;
	}

	public long getSeries_num() {
		return series_num;
	}

	public void setSeries_num(long series_num) {
		this.series_num = series_num;
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
		return "DetailDto [second_num_1=" + second_num_1 + ", second_num_2=" + second_num_2 + ", second_num_3="
				+ second_num_3 + ", second_name_1=" + second_name_1 + ", second_name_2=" + second_name_2
				+ ", second_name_3=" + second_name_3 + ", third_num_1=" + third_num_1 + ", third_num_2=" + third_num_2
				+ ", third_num_3=" + third_num_3 + ", third_name_1=" + third_name_1 + ", third_name_2=" + third_name_2
				+ ", third_name_3=" + third_name_3 + ", book_num=" + book_num + ", book_name=" + book_name
				+ ", book_sub_title=" + book_sub_title + ", write_date=" + write_date + ", pub_num=" + pub_num
				+ ", pub_name=" + pub_name + ", author_num=" + author_num + ", author_name=" + author_name
				+ ", illu_num=" + illu_num + ", illu_name=" + illu_name + ", trans_num=" + trans_num + ", trans_name="
				+ trans_name + ", discount=" + discount + ", discount2=" + discount2 + ", book_price=" + book_price
				+ ", rental_price=" + rental_price + ", rental_period=" + rental_period + ", preference=" + preference
				+ ", series_num=" + series_num + ", support=" + support + ", img_path=" + img_path + ", file_path="
				+ file_path + ", file_name=" + file_name + ", file_size=" + file_size + ", type=" + type + ", intro="
				+ intro + ", pub_intro=" + pub_intro + ", star_point=" + star_point + ", star_count=" + star_count
				+ ", getSecond_num_1()=" + getSecond_num_1() + ", getSecond_num_2()=" + getSecond_num_2()
				+ ", getSecond_num_3()=" + getSecond_num_3() + ", getSecond_name_1()=" + getSecond_name_1()
				+ ", getSecond_name_2()=" + getSecond_name_2() + ", getSecond_name_3()=" + getSecond_name_3()
				+ ", getThird_num_1()=" + getThird_num_1() + ", getThird_num_2()=" + getThird_num_2()
				+ ", getThird_num_3()=" + getThird_num_3() + ", getThird_name_1()=" + getThird_name_1()
				+ ", getThird_name_2()=" + getThird_name_2() + ", getThird_name_3()=" + getThird_name_3()
				+ ", getBook_num()=" + getBook_num() + ", getBook_name()=" + getBook_name() + ", getBook_sub_title()="
				+ getBook_sub_title() + ", getWrite_date()=" + getWrite_date() + ", getPub_num()=" + getPub_num()
				+ ", getPub_name()=" + getPub_name() + ", getAuthor_num()=" + getAuthor_num() + ", getAuthor_name()="
				+ getAuthor_name() + ", getIllu_num()=" + getIllu_num() + ", getIllu_name()=" + getIllu_name()
				+ ", getTrans_num()=" + getTrans_num() + ", getTrans_name()=" + getTrans_name() + ", getDiscount()="
				+ getDiscount() + ", getDiscount2()=" + getDiscount2() + ", getBook_price()=" + getBook_price()
				+ ", getRental_price()=" + getRental_price() + ", getRental_period()=" + getRental_period()
				+ ", getPreference()=" + getPreference() + ", getSeries_num()=" + getSeries_num() + ", getSupport()="
				+ getSupport() + ", getImg_path()=" + getImg_path() + ", getFile_path()=" + getFile_path()
				+ ", getFile_name()=" + getFile_name() + ", getFile_size()=" + getFile_size() + ", getType()="
				+ getType() + ", getIntro()=" + getIntro() + ", getPub_intro()=" + getPub_intro() + ", getStar_point()="
				+ getStar_point() + ", getStar_count()=" + getStar_count() + ", getClass()=" + getClass()
				+ ", hashCode()=" + hashCode() + ", toString()=" + super.toString() + "]";
	}
	
}
