package com.bf.order.dao;

import java.util.List;

import com.bf.book.dto.HomeDto;
import com.bf.main.dto.CategoryPageDto;
import com.bf.order.dto.OrderDto;

/**
 * @author	박성호
 * @date	2018. 2. 14.
 * @description	카트/위시리스트/구매 관련 DAO 인터페이스
 */
public interface OrderDao {

	public int cartWishList(int num, String id);

	public int cartDelete(int num, String id);

	public List<HomeDto> getCart(String id);
	
	public List<HomeDto> getWish(String id);

	public int cartInsert(int bookNum, String id);

	public int oneCart_Wish(String id, int bookNum);	//카트 중복검사
	
	public int wishListInsert(int bookNum, String id);

	public int paymentInsert(OrderDto orderDto);

	public HomeDto getBookSelect(int book_num);

	public List<CategoryPageDto> getCartPurchase(String id, int type);

	public List<CategoryPageDto> getOrderList(List<String> bookList);
	
	
}
