package com.bf.serviceCenter.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.bf.serviceCenter.dao.ServiceCenterDao;

/**
 * @author 박성호
 * @date 2018. 2. 14.
 * @description 고객센터 서비스 구현 클래스
 */
@Component
public class ServiceCenterServiceImp implements ServiceCenterService {
	@Autowired
	private ServiceCenterDao serviceCenterDao;
}
