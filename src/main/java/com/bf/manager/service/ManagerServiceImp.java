package com.bf.manager.service;

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

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;

import com.bf.aop.LogAspect;
import com.bf.manager.dao.ManagerDao;
import com.bf.manager.dto.AuthorDto;
import com.bf.manager.dto.BookDto;
import com.bf.manager.dto.BookFirstCateDto;
import com.bf.manager.dto.BookSecondCateDto;
import com.bf.manager.dto.BookThirdCateDto;
import com.bf.manager.dto.CountryDto;
import com.bf.manager.dto.PublisherDto;


/**
 * @이름: 염현우 X 전상헌
 * @날짜: 2018. 2. 12.
 * @설명:
 */
@Component
public class ManagerServiceImp implements ManagerService {
	@Autowired
	private ManagerDao managerDao;

	// Go 염현우
	@Override
	public void bookCategoryOk(ModelAndView mav) {
		//대분류 설정
		int thae = managerDao.checkCateOne();
		if(thae != 5) {
			String[] cateOne = {"일반","로맨스","판타지","만화","BL"};
			for(int i=0;i<cateOne.length;i++) {
				managerDao.insertCateOne(cateOne[i]);
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
		
		int check = managerDao.authorInsertOk(authorDto);
		
		mav.addObject("check", check);
	}
	
	@Override
	public void bookInsert(ModelAndView mav) {
		List<BookFirstCateDto> firstCateList = managerDao.getFirstCate();
		mav.addObject("firstCateList", firstCateList);
	}
	
	@Override
	public void bookCateOne(ModelAndView mav) {
		HttpServletRequest request = (HttpServletRequest) mav.getModelMap().get("request");
		HttpServletResponse response = (HttpServletResponse) mav.getModelMap().get("response");
		
		String name = request.getParameter("name");

		List<BookSecondCateDto> secondCateList = managerDao.bookCateOne(name);
		LogAspect.logger.info(LogAspect.logMsg + secondCateList);
		
		String secondNameList = "";
		for(int i=0;i<secondCateList.size();i++) {
			secondNameList += secondCateList.get(i).getName() + ",";
		}
		
		try {
			response.setContentType("application/text;charset=utf-8");
			response.getWriter().print(secondNameList);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	@Override
	public void bookCateTwo(ModelAndView mav) {
		HttpServletRequest request = (HttpServletRequest) mav.getModelMap().get("request");
		HttpServletResponse response = (HttpServletResponse) mav.getModelMap().get("response");
		
		String name = request.getParameter("name");

		List<BookThirdCateDto> thirdCateList = managerDao.bookCateTwo(name);
		LogAspect.logger.info(LogAspect.logMsg + thirdCateList);
		
		String thirdNameList = "";
		for(int i=0;i<thirdCateList.size();i++) {
			thirdNameList += thirdCateList.get(i).getName() + ",";
		}
		
		try {
			response.setContentType("application/text;charset=utf-8");
			response.getWriter().print(thirdNameList);
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

	@Override
	public void autoPublisher(ModelAndView mav) {
		HttpServletRequest request = (HttpServletRequest) mav.getModelMap().get("request");
		HttpServletResponse response = (HttpServletResponse) mav.getModelMap().get("response");
		
		String url = request.getParameter("value");

		int countPub = 0;
		try {
			Document doc = Jsoup.connect(url).get();
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
			}
			
			response.setContentType("application/text;charset=utf-8");
			response.getWriter().print(countPub + "개 출판사 등록완료");
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
	
	@Override
	public void autoAuthor(ModelAndView mav) {
		HttpServletRequest request = (HttpServletRequest) mav.getModelMap().get("request");
		HttpServletResponse response = (HttpServletResponse) mav.getModelMap().get("response");
		
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
		String url = request.getParameter("value");
		int inputSize = 0;

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
					inputSize += managerDao.authorInsertOk(authorDto);

					LogAspect.logger.info(LogAspect.logMsg + "작가:" + authorDto);
					
				}
			}
			response.setContentType("application/text;charset=utf-8");
			response.getWriter().print(inputSize + "명 입력완료");
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
	
	@Override
	public void autoBook(ModelAndView mav) {
		HttpServletRequest request = (HttpServletRequest) mav.getModelMap().get("request");
		HttpServletResponse response = (HttpServletResponse) mav.getModelMap().get("response");
		
		String url = request.getParameter("value");
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
					DecimalFormat df2 = new DecimalFormat(".##");
					Element priceTable = meta.selectFirst(".normal_price_table");
					if(priceTable == null) {
						priceTable = meta.selectFirst(".series_price_table");
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
									Number number = df.parse(bookPrice.selectFirst("span").text());
									if(pType.text().equals("종이책 정가") || pType.text().equals("전자책 단권 정가")) {
										bookDto.setPrice(number.intValue());
										bookDto.setType("paper");
									}else if(pType.text().equals("전자책 정가") || pType.text().equals("전자책 세트 정가")) {
										if(p.selectFirst(".discount_rate").selectFirst("span") == null ) {
											bookDto.setDiscount(0);
										}else {
											int p1 = bookDto.getPrice();
											int p2 = number.intValue();
											double discount = 1- ((double) p2 / p1);
											
											bookDto.setDiscount(Double.parseDouble(df2.format(discount)));										
										}
									}else if(pType.text().equals("판매가")) {
										if(p.selectFirst(".discount_rate").selectFirst("span") == null ) {
											bookDto.setDiscount2(0);
										}else {
											int p1 = bookDto.getPrice();
											double p2 = p1 * (1-bookDto.getDiscount());
											int p3 = number.intValue();
											double discount2 = 1-(p3 / p2);
											bookDto.setDiscount2(Double.parseDouble(df2.format(discount2)));										
										}
									}
								}
							} catch (ParseException e) {
								e.printStackTrace();
							}
						}
					}
					
					//대여 기본타입 no
					bookDto.setRental_period("no");
					
					if(!bookDto.getType().equals("paper") && !bookDto.getType().equals("series")) {
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
				}
				
			}
			response.setContentType("application/text;charset=utf-8");
			response.getWriter().print(inputBook + "개 입력완료");
		} catch (IOException e) {
			e.printStackTrace();
		}
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
	
	@Override
	public void autoUrl(ModelAndView mav) {
		HttpServletRequest request = (HttpServletRequest) mav.getModelMap().get("request");
		HttpServletResponse response = (HttpServletResponse) mav.getModelMap().get("response");
		
    	FileReader reader = null;
    	HashMap<String,String> map = null;
    	try {
    		reader = new FileReader(request.getRealPath(request.getParameter("value")));
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
					autoAuthorTest(href);
					autoBookTest(href);
				}
			}
			response.setContentType("application/text;charset=utf-8");
			response.getWriter().print("ㅋㅋㅋ");
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	
	public void autoPublisherTest(String href) {
		String url = href;

		int countPub = 0;
		try {
			Document doc = Jsoup.connect(url).get();
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
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
	
	public void autoAuthorTest(String href1) {
		
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
		int inputSize = 0;

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
					inputSize += managerDao.authorInsertOk(authorDto);

					LogAspect.logger.info(LogAspect.logMsg + "작가:" + authorDto);
					
				}
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
	
	public void autoBookTest(String href) {
		
		String url = href;
		System.out.println(href);
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
					DecimalFormat df2 = new DecimalFormat(".##");
					Element priceTable = meta.selectFirst(".normal_price_table");
					if(priceTable == null) {
						priceTable = meta.selectFirst(".series_price_table");
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
										}else {
											/*int p1 = bookDto.getPrice();
											int p2 = number.intValue();
											double discount = 1- ((double) p2 / p1);
											
											bookDto.setDiscount(Double.parseDouble(df2.format(discount)));*/
											Element discount = p.selectFirst(".discount_rate");
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
										}else {/*
											int p1 = bookDto.getPrice();
											double p2 = p1 * (1-bookDto.getDiscount());
											int p3 = number.intValue();
											double discount2 = 1-(p3 / p2);
											bookDto.setDiscount2(Double.parseDouble(df2.format(discount2)));	
											*/
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
					
					//대여 기본타입 no
					bookDto.setRental_period("no");
					
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
				}
				
			}
			System.out.println(inputBook + "개 입력완료");
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

}
