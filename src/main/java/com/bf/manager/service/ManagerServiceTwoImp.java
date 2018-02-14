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
import com.bf.manager.dao.ManagerDaoTwo;
import com.bf.manager.dto.BoardFrequencyDto;

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

}
