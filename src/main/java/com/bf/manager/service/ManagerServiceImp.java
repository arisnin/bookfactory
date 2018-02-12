package com.bf.manager.service;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;

import com.bf.aop.LogAspect;
import com.bf.manager.dao.ManagerDao;

/**
 * @이름: 염현우 X 전상헌
 * @날짜: 2018. 2. 12.
 * @설명: 
 */
@Component
public class ManagerServiceImp implements ManagerService {
	@Autowired
	private ManagerDao managerDao;

	// Go 염현우
	@Override
	public void bookCategoryOk(ModelAndView mav) {
		HttpServletRequest request = (HttpServletRequest) mav.getModelMap().get("request");
		String url = request.getParameter("url");
		try {
			Document doc = Jsoup.connect(url).get();
			Elements el = doc.select(".sub_category_list").not(".selected");
			el = el.select(".sub_category_list_item");
			
			ArrayList<String> cateList = new ArrayList<String>();
			for(Element e : el) {
				LogAspect.logger.info(LogAspect.logMsg + e.text());
				cateList.add(e.text());
			}
			/*managerDao.insertCategory(cateList);*/
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	@Override
	public void bookCateSecond(ModelAndView mav) {
		HttpServletRequest request = (HttpServletRequest) mav.getModelMap().get("request");
		String url = request.getParameter("url");
		try {
			Document doc = Jsoup.connect(url).get();
			Elements el = doc.select(".main_category_list");
			el = el.select(".main_category_button");
			ArrayList<String> cateList = new ArrayList<String>();
			for(Element e : el) {
				if(e.text().equals("로맨스 단행본")) break;
				cateList.add(e.text());
			}
			for(int i=0;i<cateList.size(); i++) {
				LogAspect.logger.info(LogAspect.logMsg + cateList.get(i));				
			}
			int check = managerDao.insertCategory(cateList);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	
}
