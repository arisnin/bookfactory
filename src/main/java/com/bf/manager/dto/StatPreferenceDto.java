package com.bf.manager.dto;

/**
 * @이름: 염현우
 * @날짜: 2018. 3. 7.
 * @설명: 통계 - 선호도 DTO 
 */
public class StatPreferenceDto {

	private int rnum;
	private int book_num;
	private String book_name;
	private String author_name;
	private int preference;
	private String pub_name;
	private float score;

	public int getRnum() {
		return rnum;
	}

	public void setRnum(int rnum) {
		this.rnum = rnum;
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

	public String getAuthor_name() {
		return author_name;
	}

	public void setAuthor_name(String author_name) {
		this.author_name = author_name;
	}

	public int getPreference() {
		return preference;
	}

	public void setPreference(int preference) {
		this.preference = preference;
	}

	public String getPub_name() {
		return pub_name;
	}

	public void setPub_name(String pub_name) {
		this.pub_name = pub_name;
	}

	public float getScore() {
		return score;
	}

	public void setScore(float score) {
		this.score = score;
	}

	@Override
	public String toString() {
		return "StatPreferenceDto [rnum=" + rnum + ", book_num=" + book_num + ", book_name=" + book_name
				+ ", author_name=" + author_name + ", preference=" + preference + ", pub_name=" + pub_name + ", score="
				+ score + "]";
	}

}
