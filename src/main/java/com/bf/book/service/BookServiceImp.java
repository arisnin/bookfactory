package com.bf.book.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.bf.book.dao.BookDao;

/**
 * @author	박성호
 * @date	2018. 2. 14.
 * @description	대분류별 보기 / 책 상세보기 관련 서비스 구현 클래스
 */
@Component
public class BookServiceImp implements BookService {
	@Autowired
	private BookDao bookDao;
}
