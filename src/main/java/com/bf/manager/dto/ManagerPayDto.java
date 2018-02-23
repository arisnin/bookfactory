package com.bf.manager.dto;

import java.util.Date;

public class ManagerPayDto {
	private int num;
	private String id;
	private int order_num;
	private int book_num;
	private String book_name;
	private int direct_cash;
	private int cash_use;
	private int point_use;
	private Date payment_date;
	
	public ManagerPayDto() {}

	public ManagerPayDto(int num, String id, int order_num, int book_num, String book_name, int direct_cash,
			int cash_use, int point_use, Date payment_date) {
		super();
		this.num = num;
		this.id = id;
		this.order_num = order_num;
		this.book_num = book_num;
		this.book_name = book_name;
		this.direct_cash = direct_cash;
		this.cash_use = cash_use;
		this.point_use = point_use;
		this.payment_date = payment_date;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public int getOrder_num() {
		return order_num;
	}

	public void setOrder_num(int order_num) {
		this.order_num = order_num;
	}

	public int getBook_num() {
		return book_num;
	}

	public void setBook_num(int book_num) {
		this.book_num = book_num;
	}

	public String getBook_name() {
		return book_name;
	}

	public void setBook_name(String book_name) {
		this.book_name = book_name;
	}

	public int getDirect_cash() {
		return direct_cash;
	}

	public void setDirect_cash(int direct_cash) {
		this.direct_cash = direct_cash;
	}

	public int getCash_use() {
		return cash_use;
	}

	public void setCash_use(int cash_use) {
		this.cash_use = cash_use;
	}

	public int getPoint_use() {
		return point_use;
	}

	public void setPoint_use(int point_use) {
		this.point_use = point_use;
	}

	public Date getPayment_date() {
		return payment_date;
	}

	public void setPayment_date(Date payment_date) {
		this.payment_date = payment_date;
	}

	@Override
	public String toString() {
		return "ManagerPayDto [num=" + num + ", id=" + id + ", order_num=" + order_num + ", book_num=" + book_num
				+ ", book_name=" + book_name + ", direct_cash=" + direct_cash + ", cash_use=" + cash_use
				+ ", point_use=" + point_use + ", payment_date=" + payment_date + "]";
	}
	

	
}
