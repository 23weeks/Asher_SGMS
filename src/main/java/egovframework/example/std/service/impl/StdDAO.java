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
package egovframework.example.std.service.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.example.std.vo.StdVO;
import egovframework.example.usr.vo.UsrVO;
import egovframework.rte.psl.dataaccess.EgovAbstractDAO;

/**
 * @Class Name : StdDAO.java
 * @Description : Std DAO Class
 * @Modification Information
 * @
 * @  수정일      수정자              수정내용
 * @ ---------   ---------   -------------------------------
 * @ 2024.01.22           최초생성
 *
 * @author SJLEE
 */

@Repository("stdDAO")
public class StdDAO extends EgovAbstractDAO {

	/**
	 * 본인이 속한 스터디 그룹 조회
	 * @param usrVO - usr_id
	 * @return List<StdVO>
	 * @exception Exception
	 */
	List<?> selectMyStdGrpList(UsrVO usrVO) throws Exception {
		return list("stdDAO.selectMyStdGrpList", usrVO);
	}
	
	/**
	 * 스터디 목록 조회
	 * @param
	 * @return List<usrVO>
	 * @exception Exception
	 */
	List<?> selectGrpList(StdVO stdVO) throws Exception {
		return list("stdDAO.selectGrpList", stdVO);
	}
	
	/**
	 * 스터디 상세 조회
	 * @param StdVO - grp_id
	 * @return stdVO
	 * @exception Exception
	 */
	StdVO selectStdGrpInfo(StdVO stdVO) throws Exception {
		return (StdVO) select("stdDAO.selectStdGrpInfo", stdVO);
	}
	
	/**
	 * 스터디 상세 조회 - 일정 조회
	 * @param StdVO - grp_id
	 * @return List<stdVO>
	 * @exception Exception
	 */
	List<?> selectStdGrpInfo_schd(StdVO stdVO) throws Exception {
		return list("stdDAO.selectStdGrpInfo_schd", stdVO);
	}
	
	/**
	 * 스터디 그룹원 체크
	 * @param StdVO - grp_id, usr_id
	 * @return boolean
	 * @exception Exception
	 */
	int stdUsrCheck(StdVO stdVO) throws Exception {
		return (int) select("stdDAO.stdUsrCheck", stdVO);
	}
	
	/**
	 * 스터디 가입 신청
	 * @param StdVO - grp_id, usr_id
	 * @return boolean
	 * @exception Exception
	 */
	int stdGrpSubReq(StdVO stdVO) throws Exception {
		return (int) insert("stdDAO.stdGrpSubReq", stdVO);
	}
}
