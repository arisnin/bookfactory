package com.bf.serviceCenter.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

/**
 * @author 박성호
 * @date 2018. 2. 14.
 * @description 고객센터 DAO 구현 클래스
 */
@Component
public class ServiceCenterDaoImp implements ServiceCenterDao {
	@Autowired
	private SqlSessionTemplate sqlSession;
}
