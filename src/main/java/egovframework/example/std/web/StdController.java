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
package egovframework.example.std.web;

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

import egovframework.example.std.service.StdService;
import egovframework.example.std.vo.StdVO;
import egovframework.example.usr.vo.UsrVO;

/**
 * @Class Name : StdController.java
 * @Description : StdController Class
 * @Modification Information
 * @
 * @  수정일      수정자              수정내용
 * @ ---------   ---------   -------------------------------
 * @ 2024.01.22           최초생성
 *
 * @author SJLEE
 */

@Controller
public class StdController {

	@Resource(name = "stdService")
	private StdService stdService;
	
	/**
	 * 스터디 목록 조회(본인이 속한)
	 * @param usrVO
	 * @param 
	 * @return List<usrVO>
	 * @exception Exception
	 */
	@ResponseBody
	@RequestMapping(path = "/selectMyStdGrpList.ajax", method=RequestMethod.POST, produces="application/json")
	public ModelAndView selectUsrList(@ModelAttribute("usrVO") UsrVO usrVO, ModelMap model) throws Exception {
		ModelAndView mv = new ModelAndView("jsonView");
		Map<String, Object> resultMap = new HashMap<String, Object>();
		
		List<StdVO> resultList = stdService.selectMyStdGrpList(usrVO);
		
		resultMap.put("resultList", resultList);
		
		mv.addAllObjects(resultMap);
		
		return mv;
	}
	
	/**
	 * 스터디 상세 조회
	 * @param 
	 * @param 
	 * @return 
	 * @exception Exception
	 */
	@RequestMapping(value = "/stdGrpInfo.do")
	public String StdGrpInfo() throws Exception {
		return "std/stdGrpInfo";
	}
	
	
	/**
	 * 스터디 상세 조회
	 * @param StdVO - grp_id
	 * @param 
	 * @return result / result_schd / stdUsrCheck
	 * @exception Exception
	 */
	@ResponseBody
	@RequestMapping(path = "/stdGrpInfo.ajax", method=RequestMethod.POST, produces="application/json")
	public ModelAndView stdGrpInfo(@ModelAttribute("stdVO") StdVO stdVO, ModelMap model) throws Exception {
		ModelAndView mv = new ModelAndView("jsonView");
		Map<String, Object> resultMap = new HashMap<String, Object>();
		
		//스터디 그룹 정보
		StdVO result = stdService.selectStdGrpInfo(stdVO);
		
		//스터디 그룹 일정
		List<StdVO> result_schd = stdService.selectStdGrpInfo_schd(stdVO);
		
		//스터디 그룹원 체크
		int stdUsrCheck = stdService.stdUsrCheck(stdVO);
		
		resultMap.put("result", result);
		resultMap.put("result_schd", result_schd);
		resultMap.put("stdUsrCheck", stdUsrCheck);
		
		mv.addAllObjects(resultMap);
		
		return mv;
	}
	
	
	/**
	 * 스터디 가입 신청
	 * @param StdVO - grp_id, usr_id
	 * @param 
	 * @return 
	 * @exception Exception
	 */
	@ResponseBody
	@RequestMapping(path = "/stdGrpSubReq.ajax", method=RequestMethod.POST, produces="application/json")
	public ModelAndView stdGrpReq(@ModelAttribute("stdVO") StdVO stdVO, ModelMap model) throws Exception {
		ModelAndView mv = new ModelAndView("jsonView");
		Map<String, Object> resultMap = new HashMap<String, Object>();
		
		//스터디 가입 신청
		int result = stdService.stdGrpSubReq(stdVO);
		
		resultMap.put("result", result);
		
		mv.addAllObjects(resultMap);
		
		return mv;
	}
}
