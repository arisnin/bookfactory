package com.bf.book.service;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.JSONValue;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;

import com.bf.aop.LogAspect;
import com.bf.book.dao.BookDao;
import com.bf.book.dto.DetailCateDto;
import com.bf.book.dto.DetailDto;
import com.bf.book.dto.ExampleDto;
import com.bf.book.dto.HomeDto;
import com.bf.book.dto.NewBookDto;
import com.bf.book.dto.ReplyDto;
import com.bf.book.dto.ReviewDto;
import com.bf.book.dto.ReviewPageDto;
import com.bf.main.dto.CategoryPageDto;
import com.bf.manager.dto.AuthorDto;
import com.bf.member.model.User;
import com.bf.myPage.dto.MyPageRecentLookBookDto;

/**
 * @author 박성호
 * @date 2018. 2. 14.
 * @description 대분류별 보기 / 책 상세보기 관련 서비스 구현 클래스
 *
 * @author choi jung eun
 * @date 2018. 2. 20.
 * @description 각각의 홈화면, 신간 등 리스트뿌려주기, 상세보기 화면 담당
 */

@Component
public class BookServiceImp implements BookService {
	@Autowired
	private BookDao bookDao;

	@Override
	public ModelAndView author(ModelAndView mav) {
		HttpServletRequest request = (HttpServletRequest)mav.getModelMap().get("request");
		
		String anum = request.getParameter("anum");
		String onum = request.getParameter("onum");
		int authorNum = 0;
		
		if (anum == null) return mav;
		else authorNum = Integer.parseInt(anum);
		int orderTypeNum = onum == null ? 100 : Integer.parseInt(onum);
		
		LogAspect.info("anum/onum:" + authorNum + "/" + orderTypeNum);
		
		// Pagination 설정
		String pnum = request.getParameter("pnum");
		int pageNumber = pnum == null ? 1 : Integer.parseInt(pnum);

		int boardSize = 10;
		int endRow = pageNumber * boardSize;
		int startRow = endRow - boardSize + 1;
		int count = bookDao.getAuthorBookCount(authorNum);
		
		AuthorDto authorDto = bookDao.getAuthorInfo(authorNum);
		List<CategoryPageDto> authorBookList = bookDao.getAuthorBookList(authorNum, orderTypeNum, startRow, endRow);
		
		LogAspect.info("authorBookList:" + authorBookList.size());
		
		mav.addObject("pnum", pageNumber);
		mav.addObject("count", count);
		mav.addObject("boardSize", boardSize);
		
		return mav.addObject("authorDto", authorDto).addObject("authorBookList", authorBookList);
	}
	
	@Override
	public ModelAndView reviewWrite(ModelAndView mav) {
		Map<String, Object> map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		ReviewDto reviewDto = (ReviewDto)map.get("reviewDto");

		// 책 번호(book_num)는 presentation단에서 넘어옵니다.

		User user = (User) request.getSession().getAttribute("userInfo");
		reviewDto.setId(user.getUsername());

		// 스포일러(spoiler)는 존재하면 'on', 존재하지 않으면 'off'입니다.
		if (!"on".equals(reviewDto.getSpoiler())) {
			reviewDto.setSpoiler("off");
		}
		// 공개여부(display)는 디폴트로 'on'만 설정하면 됩니다. 이 값은 관리자 메뉴에서 공개(on)/비공개(off) 전환 가능합니다.
		reviewDto.setDisplay("on");
		reviewDto.setWrite_date(new java.util.Date());
		reviewDto.setContent(reviewDto.getContent().replace("\r\n", "<br />"));
		
		LogAspect.info(reviewDto);

		int check = bookDao.insertReview(reviewDto);

		return mav.addObject("checkReview", check).addObject("book_num",reviewDto.getBook_num());
	}

	@Override
	public ModelAndView reviewList(ModelAndView mav) {
		HttpServletRequest request=(HttpServletRequest)mav.getModel().get("request");
		String reviewRequestUrl = request.getContextPath() + "/review/write.do";
		
		int buyerCount = 0;
		int scoreGraph[] = new int[] {0,0,0,0,0,0};
		
		if (request.getParameter("book_num") == null) {
			LogAspect.warning("요청 객체에 책 번호가 없습니다.");
		} else {
			int book_num = Integer.parseInt(request.getParameter("book_num"));
			LogAspect.info("book_num:" + book_num);

			User user = (User) request.getSession().getAttribute("userInfo");
			LogAspect.info("userInfo:" + user);
			
			// reviewSelf 생성
			if (user != null) {
				ReviewPageDto reviewSelf = bookDao.selectReviewSelf(book_num, user.getUsername());
				
				if (reviewSelf != null) {
					reviewRequestUrl = request.getContextPath() + "/review/update.do";
					mav.addObject("reviewSelfContent",reviewSelf.getContent().replace("<br />", "\r\n"));
				}
				
				mav.addObject("reviewSelf",reviewSelf);				
				LogAspect.info("reviewSelf:" + reviewSelf);
			}
			
			// reviewList 생성
			List<ReviewPageDto> reviewList = bookDao.selectReviewList(book_num);
			
			mav.addObject("reviewList",reviewList).addObject("book_num",book_num);
			LogAspect.info("reviewList:" + reviewList.size());
			
			// 기본 리뷰 정보 생성 & replyList 생성
			for (ReviewPageDto e : reviewList) {
				// 리뷰 정보
				if ("on".equalsIgnoreCase(e.getBuyer())) {
					buyerCount++;
					scoreGraph[e.getStar_point()]++;
				}
				// 댓글 리스트
				List<ReplyDto> replyList = bookDao.selectReplyList(e.getNum());
				e.setReplyList(replyList);
			}
		}
		
		mav.addObject("buyerCount",buyerCount).addObject("scoreGraph",scoreGraph);
		
		return mav.addObject("reviewRequestUrl", reviewRequestUrl);
	}

	@Override
	public ModelAndView reviewUpdate(ModelAndView mav) {
		Map<String, Object> map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		ReviewDto reviewDto = (ReviewDto)map.get("reviewDto");

		// 책 번호(book_num)는 presentation단에서 넘어옵니다.
		
		// ID(username)
		User user = (User)request.getSession().getAttribute("userInfo");
		if (user == null) return mav.addObject("checkReview",-1).addObject("error","로그인 상태가 아닙니다.");
		
		reviewDto.setId(user.getUsername());

		// Spoiler
		if (!"on".equals(reviewDto.getSpoiler())) {
			reviewDto.setSpoiler("off");
		}
		
		// Content
		reviewDto.setContent(reviewDto.getContent().replace("\r\n", "<br />"));
		
		LogAspect.info(reviewDto);

		int checkReview = bookDao.updateReview(reviewDto);
		
		if (checkReview == 0) {
			mav.addObject("error","시스템 오류입니다.");
		}
		
		return mav.addObject("checkReview", checkReview).addObject("book_num",reviewDto.getBook_num());
	}

	@Override
	public void reviewReply(HttpServletRequest request, HttpServletResponse response, ReplyDto replyDto) throws IOException {
		int check = -1;
		
		// Get user info.
		User user = (User)request.getSession().getAttribute("userInfo");
		if (user != null) {
			// Set user id
			replyDto.setId(user.getUsername());
			replyDto.setContent(replyDto.getContent().replace("\r\n", "<br />"));
			replyDto.setWrite_date(new java.util.Date());
			LogAspect.info(replyDto);
			
			check = bookDao.insertReply(replyDto);
		}
		
		LogAspect.info("insertReply():" + check);
		
		JSONObject json = new JSONObject();
		
		if (check > 0) {
			json.put("type", "ok");
			json.put("id", replyDto.getId());
			json.put("content", replyDto.getContent());
			json.put("write_date", new SimpleDateFormat("yy-MM-dd hh:mm").format(replyDto.getWrite_date()));
		} else if (check == -1) {
			json.put("type", "login");
			json.put("error", "로그인이 필요한 서비스입니다.");
		} else {
			json.put("type", "system");
			json.put("error", "시스템 에러로 댓글 달기에 실패했습니다.");
		}
		
		LogAspect.info(json);
		
		response.setContentType("application/x-json;charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.print(json.toJSONString());
		out.flush();
		out.close();
	}

	@Override
	public void reviewDelete(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String review_num = request.getParameter("review_num");
		String id = "";
		int check = -2;
		
		if (review_num != null) {
			int num = Integer.parseInt(review_num);
			
			// Get user info.
			User user = (User)request.getSession().getAttribute("userInfo");
			if (user == null) {
				check = -1;
			} else {
				id = user.getUsername();
				check = bookDao.deleteReview(id, num);
			}
		}
		
		LogAspect.info("reviewDelete():" + id + "/" + review_num);
		
		JSONObject json = new JSONObject();
		
		if (check > 0) {
			json.put("type", "ok");
		} else if (check == -1) {
			json.put("type", "login");
			json.put("error", "로그인이 필요한 서비스입니다.");
		} else {
			json.put("type", "system");
			json.put("error", "시스템 에러로 댓글 달기에 실패했습니다.");
		}
		
		LogAspect.info(json);
		
		response.setContentType("application/x-json;charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.print(json.toJSONString());
		out.flush();
		out.close();
	}
	
	//여기서부터 홈입니다.
	@Override
	public void normalHome(ModelAndView mav) {
		// TODO Auto-generated method stub
		HttpServletRequest request=(HttpServletRequest)mav.getModel().get("request");
		String firstCateNum=request.getParameter("firstCateNum");
		
		if(firstCateNum==null)	firstCateNum="1";
		
		int firstCate=Integer.parseInt(firstCateNum);
		
		//오늘의 추천은 랜덤으로 뽑아옴
		int preBookNum=0;
		List<Integer> randomBookNum=bookDao.getRandomBookNum(firstCate);
		List<HomeDto> recomList=new ArrayList<HomeDto>();
		
		for(int i=0;i<randomBookNum.size();i++) {
			int random=randomBookNum.get(i);
			
			if(preBookNum!=random) {
				HomeDto dto=bookDao.getRecomList(random);
				recomList.add(dto);
			}
			
			preBookNum=randomBookNum.get(i);
		}
		
		//사람들이 지금 많이 읽는 책 =>구매기준으로뽑아옴.
		List<HomeDto> pop=bookDao.getPopularList(firstCate);
			//두번째카테고리 이름받아옴. 중복된애들때문에 따로처리
		for(int i=0;i<pop.size();i++) {
			long book_num=pop.get(i).getBook_num();
			String thirdName=bookDao.getThirdNameOverlap(book_num);
//			System.out.println(thirdName);
			pop.get(i).setThirdCate(thirdName);
		}
		
		//베스트셀러 - > 구매기능완성되면 잘팔린순으로 뽑아와야함
		HashMap<String, Object> pMap=new HashMap<String, Object>();
		pMap.put("firstCate", firstCate);
		pMap.put("startRow", 1);
		pMap.put("endRow", 11);
		pMap.put("day", 7);
		pMap.put("rental", "no");
		List<HomeDto> bestDto=bookDao.getBestSellerWeek(pMap);
//		System.out.println(bestDto.toString());
		
		mav.addObject("recomList", recomList);
		mav.addObject("pop",pop);
		mav.addObject("bestDto", bestDto);
		mav.addObject("firstCate",firstCate);

		if(firstCate==1) {
			mav.setViewName("genre/normal.main");
		}else if(firstCate==4) {
			mav.setViewName("genre/comic.main");
		}
	}
	
	@Override
	public void homeNewbook(ModelAndView mav) {
		// TODO Auto-generated method stub
		HttpServletRequest request=(HttpServletRequest)mav.getModel().get("request");
		String firstCate=request.getParameter("firstCateNum");
		String bookType=request.getParameter("bookType");
		String seconCate=request.getParameter("seconCate");
		String rental=request.getParameter("rental");
		
		String pn=request.getParameter("pageNumber");
		if(pn==null)	pn="1";
		
		int pageNumber=Integer.parseInt(pn);
		
		String firstCateName=bookDao.getFirstCateName(firstCate);
		List<NewBookDto> newList=null;
		
		int boardSize=20;
		int startRow=(pageNumber-1)*boardSize+1;
		int endRow=pageNumber*boardSize;
		int newCount=0;
		
		//대여 구분
		if(rental==null || rental.equalsIgnoreCase("no") || rental.equalsIgnoreCase("")) {
			rental="no";
		}else if(rental.equalsIgnoreCase("yes")) {
			rental="yes";
		}
		
		HashMap<String, String> cateMap=new HashMap<String, String>();
		cateMap.put("firstCate", firstCate);
		cateMap.put("seconCate", seconCate);
		cateMap.put("startRow", String.valueOf(startRow));
		cateMap.put("endRow", String.valueOf(endRow));
		cateMap.put("rental", rental);

		HashMap<String, Object> map=new HashMap<String, Object>();
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		map.put("firstCate", Integer.parseInt(firstCate));
		map.put("rental", rental);
		
		//일반, 나머지카테(단행, 연재 구분)
		if(bookType==null || bookType=="" || bookType.equals("")) {
			newCount=bookDao.getNewBookCount(map);
			
			if(newCount>0) {
				newList=bookDao.getNewBookList(map);
//				System.out.println(newList.toString());
			}
		}else if(bookType.equalsIgnoreCase("paper") || bookType.equalsIgnoreCase("serial")) {
			newCount=bookDao.getPaperNewBookCount(cateMap);
			
			if(newCount>0) {
				newList=bookDao.getPaperNewBookList(cateMap);
			}
		}
		
//		System.out.println(newList.size());
		if(newList.size()>0) {
			for(int i=0;i<newList.size();i++) {
				int after=newList.get(i).getIntro().indexOf(">");
				String intro=newList.get(i).getIntro().substring(after+1);
				newList.get(i).setIntro(intro);
			}
		}
		
//		System.out.println(newCount +"," +firstCate);
//		System.out.println(rental);
		
		mav.addObject("firstCate", firstCate);
		mav.addObject("firstCateName", firstCateName);
		mav.addObject("seconCate", seconCate);
		mav.addObject("rental",rental);
		mav.addObject("newList", newList);
		mav.addObject("bookType", bookType);
		mav.addObject("pageNumber", pageNumber);
		mav.addObject("newCount", newCount);
		mav.addObject("boardSize", boardSize);
	}

	@Override
	public void romanceHome(ModelAndView mav) {
		// TODO Auto-generated method stub
		HttpServletRequest request=(HttpServletRequest)mav.getModel().get("request");
		String firstCateNum=request.getParameter("firstCateNum");
		
		int firstCate=Integer.parseInt(firstCateNum);
		
		//화면이 일반단행본인지, 연재인지로 구분되서 시작되어야함
		String type=request.getParameter("bookType");
		String secon=request.getParameter("seconCate");

		int seconCate=0;
		
		if(secon!=null) {
			seconCate=Integer.parseInt(secon);
		}
		if(type==null || type=="paper" || secon==null) {
			seconCate=bookDao.getBookSecondCate(firstCate);
		}else if(type=="serial") {
			//연재는 아직 데이터가없음
		}
		
		HashMap<String, Integer> map=new HashMap<String, Integer>();
		map.put("firstCate", firstCate);
		map.put("seconCate", seconCate);
		
		System.out.println("seconCate : "+seconCate);
		
		//오늘의 추천은 랜덤으로 뽑아옴
		int preBookNum=0;
		List<Integer> randomBookNum=bookDao.getPaperRandomBookNum(map);
		List<HomeDto> recomList=new ArrayList<HomeDto>();
		
		for(int i=0;i<randomBookNum.size();i++) {
			int random=randomBookNum.get(i);
			
			if(preBookNum!=random) {
				HomeDto dto=bookDao.getRecomList(random);
				recomList.add(dto);
			}
			
			preBookNum=randomBookNum.get(i);
		}
		
		//사람들이 지금 많이 읽는 책 => 나중에 어떤식으로들어갈지 모름
		List<HomeDto> pop=bookDao.getPopularList(map);
		//두번째카테고리 이름받아옴. 중복된애들때문에 따로처리
		for(int i=0;i<pop.size();i++) {
			long book_num=pop.get(i).getBook_num();
			String thirdName=bookDao.getThirdNameOverlap(book_num);
		//		System.out.println(thirdName);
			pop.get(i).setThirdCate(thirdName);
		}
		
		//베스트셀러 - > 구매기능완성되면 잘팔린순으로 뽑아와야함
		HashMap<String, Object> pMap=new HashMap<String, Object>();
		pMap.put("firstCate", firstCate);
		pMap.put("seconCate", seconCate);
		pMap.put("startRow", 1);
		pMap.put("endRow", 11);
		pMap.put("day", 7);
		pMap.put("rental", "no");
		List<HomeDto> bestDto=bookDao.getBestSellerWeekPaper(pMap);
		
//		List<HomeDto> homeList=bookDao.getPaperHomeBookInfoList(map);
//		LogAspect.info(LogAspect.logMsg + homeList.toString());
		
		mav.addObject("recomList", recomList);
		mav.addObject("pop",pop);
		mav.addObject("bestDto", bestDto);
		mav.addObject("firstCate",firstCate);
		mav.addObject("seconCate", seconCate);
		
		if(firstCate==2) {
			mav.setViewName("genre/romance.main");
		}else if(firstCate==3) {
			mav.setViewName("genre/fantasy.main");
		}else if(firstCate==5) {
			mav.setViewName("genre/bl.main");
		}
	}

	@Override	//책 상세보기
	public void bookDetail(ModelAndView mav) {
		// TODO Auto-generated method stub
		HttpServletRequest request=(HttpServletRequest) mav.getModel().get("request");
		long book_num=Long.parseLong(request.getParameter("book_num"));
		DetailDto dto=bookDao.getBookAllInfo(book_num);
		
		//카테고리작업
		List<DetailCateDto> cateDto=bookDao.getDetailCate(book_num);
		
		for(int i=0;i<cateDto.size();i++) {
			if(i==0) {
				dto.setSecond_name_1(cateDto.get(i).getSecond_name());
				dto.setSecond_num_1(cateDto.get(i).getSecond_num());
				dto.setThird_name_1(cateDto.get(i).getThird_name());
				dto.setThird_num_1(cateDto.get(i).getThird_num());
			}else if(i==1) {
				dto.setSecond_name_2(cateDto.get(i).getSecond_name());
				dto.setSecond_num_2(cateDto.get(i).getSecond_num());
				dto.setThird_name_2(cateDto.get(i).getThird_name());
				dto.setThird_num_2(cateDto.get(i).getThird_num());
			}else if(i==2) {
				dto.setSecond_name_3(cateDto.get(i).getSecond_name());
				dto.setSecond_num_3(cateDto.get(i).getSecond_num());
				dto.setThird_name_3(cateDto.get(i).getThird_name());
				dto.setThird_num_3(cateDto.get(i).getThird_num());
			}
		}
		
		//출판사 이름뽑아오기
		dto.setPub_name(bookDao.getPubName(book_num));
		
		AuthorDto auDto=null;
		AuthorDto ilDto=null;
		AuthorDto trDto=null;
		
		//작가,번역,일러 정보뽑아오기
		//작가 대표저서
		List<HomeDto> authorBook=null;
		List<HomeDto> illorBook=null;
		List<HomeDto> transBook=null;
		if(dto.getAuthor_num()!=0) {
			auDto=bookDao.getAuthorInfo(dto.getAuthor_num());
			authorBook=bookDao.getAuthorBook(dto.getAuthor_num());
			if(authorBook.size()==0)	authorBook=null;
			
		}
		
		if(dto.getIllu_num()!=0) {
			ilDto=bookDao.getAuthorInfo(dto.getIllu_num());
			illorBook=bookDao.getAuthorBook(dto.getIllu_num());
			if(illorBook.size()==0)	illorBook=null;
		}
		
		if(dto.getTrans_num()!=0) {
			trDto=bookDao.getAuthorInfo(dto.getTrans_num());
			transBook=bookDao.getAuthorBook(dto.getTrans_num());
			if(transBook.size()==0)	transBook=null;
		}
		
		//이벤트기간뽑기 - ?
		
		mav.addObject("detailDto", dto);
		mav.addObject("auDto", auDto);
		mav.addObject("ilDto", ilDto);
		mav.addObject("trDto", trDto);
		mav.addObject("authorBook", authorBook);
		mav.addObject("illorBook", illorBook);
		mav.addObject("transBook", transBook);

		// 최근 본 책 으로 넘어가게 insert문 작성(정호열) - 2018. 3. 3 user NullPointException 안나도록 수정(박성호)
		User user = (User) request.getSession().getAttribute("userInfo");
		if (user != null) {
			String id = user.getUsername(); 	//여기 로긴안하면 에러납니당 널값에러
			
			MyPageRecentLookBookDto myPageRecentLookBookDto = new MyPageRecentLookBookDto();
			myPageRecentLookBookDto.setId(id);
			myPageRecentLookBookDto.setBook_num(Integer.parseInt(request.getParameter("book_num")));
			LogAspect.info(myPageRecentLookBookDto.toString());
			
			if(id != null){
				int check = bookDao.recentLookBookInsert(myPageRecentLookBookDto);
				LogAspect.info(check);
				mav.addObject("check", check);
			}
		}		
	}

	@Override	//키워드검색
	public void keyword(ModelAndView mav) {
		// TODO Auto-generated method stub
		HttpServletRequest request=(HttpServletRequest) mav.getModel().get("request");
		int firstCate=Integer.parseInt(request.getParameter("firstCate"));
		
		mav.addObject("firstCate", firstCate);
	}

	@Override
	public void keywordSearch(ModelAndView mav) {
		// TODO Auto-generated method stub
		HttpServletRequest request=(HttpServletRequest) mav.getModel().get("request");
		HttpServletResponse response=(HttpServletResponse) mav.getModel().get("response");
		
		String tags=request.getParameter("tags");
		
		int tagListCount=0;
		
		String pn=request.getParameter("pageNumber");
		if(pn==null)	pn="1";
		int pageNumber=Integer.parseInt(pn);
		
		List<HomeDto> tagList=null;
		
		int boardSize=20;
		int startRow=(pageNumber-1)*boardSize+1;
		int endRow=pageNumber*boardSize;
		
		HashMap<String, ArrayList<String>> listMap=new HashMap<String, ArrayList<String>>();
		
		ArrayList<String> page=new ArrayList<String>();
		page.add(String.valueOf(startRow));
		page.add(String.valueOf(endRow));
		listMap.put("page", page);
		
		ArrayList<String> list=new ArrayList<String>();
		if(tags!=null) {
			String tag[]=tags.split(",");
			String query="";
			for(int i=0;i<tag.length;i++) {
				query=tag[i];
				list.add(query);
			}
			listMap.put("list", list);
			
			tagListCount=bookDao.getTagListCount(list);
			
			if(tagListCount>0 && tagListCount<10000) {
				//밑에 뿌려줄 책정보 가져와야함 덤으로 페이지 번호도.
				tagList=bookDao.getTagBookList(listMap);
			}
			
			if(tagListCount==0) {
				tagListCount=10000;
			}
			
			System.out.println("tagListCount: "+tagListCount);
			
			HashMap<String, Object> json=new HashMap<String, Object>();
			json.put("tagListCount", tagListCount);
			
			HashMap<String, Object> jsMap=new HashMap<String,Object>();
			ArrayList<Object> jsArr=new ArrayList<Object>();
			JSONArray abc=new JSONArray();
			
			if(tagList!=null) {
				for(int i=0;i<tagList.size();i++) {
					HomeDto dto=tagList.get(i);
					
					ArrayList<Object> arrT=new ArrayList<Object>();
					HashMap<String, Object> dtoMap=new HashMap<String, Object>();
					List<String> getTag=bookDao.getKeyword(dto.getBook_num());
					
					dtoMap.put("img_path", dto.getImg_path());
					dtoMap.put("book_name", dto.getBookName());
					dtoMap.put("book_num", dto.getBook_num());
					dtoMap.put("authorName", dto.getAuthorName());
					dtoMap.put("authorNum", dto.getAuthor_num());
					dtoMap.put("pub_num", dto.getPub_num());
					dtoMap.put("pub_name", dto.getPub_name());
					dtoMap.put("price", dto.getPrice());
					dtoMap.put("rental_price", dto.getRental_price());
					
					int after=dto.getIntro().indexOf(">");
					String intro=dto.getIntro().substring(after+1);
					dtoMap.put("intro", intro);
					
					dtoMap.put("star_point",dto.getStar_point());
					dtoMap.put("star_count",dto.getStar_count());
					dtoMap.put("keyword",getTag);
					
					arrT.add(dtoMap);
					jsArr.add(arrT);
					
					//가지고있는 키워드 가져오기
				}
			}
			json.put("tagList", jsArr);
			json.put("pageNumber", pageNumber);
			json.put("boardSize", boardSize);
			json.put("tagListCount", tagListCount);
			
			String text=JSONValue.toJSONString(json);
//			LogAspect.info(LogAspect.logMsg + text);
									//x-json으로 보내줘야함
			
			response.setContentType("application/x-json;charset=utf-8");
			PrintWriter out;
			try {
				out = response.getWriter();
				out.print(text);
				out.flush();
				System.out.println(text);
			} catch (IOException e) {
				e.printStackTrace();
			}
			
		}
	}

	@Override
	public void homeBestSeller(ModelAndView mav) {
		// TODO Auto-generated method stub
		HttpServletRequest request=(HttpServletRequest) mav.getModel().get("request");
		int firstCate=Integer.parseInt(request.getParameter("firstCateNum"));
		String firstCateName=bookDao.getFirstCateName(String.valueOf(firstCate));
		String type=request.getParameter("bookType");
		String secon=request.getParameter("seconCate");
		String rental=request.getParameter("rental");
		
		//대여 구분
				if(rental==null || rental.equalsIgnoreCase("no") || rental.equalsIgnoreCase("")) {
					rental="no";
				}else if(rental.equalsIgnoreCase("yes")) {
					rental="yes";
				}
		
		int seconCate=0;
		
		if(secon!=null) {
			seconCate=Integer.parseInt(secon);
		}
		if(firstCate==2 || firstCate==3 || firstCate==5) {
			if(type==null || type=="paper" || secon==null) {
				seconCate=bookDao.getBookSecondCate(firstCate);
			}else if(type=="serial") {
				//연재는 아직 데이터가없음
			}
		}
		
		String pn=request.getParameter("pageNumber");
		if(pn==null)	pn="1";
		int pageNumber=Integer.parseInt(pn);
		
		int boardSize=20;
		int startRow=(pageNumber-1)*boardSize+1;
		int endRow=pageNumber*boardSize;
		
		HashMap<String, Object> pMap=new HashMap<String, Object>();
		pMap.put("firstCate", firstCate);
		pMap.put("startRow", startRow);
		pMap.put("endRow", endRow);
		pMap.put("seconCate", seconCate);
		pMap.put("rental", rental);
		
//		System.out.println("seconCate" +seconCate);
		
		List<HomeDto> bestDto=null;
		//주간, 월간, 스테디 구분
		String bestSeller=request.getParameter("bestSeller");
		
		int bestDtoCount=0;
		
		if(bestSeller.equalsIgnoreCase("weekBest")) {
			pMap.put("day", 7);
			bestDto=bookDao.getBestSellerWeek(pMap);
			bestDtoCount=bookDao.getBestSellerWeekCount(pMap);
		}else if(bestSeller.equalsIgnoreCase("monthBest")) {
			pMap.put("day", 30);
			bestDto=bookDao.getBestSellerWeek(pMap);
			bestDtoCount=bookDao.getBestSellerWeekCount(pMap);
		}else if(bestSeller.equalsIgnoreCase("steady")) {
			bestDto=bookDao.getBestSellerSteady(pMap);
			bestDtoCount=bookDao.getBestSellerSteadyCount(pMap);
		}
		
		for(int i=0;i<bestDto.size();i++) {
			int after=bestDto.get(i).getIntro().indexOf(">");
			String intro=bestDto.get(i).getIntro().substring(after+1);
			bestDto.get(i).setIntro(intro);
		}
		
//		LogAspect.info(bestDto.toString());
//		System.out.println(bestDto.size());
		
		mav.addObject("bestSeller", bestSeller);
		mav.addObject("rental",rental);
		mav.addObject("firstCate", firstCate);
		mav.addObject("firstCateName", firstCateName);
		mav.addObject("seconCate",seconCate);
		mav.addObject("pageNumber", pageNumber);
		mav.addObject("boardSize", boardSize);
		mav.addObject("bestDto", bestDto);
		mav.addObject("bestDtoCount", bestDtoCount);
	}

	@Override
	public void bookExample(ModelAndView mav) {
		// TODO Auto-generated method stub
		HttpServletRequest request=(HttpServletRequest) mav.getModel().get("request");
		String book_num=request.getParameter("book_num");
		
		HomeDto ht=bookDao.getRecomList(Integer.parseInt(book_num));
		int first=bookDao.getFirstCateUseBookNum(book_num);
		
		ExampleDto ex=bookDao.getExample(1);
//		System.out.println(ht.toString() +" : "+ex.toString());
		
		mav.addObject("ht", ht);
		mav.addObject("first", first);
		mav.addObject("ex", ex);
		
	}

}
