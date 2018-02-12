package com.sist.bookFactory.main.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.sist.bookFactory.main.dao.MainDao;

/**
 * @Date 2018. 2. 4.
 * @Author 박성호
 * @Description
 */
@Component
public class MainServiceImp implements MainService {
	@Autowired
	private MainDao mainDao;
}
