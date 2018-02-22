package com.bf.serviceCenter.service;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.FileInputStream;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
			LogAspect.info("투스트링" + infoList.toString());
		}
		
		mav.addObject("count", count);
		mav.addObject("infoList", infoList);		
		
		mav.setViewName("serviceCenter/information.solo");
	}
	

	@Override
	public void serviceCenterInfoRead(ModelAndView mav) {
		
		Map<String, Object> map = mav.getModelMap();
		
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		
		int num = Integer.parseInt(request.getParameter("num"));
		
		int listSize = 10;
		
		int count = serviceCenterDao.infoCount();
		
		LogAspect.info("고객센터 읽기 : " + num);
				
		ServiceCenterDtoFre serviceCenterDtoFre = serviceCenterDao.infoRead(num);
		LogAspect.info("ServiceCenterDto 확인 : " + serviceCenterDtoFre.toString() );
		
		List<ServiceCenterDtoFre> infoListSide = serviceCenterDao.infoMain();		
		LogAspect.info("사이드 리스트 사이즈 확인확인 : " + infoListSide.size());
		
		if(serviceCenterDtoFre.getFile_name() !=null) {
			int index = serviceCenterDtoFre.getFile_name().indexOf("_") + 1;
			serviceCenterDtoFre.setFile_name(serviceCenterDtoFre.getFile_name().substring(index));
		}
		
				
		mav.addObject("serviceCenterDtoFre", serviceCenterDtoFre);
		mav.addObject("infoListSide", infoListSide);
		mav.addObject("listSize", listSize);
		mav.addObject("count", count);
		
		mav.setViewName("serviceCenter/information_content1.solo");
		
	}


	@Override
	public void serviceCenterInformationDownLoad(ModelAndView mav) {
		
		Map<String, Object> map = mav.getModelMap();
		
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		HttpServletResponse response = (HttpServletResponse) map.get("response");
		
		int num = Integer.parseInt(request.getParameter("num"));
		LogAspect.info("다운로드 넘버 확인 : " + num);
		
		ServiceCenterDtoFre serviceCenterDtoFre = serviceCenterDao.infoFile(num);
		LogAspect.info("다운로드 넘버 스트링링 : " + serviceCenterDtoFre.toString());
		
		BufferedInputStream bis = null;
		BufferedOutputStream bos = null;
		
		try {
			int index = serviceCenterDtoFre.getFile_name().indexOf("_") + 1;
			String bfFileName = serviceCenterDtoFre.getFile_name().substring(index);
			String fileName = new String(bfFileName.getBytes("UTF-8"), "ISO-8859-1");
			
			response.setContentType("application/octet-stream");
			response.setContentLengthLong(serviceCenterDtoFre.getFile_size());
			response.setHeader("Content-Disposition", "attachment;filename=" + fileName + ";");
			
			bis = new BufferedInputStream(new FileInputStream(serviceCenterDtoFre.getFile_path()));
			bos = new BufferedOutputStream(response.getOutputStream());
			
			while(true) {
				int data = bis.read();
				if(data == -1) break;
				bos.write(data);
			}
			
			bos.flush();
		}catch (Exception e) {
		}finally {
			try {
				if(bis!= null) bis.close();
				if(bos!= null) bos.close();
			}catch(Exception e) {
				e.printStackTrace();
			}	
		}		
	}



	
	
}
