package com.bf.main.dao;

import java.util.List;

import com.bf.main.dto.NoticeDto;
import com.bf.main.dto.RegisterDto;

/**
 * @Date 2018. 2. 4.
 * @Author 박성호
 * @Description
 */
public interface MainDao {

	public int register(RegisterDto registerDto);

	public int noticeMainCount();


	//public List<NoticeDto> noticeMain(int startRow, int endRow);

}
