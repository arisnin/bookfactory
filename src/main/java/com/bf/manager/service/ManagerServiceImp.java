package com.bf.manager.service;

import java.io.File;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.taglibs.standard.tag.common.fmt.RequestEncodingSupport;
import org.apache.tools.ant.taskdefs.condition.Http;
import org.omg.CORBA.PRIVATE_MEMBER;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import java.io.IOException;
import javax.servlet.http.HttpServletResponse;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.web.servlet.ModelAndView;

import com.bf.aop.LogAspect;
import com.bf.manager.dao.ManagerDao;
import com.bf.manager.dto.BoardFrequencyDto;
import com.bf.manager.dto.AuthorDto;
import com.bf.manager.dto.BookFirstCateDto;
import com.bf.manager.dto.BookSecondCateDto;
import com.bf.manager.dto.BookThirdCateDto;
import com.bf.manager.dto.CountryDto;
import com.bf.manager.dto.PublisherDto;

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
		int check = managerDao.checkCategory();
		mav.addObject("check", check);
		if(check > 0) {
			LogAspect.logger.info(LogAspect.logMsg +"이미 카테고리 있다");
			return ;
		}
		// 테스트중
		String url = "https://ridibooks.com/?genre=general";
		try {
			Document doc = Jsoup.connect(url).get();
			
			Elements allMenu = doc.select(".all_menu_wrapper");
			//중분류 : 일반
			Elements general = allMenu.select(".menu_general").select(".general_menu_wrapper");
			general = general.select(".general_menu_title");
			for(Element e : general) {
				//일반 삽입
				LogAspect.logger.info(LogAspect.logMsg +"일반:"+ e.text());
				int cateNum = managerDao.insertBookCateSecond(e.text(),1);
				if(cateNum == -1) {
					LogAspect.logger.info(LogAspect.logMsg +"카테고리삽입 실패");
					break;
				}
				
				//하위 메뉴 삽입
				Elements generalSub = e.parent().parent().select("li");
				int count = 0;
				for(Element eSub : generalSub) {
					if(count == 0) {	// 각 소분류에서 전체<<를 제외한다.
						count = 1;
						continue;
					}
					LogAspect.logger.info(LogAspect.logMsg +"일반서브:"+ eSub.text());
					managerDao.insertBookCateThird(eSub.text(),cateNum);
				}
			}
			
			// 일반 제외하고 나머지
			Elements notGeneral = allMenu.select(".menu_etc").select(".column_box").select("h3");
			int count = 0;
			for(Element e : notGeneral) {
				int firstCateNum = 2;
				
				count++;
				if(count == 3 || count == 4) firstCateNum = 3;
				else if(count == 5) firstCateNum = 4;
				else if(count > 5) firstCateNum = 5;
				
				Element title = e.selectFirst("a");
				LogAspect.logger.info(LogAspect.logMsg +"그외:"+ title.text());
				
				int cateNum = managerDao.insertBookCateSecond(title.text(),firstCateNum);
				if(cateNum == -1) {
					LogAspect.logger.info(LogAspect.logMsg +"카테고리삽입 실패");
					break;
				}
				
				Elements subTitle = e.nextElementSibling().select("a");
				for(Element sub : subTitle) {
					LogAspect.logger.info(LogAspect.logMsg + title.text() + " >> "+ sub.text());
					managerDao.insertBookCateThird(sub.text(),cateNum);
				}
			}
			
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	@Override
	public void publisherInsertOk(ModelAndView mav) {
		PublisherDto publisherDto = (PublisherDto) mav.getModelMap().get("publisherDto");
		LogAspect.logger.info(LogAspect.logMsg + publisherDto);
		publisherDto.setUrl("com.bf.bookfactory");
		int check = managerDao.publisherInsertOk(publisherDto);
		
		mav.addObject("check", check);
	}
	
	@Override
	public void publisherNameCheck(ModelAndView mav) {
		HttpServletRequest request = (HttpServletRequest) mav.getModelMap().get("request");
		HttpServletResponse response = (HttpServletResponse) mav.getModelMap().get("response");
		
		String name = request.getParameter("name");
		int check = managerDao.publisherNameCheck(name);
		
		try {
			response.setContentType("application/text;charset=utf-8");
			response.getWriter().print(check);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	// 상헌이꺼-------------------------------------------------------------------
	@Override
	public void boardInsert(ModelAndView mav) {

		Map<String, Object> map = mav.getModel();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		List<BoardFrequencyDto> cateList = null;
		List<BoardFrequencyDto> cateList2 = null;
		String boardNumber = request.getParameter("num");

		if (boardNumber == null)
			boardNumber = "1";
		int num = Integer.parseInt(boardNumber);

		cateList = managerDao.catecorySearch();
		cateList2 = managerDao.catecorySearch2();

		LogAspect.logger.info(LogAspect.logMsg + num + "-----" + cateList);
		LogAspect.logger.info(LogAspect.logMsg + cateList2);

		mav.addObject("cateList", cateList);
		mav.addObject("cateList2", cateList2);
		mav.addObject("num", num);
		mav.setViewName("board/insert.mg");
	}

	@Override
	public void boardInsertOk(ModelAndView mav) {
		Map<String, Object> map = mav.getModel();

		MultipartHttpServletRequest request = (MultipartHttpServletRequest) map.get("request");
		BoardFrequencyDto boardFreDto = (BoardFrequencyDto) map.get("boardFreDto");
		int num = Integer.parseInt(request.getParameter("num"));

		String catecory_1 = request.getParameter("catecory_1");
		String catecory_2 = request.getParameter("catecory_2");

		LogAspect.logger.info(LogAspect.logMsg + catecory_1 + "," + catecory_2);
		boardFreDto.setCategory(Integer.parseInt(catecory_2));
		boardFreDto.setWrite_date(new Date());
		MultipartFile freFile = request.getFile("file");
		String fileName = Long.toString(System.currentTimeMillis()) + "_" + freFile.getOriginalFilename();
		long fileSize = freFile.getSize();
		LogAspect.logger.info(LogAspect.logMsg + fileName + fileSize);

		if (fileSize != 0) {
			File path = new File("C:\\sangheon\\");
			path.mkdirs();
			if (path.exists() && path.isDirectory()) {
				File file = new File(path, fileName);

				try {
					freFile.transferTo(file);
				} catch (Exception e) {
					e.printStackTrace();
				}

				boardFreDto.setFile_path(file.getAbsolutePath());
				boardFreDto.setFile_name(fileName);
				boardFreDto.setFile_size(fileSize);

				LogAspect.logger.info(LogAspect.logMsg + boardFreDto.toString());

				int check = managerDao.BoardInsertOk(boardFreDto);
				LogAspect.logger.info(LogAspect.logMsg + check);
				mav.addObject("check", check);
				mav.setViewName("board/insertOk.mg");
			}
		}
	}

	@Override
	public void authorInsert(ModelAndView mav) {
		List<CountryDto> countryList = managerDao.getCountry();
		mav.addObject("countryList", countryList);
	}

	@Override
	public void authorInsertOk(ModelAndView mav) {
		AuthorDto authorDto = (AuthorDto) mav.getModelMap().get("authorDto");
		authorDto.setUpdate_date(new Date());
		LogAspect.logger.info(LogAspect.logMsg + authorDto);
		
		if(authorDto.getEducation() == null)	authorDto.setEducation("-");
		if(authorDto.getCareer() == null)	authorDto.setCareer("-");
		if(authorDto.getAwards() == null)	authorDto.setAwards("-");
		if(authorDto.getLink() == null)	authorDto.setLink("-");
		if(authorDto.getDescribe() == null)	authorDto.setDescribe("-");
		
		int check = managerDao.authorInsertOk(authorDto);
		
		mav.addObject("check", check);
	}
	
	@Override
	public void bookInsert(ModelAndView mav) {
		List<BookFirstCateDto> firstCateList = managerDao.getFirstCate();
		mav.addObject("firstCateList", firstCateList);
	}
	
	@Override
	public void bookCateOne(ModelAndView mav) {
		HttpServletRequest request = (HttpServletRequest) mav.getModelMap().get("request");
		HttpServletResponse response = (HttpServletResponse) mav.getModelMap().get("response");
		
		String name = request.getParameter("name");

		List<BookSecondCateDto> secondCateList = managerDao.bookCateOne(name);
		LogAspect.logger.info(LogAspect.logMsg + secondCateList);
		
		String secondNameList = "";
		for(int i=0;i<secondCateList.size();i++) {
			secondNameList += secondCateList.get(i).getName() + ",";
		}
		
		try {
			response.setContentType("application/text;charset=utf-8");
			response.getWriter().print(secondNameList);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	@Override
	public void bookCateTwo(ModelAndView mav) {
		HttpServletRequest request = (HttpServletRequest) mav.getModelMap().get("request");
		HttpServletResponse response = (HttpServletResponse) mav.getModelMap().get("response");
		
		String name = request.getParameter("name");

		List<BookThirdCateDto> thirdCateList = managerDao.bookCateTwo(name);
		LogAspect.logger.info(LogAspect.logMsg + thirdCateList);
		
		String thirdNameList = "";
		for(int i=0;i<thirdCateList.size();i++) {
			thirdNameList += thirdCateList.get(i).getName() + ",";
		}
		
		try {
			response.setContentType("application/text;charset=utf-8");
			response.getWriter().print(thirdNameList);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	@Override
	public void boardList(ModelAndView mav) {
		Map<String,Object> map = mav.getModelMap();
		HttpServletRequest request =(HttpServletRequest) map.get("request");
		String pageNumber= request.getParameter("pageNumber");
		
		if(pageNumber ==null) pageNumber ="1";
		int boardSize = 10;
		
		int currentPage = Integer.parseInt(pageNumber);
		
		int starRow = (currentPage-1)* boardSize +1;
		int endRow =currentPage* boardSize+1;
		
		int count = managerDao.Boardcount();
		LogAspect.logger.info(LogAspect.logMsg +count);
		
		List<BoardFrequencyDto> freDtoList =null;
		
		if(count>0) {
			freDtoList = managerDao.boardList(starRow,endRow);
			LogAspect.logger.info(LogAspect.logMsg +freDtoList);
		}
		mav.addObject("freDtoList",freDtoList);
		mav.addObject("pageNumber",currentPage);
		mav.addObject("count",count);
		mav.addObject("boardSize",boardSize);
		
		mav.setViewName("board/list.mg");
	}

	@Override
	public void bookOpenPub(ModelAndView mav) {
		HttpServletRequest request = (HttpServletRequest) mav.getModelMap().get("request");
		String searchWord = request.getParameter("search-word");

		String pageNumber = request.getParameter("pageNumber");
		if(pageNumber == null) pageNumber = "1";
		
		int boardSize = 10;
		int currentPage = Integer.parseInt(pageNumber);
		int startRow = (currentPage - 1) * boardSize + 1;
		int endRow = currentPage * boardSize;
		
		List<PublisherDto> pubList = null;
		if(searchWord == null) {
			pubList = managerDao.getPublisherList(startRow,endRow);
		}else {
			pubList = managerDao.getPublisherList(searchWord,startRow,endRow);
		}
		
		int count = managerDao.getPublisherCount();
		
		mav.addObject("pageNumber", pageNumber);
		mav.addObject("boardSize", boardSize);
		mav.addObject("count", count);
		mav.addObject("pubList", pubList);
	}

}
