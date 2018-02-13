package com.bf.manager.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.bf.manager.dto.BoardFrequencyDto;
import com.bf.manager.dto.AuthorDto;
import com.bf.manager.dto.BookFirstCateDto;
import com.bf.manager.dto.BookSecondCateDto;
import com.bf.manager.dto.BookThirdCateDto;
import com.bf.manager.dto.CountryDto;
import com.bf.manager.dto.PublisherDto;

/**
 * @이름: 염현우
 * @날짜: 2018. 2. 12.
 * @설명: 
 */
@Component
public class ManagerDaoImp implements ManagerDao {
	@Autowired
	private SqlSessionTemplate sqlSession;

	
	


	@Override
	public int insertCategory(String name) {
		return sqlSession.insert("com.bf.mapper.BookMapper.insertCateSecond",name);
	}

	@Override
	public int insertBookCateSecond(String name, int cate1) {
		HashMap<String,Object> map = new HashMap<String,Object>();
		map.put("name", name);
		map.put("cate1", cate1);
		int check = sqlSession.insert("com.bf.mapper.BookMapper.insertBookCateSecond", map);
		if(check == 0) {
			return -1;
		}
		return sqlSession.selectOne("com.bf.mapper.BookMapper.getMaxNum");
	}

	@Override
	public int insertBookCateThird(String name, int cateNum) {
		//책의 소분류 카테고리
		HashMap<String,Object> map = new HashMap<String,Object>();
		map.put("name", name);
		map.put("cateNum", cateNum);
		return sqlSession.insert("com.bf.mapper.BookMapper.insertBookCateThird", map);
	}

	@Override
	public int checkCategory() {
		return sqlSession.selectOne("com.bf.mapper.BookMapper.getMaxNum");
	}
	
	@Override
	public int publisherInsertOk(PublisherDto publisherDto) {
		return sqlSession.insert("com.bf.mapper.PublisherMapper.publisherInsert", publisherDto);
	}
	
	@Override
	public int publisherNameCheck(String name) {
		return sqlSession.selectOne("com.bf.mapper.PublisherMapper.nameCheck", name);
	}
	
	@Override
	public List<CountryDto> getCountry() {
		return sqlSession.selectList("com.bf.mapper.AuthorMapper.getCountry");
	}
	
	@Override
	public int authorInsertOk(AuthorDto authorDto) {
		return sqlSession.insert("com.bf.mapper.AuthorMapper.insert", authorDto);
	}
	
	@Override
	public List<BookFirstCateDto> getFirstCate() {
		return sqlSession.selectList("com.bf.mapper.BookMapper.getFirstCate");
	}
	
	@Override
	public List<BookSecondCateDto> bookCateOne(String name) {
		int num = sqlSession.selectOne("com.bf.mapper.BookMapper.getCateOneNum", name);
		return sqlSession.selectList("com.bf.mapper.BookMapper.getCateTwoList", num);
	}
	
	@Override
	public List<BookThirdCateDto> bookCateTwo(String name) {
		int num = sqlSession.selectOne("com.bf.mapper.BookMapper.getCateTwoNum", name);
		return sqlSession.selectList("com.bf.mapper.BookMapper.getCateThreeList", num);
	}
	
	@Override
	public List<PublisherDto> getPublisherList(int startRow, int endRow) {
		HashMap<String,Integer> map = new HashMap<String,Integer>();
		map.put("startRow",startRow);
		map.put("endRow",endRow);
		return sqlSession.selectList("com.bf.mapper.PublisherMapper.getPublisher1",map);
	}
	
	@Override
	public List<PublisherDto> getPublisherList(String searchWord,int startRow, int endRow) {
		HashMap<String,Object> map = new HashMap<String,Object>();
		map.put("startRow",startRow);
		map.put("endRow",endRow);
		map.put("searchWord", searchWord);
		return sqlSession.selectList("com.bf.mapper.PublisherMapper.getPublisher2",map);
	}

	@Override
	public int getPublisherCount() {
		return sqlSession.selectOne("com.bf.mapper.PublisherMapper.getCount");
	}
}
