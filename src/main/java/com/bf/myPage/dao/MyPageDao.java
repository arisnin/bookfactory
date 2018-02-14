package com.bf.myPage.dao;

import com.bf.myPage.dto.MyPagePointDto;

/**
 * @author	박성호
 * @date	2018. 2. 12.
 * @description	마이페이지 DAO 인터페이스
 */
public interface MyPageDao {

	MyPagePointDto pointInsert(String id, String menu_num, String point_type);

	int pointInsert(MyPagePointDto myPagePointDto);

}
