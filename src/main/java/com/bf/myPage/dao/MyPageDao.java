package com.bf.myPage.dao;

import java.util.List;

import com.bf.myPage.dto.MyPageCashChargeDto;
import com.bf.myPage.dto.MyPageCashPageDto;
import com.bf.myPage.dto.MyPagePointDto;
import com.bf.myPage.dto.MyPagePurchasedPageDto;
import com.bf.myPage.dto.MyPageRecentPageDto;
import com.bf.order.dto.OrderDto;

/**
 * @author	박성호
 * @date	2018. 2. 12.
 * @description	마이페이지 DAO 인터페이스
 */
public interface MyPageDao {

	int pointInsert(MyPagePointDto myPagePointDto);

	List<MyPagePointDto> myPointList(String id);

	int cashChargeInsert(MyPageCashChargeDto myPageCashChargeDto);

	List<MyPageCashPageDto> myCashPageList(String id);

	int myPointExtinctionSelect(String id);

	List<MyPageRecentPageDto> MyRecentPageList(String id);

	List<MyPagePurchasedPageDto> PurchasedPageList(String id);

	int PurchasedDelete(String id, List<String> book_num);

	int RecentDelete(String id);

	OrderDto HistoryCashClick(String id, long order_num);

	List<MyPagePurchasedPageDto> PurchasedPageList(String id, String searchValue);

	List<MyPagePurchasedPageDto> PurchasedPageFiveList(String id);

	List<MyPageRecentPageDto> MyRecentPageFiveList(String id);


}
