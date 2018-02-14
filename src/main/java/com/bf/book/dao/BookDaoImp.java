package com.bf.book.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

/**
 * @author	박성호
 * @date	2018. 2. 14.
 * @description	대분류별 보기 / 책 상세보기 관련 DAO 구현 클래스
 */
@Component
public class BookDaoImp implements BookDao {
	@Autowired
	private SqlSessionTemplate sqlSession;
}
