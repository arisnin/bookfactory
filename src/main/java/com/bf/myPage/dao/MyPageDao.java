package com.bf.myPage.dao;

import java.util.List;

import com.bf.member.model.User;
import com.bf.myPage.dto.MyPageCashChargeDto;
import com.bf.myPage.dto.MyPageCashPageDto;
import com.bf.myPage.dto.MyPagePointDto;

/**
 * @author	박성호
 * @date	2018. 2. 12.
 * @description	마이페이지 DAO 인터페이스
 */
public interface MyPageDao {

	int pointInsert(MyPagePointDto myPagePointDto);

	List<MyPagePointDto> myPointList(String id);

	int cashChargeInsert(MyPageCashChargeDto myPageCashChargeDto);

	List<MyPageCashPageDto> myCashPageList(String id);


}
