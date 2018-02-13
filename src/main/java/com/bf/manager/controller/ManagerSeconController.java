package com.bf.manager.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @author YEOM HYUN WOO X JUN SANG HUN
 * @date 2018-02-13
 * @description start-url = /bookFactory/manager/index.do 
 * 				요청맵핑은(RequestMapping의 value를 뜻함) .do로 걸어준다 
 * 				layout 설정법 (ModelAndView의 페이지셋팅값을 뜻함) 
 * 				- content만 나오는 뷰는 .mge 
 * 				- header, menu, content, footer 다 나오는 뷰는 .mg로 맞춰준다
 * 				
 * 				- 상헌형 작업 컨트롤러
 */

@Controller
@RequestMapping(value = "/manager")
public class ManagerSeconController {
	
	
}
