package com.bf.myPage.dao;

import java.util.List;

import com.bf.book.dto.ReviewDto;
import com.bf.member.model.MemberDto;
import com.bf.myPage.dto.MyPageCashChargeDto;
import com.bf.myPage.dto.MyPageCashPageDto;
import com.bf.myPage.dto.MyPagePointDto;
import com.bf.myPage.dto.MyPagePurchasedPageDto;
import com.bf.myPage.dto.MyPageRecentPageDto;
import com.bf.myPage.dto.MyReviewDto;
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

	int selectPointAvailable(String id);

	int selectCashAvailable(String id);

	int selectPurchasedCount(String id);

	String InfoOk(String id, String password);

	MemberDto selectInfo(String id);

	int infoUpdate(MemberDto memberDto);

	List<OrderDto> orderHistoryList(String id);

	List<MemberDto> HomeMemberList(String id);

	List<MyReviewDto> selectReviewList(String id);

	int deleteReview(String id, int num);

	int updateReview(ReviewDto reviewDto);

	OrderDto orderHistoryClick(String id, long order_num);

}
