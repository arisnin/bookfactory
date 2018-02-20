package com.bf.book.dto;

import java.util.Date;
import java.util.List;

import org.springframework.stereotype.Component;

/**
 * @author 박성호
 * @date 2018. 2. 12.
 * @description
 */
@Component
public class ReviewDto {
	// Field
	private int num; // NUMBER(8,0) -- index
	private String id; // VARCHAR2(40 CHAR) -- 회원 아이디
	private int book_num; // NUMBER(8,0) -- 책 번호(외래키)
	private String content; // VARCHAR2(4000 BYTE) -- 리뷰 내용
	private java.util.Date write_date; // DATE -- 작성일
	private int star_point; // NUMBER(3,0) -- 별점
	private String spoiler; // VARCHAR2(20 CHAR) -- 스포일러존재/미존재(true/false)
	private int preference; // NUMBER(8,0) -- 좋아요 개수
	private String display; // VARCHAR2(20 CHAR) -- 공개/비공개(true/false)
	private int accuse_count; // 신고 개수
	
	private List<ReplyDto> replyList;

	// Constructor
	public ReviewDto() {
	}

	public ReviewDto(int num, String id, int book_num, String content, Date write_date, int star_point, String spoiler, int preference, String display, List<ReplyDto> replyList) {
		super();
		this.num = num;
		this.id = id;
		this.book_num = book_num;
		this.content = content;
		this.write_date = write_date;
		this.star_point = star_point;
		this.spoiler = spoiler;
		this.preference = preference;
		this.display = display;
		this.replyList = replyList;
	}

	// Get, Set
	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public int getBook_num() {
		return book_num;
	}

	public void setBook_num(int book_num) {
		this.book_num = book_num;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public java.util.Date getWrite_date() {
		return write_date;
	}

	public void setWrite_date(java.util.Date write_date) {
		this.write_date = write_date;
	}

	public int getStar_point() {
		return star_point;
	}

	public void setStar_point(int star_point) {
		this.star_point = star_point;
	}

	public String getSpoiler() {
		return spoiler;
	}

	public void setSpoiler(String spoiler) {
		this.spoiler = spoiler;
	}

	public int getPreference() {
		return preference;
	}

	public void setPreference(int preference) {
		this.preference = preference;
	}

	public String getDisplay() {
		return display;
	}

	public void setDisplay(String display) {
		this.display = display;
	}

	public int getAccuse_count() {
		return accuse_count;
	}

	public void setAccuse_count(int accuse_count) {
	
		this.accuse_count = accuse_count;
	}
	public List<ReplyDto> getReplyList() {
		return replyList;
	}

	public void setReplyList(List<ReplyDto> replyList) {
		this.replyList = replyList;

	}

	@Override
	public String toString() {

		return "ReviewDto [num=" + num + ", id=" + id + ", book_num=" + book_num + ", content=" + content
				+ ", write_date=" + write_date + ", star_point=" + star_point + ", spoiler=" + spoiler + ", preference="
				+ preference + ", display=" + display + ", accuse_count=" + accuse_count + "]";

	}

}
