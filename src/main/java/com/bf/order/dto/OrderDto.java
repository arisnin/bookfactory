/**
 * 작성자 : 김도현
 * 작성일 : 2018. 2. 22.
 * 내   용 : 구매목록DTO
 */

package com.bf.order.dto;

public class OrderDto {
	private int num;
	private long order_num;
	private int book_num;
	private int price;
	private java.util.Date payment_date;
	private String present_check;
	private String cancel_check;
	private String free_pass;
	private String id;
	private String pay_type;
	private int point_use;
	private int cash_use;
	private java.util.Date rental_date;
	private String rental_state;
	private int point;
	private String cash_type;

	public int getPoint_use() {
		return point_use;
	}

	public void setPoint_use(int point_use) {
		this.point_use = point_use;
	}

	public int getCash_use() {
		return cash_use;
	}

	public void setCash_use(int cash_use) {
		this.cash_use = cash_use;
	}

	public java.util.Date getRental_date() {
		return rental_date;
	}

	public void setRental_date(java.util.Date rental_date) {
		this.rental_date = rental_date;
	}

	public String getRental_state() {
		return rental_state;
	}

	public void setRental_state(String rental_state) {
		this.rental_state = rental_state;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public long getOrder_num() {
		return order_num;
	}

	public void setOrder_num(long l) {
		this.order_num = l;
	}

	public int getBook_num() {
		return book_num;
	}

	public void setBook_num(int book_num) {
		this.book_num = book_num;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public java.util.Date getPayment_date() {
		return payment_date;
	}

	public void setPayment_date(java.util.Date payment_date) {
		this.payment_date = payment_date;
	}

	public String getPresent_check() {
		return present_check;
	}

	public void setPresent_check(String present_check) {
		this.present_check = present_check;
	}

	public String getCancel_check() {
		return cancel_check;
	}

	public void setCancel_check(String cancel_check) {
		this.cancel_check = cancel_check;
	}

	public String getFree_pass() {
		return free_pass;
	}

	public void setFree_pass(String free_pass) {
		this.free_pass = free_pass;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPay_type() {
		return pay_type;
	}

	public void setPay_type(String pay_type) {
		this.pay_type = pay_type;
	}

	public int getPoint() {
		return point;
	}

	public void setPoint(int point) {
		this.point = point;
	}

	public String getCash_type() {
		return cash_type;
	}

	public void setCash_type(String cash_type) {
		this.cash_type = cash_type;
	}

	@Override
	public String toString() {
		return "OrderDto [num=" + num + ", order_num=" + order_num
				+ ", book_num=" + book_num + ", price=" + price
				+ ", payment_date=" + payment_date + ", present_check="
				+ present_check + ", cancel_check=" + cancel_check
				+ ", free_pass=" + free_pass + ", id=" + id + ", pay_type="
				+ pay_type + ", point_use=" + point_use + ", cash_use="
				+ cash_use + ", rental_date=" + rental_date + ", rental_state="
				+ rental_state + ", point=" + point + ", cash_type="
				+ cash_type + "]";
	}
}