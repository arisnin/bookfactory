package com.bf.order.dao;

/**
 * @author	박성호
 * @date	2018. 2. 14.
 * @description	카트/위시리스트/구매 관련 DAO 인터페이스
 */
public interface OrderDao {

	public int cartWishList(int num);

	public int cartDelete(int num);

}
