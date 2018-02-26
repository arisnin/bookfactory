package com.bf.serviceCenter.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.bf.manager.dto.BoardContactDto;
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
	public List<ServiceCenterDtoFre> infoMain() {
		return sqlSession.selectList(namespace + "infoMain");
	}

	@Override
	public ServiceCenterDtoFre infoRead(int num) {
		
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
	
	
}
