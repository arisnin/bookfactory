package com.bf.book.dto;

/**
 * @author 최정은
 * @date 2018. 2. 21.
 * @description 
 * 
 */
public class DetailDto {
	//책 카테고리
	private int first_cate_num;
	private String first_cate_name;
	private int second_cate_num;
	private String second_cate_name;
	private int third_cate_num;
	private String third_cate_name;
	
	//책 상단 정보
	private long book_num;
	private String book_name;
	private String book_sub_title;
	private String write_date;
	
	private long pub_num;
	private String pun_name;
	private long author_num;
	private String author_name;
	private long illu_num;
	private String illu_name;
	private long trans_num;
	private String trans_name;
	
	private double discount;
	private double discount2;
	private long book_price;
	private long lental_price;
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
	
	private long type;
	private String intro;
	private String pub_intro;
	
	//이벤트 정보는 어떻게 들어갈지모름
	
	//별점정보
	private int star_point;
	
	//저자프로필정보는 따로 dto 뺀다.
	
}
