package com.bf.main.dao;

import com.bf.main.dto.ReviewDto;

import com.bf.main.dto.RegisterDto;

/**
 * @Date 2018. 2. 4.
 * @Author 박성호
 * @Description
 */
public interface MainDao {

	int insertReview(ReviewDto reviewDto);

	public int register(RegisterDto registerDto);

}
