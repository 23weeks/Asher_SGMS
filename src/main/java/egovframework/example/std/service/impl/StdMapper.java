/*
 * Copyright 2011 MOPAS(Ministry of Public Administration and Security).
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

import egovframework.example.std.vo.StdVO;
import egovframework.example.usr.vo.UsrVO;
import egovframework.rte.psl.dataaccess.mapper.Mapper;

/**
 * Study Group에 관한 데이터처리 매퍼 클래스
 *
 * @author  SJLEE
 * @since 2024.01.22
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *          수정일          수정자           수정내용
 *  ----------------    ------------    ---------------------------
 *   2024.01.18          최초 생성
 *
 * </pre>
 */
@Mapper("stdMapper")
public interface StdMapper {

	/**
	 * 본인이 속한 스터디 목록 조회
	 * @param usrVO - usr_id
	 * @return List<stdVO>
	 * @exception Exception
	 */
	List<StdVO> selectMyStdGrpList(UsrVO usrVO) throws Exception;
	
	/**
	 * 스터디 목록 조회
	 * @param
	 * @return List<stdVO>
	 * @exception Exception
	 */
	List<StdVO> selectGrpList(StdVO stdVO) throws Exception;
	
	/**
	 * 스터디 상세 조회
	 * @param StdVO - grp_id
	 * @return stdVO
	 * @exception Exception
	 */
	StdVO selectStdGrpInfo(StdVO stdVO) throws Exception;
	
	/**
	 * 스터디 상세 조회 - 일정 조회
	 * @param StdVO - grp_id
	 * @return List<stdVO>
	 * @exception Exception
	 */
	List<StdVO> selectStdGrpInfo_schd(StdVO stdVO) throws Exception;
	
	
	/**
	 * 스터디 그룹원 체크
	 * @param StdVO - grp_id, usr_id
	 * @return boolean
	 * @exception Exception
	 */
	int stdUsrCheck(StdVO stdVO) throws Exception;
	
	
	/**
	 * 스터디 가입 신청
	 * @param StdVO - grp_id, usr_id
	 * @return boolean
	 * @exception Exception
	 */
	int stdGrpSubReq(StdVO stdVO) throws Exception;
}
