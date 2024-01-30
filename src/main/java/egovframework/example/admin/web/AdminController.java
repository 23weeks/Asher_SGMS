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
package egovframework.example.admin.web;

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

import egovframework.example.admin.service.AdminService;
import egovframework.example.std.service.StdService;
import egovframework.example.std.vo.StdVO;
import egovframework.example.usr.vo.UsrVO;

/**
 * @Class Name : AdminController.java
 * @Description : AdminController Class
 * @Modification Information
 * @
 * @  수정일      수정자              수정내용
 * @ ---------   ---------   -------------------------------
 * @ 2024.01.18           최초생성
 *
 * @author SJLEE
 */

@Controller
public class AdminController {

	@Resource(name = "adminService")
	private AdminService adminService;
	
	@Resource(name = "stdService")
	private StdService stdService;
	
	/**
	 * 유저 목록 조회
	 * @param 
	 * @param 
	 * @return List<usrVO>
	 * @exception Exception
	 */
	@ResponseBody
	@RequestMapping(path = "/selectUsrList.ajax", method=RequestMethod.POST, produces="application/json")
	public ModelAndView selectUsrList(@ModelAttribute("usrVO") UsrVO usrVO, ModelMap model) throws Exception {
		ModelAndView mv = new ModelAndView("jsonView");
		Map<String, Object> resultMap = new HashMap<String, Object>();
		
		List<UsrVO> resultList = adminService.selectUsrList(usrVO);
		
		resultMap.put("resultList", resultList);
		
		mv.addAllObjects(resultMap);
		
		return mv;
	}
	
	/**
	 * 스터디 목록 조회
	 * @param 
	 * @param 
	 * @return List<stdVO>
	 * @exception Exception
	 */
	@ResponseBody
	@RequestMapping(path = "/selectStdGrpList.ajax", method=RequestMethod.POST, produces="application/json")
	public ModelAndView selectStdList(@ModelAttribute("usrVO") StdVO stdVO, ModelMap model) throws Exception {
		ModelAndView mv = new ModelAndView("jsonView");
		Map<String, Object> resultMap = new HashMap<String, Object>();
		
		List<StdVO> resultList = stdService.selectGrpList(stdVO);
		
		resultMap.put("resultList", resultList);
		
		mv.addAllObjects(resultMap);
		
		return mv;
	}
	

	/**
	 * 출석률 조회 팝업(관리자)
	 * @param 
	 * @param 
	 * @return 
	 * @exception Exception
	 */
	@RequestMapping(value = "/selectGrpAttRate.do")
	public String selectAttRate() throws Exception {
		return "admin/selectGrpAttRate";
	}
	
	/**
	 * 출석률 조회(관리자)
	 * @param StdVO - usr_id
	 * @param 
	 * @return List<StdVO>
	 * @exception Exception
	 */
	@ResponseBody
	@RequestMapping(path = "/selectGrpAttRate.ajax", method=RequestMethod.POST, produces="application/json")
	public ModelAndView selectGrpAttRate(@ModelAttribute("stdVO") StdVO stdVO, ModelMap model) throws Exception {
		ModelAndView mv = new ModelAndView("jsonView");
		Map<String, Object> resultMap = new HashMap<String, Object>();
		
		List<StdVO> resultList = adminService.selectGrpAttRate(stdVO);
		
		resultMap.put("resultList", resultList);
		
		mv.addAllObjects(resultMap);
		
		return mv;
	}
	
}
