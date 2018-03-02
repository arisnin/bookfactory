package com.bf.serviceCenter.service;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.bf.aop.LogAspect;
import com.bf.book.dto.ReviewDto;
import com.bf.main.dto.NoticeDto;
import com.bf.manager.dto.BoardCate1Dto;
import com.bf.manager.dto.BoardCate2Dto;
import com.bf.manager.dto.BoardContactDto;
import com.bf.manager.dto.BoardFrequencyDto;
import com.bf.member.model.MemberDto;
import com.bf.member.model.User;
import com.bf.serviceCenter.dao.ServiceCenterDao;
import com.bf.serviceCenter.dto.BookContactDto;
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
		
		List<NoticeDto> infoList = null;
		
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
				
		int count = serviceCenterDao.infoCount();		
		LogAspect.info("고객센터 읽기 : " + num);
				
		NoticeDto noticeDto = serviceCenterDao.infoRead(num);
		LogAspect.info("noticeDto 확인 : " + noticeDto.toString() );
		
		List<NoticeDto> infoListSide = serviceCenterDao.infoMain();		
		LogAspect.info("사이드 리스트 사이즈 확인확인 : " + infoListSide.size());
		
		List<NoticeDto> infoSide = serviceCenterDao.infoSide();
		
//		if(noticeDto.getFile_name() !=null) {
//			int index = noticeDto.getFile_name().indexOf("_") + 1;
//			noticeDto.setFile_name(noticeDto.getFile_name().substring(index));
//		}
		
				
		mav.addObject("noticeDto", noticeDto);
		mav.addObject("infoListSide", infoListSide);
		mav.addObject("infoSide", infoSide);
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
		
		BoardContactDto boardContactDto = serviceCenterDao.infoFile(num);
		LogAspect.info("다운로드 넘버 스트링링 : " + boardContactDto.toString());
		
		BufferedInputStream bis = null;
		BufferedOutputStream bos = null;
				
		
		try {
			int index = boardContactDto.getFile_name().indexOf("_") + 1;
			String bfFileName = boardContactDto.getFile_name().substring(index);
			String fileName = new String(bfFileName.getBytes("UTF-8"), "ISO-8859-1");
			
			response.setContentType("application/octet-stream");
			response.setContentLengthLong(boardContactDto.getFile_size());
			response.setHeader("Content-Disposition", "attachment;filename=" + fileName + ";");
			
			
			
			bis = new BufferedInputStream(new FileInputStream(boardContactDto.getFile_path()));
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
				if(bis!=null) bis.close();
				if(bos!=null) bos.close();
			}catch(Exception e) {
				e.printStackTrace();
			}	
		}
		
		mav.setViewName("serviceCenter/inquriy_list2.solo");
	}


	@Override
	public void inquriyWrite(ModelAndView mav) {
		
		Map<String, Object> map = mav.getModel();
		
		HttpServletRequest request = (HttpServletRequest) map.get("request");		
		
		mav.setViewName("serviceCenter/inquriy.solo");
		
	}


	@Override
	public void inquriyWriteOk(ModelAndView mav) {
		
		Map<String, Object> map = mav.getModel();
		
		MultipartHttpServletRequest request = (MultipartHttpServletRequest) map.get("request");

		BoardContactDto boardContactDto = (BoardContactDto) map.get("boardContactDto");
								
		MultipartFile fileUp = request.getFile("file");
		String fileName = Long.toString(System.currentTimeMillis()) + "_" + fileUp.getOriginalFilename();
		int fileSize = (int) fileUp.getSize();
		
		if(fileSize == 0) {
			LogAspect.info("파일 없지롱");
		}else {
			LogAspect.info("파일 이름 /사이즈 확인 : " + fileName + " / " + fileSize);
		}		
		
		if(fileSize !=0) {
			File path = new File("C:\\BookFactory\\");
			
			path.mkdir();
			
			if(path.exists() && path.isDirectory()) {
				File file = new File(path, fileName);
				try {
					fileUp.transferTo(file);
				}catch (Exception e) {
					e.printStackTrace();
				}
				
				boardContactDto.setFile_path(file.getAbsolutePath());
				boardContactDto.setFile_name(fileName);
				boardContactDto.setFile_size(fileSize);	
			}
		}
		
		User user = (User) request.getSession().getAttribute("userInfo");				
	    boardContactDto.setId(user.getUsername());
	    
		boardContactDto.setWrite_date(new Date());		
		boardContactDto.setContent(boardContactDto.getContent().replace("\r\n", "<br/>"));
		
		LogAspect.info("디티오 확인 : " + boardContactDto.toString() );
		
		int check = serviceCenterDao.inquriyWrite(boardContactDto);
		LogAspect.info("write값 확인 : " + check);
		
		mav.addObject("check", check);
		mav.setViewName("serviceCenter/inquriyOk.solo");
			
			
	}


	@Override
	public void inquriyList(ModelAndView mav) {
		
		Map<String, Object> map = mav.getModel();
		
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		
		int count = serviceCenterDao.inquriyCount();
		
		LogAspect.info("1:1문의내역 갯수확인 : " + count);
		
		List<BoardContactDto> inquriyList = null;
		
		User user = (User)request.getSession().getAttribute("userInfo");
		if (user == null) {
			String referer = request.getHeader("referer");
			if (referer == null) {
				referer = "serviceCenter/main.solo";
			}
			mav.setViewName(referer);
			return;
		}
		String id = user.getUsername();
		
		LogAspect.info("유저 확인 : " + id);
				
		if(count > 0) {
			inquriyList = serviceCenterDao.inquriylistlist(id);
			LogAspect.info("1:1문의 내역 디티오 : : " + inquriyList.toString());
		}
		
		
		
		mav.addObject("id", id);
		
		mav.addObject("inquriyList", inquriyList);
		mav.addObject("count", count);
		
		mav.setViewName("serviceCenter/inquriy_list2.solo");
	}


	@Override
	public void inquriyAnswer(ModelAndView mav) {
		Map<String, Object> map = mav.getModelMap();
		
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		
		int num = Integer.parseInt(request.getParameter("num"));
		
		LogAspect.info("1:1 답변 읽어오기 확인중 : " + num); 
		
		BoardContactDto boardContactDto = serviceCenterDao.inquriyAnswer(num);
		LogAspect.info("1:1 Dto 확인하깅 : " + boardContactDto.toString());
		
		mav.addObject("boardContactDto", boardContactDto);
		
		mav.setViewName("serviceCenter/inquriy_answer.solo");
		
	}


	@Override
	public void serviceCenterQuestion(ModelAndView mav) {
		Map<String, Object> map = mav.getModelMap();
		
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		
		int count = serviceCenterDao.questionCount();
		LogAspect.info("자주묻는 질문 갯수 : " + count);
		
		List<BoardFrequencyDto> questionList = null;
		
		if(count > 0) {
			questionList = serviceCenterDao.questionMain();
			LogAspect.info("자주묻는 질문 사이증 : " + questionList.size());
			LogAspect.info("투스트링" + questionList.toString());
		}
		
		mav.addObject("count", count);
		mav.addObject("questionList", questionList);		
		
		mav.setViewName("serviceCenter/manyque.solo");
	}


	@Override
	public void serviceCenterManyQuestionContent(ModelAndView mav) {
		
		Map<String, Object> map = mav.getModelMap();
		
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		
		int num = Integer.parseInt(request.getParameter("num"));
		LogAspect.info("자주묻는 질문 넘버 확인 : " + num);
		
		int count = serviceCenterDao.questionCount();
		
		BoardFrequencyDto boardFrequencyDto = serviceCenterDao.questionRead(num);
		LogAspect.info("boardFrequencyDto 확인 : " + boardFrequencyDto.toString() );
		
		List<BoardFrequencyDto> questionList = serviceCenterDao.questionMain();		
		LogAspect.info("사이드 리스트 사이즈 확인확인 : " + questionList.size());
	
		List<BoardFrequencyDto> questionSide = serviceCenterDao.questionSide();
		
		mav.addObject("boardFrequencyDto", boardFrequencyDto);
		mav.addObject("questionList", questionList);
		mav.addObject("questionSide", questionSide);
		mav.addObject("count", count);
		
		mav.setViewName("serviceCenter/manyque_content.solo");
	}


	@Override
	public void serviceCenterMain(ModelAndView mav) {

		Map<String, Object> map = mav.getModelMap();
		
		HttpServletRequest request = (HttpServletRequest) map.get("request");
				
		List<NoticeDto> mainNotice = serviceCenterDao.mainNotice();
		LogAspect.info("메인 / 공지사항 확인 : " + mainNotice.toString()); 
		
		List<BoardFrequencyDto> mainMany = serviceCenterDao.mainMany();
		LogAspect.info("메인 / 자주 묻는 질문 확인 : " + mainMany.toString());
		
		mav.addObject("mainNotice", mainNotice);
		mav.addObject("mainMany", mainMany);
		
		mav.setViewName("serviceCenter/main.solo");
		
	}


	@Override
	public void serviceCenterIdLogin(ModelAndView mav) {

		Map<String, Object> map = mav.getModelMap();
		
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		
		List<BoardFrequencyDto> idLoginList = serviceCenterDao.idLoginMain();
		LogAspect.info("메인 화면 아래 아이디/로그인 : " + idLoginList.toString());
		
		mav.addObject("idLoginList", idLoginList);		
		
		mav.setViewName("serviceCenter/id_login.solo");
		
	}


	@Override
	public void serviceCenterIdLoginContent(ModelAndView mav) {
		
		Map<String, Object> map = mav.getModelMap();
		
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		
		int num = Integer.parseInt(request.getParameter("num"));		
		LogAspect.info("아이디/로그인 넘버 확인 : " + num);
		
		int category = 1;
		int count = serviceCenterDao.categoryCount(category);
		
		
		BoardFrequencyDto idLoginRead = serviceCenterDao.questionRead(num);
		List<BoardFrequencyDto> idLoginSide = serviceCenterDao.idLoginSide();
		
		
		mav.addObject("idLoginRead", idLoginRead);
		mav.addObject("idLoginSide", idLoginSide);
		mav.addObject("count", count);
		
		mav.setViewName("serviceCenter/id_login_content.solo");
		
	}


	@Override
	public void serviceCenterPayRefund(ModelAndView mav) {
		Map<String, Object> map = mav.getModelMap();
		
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		
		List<BoardFrequencyDto> payRefundList = serviceCenterDao.payRefundMain();
		LogAspect.info("메인 화면 아래 결제/환불 : " + payRefundList.toString());
		
		mav.addObject("payRefundList", payRefundList);		
		
		mav.setViewName("serviceCenter/pay_refund.solo");
		
	}


	@Override
	public void serviceCenterPayRefundContent(ModelAndView mav) {
		Map<String, Object> map = mav.getModelMap();
		
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		
		int num = Integer.parseInt(request.getParameter("num"));		
		LogAspect.info("아이디/로그인 넘버 확인 : " + num);
		
		BoardFrequencyDto payRefundRead = serviceCenterDao.questionRead(num);
		List<BoardFrequencyDto> payRefundSide = serviceCenterDao.payRefundSide();
		int category = 2;
		int count = serviceCenterDao.categoryCount(category);
		
		mav.addObject("payRefundRead", payRefundRead);
		mav.addObject("payRefundSide", payRefundSide);
		mav.addObject("count", count);
		
		mav.setViewName("serviceCenter/pay_refund_content.solo");
		
	}


	@Override
	public void serviceCenterHowUse(ModelAndView mav) {
		Map<String, Object> map = mav.getModelMap();
		
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		
		List<BoardFrequencyDto> howUseList = serviceCenterDao.howUseMain();
		LogAspect.info("이용문의 : " + howUseList.toString());
		
		mav.addObject("howUseList", howUseList);		
		
		mav.setViewName("serviceCenter/how_use.solo");
		
	}


	@Override
	public void serviceCenterHowUseContent(ModelAndView mav) {
		Map<String, Object> map = mav.getModelMap();
		
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		
		int num = Integer.parseInt(request.getParameter("num"));		
		LogAspect.info("이용문의 넘버 확인잉잉 : " + num);
		
		BoardFrequencyDto howUseRead = serviceCenterDao.questionRead(num);
		List<BoardFrequencyDto> howUseSide = serviceCenterDao.howUseSide();
		int category = 3;
		int count = serviceCenterDao.categoryCount(category);
		
		mav.addObject("howUseRead", howUseRead);
		mav.addObject("howUseSide", howUseSide);
		mav.addObject("count", count);
		
		mav.setViewName("serviceCenter/how_use_content.solo");
		
	}


	@Override
	public void serviceCenterErrorUse(ModelAndView mav) {
		Map<String, Object> map = mav.getModelMap();
		
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		
		List<BoardFrequencyDto> errorUseList = serviceCenterDao.errorUseMain();
		LogAspect.info("오류 활용 : " + errorUseList.toString());
		
		mav.addObject("errorUseList", errorUseList);		
		
		mav.setViewName("serviceCenter/error_use.solo");
		
	}


	@Override
	public void serviceCenterErrorUseContent(ModelAndView mav) {
		Map<String, Object> map = mav.getModelMap();
		
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		
		int num = Integer.parseInt(request.getParameter("num"));		
		LogAspect.info("오류활용 넘버 확인 : " + num);
		
		BoardFrequencyDto errorUseRead = serviceCenterDao.questionRead(num);
		List<BoardFrequencyDto> errorUseSide = serviceCenterDao.errorUseSide();
		int category = 4;
		int count = serviceCenterDao.categoryCount(category);
		
		mav.addObject("errorUseRead", errorUseRead);
		mav.addObject("errorUseSide", errorUseSide);
		mav.addObject("count", count);
		
		mav.setViewName("serviceCenter/error_use_content.solo");
		
	}


	@Override
	public void serviceCenterSystemUpdate(ModelAndView mav) {
		Map<String, Object> map = mav.getModelMap();
		
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		
		List<BoardFrequencyDto> systemUpdateList = serviceCenterDao.systemUpdateMain();
		LogAspect.info("시스템 업데이트  : " + systemUpdateList.toString());
		
		mav.addObject("systemUpdateList", systemUpdateList);		
		
		mav.setViewName("serviceCenter/system_update.solo");
		
	}


	@Override
	public void serviceCenterSystemUpdateContent(ModelAndView mav) {
		Map<String, Object> map = mav.getModelMap();
		
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		
		int num = Integer.parseInt(request.getParameter("num"));		
		LogAspect.info("시스템 업뎃 넘버 화긴확인 : " + num);
		
		BoardFrequencyDto systemUpdateRead = serviceCenterDao.questionRead(num);
		List<BoardFrequencyDto> systemUpdateSide = serviceCenterDao.systemUpdateSide();
		int category = 5;
		int count = serviceCenterDao.categoryCount(category);
		
		mav.addObject("systemUpdateRead", systemUpdateRead);
		mav.addObject("systemUpdateSide", systemUpdateSide);
		mav.addObject("count", count);
		
		mav.setViewName("serviceCenter/system_update_content.solo");
		
	}


	@Override
	public void bookSuggestionWrite(ModelAndView mav) {
		Map<String, Object> map = mav.getModel();
		
		HttpServletRequest request = (HttpServletRequest) map.get("request");		
		
		mav.setViewName("serviceCenter/book_suggestion.solo");
		
	}


	@Override
	public void bookSuggestionWriteOk(ModelAndView mav) {
		Map<String, Object> map = mav.getModel();
		
		HttpServletRequest request = (HttpServletRequest) map.get("request");

		BookContactDto bookContactDto = (BookContactDto) map.get("bookContactDto");
		
		User user = (User) request.getSession().getAttribute("userInfo");				
		bookContactDto.setId(user.getUsername());
	    
		bookContactDto.setWrite_date(new Date());
		
		LogAspect.info("디티오 확인 : " + bookContactDto.toString() );
		
		int check = serviceCenterDao.bookSuggestionWrite(bookContactDto);
		LogAspect.info("write값 확인 : " + check);
		
		mav.addObject("check", check);
		mav.setViewName("serviceCenter/inquriyOk.solo");
		
	}

	
	
	
}
