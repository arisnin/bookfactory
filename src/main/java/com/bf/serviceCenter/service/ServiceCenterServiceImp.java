package com.bf.serviceCenter.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;

import com.bf.aop.LogAspect;
import com.bf.serviceCenter.dao.ServiceCenterDao;
import com.bf.serviceCenter.dto.ServiceCenterDtoFre;

/**
 * @author 박성호
 * @date 2018. 2. 14.
 * @description 고객센터 서비스 구현 클래스
 */


@Component
public class ServiceCenterServiceImp implements ServiceCenterService {
	@Autowired
	private ServiceCenterDao serviceCenterDao;

	
	/**
	 * @author : 김동환
	 * @date : 2018. 2. 21.
	 * comment : 고객센터 - 안내사항 / serviceCenterInfo
	 */
	
	@Override
	public void serviceCenterInfo(ModelAndView mav) {
		Map<String, Object> map = mav.getModelMap();
		
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		
		int count = serviceCenterDao.infoCount();
		LogAspect.info("고객센터 안내사항 리스트 : " + count);
		
		List<ServiceCenterDtoFre> infoList = null;
		
		if(count > 0) {
			infoList = serviceCenterDao.infoMain();
			LogAspect.info("고객센터 리스트 사이증 : " + infoList.size());
		}
		
		mav.addObject("infoList", infoList);
		
		mav.setViewName("serviceCenter/information.solo");
	}


	@Override
	public void serviceCenterInfoRead(ModelAndView mav) {
		
		Map<String, Object> map = mav.getModelMap();
		
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		
		int num = Integer.parseInt(request.getParameter("num"));
		LogAspect.info("zz");
		LogAspect.info("고객센터 읽기 : " + num);
		
	}
}
