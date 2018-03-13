package com.bf.myPage.dto;

import java.util.Date;
import java.util.List;

import com.bf.book.dto.ReplyDto;
import com.bf.book.dto.ReviewDto;

/**
 * @author 박성호
 * @date 2018. 3. 8.
 * @description 마이페이지의 내 리뷰 관리에서 리뷰 정보를 저장하는 DTO
 */
public class MyReviewDto extends ReviewDto {
	private String book_name;

	public MyReviewDto() {
	}

	public MyReviewDto(int num, String id, int book_num, String content, Date write_date, int star_point, String spoiler, int preference, String display, int accuse_count, List<ReplyDto> replyList, String book_name) {
		super(num, id, book_num, content, write_date, star_point, spoiler, preference, display, accuse_count, replyList);
		this.book_name = book_name;
	}

	public String getBook_name() {
		return book_name;
	}

	public void setBook_name(String book_name) {
		this.book_name = book_name;
	}

	@Override
	public String toString() {
		return "MyReviewDto [book_name=" + book_name + ", num=" + num + ", id=" + id + ", book_num=" + book_num + ", content=" + content + ", write_date=" + write_date + ", star_point=" + star_point + ", spoiler=" + spoiler + ", preference=" + preference + ", display=" + display + ", accuse_count=" + accuse_count + ", replyList=" + replyList + "]";
	}

}
