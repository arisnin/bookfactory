package com.bf.myPage.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.bf.myPage.dao.MyPageDao;

/**
 * @author	박성호
 * @date	2018. 2. 12.
 * @description	마이페이지 Service 클래스 구현
 */
@Component
public class MyPageServiceImp implements MyPageService {
	@Autowired
	private MyPageDao myPageDao;
}
