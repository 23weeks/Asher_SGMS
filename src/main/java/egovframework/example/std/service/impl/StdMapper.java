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
	
	/**
	 * 스터디 그룹마스터 유무 확인
	 * @param StdVO - usr_id
	 * @return boolean
	 * @exception Exception
	 */
	int stdGrpMasterCheck(StdVO stdVO) throws Exception;
	
	/**
	 * 스터디 그룹 생성
	 * @param stdVO
	 * @return boolean
	 * @exception Exception
	 */
	int addStdGrp(StdVO stdVO) throws Exception;
	
	/**
	 * 스터디명 중복체크
	 * @param stdVO - grp_name
	 * @return boolean
	 * @exception Exception
	 */
	int grpNamedupCheck(StdVO stdVO) throws Exception;
	
	/**
	 * 스터디 인원 추가
	 * @param stdVO - grp_id, usr_id
	 * @return 
	 * @exception Exception
	 */
	int addStdUsr(StdVO stdVO) throws Exception;
	
	/**
	 * 생성된 group grp_id 가져오기
	 * @param stdVO - grp_name, grp_type, grp_master
	 * @return boolean
	 * @exception Exception
	 */
	StdVO getAddedGrpId(StdVO stdVO) throws Exception;
	
	/**
	 * 스터디 기존 신청 이력 확인
	 * @param stdVO - grp_id, usr_id
	 * @return boolean
	 * @exception Exception
	 */
	int stdGrpSubReqCheck(StdVO stdVO) throws Exception;
	
	/**
	 * 스터디 가입 신청 목록
	 * @param stdVO - grp_id
	 * @return List<stdVO>
	 * @exception Exception
	 */
	List<StdVO> selectStdSubReqList(StdVO stdVO) throws Exception;
	
	/**
	 * 스터디 가입 신청 승인 날짜 update
	 * @param stdVO - grp_id, usr_id
	 * @return 
	 * @exception Exception
	 */
	void stdSubReqUdate(StdVO stdVO) throws Exception;
	
	
	/**
	 * 일정 추가
	 * @param stdVO - grp_id, std_yyyymmdd
	 * @return void
	 * @exception Exception
	 */
	void addSchd(StdVO stdVO) throws Exception;
	
	/**
	 * 일정 체크
	 * @param stdVO - grp_id, std_yyyymmdd
	 * @return boolean
	 * @exception Exception
	 */
	int selectSchdCheck(StdVO stdVO) throws Exception;
	
	
	/**
	 * 스터디 그룹 유저 목록 조회
	 * @param stdVO - grp_id
	 * @return List<StdVO>
	 * @exception Exception
	 */
	List<StdVO> selectStdUsrList(StdVO stdVO) throws Exception;
	
	
	/**
	 * 스터디 결과 insert
	 * @param stdVO - grp_id, usr_id, std_yyyymmdd
	 * @return void
	 * @exception Exception
	 */
	void insertStdResult(StdVO stdVO) throws Exception;
	
	/**
	 * 스터디 그룹 유저 결과 조회(std_yyyymmdd)
	 * @param stdVO - grp_id, usr_id, std_yyyymmdd
	 * @return void
	 * @exception Exception
	 */
	List<StdVO> selectStdUsrStdYyyymmdd(StdVO stdVO) throws Exception;
	
	/**
	 * 결과 확인
	 * @param stdVO - grp_id, usr_id std_yyyymmdd, join_yn
	 * @return boolean
	 * @exception Exception
	 */
	int std_yyyymmddCheck(StdVO stdVO) throws Exception;
	
	/**
	 * 출석률 조회
	 * @param stdVO - usr_id
	 * @return List<stdVO> - grp_id, grp_name, att_rate
	 * @exception Exception
	 */
	List<StdVO> selectAttRate(StdVO stdVO) throws Exception;
	
	/**
	 * 그룹 삭제
	 * @param stdVO - grp_id
	 * @return void
	 * @exception Exception
	 */
	void deleteStdGrp(StdVO stdVO) throws Exception;
	
	/**
	 * 삭제된 회원이 마스터인 그룹 삭제
	 * @param stdVO - grp_id
	 * @return void
	 * @exception Exception
	 */
	void deleteStdGrp_deletedUsr(UsrVO usrVO) throws Exception;
	
	
	/**
	 * 스케쥴러
	 * @param
	 * @return List<StdVO>
	 * @exception Exception
	 */
	List<StdVO> selectSchdRslt() throws Exception;
	
	/**
	 * 통계 테이블 데이터 입력
	 * @param StdVO - std_yyyymm, usr_id, grp_id, att_rate
	 * @return void
	 * @exception Exception
	 */
	void insertSChdStat(StdVO stdVO) throws Exception;
	
	/**
	 * 스터디 그룹 유저 삭제
	 * @param UsrVO - usr_id
	 * @return void
	 * @exception Exception
	 */
	void deleteStdGrpUsr(UsrVO usrVO) throws Exception;
}
