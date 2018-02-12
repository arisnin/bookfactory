package com.bf.manager.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.bf.aop.LogAspect;
import com.bf.manager.dao.ManagerDao;

/**
 * @이름: 염현우
 * @날짜: 2018. 2. 12.
 * @설명: 
 */
@Component
public class ManagerServiceImp implements ManagerService {
	@Autowired
	private ManagerDao managerDao;

	@Override
	public void bookCategory() {
		LogAspect.logger.info(LogAspect.logMsg + "북카테고리 입성");
	}
	
	
}
