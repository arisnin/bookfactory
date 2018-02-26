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
public class ReviewPageDto extends ReviewDto {
	// Field
	private String buyer; // 구매자 표시

	// Constructor
	public ReviewPageDto() {
		super();
	}

	public ReviewPageDto(int num, String id, int book_num, String content, Date write_date, int star_point, String spoiler, int preference, String display, int accuse_count, List<ReplyDto> replyList, String buyer) {
		super(num, id, book_num, content, write_date, star_point, spoiler, preference, display, accuse_count, replyList);
		this.buyer = buyer;
	}

	public String getBuyer() {
		return buyer;
	}

	public void setBuyer(String buyer) {
		this.buyer = buyer;
	}

	@Override
	public String toString() {
		return "ReviewPageDto [buyer=" + buyer + ", " + super.toString() + "]";
	}

}
