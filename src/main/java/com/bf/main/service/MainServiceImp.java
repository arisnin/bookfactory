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
	public ModelAndView idCheck(ModelAndView mav) throws IOException {
		Map<String,Object> map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		HttpServletResponse response = (HttpServletResponse)map.get("response");
		
		String id = request.getParameter("id");
		
		if (id != null) {
			String check = mainDao.idCheck(id);
			LogAspect.info("idCheck:" + check);
			
			JSONObject json = new JSONObject();
			if (check != null) {
				// 이미 존재하는 ID
				json.put("type", "error");
				json.put("error", "이미 존재하는 아이디입니다.");
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

	@Override
	public ModelAndView emailPhoneCheck(ModelAndView mav) throws IOException {
		Map<String,Object> map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		HttpServletResponse response = (HttpServletResponse)map.get("response");
		
		String type = request.getParameter("type");
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");
		
		if (type != null) {
			LogAspect.info(type);
			LogAspect.info(email);
			LogAspect.info(phone);
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
