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
	 * 스터디 상세 조회 페이지
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
	 * 기존 스터디 마스터 유무 확인
	 * @param 
	 * @param 
	 * @return List<stdVO>
	 * @exception Exception
	 */
	@ResponseBody
	@RequestMapping(path = "/stdGrpMasterCheck.ajax", method=RequestMethod.POST, produces="application/json")
	public ModelAndView stdGrpMasterCheck(@ModelAttribute("stdVO") StdVO stdVO, ModelMap model) throws Exception {
		ModelAndView mv = new ModelAndView("jsonView");
		Map<String, Object> resultMap = new HashMap<String, Object>();
		
		String errMsg = "";
		
		//기존 스터디 마스터 유무 확인
		int stdGrpMasterCheck = stdService.stdGrpMasterCheck(stdVO);
		
		if(stdGrpMasterCheck != 0) {
			errMsg = "회원당 1개의 그룹만 생성할 수 있습니다.";
		}
		
		resultMap.put("errMsg", errMsg);
		
		mv.addAllObjects(resultMap);
		
		return mv;
	}
	
	/**
	 * 스터디 생성 페이지
	 * @param 
	 * @param 
	 * @return 
	 * @exception Exception
	 */
	@RequestMapping(value = "/addStdGrp.do")
	public String addStdGrp() throws Exception {
		return "std/addStdGrp";
	}
	
	
	/**
	 * 스터디명 중복체크
	 * @param stdVO - grp_name
	 * @param 
	 * @return result
	 * @exception Exception
	 */
	@ResponseBody
	@RequestMapping(path = "/grpNamedupCheck.ajax", method=RequestMethod.POST, produces="application/json")
	public ModelAndView grpNamedupCheck(@ModelAttribute("stdVO") StdVO stdVO, ModelMap model) throws Exception {
		ModelAndView mv = new ModelAndView("jsonView");
		Map<String, Object> resultMap = new HashMap<String, Object>();
		
		int grpNamedupCheck = stdService.grpNamedupCheck(stdVO);
		String errMsg = "";
		
		if(grpNamedupCheck == 0) {
			errMsg = "사용이 가능합니다.";
		}else {
			errMsg = "이미 존재하는 스터디명입니다. 다른 스터디명을 사용해주세요.";
		}
		
		resultMap.put("grpNamedupCheck", grpNamedupCheck);
		resultMap.put("result", errMsg);
		
		mv.addAllObjects(resultMap);
		
		return mv;
	}
	
	/**
	 * 스터디 생성
	 * @param 
	 * @param 
	 * @return List<stdVO>
	 * @exception Exception
	 */
	@ResponseBody
	@RequestMapping(path = "/addStdGrp.ajax", method=RequestMethod.POST, produces="application/json")
	public ModelAndView addStdGrp(@ModelAttribute("stdVO") StdVO stdVO, ModelMap model) throws Exception {
		ModelAndView mv = new ModelAndView("jsonView");
		Map<String, Object> resultMap = new HashMap<String, Object>();
		
		//스터디 생성
		stdService.addStdGrp(stdVO);
		
		//생성된 스터디 grp_id 가져오기
		StdVO getAddedGrpId = stdService.getAddedGrpId(stdVO);
		
		resultMap.put("result", getAddedGrpId);
		
		mv.addAllObjects(resultMap);
		
		return mv;
	}
	
	/**
	 * 스터디 그룹 유저 추가
	 * @param 
	 * @param 
	 * @return 
	 * @exception Exception
	 */
	@ResponseBody
	@RequestMapping(path = "/addStdUsr.ajax", method=RequestMethod.POST, produces="application/json")
	public ModelAndView addStdUsr(@ModelAttribute("stdVO") StdVO stdVO, ModelMap model) throws Exception {
		ModelAndView mv = new ModelAndView("jsonView");
		
		//유저 등록
		stdService.addStdUsr(stdVO);
		
		//요청 승인 날짜 업데이트
		stdService.stdSubReqUdate(stdVO);
		
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
		
		String errMsg = "";
		/* 기존 신청 이력 확인 */
		int stdGrpSubReqCheck = stdService.stdGrpSubReqCheck(stdVO);
		
		if(stdGrpSubReqCheck != 0) {
			errMsg = "이미 가입신청한 그룹입니다.";
			resultMap.put("errMsg", errMsg);
		}else {
			//스터디 가입 신청
			int result = stdService.stdGrpSubReq(stdVO);
			resultMap.put("result", result);
		}
		
		mv.addAllObjects(resultMap);
		
		return mv;
	}
	
	
	/**
	 * 스터디 가입 신청 목록
	 * @param 
	 * @param 
	 * @return 
	 * @exception Exception
	 */
	@RequestMapping(value = "/stdGrpSubReqList.do")
	public String stdGrpSubReqList() throws Exception {
		return "std/stdGrpSubReqList";
	}
	
	/**
	 * 스터디 가입 신청 목록
	 * @param StdVO - grp_id
	 * @param 
	 * @return List<stdVO>
	 * @exception Exception
	 */
	@ResponseBody
	@RequestMapping(path = "/selectStdSubReqList.ajax", method=RequestMethod.POST, produces="application/json")
	public ModelAndView selectStdSubReqList(@ModelAttribute("stdVO") StdVO stdVO, ModelMap model) throws Exception {
		ModelAndView mv = new ModelAndView("jsonView");
		Map<String, Object> resultMap = new HashMap<String, Object>();
		
		List<StdVO> resultList = stdService.selectStdSubReqList(stdVO);
		
		resultMap.put("resultList", resultList);
		
		mv.addAllObjects(resultMap);
		
		return mv;
	}
	
	
	/**
	 * 일정 추가 페이지
	 * @param 
	 * @param 
	 * @return 
	 * @exception Exception
	 */
	@RequestMapping(value = "/addSchd.do")
	public String addSchd() throws Exception {
		return "std/addSchd";
	}
	
	/**
	 * 일정 추가
	 * @param StdVO - grp_id, std_yyyymmdd
	 * @param 
	 * @return 
	 * @exception Exception
	 */
	@ResponseBody
	@RequestMapping(path = "/addSchd.ajax", method=RequestMethod.POST, produces="application/json")
	public ModelAndView addSchd(@ModelAttribute("stdVO") StdVO stdVO, ModelMap model) throws Exception {
		ModelAndView mv = new ModelAndView("jsonView");
		Map<String, Object> resultMap = new HashMap<String, Object>();
		
		String errMsg = "";
		
		//이미 일정이 있는 날인지 체크
		int selectSchdCheck = stdService.selectSchdCheck(stdVO);
		
		if(selectSchdCheck != 0) {
			errMsg = "이미 추가되어 있는 일정입니다.\n다른 일정을 선택해주세요.";
		}else {
			//일정 추가
			stdService.addSchd(stdVO);
		}
		
		resultMap.put("errMsg", errMsg);
		
		mv.addAllObjects(resultMap);
		
		return mv;
	}
	
	/**
	 * 참석 여부 확인 팝업
	 * @param 
	 * @param 
	 * @return 
	 * @exception Exception
	 */
	@RequestMapping(value = "/stdGrpSchdJoinYn.do")
	public String stdGrpSchdJoinYn() throws Exception {
		return "std/stdGrpSchdJoinYn";
	}

	/**
	 * 스터디 그룹 유저 목록 조회
	 * @param StdVO - grp_id
	 * @param 
	 * @return 
	 * @exception Exception
	 */
	@ResponseBody
	@RequestMapping(path = "/selectStdUsrList.ajax", method=RequestMethod.POST, produces="application/json")
	public ModelAndView selectStdUsrList(@ModelAttribute("stdVO") StdVO stdVO, ModelMap model) throws Exception {
		ModelAndView mv = new ModelAndView("jsonView");
		Map<String, Object> resultMap = new HashMap<String, Object>();
		
		//유저 조회
		List<StdVO> resultList = stdService.selectStdUsrList(stdVO);
		
		
		resultMap.put("resultList", resultList);
		
		mv.addAllObjects(resultMap);
		
		return mv;
	}
	
	
	/**
	 * 스터디 그룹 참여 Yn
	 * @param StdVO - grp_id, std_yyyymmdd, usr_id, joinYn
	 * @param 
	 * @return 
	 * @exception Exception
	 */
	@ResponseBody
	@RequestMapping(path = "/insertStdSchdYn.ajax", method=RequestMethod.POST, produces="application/json")
	public ModelAndView insertStdSchdYn(@ModelAttribute("stdVO") StdVO stdVO, ModelMap model) throws Exception {
		ModelAndView mv = new ModelAndView("jsonView");
		Map<String, Object> resultMap = new HashMap<String, Object>();
		
		String errMsg = "";
		
		int std_yyyymmddCheck = stdService.std_yyyymmddCheck(stdVO);
		if(std_yyyymmddCheck != 0) {
			errMsg = "이미 참석여부가 저장된 유저입니다.";
		}else {
			stdService.insertStdResult(stdVO);
		}
		
		resultMap.put("errMsg", errMsg);
		
		mv.addAllObjects(resultMap);
		
		return mv;
	}
	
	/**
	 * 출석률 조회 팝업
	 * @param 
	 * @param 
	 * @return 
	 * @exception Exception
	 */
	@RequestMapping(value = "/selectAttRate.do")
	public String selectAttRate() throws Exception {
		return "std/selectAttRate";
	}
	
	/**
	 * 출석률 조회
	 * @param StdVO - usr_id
	 * @param 
	 * @return List<StdVO>
	 * @exception Exception
	 */
	@ResponseBody
	@RequestMapping(path = "/selectAttRate.ajax", method=RequestMethod.POST, produces="application/json")
	public ModelAndView selectAttRate(@ModelAttribute("stdVO") StdVO stdVO, ModelMap model) throws Exception {
		ModelAndView mv = new ModelAndView("jsonView");
		Map<String, Object> resultMap = new HashMap<String, Object>();
		
		List<StdVO> resultList = stdService.selectAttRate(stdVO);
		
		resultMap.put("resultList", resultList);
		
		mv.addAllObjects(resultMap);
		
		return mv;
	}
	
	
	/**
	 * 출석률 조회 팝업
	 * @param 
	 * @param 
	 * @return 
	 * @exception Exception
	 */
	@RequestMapping(value = "/updateInfo.do")
	public String updateInfo() throws Exception {
		return "std/updateInfo";
	}
}
