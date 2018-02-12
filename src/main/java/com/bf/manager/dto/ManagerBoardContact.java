package com.bf.manager.dto;

import java.util.Date;

/**
 * @ 작성자 : 전상헌
 * @ 작성일  : 2018. 2. 12.
 * @ 주제 및 설명 : boardDto
 */
public class ManagerBoardContact {
	private int num;
	private String title;
	private String content;
	private String id;
	private Date WRITE_DATE;
	private int CATEGORY;
	private String REPLY_CONTENT;
	private String REPLY_CHECK;
	private String FILE_NAME;
	private int FILE_SIZE;
	private String FILE_PATH;
	
	public ManagerBoardContact() {}
	
	public ManagerBoardContact(int num, String title, String content, String id, Date wRITE_DATE, int cATEGORY,
			String rEPLY_CONTENT, String rEPLY_CHECK, String fILE_NAME, int fILE_SIZE, String fILE_PATH) {
		super();
		this.num = num;
		this.title = title;
		this.content = content;
		this.id = id;
		WRITE_DATE = wRITE_DATE;
		CATEGORY = cATEGORY;
		REPLY_CONTENT = rEPLY_CONTENT;
		REPLY_CHECK = rEPLY_CHECK;
		FILE_NAME = fILE_NAME;
		FILE_SIZE = fILE_SIZE;
		FILE_PATH = fILE_PATH;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public Date getWRITE_DATE() {
		return WRITE_DATE;
	}

	public void setWRITE_DATE(Date wRITE_DATE) {
		WRITE_DATE = wRITE_DATE;
	}

	public int getCATEGORY() {
		return CATEGORY;
	}

	public void setCATEGORY(int cATEGORY) {
		CATEGORY = cATEGORY;
	}

	public String getREPLY_CONTENT() {
		return REPLY_CONTENT;
	}

	public void setREPLY_CONTENT(String rEPLY_CONTENT) {
		REPLY_CONTENT = rEPLY_CONTENT;
	}

	public String getREPLY_CHECK() {
		return REPLY_CHECK;
	}

	public void setREPLY_CHECK(String rEPLY_CHECK) {
		REPLY_CHECK = rEPLY_CHECK;
	}

	public String getFILE_NAME() {
		return FILE_NAME;
	}

	public void setFILE_NAME(String fILE_NAME) {
		FILE_NAME = fILE_NAME;
	}

	public int getFILE_SIZE() {
		return FILE_SIZE;
	}

	public void setFILE_SIZE(int fILE_SIZE) {
		FILE_SIZE = fILE_SIZE;
	}

	public String getFILE_PATH() {
		return FILE_PATH;
	}

	public void setFILE_PATH(String fILE_PATH) {
		FILE_PATH = fILE_PATH;
	}

	@Override
	public String toString() {
		return "ManagerBoardContact [num=" + num + ", title=" + title + ", content=" + content + ", id=" + id
				+ ", WRITE_DATE=" + WRITE_DATE + ", CATEGORY=" + CATEGORY + ", REPLY_CONTENT=" + REPLY_CONTENT
				+ ", REPLY_CHECK=" + REPLY_CHECK + ", FILE_NAME=" + FILE_NAME + ", FILE_SIZE=" + FILE_SIZE
				+ ", FILE_PATH=" + FILE_PATH + "]";
	}
	
	
}
