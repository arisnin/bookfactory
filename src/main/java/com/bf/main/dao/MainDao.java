package com.bf.main.dao;

import java.util.List;

import com.bf.member.model.MemberDto;

/**
 * @Date 2018. 2. 4.
 * @Author 박성호
 * @Description
 */
public interface MainDao {

	public int register(MemberDto memberDto);

	public String idCheck(String id);

	public int noticeMainCount();

	public List<String> registerValidation(String type, String keyword);


	//public List<NoticeDto> noticeMain(int startRow, int endRow);

}
