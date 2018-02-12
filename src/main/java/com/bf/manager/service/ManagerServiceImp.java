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
		// 테스트중
		String url = "https://ridibooks.com/?genre=general";
		try {
			Document doc = Jsoup.connect(url).get();
			
			Elements allMenu = doc.select(".all_menu_wrapper");
			//중분류 : 일반
			Elements general = allMenu.select(".menu_general").select(".general_menu_wrapper");
			general = general.select(".general_menu_title");
			for(Element e : general) {
				Elements generalSub = e.parent().parent().select("li");
				LogAspect.logger.info(LogAspect.logMsg +"일반:"+ e.text());
				
				int count = 0;
				for(Element eSub : generalSub) {
					if(count == 0) {	// 각 소분류에서 전체<<를 제외한다.
						count = 1;
						continue;
					}
					LogAspect.logger.info(LogAspect.logMsg +"일반서브:"+ eSub.text());					
				}
			}
			
			// 일반 제외하고 나머지
			Elements notGeneral = allMenu.select(".menu_etc").select(".column_box").select("h3");
			for(Element e : notGeneral) {
				Element title = e.selectFirst("a");
				LogAspect.logger.info(LogAspect.logMsg +"그외:"+ title.text());
				
				Elements subTitle = e.nextElementSibling().select("a");
				for(Element sub : subTitle) {
					LogAspect.logger.info(LogAspect.logMsg + title.text() + " >> "+ sub.text());	
				}
			}
			
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
				LogAspect.logger.info(LogAspect.logMsg +"카테고리:" + cateList.get(i));				
				/*int check = managerDao.insertCategory(cateList.get(i));*/
			}
			
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	
}
