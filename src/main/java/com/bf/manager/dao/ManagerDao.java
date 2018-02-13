package com.bf.manager.dao;

import com.bf.manager.dto.PublisherDto;

/**
 * @이름: 염현우
 * @날짜: 2018. 2. 12.
 * @설명: 
 */
public interface ManagerDao {

	public int insertCategory(String name);

	public int insertBookCateSecond(String name, int cate1);

	public int insertBookCateThird(String name, int cateNum);

	public int checkCategory();

	public int publisherInsertOk(PublisherDto publisherDto);
	
}
