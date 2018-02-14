package com.bf.book.dao;

import com.bf.book.dto.ReviewDto;

/**
 * @author 박성호
 * @date 2018. 2. 14.
 * @description 대분류별 보기 / 책 상세보기 관련 DAO 인터페이스
 */
public interface BookDao {

	int insertReview(ReviewDto reviewDto);

}
