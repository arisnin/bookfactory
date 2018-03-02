package com.bf.serviceCenter.dao;

import java.util.List;

import com.bf.main.dto.NoticeDto;
import com.bf.manager.dto.BoardContactDto;
import com.bf.manager.dto.BoardFrequencyDto;
import com.bf.member.model.User;
import com.bf.serviceCenter.dto.BookContactDto;
import com.bf.serviceCenter.dto.ServiceCenterDtoFre;

/**
 * @author 박성호
 * @date 2018. 2. 14.
 * @description 고객센터 DAO 인터페이스
 */
public interface ServiceCenterDao {

	int infoCount();

	List<NoticeDto> infoMain();

	NoticeDto infoRead(int num);

	BoardContactDto infoFile(int num);

	int inquriyWrite(BoardContactDto boardContactDto);

	int inquriyCount();

	List<BoardContactDto> inquriylistlist(String id);

	BoardContactDto inquriyAnswer(int num);

	List<NoticeDto> infoSide();

	int questionCount();

	List<BoardFrequencyDto> questionMain();

	BoardFrequencyDto questionRead(int num);

	List<BoardFrequencyDto> questionSide();

	List<NoticeDto> mainNotice();

	List<BoardFrequencyDto> mainMany();

	List<BoardFrequencyDto> idLoginMain();

	List<BoardFrequencyDto> idLoginSide();

	List<BoardFrequencyDto> payRefundMain();

	List<BoardFrequencyDto> payRefundSide();

	List<BoardFrequencyDto> howUseMain();

	List<BoardFrequencyDto> howUseSide();

	List<BoardFrequencyDto> errorUseMain();

	List<BoardFrequencyDto> errorUseSide();

	List<BoardFrequencyDto> systemUpdateMain();

	List<BoardFrequencyDto> systemUpdateSide();

	int categoryCount(int category);

	int bookSuggestionWrite(BookContactDto bookContactDto);


}
