package com.bf.serviceCenter.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.bf.main.dto.NoticeDto;
import com.bf.manager.dto.BoardContactDto;
import com.bf.manager.dto.BoardFrequencyDto;
import com.bf.serviceCenter.dto.ServiceCenterDtoFre;

/**
 * @author 박성호
 * @date 2018. 2. 14.
 * @description 고객센터 DAO 구현 클래스
 */
@Component
public class ServiceCenterDaoImp implements ServiceCenterDao {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	private final String namespace = "com.bf.mapper.ServiceCenterMapper.";

	@Override
	public int infoCount() {
		return sqlSession.selectOne(namespace + "infoCount");
	}

	@Override
	public List<NoticeDto> infoMain() {
		return sqlSession.selectList(namespace + "infoMain");
	}

	@Override
	public NoticeDto infoRead(int num) {
		
		return sqlSession.selectOne(namespace + "infoRead", num);
	}

	@Override
	public ServiceCenterDtoFre infoFile(int num) {
		return sqlSession.selectOne(namespace + "infoRead", num);
	}

	@Override
	public int inquriyWrite(BoardContactDto boardContactDto) {
		int check = 0;
		
		if(boardContactDto.getFile_size()== 0) {
			check = sqlSession.insert(namespace + "board_ContactInsert", boardContactDto);
		}else {
			check = sqlSession.insert(namespace + "board_ContactFileInsert", boardContactDto); 
		}
		
		return check;
	}

	@Override
	public int inquriyCount() {
		
		return sqlSession.selectOne(namespace + "inquriyCount");
	}

	@Override
	public List<BoardContactDto> inquriylistlist() {
		return sqlSession.selectList(namespace + "inquriylistlist");
	}

	@Override
	public BoardContactDto inquriyAnswer(int num) {
		return sqlSession.selectOne(namespace + "inquriyAnswer", num);
	}

	@Override
	public List<NoticeDto> infoSide() {
		return sqlSession.selectList(namespace + "infoSide");
	}

	@Override
	public int questionCount() {
		return sqlSession.selectOne(namespace + "questionCount");
	}

	@Override
	public List<BoardFrequencyDto> questionMain() {
		return sqlSession.selectList(namespace + "questionMain");
	}

	@Override
	public BoardFrequencyDto questionRead(int num) {
		return sqlSession.selectOne(namespace + "questionRead", num);
	}

	@Override
	public List<BoardFrequencyDto> questionSide() {
		return sqlSession.selectList(namespace + "questionSide");
	}

	@Override
	public List<NoticeDto> mainNotice() {
		return sqlSession.selectList(namespace + "mainNotice");
	}

	@Override
	public List<BoardFrequencyDto> mainMany() {
		return sqlSession.selectList(namespace + "mainMany");
	}
	
	
	
}
