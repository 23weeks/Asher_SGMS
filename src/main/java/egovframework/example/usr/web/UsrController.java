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
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.request.RequestAttributes;
import org.springframework.web.context.request.RequestContextHolder;
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
	 * ID/비밀번호 찾기
	 * @param 
	 * @param 
	 * @return 
	 * @exception Exception
	 */
	@RequestMapping(value = "/find.do")
	public String find() throws Exception {
		return "usr/find";
	}
	
	/**
	 * 아이디찾기
	 * @param 
	 * @param 
	 * @return 
	 * @exception Exception
	 */
	@RequestMapping(value = "/findId.do")
	public String findId() throws Exception {
		return "usr/findId";
	}
	
	/**
	 * 비밀번호찾기
	 * @param 
	 * @param 
	 * @return 
	 * @exception Exception
	 */
	@RequestMapping(value = "/findPwd.do")
	public String findPwd() throws Exception {
		return "usr/findPwd";
	}
	
	/**
	 * 비밀번호찾기
	 * @param 
	 * @param 
	 * @return 
	 * @exception Exception
	 */
	@RequestMapping(value = "/findPwdSecond.do")
	public String findPwdSecond() throws Exception {
		return "usr/findPwdSecond";
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
		
		resultMap.put("dupCheck", dupCheck);
		resultMap.put("result", alertMsg);
		
		mv.addAllObjects(resultMap);
		
		return mv;
	}
	
	/**
	 * 회원가입
	 * @param UsrVO
	 * @param 
	 * @return int(result)
	 * @exception Exception
	 */
	@ResponseBody
	@RequestMapping(path = "/signUp.ajax", method=RequestMethod.POST, produces="application/json")
	public ModelAndView signUp(@ModelAttribute("usrVO") UsrVO usrVO, ModelMap model) throws Exception {
		ModelAndView mv = new ModelAndView("jsonView");
		Map<String, Object> resultMap = new HashMap<String, Object>();
		
		int result = usrService.insertUsr(usrVO);
		
		resultMap.put("result", result);
		
		mv.addAllObjects(resultMap);
		return mv;
	}
	
	/**
	 * 로그인
	 * @param UsrVO
	 * @param 
	 * @return int(result)
	 * @exception Exception
	 */
	@ResponseBody
	@RequestMapping(path = "/login.ajax", method=RequestMethod.POST, produces="application/json")
	public ModelAndView login(@ModelAttribute("usrVO") UsrVO usrVO, ModelMap model, HttpSession session) throws Exception {
		ModelAndView mv = new ModelAndView("jsonView");
		Map<String, Object> resultMap = new HashMap<String, Object>();
		
		String errMsg = "";
		UsrVO result = usrService.loginUsrInfo(usrVO);
		
		if(result != null) {
			session.setAttribute("usr_id", usrVO.getUsr_id());
		}else {
			errMsg = "일치하는 ID와 비밀번호가 없습니다.\nID와 비밀번호를 확인해주세요.";
		}
		
		resultMap.put("result", result);
		resultMap.put("errMsg", errMsg);
		
		mv.addAllObjects(resultMap);
		return mv;
	}
	
	/**
	 * 아이디찾기
	 * @param usrVO - usr_name, usr_brth, usr_phone
	 * @param 
	 * @return 
	 * @exception Exception
	 */
	@ResponseBody
	@RequestMapping(path = "/findId.ajax", method=RequestMethod.POST, produces="application/json")
	public ModelAndView findId(@ModelAttribute("usrVO") UsrVO usrVO, ModelMap model) throws Exception {
		ModelAndView mv = new ModelAndView("jsonView");
		Map<String, Object> resultMap = new HashMap<String, Object>();
		
		String errMsg = "";
		UsrVO result = usrService.findId(usrVO);
		
		if(result == null) {
			errMsg = "일치하는 정보가 없습니다.";
		}
		
		resultMap.put("result", result);
		resultMap.put("errMsg", errMsg);
		
		mv.addAllObjects(resultMap);
		return mv;
	}
	
	/**
	 * 비밀번호 찾기(1단계)
	 * @param usrVO - usr_id
	 * @param 
	 * @return 
	 * @exception Exception
	 */
	@ResponseBody
	@RequestMapping(path = "/findPwdFirst.ajax", method=RequestMethod.POST, produces="application/json")
	public ModelAndView findPwdFirst(@ModelAttribute("usrVO") UsrVO usrVO, ModelMap model) throws Exception {
		ModelAndView mv = new ModelAndView("jsonView");
		Map<String, Object> resultMap = new HashMap<String, Object>();
		
		String errMsg = "";
		int result = usrService.usrDupCheck(usrVO);
		
		if(result == 0) {
			errMsg = "일치하는 정보가 없습니다.";
		}
		
		resultMap.put("result", result);
		resultMap.put("errMsg", errMsg);
		
		mv.addAllObjects(resultMap);
		return mv;
	}
	
	/**
	 * 비밀번호 찾기(2단계)
	 * @param usrVO - usr_id
	 * @param 
	 * @return 
	 * @exception Exception
	 */
	@ResponseBody
	@RequestMapping(path = "/findPwdSecond.ajax", method=RequestMethod.POST, produces="application/json")
	public ModelAndView findPwdSecond(@ModelAttribute("usrVO") UsrVO usrVO, ModelMap model) throws Exception {
		ModelAndView mv = new ModelAndView("jsonView");
		Map<String, Object> resultMap = new HashMap<String, Object>();
		
		String errMsg = "";
		UsrVO result = usrService.findPwd(usrVO);
		
		if(result == null) {
			errMsg = "입력한 정보가 일치하지 않습니다.";
		}
		
		resultMap.put("result", result);
		resultMap.put("errMsg", errMsg);
		
		mv.addAllObjects(resultMap);
		return mv;
	}
	
	
	
	
	/**
	 * 로그아웃
	 * @param
	 * @param 
	 * @return 
	 * @exception Exception
	 */
	@RequestMapping(value="/logout.do")
	public String logout(HttpServletRequest request) {
		RequestContextHolder.getRequestAttributes().removeAttribute("usr_id", RequestAttributes.SCOPE_SESSION);
		request.getSession().invalidate();
		return "usr/indexPage";
	}
}
