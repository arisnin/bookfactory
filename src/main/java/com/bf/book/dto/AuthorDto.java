package com.bf.book.dto;

import java.sql.Date;

/**
 * @author 최정은
 * @date 2018. 2. 21.
 * @description 책 상세보기 화면에서의 저자 프로필 dto 
 * 
 */
public class AuthorDto {
	private long author_num;
	private String author_name;
	private String country_num;
	private String country_name;
	private String birthday;
	private String education;
	private String career;
	private String debut;
	private String link;
	private Date update_date;
	private String awards;
	private String describe;
	
	//대표저서 - >다른 dto 사용 homeDto 사용예정
}
