/*
 * Copyright 2008-2009 the original author or authors.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package egovframework.example.usr.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springmodules.validation.commons.DefaultBeanValidator;

import egovframework.example.usr.service.UsrService;
import egovframework.example.usr.vo.UsrVO;
import egovframework.rte.fdl.property.EgovPropertyService;

/**
 * @Class Name : UsrController.java
 * @Description : Usr Controller Class
 * @Modification Information
 * @
 * @  수정일      수정자              수정내용
 * @ ---------   ---------   -------------------------------
 * @ 2024.01.11           최초생성
 *
 * @author SJLEE
 */

@Controller
public class UsrController {

	/** EgovusrService */
	@Resource(name = "usrService")
	private UsrService usrService;

	/** EgovPropertyService */
	@Resource(name = "propertiesService")
	protected EgovPropertyService propertiesService;

	/** Validator */
	@Resource(name = "beanValidator")
	protected DefaultBeanValidator beanValidator;

	/**
	 * indexPage (로그인페이지)
	 * @param 
	 * @param 
	 * @return 
	 * @exception Exception
	 */
	@RequestMapping(value = "/login.do")
	public String indexPage() throws Exception {
		return "usr/indexPage";
	}
	
	/**
	 * 회원가입페이지
	 * @param 
	 * @param 
	 * @return 
	 * @exception Exception
	 */
	@RequestMapping(value = "/signUp.do")
	public String signUp() throws Exception {
		return "usr/signUp";
	}
	
	/**
	 * ID중복체크
	 * @param UsrVO - usr_id
	 * @param 
	 * @return int(result)
	 * @exception Exception
	 */
	@ResponseBody
	@RequestMapping(path = "/dupCheck.ajax", method=RequestMethod.POST, produces="application/json")
	public ModelAndView dupCheck(@ModelAttribute("usrVO") UsrVO usrVO, ModelMap model) throws Exception {
		ModelAndView mv = new ModelAndView("jsonView");
		Map<String, Object> resultMap = new HashMap<String, Object>();
		
		int dupCheck = usrService.usrDupCheck(usrVO);
		String alertMsg = "";
		
		if(dupCheck == 0) {
			alertMsg = "ID 사용이 가능합니다.";
		}else {
			alertMsg = "ID가 이미 존재합니다. 다른 ID를 사용해주세요.";
		}
		
		resultMap.put("dubCheck", dupCheck);
		resultMap.put("result", alertMsg);
		
		mv.addAllObjects(resultMap);
		
		return mv;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	/* ajax 테스트용 */
	@ResponseBody
	@RequestMapping(path = "/test.ajax", method=RequestMethod.POST, produces="application/json")
	public ModelAndView test(@ModelAttribute("usrVO") UsrVO usrVO, ModelMap model) throws Exception {
		
		ModelAndView mv = new ModelAndView("jsonView");
		Map<String, Object> resultMap = new HashMap<String, Object>();
		
		List<UsrVO> list = usrService.selectUsrList(usrVO);
		
		resultMap.put("resultList", list);
		mv.addAllObjects(resultMap);
		
		return mv;
	}
}
