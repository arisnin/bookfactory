package com.bf.manager.service;

import java.io.File;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.bf.aop.LogAspect;
import com.bf.book.dto.ReviewDto;
import com.bf.manager.dao.ManagerDaoTwo;
import com.bf.manager.dto.AccuseDto;
import com.bf.manager.dto.BoardContactDto;
import com.bf.manager.dto.BoardFrequencyDto;
import com.bf.manager.dto.BookDto;
import com.bf.manager.dto.ManagerNoticeDto;
import com.bf.manager.dto.MemberDto;
import com.bf.manager.dto.ReviewManagerDto;

/**
 * @이름: 염현우 X 전상헌
 * @날짜: 2018. 2. 13.
 * @설명: ManagerServiceTwo
 */

@Component
public class ManagerServiceTwoImp implements ManagerServiceTwo {
	@Autowired
	private ManagerDaoTwo managerDao;

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
	public void boardList(ModelAndView mav) {
		Map<String, Object> map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		String pageNumber = request.getParameter("pageNumber");
		String word = request.getParameter("search-word");
		String sDate = request.getParameter("startDate");
		String eDate = request.getParameter("endDate");
		Date startDate = null;
		Date endDate = null;

		try {
			if (sDate != null && eDate != null) {
				startDate = new SimpleDateFormat("yyyy-MM-dd").parse(sDate);
				endDate = new SimpleDateFormat("yyyy-MM-dd").parse(eDate);
				LogAspect.logger.info(LogAspect.logMsg + startDate + "zzzzzzzzzzzzzzzz" + endDate);
			}
		} catch (Exception e) {

			e.printStackTrace();
		}

		if (pageNumber == null)
			pageNumber = "1";
		int boardSize = 5;

		int currentPage = Integer.parseInt(pageNumber);

		int starRow = (currentPage - 1) * boardSize + 1;
		int endRow = currentPage * boardSize + 1;

		int count = managerDao.Boardcount();

		LogAspect.logger.info(LogAspect.logMsg + count + "-------------" + currentPage);

		List<BoardFrequencyDto> freDtoList = null;
		if (count > 0) {
			if (startDate != null && endDate != null) {
				freDtoList = managerDao.boardSearchDate(starRow, endRow, startDate, endDate);
				LogAspect.logger.info(LogAspect.logMsg + freDtoList + startDate + endDate);

			} else if (word != null) {
				freDtoList = managerDao.boardSearch(starRow, endRow, word);
				LogAspect.logger.info(LogAspect.logMsg + freDtoList);
			} else {
				freDtoList = managerDao.boardList(starRow, endRow);
				LogAspect.logger.info(LogAspect.logMsg + freDtoList);
			}
		}
		mav.addObject("freDtoList", freDtoList);
		mav.addObject("pageNumber", currentPage);
		mav.addObject("count", count);
		mav.addObject("boardSize", boardSize);

		mav.setViewName("board/list.mg");
	}

	@Override
	public void boardContact(ModelAndView mav) {
		Map<String, Object> map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		String pageNumber = request.getParameter("pageNumber");

		String word = request.getParameter("search-word");
		String sDate = request.getParameter("startDate");
		String eDate = request.getParameter("endDate");
		Date startDate = null;
		Date endDate = null;
		try {
			if (sDate != null && eDate != null) {
				startDate = new SimpleDateFormat("yyyy-MM-dd").parse(sDate);
				endDate = new SimpleDateFormat("yyyy-MM-dd").parse(eDate);
				LogAspect.logger.info(LogAspect.logMsg + startDate + "zzzzzzzzzzzzzzzz" + endDate);
			}
		} catch (Exception e) {

			e.printStackTrace();
		}

		if (pageNumber == null)
			pageNumber = "1";
		int boardSize = 5;

		int currentPage = Integer.parseInt(pageNumber);

		int startRow = (currentPage - 1) * boardSize + 1;
		int endRow = currentPage * boardSize + 1;

		int count = managerDao.BoardContactcount();

		LogAspect.logger.info(LogAspect.logMsg + count + "-------------" + currentPage);

		List<BoardContactDto> contactDtoList = null;
		if (count > 0) {
			contactDtoList = managerDao.boardContact(startRow, endRow);
			LogAspect.logger.info(LogAspect.logMsg + contactDtoList);


		}
		mav.addObject("contactDtoList", contactDtoList);
		mav.addObject("pageNumber", currentPage);
		mav.addObject("count", count);
		mav.addObject("boardSize", boardSize);

		mav.setViewName("board/contact.mg");
	}

	@Override
	public void boardReply(ModelAndView mav) {
		Map<String, Object> map = mav.getModel();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		BoardContactDto boardContactDto = (BoardContactDto) map.get("boardContactDto");
		String pageNumber=request.getParameter("pageNumber");
		
		
		/*		String date = request.getParameter("writeDate");
		LogAspect.info(date);
		Date write_date = null;

	try {
			write_date = new SimpleDateFormat("yyyy-MM-dd").parse(date);
			boardContactDto.setWrite_date(write_date);
		} catch (ParseException e) {
			e.printStackTrace();
		}*/
		
		LogAspect.info(boardContactDto);
		mav.addObject("boardContactDto", boardContactDto);
		mav.addObject("pageNumber", pageNumber);
		mav.setViewName("board/reply.mg");
		
	}
	@Override
	public void boardReplyOk(ModelAndView mav) {
		Map<String, Object> map = mav.getModel();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		BoardContactDto boardContactDto = (BoardContactDto) map.get("boardContactDto");
		String pageNumber=request.getParameter("pageNumber");
		
		Date reply_date = new Date();
		
		boardContactDto.setReply_date(reply_date);
		
		
	}
	
	
	
	@Override
	public void memberList(ModelAndView mav) {
		Map<String, Object> map = mav.getModel();
		HttpServletRequest request = (HttpServletRequest) map.get("request");

		String pageNumber = request.getParameter("pageNumber");
		String word = request.getParameter("search-word");
		String sDate = request.getParameter("startDate");
		String eDate = request.getParameter("endDate");
		Date startDate = null;
		Date endDate = null;

		try {
			if (sDate != null && eDate != null) {
				startDate = new SimpleDateFormat("yyyy-MM-dd").parse(sDate);
				endDate = new SimpleDateFormat("yyyy-MM-dd").parse(eDate);
				LogAspect.logger.info(LogAspect.logMsg + startDate + "zzzzzzzzzzzzzzzz" + endDate);
			}
		} catch (Exception e) {

			e.printStackTrace();
		}

		if (pageNumber == null)
			pageNumber = "1";
		int boardSize = 5;

		int currentPage = Integer.parseInt(pageNumber);

		int starRow = (currentPage - 1) * boardSize + 1;
		int endRow = currentPage * boardSize + 1;

		int count = managerDao.memberCount();
		LogAspect.logger.info(LogAspect.logMsg + count);

		List<MemberDto> memberDtoList = null;
		if (count > 0) {
			memberDtoList = managerDao.memberList(starRow, endRow);
			LogAspect.logger.info(LogAspect.logMsg + memberDtoList);
	
		}
		mav.addObject("memberDto", memberDtoList);
		mav.addObject("pageNumber", currentPage);
		mav.addObject("count", count);
		mav.addObject("boardSize", boardSize);

		mav.setViewName("member/member.mg");

	}

	@Override
	public void memberRegister(ModelAndView mav) {

		Map<String, Object> map = mav.getModel();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		String img = null;

		String id = request.getParameter("id");
		String pageNumber = request.getParameter("pageNumber");
		LogAspect.logger.info(LogAspect.logMsg + id);

		MemberDto memberDto = managerDao.register(id);

		LogAspect.logger.info(LogAspect.logMsg + memberDto);

		if (memberDto.getGender().equals("male")) {
			img = "/img/manager/man.jpg";
		} else if (memberDto.getGender().equals("female")) {
			img = "/img/manager/woman.jpg";
		}

		mav.addObject("memberDto", memberDto);
		mav.addObject("pageNumber", pageNumber);
		mav.addObject("img", img);
		mav.setViewName("member/register.mg");
	}

	@Override
	public void memberRegisterOk(ModelAndView mav) {
		Map<String, Object> map = mav.getModel();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		MemberDto memberDto = (MemberDto) map.get("memberDto");
		String pageNumber = request.getParameter("pageNumber");

		LogAspect.logger.info(LogAspect.logMsg + memberDto);
		LogAspect.logger.info(LogAspect.logMsg + pageNumber);
		memberDto.setId(request.getParameter("id"));
		memberDto.setName(request.getParameter("name"));
		memberDto.setEmail(request.getParameter("email"));
		memberDto.setPassword(request.getParameter("password"));
		memberDto.setRole(request.getParameter("role"));

		int check = managerDao.registerOk(memberDto);
		LogAspect.logger.info(LogAspect.logMsg + check);

		mav.addObject("check", check);
		mav.addObject("pageNumber", pageNumber);
		mav.addObject("memberDto", memberDto);
		mav.setViewName("member/registerOk.mg");
	}

	@Override
	public void memberDelete(ModelAndView mav) {
		Map<String, Object> map = mav.getModel();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		String id = request.getParameter("id");

		String pageNumber = request.getParameter("pageNumber");
		LogAspect.logger.info(LogAspect.logMsg + id);

		int check = managerDao.registerDelete(id);
		LogAspect.logger.info(LogAspect.logMsg + check);

		mav.addObject("pageNumber", pageNumber);
		mav.addObject("id", id);
		mav.addObject("check", check);
		mav.setViewName("member/delete.mg");

	}

	@Override
	public void memberPayDetail(ModelAndView mav) {
		Map<String, Object> map = mav.getModel();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		String id = request.getParameter("id");
		String pageNumber = request.getParameter("pageNumber");
		LogAspect.logger.info(LogAspect.logMsg + id);

	}

	@Override
	public void managerReview(ModelAndView mav) {

		Map<String, Object> map = mav.getModel();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		String pageNumber = request.getParameter("pageNumber");

		if (pageNumber == null)
			pageNumber = "1";
		int boardSize = 5;

		int currentPage = Integer.parseInt(pageNumber);

		int startRow = (currentPage - 1) * boardSize + 1;
		int endRow = currentPage * boardSize + 1;

		int count = managerDao.reviewCount();
		LogAspect.logger.info(LogAspect.logMsg + count);

		List<ReviewManagerDto> reviewDtoList = null;

		if (count > 0) {
			reviewDtoList = managerDao.reviewList(startRow, endRow);
			LogAspect.logger.info(LogAspect.logMsg + reviewDtoList);
		}

		mav.addObject("reviewDtoList", reviewDtoList);
		mav.addObject("pageNumber", currentPage);
		mav.addObject("count", count);
		mav.addObject("boardSize", boardSize);

		mav.setViewName("review/review.mg");

	}

	@Override
	public void managerReviewReport(ModelAndView mav) {
		Map<String, Object> map = mav.getModel();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		ReviewManagerDto reviewManagerDto = (ReviewManagerDto) map.get("ReviewManagerDto");

		int num = reviewManagerDto.getR_num();
		int count = reviewManagerDto.getCount();
		LogAspect.info("num:" + num);

		String pageNumber = request.getParameter("pageNumber");

		List<AccuseDto> accuseDtoList = null;
		if (pageNumber == null)
			pageNumber = "1";
		int boardSize = 5;

		int currentPage = Integer.parseInt(pageNumber);

		int starRow = (currentPage - 1) * boardSize + 1;
		int endRow = currentPage * boardSize + 1;

		if (count > 0) {
			accuseDtoList = managerDao.accuseList(num, starRow, endRow);
			LogAspect.info(accuseDtoList);
		}

		mav.addObject("count", count);
		mav.addObject("pageNumber", pageNumber);
		mav.addObject("accuseDtoList", accuseDtoList);
		mav.addObject("boardSize", boardSize);
		mav.setViewName("review/report.mg");

	}

	@Override
	public void managerNoticeInsert(ModelAndView mav) {
		Map<String, Object> map = mav.getModel();
		HttpServletRequest request = (HttpServletRequest) map.get("request");

		ManagerNoticeDto noticeDto = new ManagerNoticeDto();

		noticeDto.setWrite_date(new Date());
		noticeDto.setId("admin");
		String boardNumber = request.getParameter("num");

		if (boardNumber == null)
			boardNumber = "1";
		int num = Integer.parseInt(boardNumber);

		mav.addObject("noticeDto", noticeDto);
		mav.addObject("num", num);
		mav.setViewName("board/noticeInsert.mg");
	}

	@Override
	public void boardNoticeInsertOk(ModelAndView mav) {

		Map<String, Object> map = mav.getModel();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		int num = Integer.parseInt(request.getParameter("num"));
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		String id = request.getParameter("id");
		ManagerNoticeDto noticeDto = new ManagerNoticeDto();

		String date = request.getParameter("write_date");
		Date write_date = null;

		try {
			write_date = new SimpleDateFormat("yyyy-MM-dd").parse(date);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		noticeDto.setWrite_date(write_date);
		noticeDto.setId(id);
		noticeDto.setContent(content);
		noticeDto.setNum(num);
		noticeDto.setTitle(title);

		LogAspect.logger.info(LogAspect.logMsg + noticeDto);

		int check = managerDao.BoardNoitceInsertOk(noticeDto);

		LogAspect.logger.info(LogAspect.logMsg + check);

		mav.addObject("check", check);
		mav.setViewName("board/noticeInsertOk.mg");
	}



}
