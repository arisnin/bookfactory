package com.bf.manager.service;

import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.text.DecimalFormat;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Properties;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.bf.aop.LogAspect;
import com.bf.manager.dao.ManagerDao;
import com.bf.manager.dto.AuthorDto;
import com.bf.manager.dto.AuthorEditDto;
import com.bf.manager.dto.AuthorSearchDto;
import com.bf.manager.dto.BookDto;
import com.bf.manager.dto.BookFirstCateDto;
import com.bf.manager.dto.BookSearchDto;
import com.bf.manager.dto.BookSecondCateDto;
import com.bf.manager.dto.BookThirdCateDto;
import com.bf.manager.dto.CountryDto;
import com.bf.manager.dto.KeywordDto;
import com.bf.manager.dto.PublisherDto;
import com.bf.manager.dto.PublisherSearchDto;
import com.bf.manager.dto.StatPreferenceDto;


/**
 * @이름: 염현우 X 전상헌
 * @날짜: 2018. 2. 12.
 * @설명: 관리자 페이지 서비스 메뉴 [도서, 출판사, 작가, 통계]
 */
@Component
public class ManagerServiceImp implements ManagerService {
	@Autowired
	private ManagerDao managerDao;

	// Go 염현우
	@Override
	public void manager(ModelAndView mav) {
		int bookCount = managerDao.getBookCount();
		int authorCount = managerDao.getAuthorCount();
		int pubCount = managerDao.getPublisherCount();
		int memberCount = managerDao.getMemberCount();
		int authorEditCount = managerDao.getAuthorEditCount();
		int cateCount = managerDao.getCateThreeCount();
		int saleCount = managerDao.getSaleCount();
		
		mav.addObject("saleCount", saleCount);
		mav.addObject("cateCount", cateCount);
		mav.addObject("authorEditCount", authorEditCount);
		mav.addObject("memberCount", memberCount);
		mav.addObject("bookCount", bookCount);
		mav.addObject("authorCount", authorCount);
		mav.addObject("pubCount", pubCount);
	}
	
	@Override
	public void bookCategoryOk(ModelAndView mav) {
		//대분류 설정
		int thae = managerDao.checkCateOne();
		if(thae < 5) {
			String[] cateOne = {"일반","로맨스","판타지","만화","BL"};
			for(int i=0;i<cateOne.length;i++) {
				managerDao.insertCateOne(cateOne[i],i+1);
			}
			//초기 키워드 삽입
			String keyword = "실존역사물, 가상시대물, 궁정로맨스, 캠퍼스물, 한국씨, 백합/GL, 차원이동, 회귀/타임슬립, 영혼체인지/빙의, 초월적존재, 외국인/혼혈, 남장여자, 바람둥이, 맞선, 속도위반, 베이비메신저, 법조계, 메디컬, 군대물, 경찰/형사/수사관, 연예인, 불치병/장애, 기억상실, 오해, 시월드, 신데렐라, 권선징악, 나이차커플, 비밀연애, 삼각관계, 계약연애/결혼, 정략결혼, 선결혼후연애, 몸정>맘정, 소유욕/독점욕/질투, 여공남수, 운명적사랑, 로맨틱코미디, 애잔물, 신파, 추리/미스터리/스릴러, 육아물, 악녀시점, 더티토크, 이야기중심, 고수위, 씬중심, 삽화, 2016년출간, 2015년출간, 2014년출간, 2013년이전출간, 3000원이하, 3000~6000원, 6000~10000원, 1만원 초과, 현대판타지, 게임판타지, 퓨전판타지, 정통판타지, 기갑판타지, 신무협, 전통무협, 차원이동물, 복수물, 전쟁물, 하렘물, 먼치킨, 레이드물, 생존물, 전문직, 경영물, 귀환물, 환생물, 빙의물, 오래된연인, 라이벌/앙숙, 갑을관계, 질투/복수, 황제, 가족, 종교, 장군/기사, 반역물, 마법사/소환사/정령사, 도적/암살자, 검사/군인, 도사/퇴마사, 통쾌함, 유쾌함, 고독함, 비장함, 에로틱함, 오만함, 잔잔함, 서정적, 순정만화, 소년만화, 청장년만화, 웹툰, 판타지/SF, 시대/역사물, 스포츠물, 학원물, 코믹물, 추리물, 공포물, 액션물, 백합물, 무협물, 회사, 캠퍼스, 병원배경, 던전/모험, 성장, 일상, 동물, 음악, 요괴, 요리/음식, 퇴마, 도박/범죄, 복수/배신, 현대배경, 미래배경, 대체역사, 이계/이세계, 세계멸망, 타임슬립, 남녀성전환(TS), 연상연하, 짝사랑, 사제지간, 삼각로맨스, 동거, 러브코믹, 금지된사랑, 하렘, 역하렘, 결혼생활, 평범남, 뇌섹남, 능력남, 재벌남, 사이다남, 직진남, 계략남, 능글남, 다정남, 애교남, 유혹남, 절륜남, 집착남, 나쁜남자, 후회남, 상처남, 짝사랑남, 순정남, 철벽남, 동정남, 순진남, 까칠남, 냉정남, 무심남, 오만남, 카리스마남, 존댓말남, 대형견남, 연하남, 사차원남, 평범녀, 뇌섹녀, 능력녀, 재벌녀, 사이다녀, 직진녀, 계략녀, 능글녀, 다정녀, 애교녀, 유혹녀, 절륜녀, 집착녀, 나쁜여자, 후회녀, 상처녀, 짝사랑녀, 순정녀, 철벽녀, 동정녀, 순진녀, 까칠녀, 냉정녀, 무심녀, 도도녀, 외유내강, 우월녀, 걸크러시, 털털녀, 엉뚱녀, 쾌활발랄녀, 한국, 일본, 완결, 치유, 감동, 달달함, 진지함, 잔인함, 애니화, 드라마화, 영화화, 단편, 4컷만화, 고화질, 현대물, 시대물, SF/미래물, 동양풍, 서양풍, 판타지물, OO버스, 오메가버스, 추리/스릴러, 미스터리/오컬트, 학원/캠퍼스물, 궁정물, 차원이동/영혼바뀜, 회귀물, 전생/환생, 초능력, 인외존재, 복수, 질투, 오해/착각, 감금, SM, 외국인, 왕족/귀족, 연예계, 조직/암흑가, 스포츠, 리맨물, 사내연애, 전문직물, 정치/사회/재벌, 할리킹, 게임물, 키잡물, 소꿉친구, 친구>연인, 동거/배우자, 첫사랑, 재회물, 라이벌/열등감, 배틀연애, 애증, 하극상, 계약, 원나잇, 스폰서, 금단의관계, 사제관계, 신분차이, 나이차이, 다공일수, 서브공있음, 서브수있음, 리버스, 미인공, 다정공, 울보공, 대형견공, 순진공, 귀염공, 호구공, 헌신공, 강공, 냉혈공, 능욕공, 무심공, 능글공, 까칠공, 츤데레공, 초딩공, 집착공, 광공, 개아가공, 복흑/계략공, 연하공, 재벌공, 황제공, 후회공, 사랑꾼공, 순정공, 짝사랑공, 상처공, 절륜공, 천재공, 존댓말공, 미인수, 다정수, 순진수, 명랑수, 적극수, 소심수, 잔망수, 허당수, 평범수, 호구수, 헌신수, 강수, 냉혈수, 까칠수, 츤데레수, 외유내강수, 단정수, 무심수, 우월수, 여왕수, 유혹수, 계략수, 떡대수, 재벌수, 연상수, 중년수, 임신수, 순정수, 짝사랑수, 상처수, 굴림수, 도망수, 후회수, 능력수, 얼빠수, 단행본, 연재중, 연재완결, 코믹/개그물, 달달물, 삽질물, 일상물, 힐링물, 시리어스물, 피폐물, 사건물, 성장물, 잔잔물, 애절물, 하드코어, 3인칭시점, 공시점, 수시점, 해외소설, 평점4점이상, 리뷰100개이상, 만원 미만, 10000~20000원, 2만원 초과";
			String[] original = keyword.split(",");
			
			ArrayList<String> result = new ArrayList<String>();
			
			for(int i=0;i<original.length;i++) {
				result.add(original[i]);
			}
			for(int i=0;i<result.size();i++) {
				managerDao.insertKeyWord(result.get(i).trim());
			}
		}
		
		int check = managerDao.checkCategory();
		mav.addObject("check", check);
		if(check > 0) {
			LogAspect.logger.info(LogAspect.logMsg +"이미 카테고리 있다");
			return ;
		}
		// 테스트중
		String url = "https://ridibooks.com/?genre=general";
		try {
			Document doc = Jsoup.connect(url).get();
			
			Elements allMenu = doc.select(".all_menu_wrapper");
			//중분류 : 일반
			Elements general = allMenu.select(".menu_general").select(".general_menu_wrapper");
			general = general.select(".general_menu_title");
			for(Element e : general) {
				//일반 삽입
				LogAspect.logger.info(LogAspect.logMsg +"일반:"+ e.text());
				int cateNum = managerDao.insertBookCateSecond(e.text(),1);
				if(cateNum == -1) {
					LogAspect.logger.info(LogAspect.logMsg +"카테고리삽입 실패");
					break;
				}
				
				//하위 메뉴 삽입
				Elements generalSub = e.parent().parent().select("li");
				int count = 0;
				for(Element eSub : generalSub) {
					if(eSub.text().equals("해외도서 전체")) {
						managerDao.insertBookCateThird("해외도서",cateNum);
					}
					if(count == 0) {	// 각 소분류에서 전체<<를 제외한다.
						count = 1;
						continue;
					}
					LogAspect.logger.info(LogAspect.logMsg +"일반서브:"+ eSub.text());
					managerDao.insertBookCateThird(eSub.text(),cateNum);
				}
			}
			
			// 일반 제외하고 나머지
			Elements notGeneral = allMenu.select(".menu_etc").select(".column_box").select("h3");
			int count = 0;
			for(Element e : notGeneral) {
				int firstCateNum = 2;
				
				count++;
				if(count == 3 || count == 4) firstCateNum = 3;
				else if(count == 5) firstCateNum = 4;
				else if(count > 5) firstCateNum = 5;
				
				Element title = e.selectFirst("a");
				LogAspect.logger.info(LogAspect.logMsg +"그외:"+ title.text());
				
				int cateNum = managerDao.insertBookCateSecond(title.text(),firstCateNum);
				if(cateNum == -1) {
					LogAspect.logger.info(LogAspect.logMsg +"카테고리삽입 실패");
					break;
				}
				
				Elements subTitle = e.nextElementSibling().select("a");
				for(Element sub : subTitle) {
					LogAspect.logger.info(LogAspect.logMsg + title.text() + " >> "+ sub.text());
					managerDao.insertBookCateThird(sub.text(),cateNum);
				}
			}
			
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	@Override
	public void publisherInsertOk(ModelAndView mav) {
		PublisherDto publisherDto = (PublisherDto) mav.getModelMap().get("publisherDto");
		LogAspect.logger.info(LogAspect.logMsg + publisherDto);
		publisherDto.setUrl("com.bf.bookfactory");
		int check = managerDao.publisherInsertOk(publisherDto);
		
		mav.addObject("check", check);
	}
	
	@Override
	public void publisherNameCheck(ModelAndView mav) {
		HttpServletRequest request = (HttpServletRequest) mav.getModelMap().get("request");
		HttpServletResponse response = (HttpServletResponse) mav.getModelMap().get("response");
		
		String name = request.getParameter("name");
		int check = managerDao.publisherNameCheck(name);
		
		try {
			response.setContentType("application/text;charset=utf-8");
			response.getWriter().print(check);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	

	@Override
	public void authorInsert(ModelAndView mav) {
		List<CountryDto> countryList = managerDao.getCountry();
		mav.addObject("countryList", countryList);
	}

	@Override
	public void authorInsertOk(ModelAndView mav) {
		AuthorDto authorDto = (AuthorDto) mav.getModelMap().get("authorDto");
		authorDto.setUpdate_date(new Date());
		LogAspect.logger.info(LogAspect.logMsg + authorDto);
		
		if(authorDto.getEducation() == null)	authorDto.setEducation("-");
		if(authorDto.getCareer() == null)	authorDto.setCareer("-");
		if(authorDto.getAwards() == null)	authorDto.setAwards("-");
		if(authorDto.getLink() == null)	authorDto.setLink("-");
		if(authorDto.getDescribe() == null)	authorDto.setDescribe("-");
		authorDto.setDescribe(authorDto.getDescribe().replace("\n",	"<br>"));
		
		int check = managerDao.authorInsertOk(authorDto);
		
		mav.addObject("check", check);
	}
	
	@Override
	public void authorUpdate(ModelAndView mav) {
		HttpServletRequest request = (HttpServletRequest) mav.getModelMap().get("request");
		List<CountryDto> countryList = managerDao.getCountry();
		int num = Integer.parseInt(request.getParameter("num"));
		AuthorDto authorDto = managerDao.getAuthor(num);
		authorDto.setDescribe(authorDto.getDescribe().replace("<br>", "\n"));
		
		
		mav.addObject("authorDto", authorDto);
		mav.addObject("countryList", countryList);
	}
	
	@Override
	public void authorUpdateOk(ModelAndView mav) {
		HttpServletRequest request = (HttpServletRequest) mav.getModelMap().get("request");
		AuthorDto authorDto = (AuthorDto) mav.getModelMap().get("authorDto");
		authorDto.setUpdate_date(new Date());
		authorDto.setDescribe(authorDto.getDescribe().replace("\n", "<br>"));
		
		String params = "";
		String searchWord = request.getParameter("searchWord");
		if(searchWord != null) {
			params += "&searchWord="+searchWord;
		}
		String pageNumber = request.getParameter("pageNumber");
		if(pageNumber != null && pageNumber != "") {
			params += "&pageNumber="+pageNumber;
		}
		System.out.println(params);
		
		int check = managerDao.updateAuthor(authorDto);
		mav.addObject("check", check);
		mav.addObject("num", authorDto.getNum());
		mav.addObject("params", params);
	}
	
	@Override
	public void authorRead(ModelAndView mav) {
		HttpServletRequest request = (HttpServletRequest) mav.getModelMap().get("request");
		int num = Integer.parseInt(request.getParameter("num"));
		AuthorDto authorDto = managerDao.getAuthor(num);
		String country_name = managerDao.getCountryName(authorDto.getCountry_num());
		List<BookDto> bookList = managerDao.getBookList(authorDto.getNum());
		
		mav.addObject("country_name", country_name);
		mav.addObject("authorDto", authorDto);
		mav.addObject("count", bookList.size());
		mav.addObject("bookList", bookList);
	}
	
	@Override
	public void authorNameCheck(ModelAndView mav) {
		HttpServletRequest request = (HttpServletRequest) mav.getModelMap().get("request");
		HttpServletResponse response = (HttpServletResponse) mav.getModelMap().get("response");
		
		String name = request.getParameter("name");
		int check = -1;
		
		if(name == null || name == "") {
			check = -1;
		}else {
			check = managerDao.authorCheckName(name);
		}
		
		try {
			response.setContentType("application/text;charset=utf-8");
			response.getWriter().print(check);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	@Override
	public void authorUpdateRead(ModelAndView mav) {
		HttpServletRequest request = (HttpServletRequest) mav.getModelMap().get("request");
		List<CountryDto> countryList = managerDao.getCountry();
		
		int num = Integer.parseInt(request.getParameter("num"));
		int editNum = Integer.parseInt(request.getParameter("editNum"));
		
		AuthorDto authorDto = managerDao.getAuthor(num);
		authorDto.setDescribe(authorDto.getDescribe().replace("<br>", "\n"));
		
		AuthorEditDto authorEditDto = managerDao.getAuthorEditOne(editNum);
		
		
		mav.addObject("authorDto", authorDto);
		mav.addObject("countryList", countryList);
		mav.addObject("authorEditDto", authorEditDto);
	}
	
	@Override
	public void authorUpdateReadOk(ModelAndView mav) {
		HttpServletRequest request = (HttpServletRequest) mav.getModelMap().get("request");
		AuthorDto authorDto = (AuthorDto) mav.getModelMap().get("authorDto");
		authorDto.setUpdate_date(new Date());
		authorDto.setDescribe(authorDto.getDescribe().replace("\n", "<br>"));
		
		int editNum = Integer.parseInt(request.getParameter("editNum"));
		
		managerDao.updateAuthorEdit(editNum);
		int check = managerDao.updateAuthor(authorDto);
		
		mav.addObject("check", check);
		mav.addObject("pageNumber", 1);
	}
	
	@Override
	public void bookInsert(ModelAndView mav) {
		List<BookFirstCateDto> firstCateList = managerDao.getFirstCate();
		mav.addObject("firstCateList", firstCateList);
	}
	
	@Override
	public void bookInsertOk(ModelAndView mav) {
		BookDto bookDto = (BookDto) mav.getModelMap().get("bookDto");
		HttpServletRequest request = (HttpServletRequest) mav.getModelMap().get("request");

		int check = managerDao.insertBook(bookDto);
		
		int currentNum = managerDao.getMaxBookNum();
		String keyword_list = request.getParameter("keyword");
		if(keyword_list != null) {
			String[] keyword = keyword_list.split(",");
			LogAspect.info(LogAspect.logMsg +keyword);
			for(String key : keyword) {
				int checkKey = managerDao.keyNameCheck(key);
				
				if(checkKey == 0) {
					managerDao.insertKeyWord(key);
				}
				checkKey = managerDao.bookKeyWordCheck(key,currentNum);
				
				if(checkKey == 0) {
					managerDao.insertKeyWordList(key,currentNum);
				}
			}
		}
		
		mav.addObject("check", check);
	}
	
	@Override
	public void bookSearch(ModelAndView mav) {
		HttpServletRequest request = (HttpServletRequest) mav.getModelMap().get("request");
		
		String searchWord = request.getParameter("searchWord");
		String pageNumber = request.getParameter("pageNumber");
		if(pageNumber == null) pageNumber = "1";
		
		int boardSize = 10;
		int currentPage = Integer.parseInt(pageNumber);
		int startRow = (currentPage - 1) * boardSize + 1;
		int endRow = currentPage * boardSize;
		
		List<BookSearchDto> bookList = null;
		int count = 0;
		if(searchWord == null) {
			bookList = managerDao.getBookSearchList(startRow,endRow);
			count = managerDao.getBookCount();
		}else {
			bookList = managerDao.getBookSearchList(searchWord,startRow,endRow);
			count = managerDao.getBookCount(searchWord);
		}
		mav.addObject("searchWord", searchWord);
		mav.addObject("pageNumber", pageNumber);
		mav.addObject("boardSize", boardSize);
		mav.addObject("count", count);
		mav.addObject("bookList", bookList);
		mav.addObject("searchWord", searchWord);
	}
	
	@Override
	public void bookUpdate(ModelAndView mav) {
		HttpServletRequest request = (HttpServletRequest) mav.getModelMap().get("request");
		int book_num = Integer.parseInt(request.getParameter("book_num"));
		BookDto bookDto = managerDao.getBook(book_num);
		
		AuthorDto author = managerDao.getAuthor(bookDto.getAuthor_num());
		AuthorDto illustrator = managerDao.getAuthor(bookDto.getIllustrator_num());
		AuthorDto translator = managerDao.getAuthor(bookDto.getTranslator_num());
		
		PublisherDto publisherDto =  managerDao.getPublisher(bookDto.getPub_num());
		
		List<KeywordDto> keywordList = managerDao.getKeywordList(bookDto.getBook_num());
		String keyword = "";
		for(KeywordDto key : keywordList) {
			if(keyword.equals("")) {
				keyword += key.getName();				
			}else {
				keyword += "," + key.getName();
			}
		}
		
		mav.addObject("bookDto", bookDto);
		mav.addObject("author", author);
		mav.addObject("illustrator", illustrator);
		mav.addObject("translator", translator);
		mav.addObject("publisherDto", publisherDto);
		mav.addObject("keyword", keyword);
	}
	
	@Override
	public void bookUpdateOk(ModelAndView mav) {
		BookDto bookDto = (BookDto) mav.getModelMap().get("bookDto");
		HttpServletRequest request = (HttpServletRequest) mav.getModelMap().get("request");
		
		LogAspect.info(LogAspect.logMsg+ bookDto);
		
		int check = managerDao.updateBook(bookDto);
		
		String keyword_list = request.getParameter("keyword");
		if(keyword_list != null && check == 1) {
			String[] keyword = keyword_list.split(",");
			LogAspect.info(LogAspect.logMsg +keyword);
			for(String key : keyword) {
				int checkKey = managerDao.keyNameCheck(key);
				
				if(checkKey == 0) {
					managerDao.insertKeyWord(key);
				}
				checkKey = managerDao.bookKeyWordCheck(key,bookDto.getBook_num());
				
				if(checkKey == 0) {
					managerDao.insertKeyWordList(key,bookDto.getBook_num());
				}
			}
		}
		mav.addObject("check", check);
		mav.addObject("num", bookDto.getBook_num());
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public void bookCateOne(ModelAndView mav) {
		HttpServletRequest request = (HttpServletRequest) mav.getModelMap().get("request");
		HttpServletResponse response = (HttpServletResponse) mav.getModelMap().get("response");
		
		String name = request.getParameter("name");

		List<BookSecondCateDto> secondCateList = managerDao.bookCateOne(name);
		LogAspect.logger.info(LogAspect.logMsg + secondCateList);
		
		JSONObject jsonList = new JSONObject();
		JSONArray jsonArr = new JSONArray();
		for(int i=0;i<secondCateList.size();i++) {
			JSONObject jsonObj = new JSONObject();
			jsonObj.put("num", secondCateList.get(i).getNum());
			jsonObj.put("name", secondCateList.get(i).getName());
			
			jsonArr.add(jsonObj);
			jsonList.put("cate1", jsonArr);
		}
		try {
			response.setContentType("application/text;charset=utf-8");
			response.getWriter().print(jsonList.toJSONString());
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public void bookCateTwo(ModelAndView mav) {
		HttpServletRequest request = (HttpServletRequest) mav.getModelMap().get("request");
		HttpServletResponse response = (HttpServletResponse) mav.getModelMap().get("response");
		
		String name = request.getParameter("name");

		List<BookThirdCateDto> thirdCateList = managerDao.bookCateTwo(name);
		LogAspect.logger.info(LogAspect.logMsg + thirdCateList);
		
		JSONObject jsonList = new JSONObject();
		JSONArray jsonArr = new JSONArray();
		for(int i=0;i<thirdCateList.size();i++) {
			JSONObject jsonObj = new JSONObject();
			jsonObj.put("num", thirdCateList.get(i).getNum());
			jsonObj.put("name", thirdCateList.get(i).getName());
			
			jsonArr.add(jsonObj);
			jsonList.put("cate2", jsonArr);
		}
		
		try {
			response.setContentType("application/text;charset=utf-8");
			response.getWriter().print(jsonList.toJSONString());
		} catch (IOException e) {
			e.printStackTrace();
		}
	}


	@Override
	public void bookOpenPub(ModelAndView mav) {
		HttpServletRequest request = (HttpServletRequest) mav.getModelMap().get("request");
		String searchWord = request.getParameter("search-word");

		String pageNumber = request.getParameter("pageNumber");
		if(pageNumber == null) pageNumber = "1";
		
		int boardSize = 10;
		int currentPage = Integer.parseInt(pageNumber);
		int startRow = (currentPage - 1) * boardSize + 1;
		int endRow = currentPage * boardSize;
		
		List<PublisherDto> pubList = null;
		if(searchWord == null) {
			pubList = managerDao.getPublisherList(startRow,endRow);
		}else {
			pubList = managerDao.getPublisherList(searchWord,startRow,endRow);
		}
		
		int count = managerDao.getPublisherCount();
		
		mav.addObject("pageNumber", pageNumber);
		mav.addObject("boardSize", boardSize);
		mav.addObject("count", count);
		mav.addObject("pubList", pubList);
	}
	
	public ArrayList<String> searchUrl(String url) {
		try {
			Document doc = Jsoup.connect(url).get();
			Elements elements = doc.select(".js_book_macro_wrapper");
			elements = elements.select(".book_metadata_wrapper");

			System.out.println(elements.size());
			ArrayList<String> hrefList = new ArrayList<String>();
			for (Element e : elements) {
				Element title = e.selectFirst(".title_link");
				String href = "https://ridibooks.com" + title.attr("href");
				hrefList.add(href);
			}
			return hrefList;
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	@SuppressWarnings("deprecation")
	@Override
	public void autoUrl(ModelAndView mav) {
		HttpServletRequest request = (HttpServletRequest) mav.getModelMap().get("request");
		HttpServletResponse response = (HttpServletResponse) mav.getModelMap().get("response");
		
		HashMap<String,String> map = loadProperties(request.getRealPath(request.getParameter("value")));
    	
		autoProcess(map);

		try {
			response.setContentType("application/text;charset=utf-8");
			response.getWriter().print("완료");
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	private HashMap<String, String> loadProperties(String path){
		FileReader reader = null;
    	HashMap<String,String> map = null;
    	try {
    		reader = new FileReader(path);
    		Properties prop = new Properties();
    		prop.load(reader);
    		Iterator<Object> iter = prop.keySet().iterator();
    		map = new HashMap<String, String>();
    		while(iter.hasNext()) {
    			String key = (String) iter.next();
    			String value =(String) prop.getProperty(key);
    			map.put(key,value);
    		}
    		
    	} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(reader!=null)
				try {
					reader.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
		}
		return map;
	}
	
	private void autoProcess(HashMap<String,String> map) {
		Iterator<String> iter = map.keySet().iterator();
		try {
			while (iter.hasNext()) {
				String key = iter.next();
				LogAspect.logger.info(LogAspect.logMsg + key);
				String href = map.get(key);
				while (true) {
					Document doc = Jsoup.connect(href).get();
					Element paging = doc.selectFirst(".module_paging");

					Element btn_next = paging.selectFirst(".btn_next");
					if (btn_next == null) {
						break;
					}
					href = "https://ridibooks.com" + btn_next.select("a").attr("href");
					LogAspect.logger.info(LogAspect.logMsg + href);
					autoPublisherTest(href);
					LogAspect.logger.info(LogAspect.logMsg + href);
					autoAuthorTest(href);
					LogAspect.logger.info(LogAspect.logMsg + href);
					autoBookTest(href);
				}
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	
	private void autoPublisherTest(String href) {
		if(managerDao.getPublisherZero() == 0) {
			PublisherDto publisherDto = new PublisherDto();
			publisherDto.setPub_num(0);
			publisherDto.setName("없음");
			publisherDto.setUrl("com.bf.bookFactory");
			managerDao.publisherInsertZero(publisherDto);
		}
		String url = href;
		
		int countPub = 0;
		try {
			Document doc = Jsoup.connect(url).get();
			for(int i=0;i<3;i++) {
				Elements elements = doc.select(".js_book_macro_wrapper");
				
				Elements publisher = elements.select(".publisher");
				
				for(Element p : publisher) {
					int check = managerDao.publisherNameCheck(p.text());
					System.out.println(p.text());
					if(check > 0) {
						continue;
					}
					PublisherDto publisherDto = new PublisherDto();
					publisherDto.setName(p.text());
					publisherDto.setUrl("com.bf.bookFactory");
					countPub += managerDao.publisherInsertOk(publisherDto);
					System.out.println(countPub + "개 출판사 등록");
				}
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
	
	private void autoAuthorTest(String href1) {
		
		//0번처리
		int init = managerDao.getZeroAuthor();
		if(init == 0) {
			AuthorDto authorDto = new AuthorDto();
			authorDto.setName("anonymous");
			authorDto.setCountry_num("NOT");
			authorDto.setUpdate_date(new Date());
			
			managerDao.authorInsertInit(authorDto);
		}
		
		//ajax
		String url = href1;

		try {
			ArrayList<String> hrefList = searchUrl(url);
			
			for(int i=0;i<hrefList.size();i++) {
				String subUrl = hrefList.get(i);
				Document subDoc = Jsoup.connect(subUrl).get();
				Elements info = subDoc.select(".header_info_wrap");
				
				//작가정보가 있는 링크 정리
				ArrayList<String> authorLinkList = new ArrayList<String>();
				for(Element meta : info) {
					Elements authorLink = meta.select(".author_detail_link");
					for(Element al : authorLink) {
						String href = "https://ridibooks.com" + al.attr("href").trim();
						Document authorDoc = Jsoup.connect(href).get();
						Element authorInfo = authorDoc.selectFirst(".author_area_wrapper");
						
						if(authorInfo == null) {
							Element aResult = authorDoc.selectFirst(".author_result_wrapper");
							if(aResult == null) {
								continue;
							}
							Element liList = aResult.selectFirst(".author_result_list");
							for(Element li : liList.select("li")) {
								href = "https://ridibooks.com" + li.selectFirst("a").attr("href").trim();
								authorLinkList.add(href);
							}
						}else {
							authorLinkList.add(href);							
						}
					}
				}
				
				//작가정보
				for(int k=0;k<authorLinkList.size();k++) {
					String authorUrl = authorLinkList.get(k);
					LogAspect.logger.info(LogAspect.logMsg + authorUrl);

					Document authorDoc = Jsoup.connect(authorUrl).get();
					Element authorInfo = authorDoc.selectFirst(".author_area_wrapper");
					Element authorProfile = authorInfo.selectFirst(".author_profile");
					
					//이름
					String authorName = authorProfile.selectFirst(".author_name").selectFirst("span").text();

					//학력,경력,수상,국적,출생
					String country = "없음";
					String birthday = "없음";
					String education = "없음";
					String career = "없음";
					String awards = "없음";
					String debut = "없음";
					String link = "없음";
					//경력
					Elements profileList = authorProfile.select(".profile_list");
					for(Element e : profileList) {
						Element titleNode = e.selectFirst(".list_title");
						String title = titleNode.text();
						
						if(title.equals("학력")) {
							education = e.selectFirst(".list_contents").html();
						}else if(title.equals("경력")) {
							career = e.selectFirst(".list_contents").html();
						}else if(title.equals("수상")) {
							awards = e.selectFirst(".list_contents").html();
						}else if(title.equals("국적")) {
							country = e.selectFirst(".list_contents").text();
						}else if(title.equals("출생") || title.equals("출생-사망")) {
							birthday = e.selectFirst(".list_contents").text();
						}else if(title.equals("데뷔")) {
							debut = e.selectFirst(".list_contents").text();
						}else if(title.equals("링크")) {
							link = e.selectFirst(".list_contents").html();
						}
					}
					
					//작가소개
					Element authorDesc = authorInfo.selectFirst(".biography_paragraph");
					String describe = "없음";
					if(authorDesc != null) describe = authorDesc.html();
					
					//나라 키 가져오기
					String country_num = managerDao.getCountry(country);
					
					//작가DTO 정보입력
					AuthorDto authorDto = new AuthorDto();
					authorDto.setName(authorName);
					authorDto.setAwards(awards);
					authorDto.setBirthday(birthday);
					authorDto.setCareer(career);
					authorDto.setCountry_num(country_num);
					authorDto.setDescribe(describe);
					authorDto.setEducation(education);
					authorDto.setDebut(debut);
					authorDto.setLink(link);
					authorDto.setUpdate_date(new Date());
					
					//중복체크
					int check = managerDao.authorCheck(authorDto);
					if(check > 0) {
						LogAspect.logger.info(LogAspect.logMsg + "중복!!:");
						continue;
					}
					managerDao.authorInsertOk(authorDto);

					LogAspect.logger.info(LogAspect.logMsg + "작가:" + authorDto);
				}
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
	
	private void autoBookTest(String href) {
		
		String url = href;
		//책정보 
		try {
			ArrayList<String> hrefList = searchUrl(url);
			BookDto bookDto;
			int inputBook = 0;
			
			for(int i=0;i<hrefList.size();i++) {
				bookDto = new BookDto();
				String subUrl = hrefList.get(i);
				Document subDoc = Jsoup.connect(subUrl).get();
				Elements info = subDoc.select(".header_info_wrap");
				
				ArrayList<String> cateList = new ArrayList<String>();
				ArrayList<String> secondCateList = new ArrayList<String>();
				for(Element meta : info) {
					//제목
					String name = meta.selectFirst(".info_title_wrap").text();
					System.out.println("제목:\t" + name);
					
					//부제목
					Element subTitle = meta.selectFirst(".info_title_sub_wrap");
					String subTitleStr = "없음";
					if(subTitle != null) subTitleStr = subTitle.text();
					
					System.out.println("부제목:\t" + subTitleStr);
					
					//카테고리
					Element cateInfo = meta.selectFirst(".info_category_wrap");
					Elements cate = cateInfo.select("a");
					for(int k=0;k<cate.size();k++) {
						Element cateName = cate.get(k);
						Element next = cateName.nextElementSibling();
						if(next != null && next.is("span")) {
							secondCateList.add(cateName.text());
							continue;
						}
						cateList.add(cateName.text());
					}
					
					//작가
					Elements author = meta.select(".author_detail_link");
					
					ArrayList<Integer> authorStr = new ArrayList<Integer>();
					for(Element a : author) {
						int author_num = managerDao.selectAuthorNum(a.text());
						authorStr.add(author_num);
					}
					LogAspect.logger.info(LogAspect.logMsg + "작가:" + authorStr);

					
					if(authorStr.size() == 1) {
						bookDto.setAuthor_num(authorStr.get(0));
					}else if(authorStr.size() == 2) {
						bookDto.setAuthor_num(authorStr.get(0));
						bookDto.setIllustrator_num(authorStr.get(1));
					}else if(authorStr.size() == 3) {
						bookDto.setAuthor_num(authorStr.get(0));
						bookDto.setIllustrator_num(authorStr.get(1));
						bookDto.setTranslator_num(authorStr.get(2));
					}
					
					
					
					Elements publisher = meta.select(".publisher_detail_link");
					int pub_num = managerDao.getPublisherNum(publisher.text());
					
					Elements pubDate = meta.select(".book_info_list_wrapper").select(".published_date_info");
					
					Element img = meta.nextElementSibling().selectFirst(".thumbnail_image").selectFirst("img");
					
					DecimalFormat df = new DecimalFormat(",###");
					Element priceTable = meta.selectFirst(".normal_price_table");

					//대여 기본타입 no
					bookDto.setRental_period("no");
					if(priceTable == null) {
						priceTable = meta.selectFirst(".series_price_table");
						if(priceTable == null) {
							//무료책
						}else {
							
							int insertSeries = managerDao.insertSeries(name);
							if(insertSeries > 0) {
								bookDto.setSeries_num(managerDao.getSeriesNum());
							}
							Elements tr = priceTable.select("tr");
							for(Element p : tr) {
								Element price_subtitle = p.selectFirst(".price_subtitle");
								if(price_subtitle != null && price_subtitle.text().equals("단권")) {
									try {
										Element bookPrice = p.selectFirst(".book_price");
										if(bookPrice.text().trim().equals("무료")) {
											bookDto.setRental_price(0);
											continue;
										}
										Number number = df.parse(bookPrice.selectFirst("span").text());
										bookDto.setPrice(number.intValue());
										bookDto.setType("series");
										
										Element discount = p.selectFirst(".discount_rate");
										if(discount.selectFirst("span") != null) {
											String disStr = discount.selectFirst("span").text();
											int start = disStr.indexOf("(");
											int end = disStr.indexOf("%");
											bookDto.setDiscount(Double.parseDouble(disStr.substring(start+1, end)));
										}
									} catch (ParseException e) {
										e.printStackTrace();
									}
								}
							}
						}
					}else {
						Elements tr = priceTable.select("tr");
						for(Element p : tr) {
							Element title = p.selectFirst(".price_title");
							try {
								if(title != null && title.text().equals("대여")) {
									//대여 정보 입력
									bookDto.setRental_period(p.selectFirst(".price_type").text());
									Element bookPrice = p.selectFirst(".book_price");
									if(bookPrice.text().trim().equals("무료")) {
										bookDto.setRental_price(0);
									}else {
										Number number = df.parse(bookPrice.selectFirst("span").text());
										bookDto.setRental_price(number.intValue());
									}
								}else {
									// 그외
									Element pType = p.selectFirst(".price_type");
									Element bookPrice = p.selectFirst(".book_price");
									if(bookPrice.text().equals("무료")) {
										continue;
									}
									
									Number number = df.parse(bookPrice.selectFirst("span").text());
									if(pType.text().equals("종이책 정가") || pType.text().equals("전자책 단권 정가")) {
										bookDto.setPrice(number.intValue());
										bookDto.setType("paper");
									}else if(pType.text().equals("전자책 정가") || pType.text().equals("전자책 세트 정가")) {
										if(p.selectFirst(".discount_rate").selectFirst("span") == null ) {
											bookDto.setDiscount(0);
										}else {											Element discount = p.selectFirst(".discount_rate");
											if(discount.selectFirst("span") != null) {
												String disStr = discount.selectFirst("span").text();
												int start = disStr.indexOf("(");
												int end = disStr.indexOf("%");
												bookDto.setDiscount(Double.parseDouble(disStr.substring(start+1, end)));
											}
										}
									}else if(pType.text().equals("판매가")) {
										if(p.selectFirst(".discount_rate").selectFirst("span") == null ) {
											bookDto.setDiscount2(0);
										}else {
											Element discount = p.selectFirst(".discount_rate");
											if(discount.selectFirst("span") != null) {
												String disStr = discount.selectFirst("span").text();
												int start = disStr.indexOf("(");
												int end = disStr.indexOf("%");
												bookDto.setDiscount2(Double.parseDouble(disStr.substring(start+1, end)));
											}
										}
									}
								}
							} catch (ParseException e) {
								e.printStackTrace();
							}
						}
					}
					
					
					if(bookDto.getType() == null || (!bookDto.getType().equals("paper") && !bookDto.getType().equals("series"))) {
						bookDto.setType("ebook");
					}
					
					
					bookDto.setName(name);
					bookDto.setWrite_date(pubDate.text());
					bookDto.setImg_path(img.attr("src"));
					bookDto.setPub_num(pub_num);
					bookDto.setPreference(0);
					bookDto.setSub_title(subTitleStr);
					bookDto.setSupport("PAPER,iOS,Android,PC,Mac");
					
				}
				
				Element intro = subDoc.selectFirst(".introduce_paragraph");
				if(intro == null) {
					LogAspect.logger.info(LogAspect.logMsg + "19금인가..?");	
					continue;
				}
				String introHtml = intro.html();
				String delSpan = "</span>";
				String introStr = introHtml.substring(introHtml.indexOf(delSpan) + delSpan.length());
				
				Element pubReview = subDoc.selectFirst("#publisher_book_review");
				String pubReviewStr = "없음";
				if(pubReview != null)	pubReviewStr = pubReview.selectFirst("p").html();
				
				//책소개 , 출판사평
				bookDto.setIntro(introStr);
				bookDto.setPub_intro(pubReviewStr);

				LogAspect.logger.info(LogAspect.logMsg + "책:" + bookDto);
				int check = managerDao.checkBook(bookDto.getImg_path());
				if(check > 0) {
					LogAspect.logger.info(LogAspect.logMsg + "중복입니다");
				}else {
					//도서삽입
					inputBook += managerDao.insertBook(bookDto);
					//카테삽입
					int currentNum = managerDao.getMaxBookNum();
					if(cateList.size()==secondCateList.size()) {
						for(int j=0;j<cateList.size();j++) {
							LogAspect.logger.info(LogAspect.logMsg + cateList.get(j) + "///" + currentNum);
							managerDao.insertBookCategory(secondCateList.get(j),cateList.get(j),currentNum);						
						}
					}else {
						for(int j=0;j<cateList.size();j++) {
							LogAspect.logger.info(LogAspect.logMsg + cateList.get(j) + "///" + currentNum);
							managerDao.insertBookCategory(cateList.get(j),currentNum);						
						}
					}
					//키워드
					Elements keyword_list = subDoc.select(".keyword_list");
					if(keyword_list != null) {
						Elements lis = keyword_list.select("li");
						for(Element li : lis) {
							String value = li.selectFirst("span").text();
							int valueSubNum = value.indexOf("#")+1;
							String keyName = value.substring(valueSubNum);
							int checkKey = managerDao.keyNameCheck(keyName);
							
							if(checkKey == 0) {
								managerDao.insertKeyWord(keyName);
							}
							checkKey = managerDao.bookKeyWordCheck(keyName,currentNum);
							System.out.println("checkKey : " + checkKey);
							if(checkKey == 0) {
								managerDao.insertKeyWordList(keyName,currentNum);
							}
						}
					}
				}
				
			}
			System.out.println(inputBook + "개 입력완료");
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	@Override
	public void autoInsertBook(ModelAndView mav) {
		HttpServletRequest request = (HttpServletRequest) mav.getModelMap().get("request");
		HttpServletResponse response = (HttpServletResponse) mav.getModelMap().get("response");
		
		@SuppressWarnings("deprecation")
		HashMap<String,String> map = loadProperties(request.getRealPath(request.getParameter("value")));
    	
		autoProcess(map);

		try {
			response.setContentType("application/text;charset=utf-8");
			response.getWriter().print("일반끝");
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	@Override
	public void bookInNameCheck(ModelAndView mav) {
		HttpServletRequest request = (HttpServletRequest) mav.getModelMap().get("request");
		HttpServletResponse response = (HttpServletResponse) mav.getModelMap().get("response");
		
		String name = request.getParameter("name");
		int check = managerDao.checkBookName(name);
		if(check > 0) {
			name = "no";
		}else {
			name = "yes";
		}
		try {
			response.setContentType("application/text;charset=utf-8");
			response.getWriter().print(name);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public void bookInAuthorCheck(ModelAndView mav) {
		HttpServletRequest request = (HttpServletRequest) mav.getModelMap().get("request");
		HttpServletResponse response = (HttpServletResponse) mav.getModelMap().get("response");
		
		String name = request.getParameter("name");
		List<AuthorDto> list = managerDao.checkBookAuthor(name);
		
		
		response.setContentType("application/text;charset=utf-8");
		
		JSONObject jsonList = new JSONObject();
		if (list != null) {
			JSONArray jsonArr = new JSONArray();
			for (int i = 0; i < list.size(); i++) {
				JSONObject jsonObj = new JSONObject();
				AuthorDto author = list.get(i);
				jsonObj.put("num", author.getNum());
				jsonObj.put("name", author.getName());

				jsonArr.add(jsonObj);
				jsonList.put("author", jsonArr);
			}
		}
		
		try {
			System.out.println(jsonList.toJSONString());
			response.getWriter().print(jsonList.toJSONString());
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	@Override
	public void bookCategory(ModelAndView mav) {
		List<BookFirstCateDto> firstCateList = managerDao.getFirstCate();
		mav.addObject("firstCateList", firstCateList);
	}
	
	@Override
	public void bookUploadImg(ModelAndView mav) {
		HttpServletRequest request = (HttpServletRequest) mav.getModelMap().get("request");
		HttpServletResponse response = (HttpServletResponse) mav.getModelMap().get("response");
		MultipartHttpServletRequest multiRequest = (MultipartHttpServletRequest) request;
		MultipartFile formFile = multiRequest.getFile("file");
		
		long fileSize = formFile.getSize();
		String fileName = System.currentTimeMillis() + "_"+ formFile.getOriginalFilename();
		
		if (fileSize != 0) {
			/*String appPath = System.getProperty("catalina.home") + "/wtpwebapps/projectBookFactory/resources/img/manager/bookImg";*/
			String appPath = "C:/bfStore";
			/*String appPath = request.getSession().getServletContext().getRealPath("/resources/img/manager/bookimg");*/
			/*String appPath = "/img/manager/bookimg";*/
			File path = new File(appPath);
			path.mkdirs();
			if (path.exists() && path.isDirectory()) {
				File file = new File(path, fileName);
				System.out.println(path.getAbsolutePath());
				try {
					formFile.transferTo(file);
					response.setContentType("application/text;charset=utf-8");
					response.getWriter().print("/bfStore/" + fileName);
					
					/*response.getWriter().print(file.getPath());*/
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}
	}
	
	@Override
	public void insertCateOne(ModelAndView mav) {
		HttpServletRequest request = (HttpServletRequest) mav.getModelMap().get("request");
		String name = request.getParameter("name");
		int maxNum = managerDao.getCateOneCount();
		int checkName = managerDao.checkCateOne(name);
		int check = 0;
		if(checkName == 0) {
			check = managerDao.insertCateOne(name, maxNum+1);
		}
		mav.addObject("check", check);
	}
	
	@Override
	public void insertCateTwo(ModelAndView mav) {
		HttpServletRequest request = (HttpServletRequest) mav.getModelMap().get("request");
		String name = request.getParameter("name");
		int cate1 = Integer.parseInt(request.getParameter("cate1"));
		
		int maxNum = managerDao.getCateTwoCount();
		int checkName = managerDao.checkCateTwo(name);
		int check = 0;
		if(checkName == 0) {
			check = managerDao.insertCateTwo(name,cate1,maxNum+1);
		}
		mav.addObject("check", check);
	}
	
	@Override
	public void insertCateThree(ModelAndView mav) {
		HttpServletRequest request = (HttpServletRequest) mav.getModelMap().get("request");
		String name = request.getParameter("name");
		int cate1 = Integer.parseInt(request.getParameter("cate1"));
		
		int maxNum = managerDao.getCateThreeCount();
		int checkName = managerDao.checkCateThree(name);
		int check = 0;
		if(checkName == 0) {
			check = managerDao.insertCateThree(name,cate1,maxNum+1);
		}
		mav.addObject("check", check);
	}

	@Override
	public void publisherSearch(ModelAndView mav) {
		HttpServletRequest request = (HttpServletRequest) mav.getModelMap().get("request");
		String searchWord = request.getParameter("searchWord");
		String pageNumber = request.getParameter("pageNumber");
		if(pageNumber == null) pageNumber = "1";
		
		int boardSize = 10;
		int currentPage = Integer.parseInt(pageNumber);
		int startRow = (currentPage - 1) * boardSize + 1;
		int endRow = currentPage * boardSize;
		
		List<PublisherSearchDto> publisherList = null;
		int count = 0;
		if(searchWord == null) {
			publisherList = managerDao.getPublisherSearchList(startRow,endRow);
			count = managerDao.getPublisherCount();
		}else {
			publisherList = managerDao.getPublisherSearchList(searchWord,startRow,endRow);
			count = managerDao.getPublisherCount(searchWord);
		}
		
		mav.addObject("pageNumber", pageNumber);
		mav.addObject("boardSize", boardSize);
		mav.addObject("count", count);
		mav.addObject("publisherList", publisherList);
		mav.addObject("searchWord", searchWord);
	}
	
	@Override
	public void publisherUpdate(ModelAndView mav) {
		HttpServletRequest request = (HttpServletRequest) mav.getModelMap().get("request");
		int pub_num = Integer.parseInt(request.getParameter("pub_num"));
		PublisherDto publisherDto= managerDao.getPublisher(pub_num);
		
		mav.addObject("publisherDto", publisherDto);
	}
	
	@Override
	public void publisherUpdateOk(ModelAndView mav) {
		PublisherDto publisherDto = (PublisherDto) mav.getModelMap().get("publisherDto");
		int check = managerDao.updatePublisher(publisherDto);
		mav.addObject("check", check);
	}

	@Override
	public void authorSearch(ModelAndView mav) {
		HttpServletRequest request = (HttpServletRequest) mav.getModelMap().get("request");
		String searchWord = request.getParameter("searchWord");
		String pageNumber = request.getParameter("pageNumber");
		if(pageNumber == null) pageNumber = "1";
		
		int boardSize = 10;
		int currentPage = Integer.parseInt(pageNumber);
		int startRow = (currentPage - 1) * boardSize + 1;
		int endRow = currentPage * boardSize;
		
		List<AuthorSearchDto> authorList = null;
		int count = 0;
		if(searchWord == null) {
			authorList = managerDao.getAuthorSearchList(startRow,endRow);
			count = managerDao.getAuthorCount();
		}else {
			authorList = managerDao.getAuthorSearchList(searchWord,startRow,endRow);
			count = managerDao.getAuthorCount(searchWord);
		}
		
		mav.addObject("pageNumber", pageNumber);
		mav.addObject("boardSize", boardSize);
		mav.addObject("count", count);
		mav.addObject("authorList", authorList);
		mav.addObject("searchWord", searchWord);
	}
	
	@Override
	public void test(ModelAndView mav) {
		String currentdir = System.getProperty("catalina.home");
		dirlist(currentdir);
		File dir = new File(".");
		System.out.println(dir.getAbsolutePath());
		
		HttpServletRequest request = (HttpServletRequest) mav.getModelMap().get("request");
		String pathSet = request.getSession().getServletContext().getRealPath("/resources/img/manager/bookimg");

		System.out.println(pathSet.toString());
		Set<String> pathSet2 = request.getSession().getServletContext().getResourcePaths("/");
		/*String path3 = new HttpServletRequestWrapper(request).getRealPath("/");
		System.out.println("path3: = = " + path3);*/
		Iterator<String> iter = pathSet2.iterator();
		while(iter.hasNext()) {
			System.out.println(new File(iter.next()).getAbsolutePath());
		}
		
		System.out.println(pathSet2);
		/*System.out.println(ResourcesPlugin.getWorkspace());*/
		try {
			System.out.println(new File(".").getCanonicalPath());
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	private void dirlist(String fname) {
		File dir = new File(fname);
		String parentpath = dir.getParent();
		System.out.println("Current Directory : " + dir);
		System.out.println("parent Directory : " + parentpath);
	}

	@Override
	public void randomPreference(ModelAndView mav) {
		int size = managerDao.getBookCount();
		for(int i=0;i<2000;i++) {
			int value = (int)(Math.random() * i) + 1;
			int book_num = (int)(Math.random() * size) + 1;
			managerDao.updateRandomPreference(value,book_num);
		}
	}

	@Override
	public void statPreference(ModelAndView mav) {
		HashMap<String, Integer> countMap = new HashMap<String, Integer>();
		int max = 0;
		for(int i=0;i<5;i++) {
			int count = managerDao.getPreferenceTotalCount(i+1);
			if(count > max) {
				max = count;
			}
			if(i==0)
				countMap.put("ilban", count);
			else if(i==1)
				countMap.put("romance", count);
			else if(i==2)
				countMap.put("fantasy", count);
			else if(i==3)
				countMap.put("manhwa", count);
			else if(i==4)
				countMap.put("bl", count);
		}
		
		int maxCount = 0;
		HashMap<String, Integer> heightMap = new HashMap<String, Integer>();
		for(int i=0;i<5;i++) {
			String key = "";
			if(i==0)
				key = "ilban";
			else if(i==1)
				key = "romance";
			else if(i==2)
				key = "fantasy";
			else if(i==3)
				key = "manhwa";
			else if(i==4)
				key = "bl";
			
			if(maxCount < countMap.get(key)) {
				maxCount = countMap.get(key);
			}
			int height = (int)(((float)countMap.get(key)/max) * 300);
			heightMap.put(key, height);
		}
		
		//랭킹5가져오기
		List<StatPreferenceDto> rankList = managerDao.getStatPreferenceList();
		
		mav.addObject("rankList", rankList);
		mav.addObject("countMap", countMap);
		mav.addObject("heightMap", heightMap);
		mav.addObject("maxCount", maxCount);
	}

	@Override
	public void ilbanPrefer(ModelAndView mav) {
		processPrefer(mav, 1);
		mav.addObject("pageName", "일반");
	}
	
	@Override
	public void romancePrefer(ModelAndView mav) {
		processPrefer(mav, 2);
		mav.addObject("pageName", "로맨스");
	}

	@Override
	public void fantasyPrefer(ModelAndView mav) {
		processPrefer(mav, 3);
		mav.addObject("pageName", "판타지");
	}

	@Override
	public void manhwaPrefer(ModelAndView mav) {
		processPrefer(mav, 4);
		mav.addObject("pageName", "만화");
	}

	@Override
	public void blPrefer(ModelAndView mav) {
		processPrefer(mav, 5);
		mav.addObject("pageName", "BL");
	}
	
	private void processPrefer(ModelAndView mav, int cateNum) {
		HashMap<String, Integer> countMap = new HashMap<String, Integer>();
		List<StatPreferenceDto> rankList = new ArrayList<StatPreferenceDto>();
		int max = 0;
		for(int i=0;i<5;i++) {
			StatPreferenceDto statPreferenceDto = managerDao.getPreferenceTotalCount(cateNum,i+1);
			LogAspect.info(LogAspect.logMsg +statPreferenceDto);
			
			rankList.add(statPreferenceDto);
			
			if(statPreferenceDto.getPreference() > max) {
				max = statPreferenceDto.getPreference();
			}
			if(i==0)
				countMap.put("one", statPreferenceDto.getPreference());
			else if(i==1)
				countMap.put("two", statPreferenceDto.getPreference());
			else if(i==2)
				countMap.put("three", statPreferenceDto.getPreference());
			else if(i==3)
				countMap.put("four", statPreferenceDto.getPreference());
			else if(i==4)
				countMap.put("five", statPreferenceDto.getPreference());
		}
		
		int maxCount = 0;
		HashMap<String, Integer> heightMap = new HashMap<String, Integer>();
		for(int i=0;i<5;i++) {
			String key = "";
			if(i==0)
				key = "one";
			else if(i==1)
				key = "two";
			else if(i==2)
				key = "three";
			else if(i==3)
				key = "four";
			else if(i==4)
				key = "five";
			
			if(maxCount < countMap.get(key)) {
				maxCount = countMap.get(key);
			}
			int height = (int)(((float)countMap.get(key)/max) * 300);
			heightMap.put(key, height);
		}
		
		//랭킹5가져오기
		mav.addObject("rankList", rankList);
		mav.addObject("countMap", countMap);
		mav.addObject("heightMap", heightMap);
		mav.addObject("maxCount", maxCount);
		mav.addObject("oneName", rankList.get(0).getBook_name());
		mav.addObject("twoName", rankList.get(1).getBook_name());
		mav.addObject("threeName", rankList.get(2).getBook_name());
		mav.addObject("fourName", rankList.get(3).getBook_name());
		mav.addObject("fiveName", rankList.get(4).getBook_name());
	}

	@Override
	public void authorUpdateBoard(ModelAndView mav) {
		HttpServletRequest request = (HttpServletRequest) mav.getModelMap().get("request");
		String condition = request.getParameter("condition");
		String pageNumber = request.getParameter("pageNumber");
		if(pageNumber == null) pageNumber = "1";
		
		int boardSize = 10;
		int currentPage = Integer.parseInt(pageNumber);
		int startRow = (currentPage - 1) * boardSize + 1;
		int endRow = currentPage * boardSize;
		
		List<AuthorEditDto> authorEditList = null;
		int count = 0;
		if(condition == null) {
			authorEditList = managerDao.getAuthorEditList(startRow,endRow);
			count = managerDao.getAuthorEditCount();
		}else {
			authorEditList = managerDao.getAuthorEditList(condition,startRow,endRow);
			count = managerDao.getAuthorEditCount(condition);
		}
		
		mav.addObject("pageNumber", pageNumber);
		mav.addObject("boardSize", boardSize);
		mav.addObject("count", count);
		mav.addObject("authorEditList", authorEditList);
		mav.addObject("condition", condition);
	}

	@Override
	public void statTotal(ModelAndView mav) {
		int ilban = managerDao.getStatTotalCount(1);
		int romance = managerDao.getStatTotalCount(2);
		int fantasy = managerDao.getStatTotalCount(3);
		int manhwa = managerDao.getStatTotalCount(4);
		int bl = managerDao.getStatTotalCount(5);
		
		mav.addObject("ilban", ilban);
		mav.addObject("romance", romance);
		mav.addObject("fantasy", fantasy);
		mav.addObject("manhwa", manhwa);
		mav.addObject("bl", bl);
		
	}

	
	
	
}
