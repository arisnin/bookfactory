package com.bf.main.dao;

import com.bf.myPage.dto.MyPageReviewDto;

import com.bf.main.dto.RegisterDto;

/**
 * @Date 2018. 2. 4.
 * @Author 박성호
 * @Description
 */
public interface MainDao {

	int insertReview(MyPageReviewDto myPageReviewDto);

	public int cartWishList(int num);

	public int cartDelete(int num);

	public int register(RegisterDto registerDto);

}
