package com.bf.main.service;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;

import com.bf.aop.LogAspect;
import com.bf.main.dao.MainDao;
import com.bf.main.dto.CategoryPageDto;
import com.bf.main.dto.NoticeDto;
import com.bf.member.model.MemberDto;

/**
 * @Date 2018. 2. 4.
 * @Author 박성호
 * @Description
 */

@Component
public class MainServiceImp implements MainService {
	@Autowired
	private MainDao mainDao;

	@Override
	public ModelAndView category(ModelAndView mav) {
		HttpServletRequest request = (HttpServletRequest)mav.getModelMap().get("request");
				
		String cnum = request.getParameter("cnum");
		String snum = request.getParameter("snum");
		
		// 중분류 카테고리 전체메뉴 구분
		// 100 단위 cnum -> 중분류 카테고리 전체를 대상으로 검색 -> second_cate = 1 ~ 24
		// 100 단위 이외의 cnum -> 소분류 카테고리를 대상으로 검색 -> second_cate = 1 ~ 24 and third_cate = 1 ~ 127;
		
		// cnum 으로부터 third_category 번호 추출하기
		int groupBySecondCate[] = {0,17,5,4,6,2,2,5,4,4,8,5,3,3,3,1,10,8,3,8,4,13,4,2,3};
		int intCnum = cnum == null ? 100 : Integer.parseInt(cnum);
		int secondCateNum = intCnum / 100;
		int thirdCateNum = intCnum - secondCateNum*100;
		int serviceNum = snum == null ? 100 : Integer.parseInt(snum);
		
		// 소분류(third category) 번호 계산(0이면 해당 중분류 카테고리 전체검색)
		if (thirdCateNum > 0) {
			for (int i=1; i<secondCateNum; i++) {
				thirdCateNum += groupBySecondCate[i];
			}
		}
		
		LogAspect.info("cnum/snum:" + cnum + "/" + snum + " -> " + secondCateNum + "," + thirdCateNum + "/" + serviceNum);

		// Pagination 설정
		String pnum = request.getParameter("pnum");
		int pageNumber = pnum == null ? 1 : Integer.parseInt(pnum);
		
		int boardSize=20;
		int endRow = pageNumber * boardSize;
		int startRow = endRow -boardSize + 1;
		
		int count = mainDao.selectCategoryAllCount(secondCateNum, thirdCateNum, serviceNum);
		
		LogAspect.info("pnum/count/start/end:" + pageNumber + "/" + count + "/" + startRow + "/" + endRow);
		
		List<CategoryPageDto> categoryPageList = null;
		List<CategoryPageDto> categoryPageBestList = null;
		List<CategoryPageDto> categoryPageFreeList = null;
		
		// 서비스 타입 구분(신간=101, 베스트셀러=102, 무료=103, 전체=104)
		if (snum == null || "100".equals(snum)) {
			// 홈(신간, 무료 항목에서 각 10개씩. 베스트셀러는 5개)
			categoryPageList = mainDao.selectCategoryAll(secondCateNum, thirdCateNum, 101, 1, 10);
			categoryPageBestList = mainDao.selectCategoryAll(secondCateNum, thirdCateNum, 102, 1, 5);
			categoryPageFreeList = mainDao.selectCategoryAll(secondCateNum, thirdCateNum, 103, 1, 10);
			LogAspect.info("categoryPageList:" + categoryPageList.size() + "/" + categoryPageBestList.size() + "/" + categoryPageFreeList.size());
		} else {
			// 신간, 베스트셀러, 무료, 전체
			categoryPageList = mainDao.selectCategoryAll(secondCateNum, thirdCateNum, serviceNum, startRow, endRow);
			LogAspect.info("categoryPageList:" + categoryPageList.size());
		}
		
		mav.addObject("pnum",pageNumber);
		mav.addObject("count",count);
		mav.addObject("boardSize", boardSize);
	
		return mav.addObject("categoryPageList", categoryPageList).addObject("categoryPageBestList", categoryPageBestList).addObject("categoryPageFreeList", categoryPageFreeList);
	}

	@Override
	public ModelAndView register(ModelAndView mav) throws IOException {
		Map<String,Object> map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		HttpServletResponse response = (HttpServletResponse)map.get("response");
		
		MemberDto memberDto = (MemberDto)map.get("memberDto");
		int check = 0;
		
		Date birthday;
		try {
			birthday = new SimpleDateFormat("yyMMdd").parse(request.getParameter("birthdayStr"));
			memberDto.setBirthday(birthday);
			
		} catch (ParseException e) {
			LogAspect.severe(e.getMessage());
			e.printStackTrace();			
			check = -1;
		}
		
		if (check == 0) {
			memberDto.setIp(request.getRemoteAddr());
			memberDto.setMarketing_check("yes");
			
			LogAspect.info(memberDto.toString());
			
			try {
				check = mainDao.register(memberDto);
			} catch (Exception e) {
				LogAspect.severe(e.getMessage());
				e.printStackTrace();
			}
			
			LogAspect.info("register check:" + check);
		}
		
		// Ajax request
		JSONObject json = new JSONObject();
		if ("ajax".equalsIgnoreCase(request.getParameter("requestURL"))) {
			switch(check) {
			case 0:
				json.put("type", "system");
				json.put("error", "시스템 에러로 가입에 실패하셨습니다.");
				break;
			case -1:
				json.put("type","birthday");
				json.put("error","생년월일 입력이 잘못되었습니다.");
				break;
			default:
				json.put("type", "ok");
				json.put("error", "");
				break;
			}
			
			LogAspect.info(json);
			
			response.setContentType("application/x-json;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.print(json);
			out.flush();
			out.close();
		}
		
		return null;
	}

	@Override
	public ModelAndView registerValidation(ModelAndView mav) throws IOException {
		Map<String,Object> map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		HttpServletResponse response = (HttpServletResponse)map.get("response");
		
		String type = request.getParameter("type");
		String keyword = request.getParameter("keyword");
		
		if (type != null) {
			LogAspect.info("registerValidation(): " + type + "/" + keyword);
			String errMsg = "";
			
			List<String> check = mainDao.registerValidation(type,keyword);
			
			if ("email".equalsIgnoreCase(type)) {
				errMsg = "이미 존재하는 이메일입니다.";
			} else if ("phone".equalsIgnoreCase(type)) {
				errMsg = "이미 존재하는 전화번호입니다.";
			} else if ("id".equalsIgnoreCase(type)) {
				errMsg = "이미 존재하는 아이디입니다.";
			}
			
			JSONObject json = new JSONObject();
			if (check.size() > 0) {
				// 이미 존재하는 email(phone)
				json.put("type", "error");
				json.put("error", errMsg);
			} else {
				json.put("type", "ok");
			}
			
			response.setContentType("application/x-json;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.print(json);
			out.flush();
			out.close();
		}
		
		return null;
	}

	/**
	 * @author : 김동환
	 * @date : 2018. 2. 20.
	 * comment : 공지사항
	 */
	
	@Override
	public void noticeMain(ModelAndView mav) {		
		Map<String, Object> map = mav.getModelMap();
		
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		
		String pageNumber = request.getParameter("pageNumber");
		if(pageNumber == null) pageNumber = "1";
		
		int boardSize = 10;		
		int currentPage = Integer.parseInt(pageNumber);
		int startRow = (currentPage-1) * boardSize + 1;
		int endRow = currentPage * boardSize;
		
		int count = mainDao.noticeMainCount();		
		LogAspect.info("공지사항 메인리스트 확인 : " + count);
		
		List<NoticeDto> noticeList = null;
		
		if(count > 0) {
			noticeList = mainDao.noticeMain(startRow, endRow);
			LogAspect.info("공지사항 리스트 사이즈 : " + noticeList.size());
		}
		
		mav.addObject("noticeList", noticeList);
		mav.addObject("count", count);
		mav.addObject("boardSize", boardSize);
		mav.addObject("currentPage", currentPage);
		
		mav.setViewName("notice/main.solo");
		
	}
	
	@Override
	public void noticeRead(ModelAndView mav) {
		Map<String, Object> map = mav.getModelMap();
		
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		
		int num = Integer.parseInt(request.getParameter("num"));
		int pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
		
		LogAspect.info("읽어오기 확인중 : " + num + ", " + pageNumber);
		
		NoticeDto noticeDto = mainDao.noticeRead(num);
		LogAspect.info("NoticeDto 확인 : " + noticeDto.toString());
		
		mav.addObject("noticeDto", noticeDto);
		mav.addObject("pageNumber", pageNumber);
		
		mav.setViewName("notice/content.solo");		
	}
	
	
	
}
