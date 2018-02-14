package com.bf.manager.service;

import java.io.IOException;
import java.text.DecimalFormat;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

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

		Document doc;
		try {
			doc = Jsoup.connect(url).get();
			Elements elements = doc.select(".js_book_macro_wrapper");
			
			Elements publisher = elements.select(".publisher");
			
			for(Element p : publisher) {
				int check = managerDao.publisherNameCheck(p.text());
				if(check > 0) {
					continue;
				}
				PublisherDto publisherDto = new PublisherDto();
				publisherDto.setName(p.text());
				publisherDto.setUrl("com.bf.bookFactory");
				managerDao.publisherInsertOk(publisherDto);
			}
			
			response.setContentType("application/text;charset=utf-8");
			response.getWriter().print("오케이");
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
	
	@Override
	public void autoAuthor(ModelAndView mav) {
		HttpServletRequest request = (HttpServletRequest) mav.getModelMap().get("request");
		HttpServletResponse response = (HttpServletResponse) mav.getModelMap().get("response");
		
		String url = request.getParameter("value");
		int inputSize = 0;
		LogAspect.logger.info(LogAspect.logMsg + url);

		try {
			ArrayList<String> hrefList = searchUrl(url);
			
			for(int i=0;i<hrefList.size();i++) {
				String subUrl = hrefList.get(i);
				Document subDoc = Jsoup.connect(subUrl).get();
				Elements info = subDoc.select(".header_info_wrap");
				
				ArrayList<String> authorLinkList = new ArrayList<String>();
				for(Element meta : info) {
					Elements authorLink = meta.select(".author_detail_link");
					for(Element al : authorLink) {
						authorLinkList.add("https://ridibooks.com" + al.attr("href"));						
					}
				}
				
				//작가정보
				for(int k=0;k<authorLinkList.size();k++) {
					String authorUrl = authorLinkList.get(k);
					
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
					int check = managerDao.authorCheck(authorName,birthday,country_num);
					if(check > 0) {
						LogAspect.logger.info(LogAspect.logMsg + "중복!!:");
						continue;
					}
					
					/*if(describe.length() > 2000) {
						describe = describe.substring(0, 1300);
					}*/
					
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
					
					inputSize += managerDao.authorInsertOk(authorDto);

					LogAspect.logger.info(LogAspect.logMsg + "작가:" + authorDto);
					
				}
			}
			response.setContentType("application/text;charset=utf-8");
			response.getWriter().print(inputSize);
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
			BookDto bookDto = new BookDto();
			
			for(int i=0;i<hrefList.size();i++) {
				String subUrl = hrefList.get(i);
				Document subDoc = Jsoup.connect(subUrl).get();
				Elements info = subDoc.select(".header_info_wrap");
				
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
					ArrayList<String> cateList = new ArrayList<String>();
					String cateStr = "";
					for(int k=0;k<cate.size();k++) {
						Element cateName = cate.get(k);
						cateStr += cateName.text() + ",";
						if(k%2 == 1) {
							cateList.add(cateStr);
							cateStr = "";
						}
					}
					System.out.println(cateList);
					
					//작가
					Elements author = meta.select(".author_detail_link");
					
					ArrayList<Integer> authorStr = new ArrayList<Integer>();
					for(Element a : author) {
						LogAspect.logger.info(LogAspect.logMsg + "작가:" + a.text());

						int author_num = managerDao.selectAuthorNum(a.text());
						authorStr.add(author_num);
					}
					
					System.out.println("작가:\t" + authorStr);
					
					Elements publisher = meta.select(".publisher_detail_link");
					System.out.println("출판사:\t" + publisher.text());
					int pub_num = managerDao.getPublisherNum(publisher.text());
					
					Elements pubDate = meta.select(".book_info_list_wrapper").select(".published_date_info");
					System.out.println("출간정보:\t" + pubDate.text());
					
					Element img = meta.nextElementSibling().selectFirst(".thumbnail_image").selectFirst("img");
					System.out.println(img.attr("src"));
					
					Elements price = meta.select(".book_price");
					ArrayList<Integer> priceList = new ArrayList<Integer>();
					
					for(Element p : price) {
						DecimalFormat df = new DecimalFormat(",###");
						try {
							Number number = df.parse(p.selectFirst("span").text());
							priceList.add(number.intValue());
						} catch (ParseException e) {
							e.printStackTrace();
						}
					}
					System.out.println("가격:\t" + priceList);
					
					
					bookDto.setName(name);
					bookDto.setWrite_date(pubDate.text());
					bookDto.setImg_path(img.attr("src"));
					bookDto.setPub_num(pub_num);
					bookDto.setPreference(0);
					bookDto.setSub_title(subTitleStr);
					bookDto.setSupport("PAPER,iOS,Android,PC,Mac");
					
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
					
					if(priceList.size()==2) {
						int p1 = priceList.get(0);
						int p2 = priceList.get(1);
						float discount = 1- ((float) p2 / p1);
						bookDto.setPrice(p1);
						bookDto.setDiscount(discount);
						bookDto.setType("전자책");
					}else if(priceList.size() == 3) {
						int p1 = priceList.get(0);
						int p2 = priceList.get(1);
						int p3 = priceList.get(2);
						float discount = 1-((float) p2 / p1);
						float discount2 = 1-((float) p3 / p2);
						
						bookDto.setPrice(p1);
						bookDto.setDiscount(discount);
						bookDto.setDiscount2(discount2);
						bookDto.setType("종이책");
					}
					

				}
				
				Element intro = subDoc.selectFirst(".introduce_paragraph");
				String introHtml = intro.html();
				String delSpan = "</span>";
				String introStr = introHtml.substring(introHtml.indexOf(delSpan) + delSpan.length());
				bookDto.setIntro(introStr);
				
				Element pubReview = subDoc.selectFirst("#publisher_book_review");
				String pubReviewStr = "없음";
				if(pubReview != null)	pubReviewStr = pubReview.selectFirst("p").html();
				bookDto.setPub_intro(pubReviewStr);
				
				int check = managerDao.checkBook(bookDto.getImg_path());
				if(check > 0) {
					LogAspect.logger.info(LogAspect.logMsg + "중복입니다");
					continue;
				}else {
					int inputBook = managerDao.insertBook(bookDto);
				}
				
				
				LogAspect.logger.info(LogAspect.logMsg + "책:" + bookDto);
			}
			
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
	
	

}
