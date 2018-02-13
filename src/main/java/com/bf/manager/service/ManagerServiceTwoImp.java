package com.bf.manager.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.bf.manager.dao.ManagerDaoTwo;

/**
 * @이름: 염현우 X 전상헌
 * @날짜: 2018. 2. 13.
 * @설명:		ManagerServiceTwo
 */

@Component
public class ManagerServiceTwoImp implements ManagerServiceTwo {
	@Autowired
	private ManagerDaoTwo managerDao;

}
