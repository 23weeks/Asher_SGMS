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

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import egovframework.example.std.service.StdService;
import egovframework.example.std.vo.StdVO;
import egovframework.example.usr.vo.UsrVO;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import egovframework.rte.fdl.idgnr.EgovIdGnrService;

/**
 * @Class Name : StdServiceImpl.java
 * @Description : Std Business Implement Class
 * @Modification Information
 * @ @ 수정일 수정자 수정내용 
 * @ --------- --------- ------------------------------- 
 *   2024.01.22 최초생성
 *
 * @author SJLEE
 */

@Service("stdService")
public class StdServiceImpl extends EgovAbstractServiceImpl implements StdService {

	@SuppressWarnings("unused")
	private static final Logger LOGGER = LoggerFactory.getLogger(StdServiceImpl.class);

	// TODO mybatis 사용
	@Resource(name = "stdMapper")
	private StdMapper stdMapper;

	/** ID Generation */
	@Resource(name = "egovIdGnrService")
	private EgovIdGnrService egovIdGnrService;

	/**
	 * 스터디 목록 조회
	 * @param 
	 * @return List<stdVO>
	 * @exception Exception
	 */
	@Override
	public List<StdVO> selectGrpList(StdVO stdVO) throws Exception {
		return stdMapper.selectGrpList(stdVO);
	}

	/**
	 * 본인이 속한 스터디 목록 조회
	 * @param usrVO - usr_id
	 * @return List<stdVO>
	 * @exception Exception
	 */
	@Override
	public List<StdVO> selectMyStdGrpList(UsrVO usrVO) throws Exception {
		return stdMapper.selectMyStdGrpList(usrVO);
	}

	/**
	 * 스터디 상세 조회
	 * @param StdVO - grp_id
	 * @return stdVO
	 * @exception Exception
	 */
	@Override
	public StdVO selectStdGrpInfo(StdVO stdVO) throws Exception {
		return stdMapper.selectStdGrpInfo(stdVO);
	}

	/**
	 * 스터디 상세 조회 - 일정 조회
	 * @param StdVO - grp_id
	 * @return List<stdVO>
	 * @exception Exception
	 */
	@Override
	public List<StdVO> selectStdGrpInfo_schd(StdVO stdVO) throws Exception {
		return stdMapper.selectStdGrpInfo_schd(stdVO);
	}

	/**
	 * 스터디 그룹원 체크
	 * @param StdVO - grp_id, usr_id
	 * @return boolean
	 * @exception Exception
	 */
	@Override
	public int stdUsrCheck(StdVO stdVO) throws Exception {
		return stdMapper.stdUsrCheck(stdVO);
	}

	/**
	 * 스터디 가입 신청
	 * @param StdVO - grp_id, usr_id
	 * @return boolean
	 * @exception Exception
	 */
	@Override
	public int stdGrpSubReq(StdVO stdVO) throws Exception {
		return stdMapper.stdGrpSubReq(stdVO);
	}

	/**
	 * 스터디 그룹마스터 유무 확인
	 * @param StdVO - usr_id
	 * @return boolean
	 * @exception Exception
	 */
	@Override
	public int stdGrpMasterCheck(StdVO stdVO) throws Exception {
		return stdMapper.stdGrpMasterCheck(stdVO);
	}

	@Override
	public int addStdGrp(StdVO stdVO) throws Exception {
		return stdMapper.addStdGrp(stdVO);
	}

	/**
	 * 스터디명 중복체크
	 * @param stdVO - grp_name
	 * @return boolean
	 * @exception Exception
	 */
	@Override
	public int grpNamedupCheck(StdVO stdVO) throws Exception {
		return stdMapper.grpNamedupCheck(stdVO);
	}

	/**
	 * 생성된 group grp_id 가져오기
	 * @param stdVO - grp_name, grp_type, grp_master
	 * @return boolean
	 * @exception Exception
	 */
	@Override
	public StdVO getAddedGrpId(StdVO stdVO) throws Exception {
		return stdMapper.getAddedGrpId(stdVO);
	}

	/**
	 * 스터디 인원 추가
	 * @param stdVO - grp_id, usr_id
	 * @return boolean
	 * @exception Exception
	 */
	@Override
	public int addStdUsr(StdVO stdVO) throws Exception {
		return stdMapper.addStdUsr(stdVO);
	}

	@Override
	public int stdGrpSubReqCheck(StdVO stdVO) throws Exception {
		return stdMapper.stdGrpSubReqCheck(stdVO);
	}

	/**
	 * 스터디 가입 신청 목록
	 * @param stdVO - grp_id
	 * @return List<stdVO>
	 * @exception Exception
	 */
	@Override
	public List<StdVO> selectStdSubReqList(StdVO stdVO) throws Exception {
		return stdMapper.selectStdSubReqList(stdVO);
	}

	/**
	 * 스터디 가입 신청 승인 날짜 update
	 * @param stdVO - grp_id, usr_id
	 * @return 
	 * @exception Exception
	 */
	@Override
	public void stdSubReqUdate(StdVO stdVO) throws Exception {
		stdMapper.stdSubReqUdate(stdVO);
	}

	/**
	 * 일정 추가
	 * @param stdVO - grp_id, std_yyyymmdd
	 * @return void
	 * @exception Exception
	 */
	@Override
	public void addSchd(StdVO stdVO) throws Exception {
		stdMapper.addSchd(stdVO);
	}

	/**
	 * 일정 체크
	 * @param stdVO - grp_id, std_yyyymmdd
	 * @return boolean
	 * @exception Exception
	 */
	@Override
	public int selectSchdCheck(StdVO stdVO) throws Exception {
		return stdMapper.selectSchdCheck(stdVO);
	}

	/**
	 * 스터디 그룹 유저 목록 조회
	 * @param stdVO - grp_id
	 * @return List<StdVO>
	 * @exception Exception
	 */
	@Override
	public List<StdVO> selectStdUsrList(StdVO stdVO) throws Exception {
		return stdMapper.selectStdUsrList(stdVO);
	}

	/**
	 * 스터디 결과 insert
	 * @param stdVO - grp_id, usr_id, std_yyyymmdd
	 * @return void
	 * @exception Exception
	 */
	@Override
	public void insertStdResult(StdVO stdVO) throws Exception {
		stdMapper.insertStdResult(stdVO);
		
	}

	/**
	 * 스터디 그룹 유저 결과 조회(std_yyyymmdd)
	 * @param stdVO - grp_id, usr_id, std_yyyymmdd
	 * @return void
	 * @exception Exception
	 */
	@Override
	public List<StdVO> selectStdUsrStdYyyymmdd(StdVO stdVO) throws Exception {
		return stdMapper.selectStdUsrStdYyyymmdd(stdVO);
	}

	/**
	 * 결과 확인
	 * @param stdVO - grp_id, usr_id std_yyyymmdd, join_yn
	 * @return boolean
	 * @exception Exception
	 */
	@Override
	public int std_yyyymmddCheck(StdVO stdVO) throws Exception {
		return stdMapper.std_yyyymmddCheck(stdVO);
	}

	/**
	 * 출석률 조회
	 * @param stdVO - usr_id
	 * @return stdVO - grp_id, grp_name, att_rate
	 * @exception Exception
	 */
	@Override
	public List<StdVO> selectAttRate(StdVO stdVO) throws Exception {
		return stdMapper.selectAttRate(stdVO);
	}
	
	/**
	 * 그룹 삭제
	 * @param stdVO - grp_id
	 * @return void
	 * @exception Exception
	 */
	@Override
	public void deleteStdGrp(StdVO stdVO) throws Exception {
		stdMapper.deleteStdGrp(stdVO);
	}
	
	/**
	 * 삭제된 회원이 마스터인 그룹 삭제
	 * @param stdVO - grp_id
	 * @return void
	 * @exception Exception
	 */
	@Override
	public void deleteStdGrp_deletedUsr(UsrVO usrVO) throws Exception {
		stdMapper.deleteStdGrp_deletedUsr(usrVO);
	}
	
	
	
	
	
	
	
	
	/**
	 * 스케쥴러
	 * @param
	 * @return List<StdVO>
	 * @exception Exception
	 */
	@Override
	public List<StdVO> selectSchdRslt() throws Exception {
		return stdMapper.selectSchdRslt();
	}
	
	/**
	 * 통계 테이블 데이터 입력
	 * @param StdVO - std_yyyymm, usr_id, grp_id, att_rate
	 * @return void
	 * @exception Exception
	 */
	public void insertSChdStat(StdVO stdVO) throws Exception {
		stdMapper.insertSChdStat(stdVO);
	}

	/**
	 * 스터디 그룹 유저 삭제
	 * @param StdVO - usr_id
	 * @return void
	 * @exception Exception
	 */
	@Override
	public void deleteStdGrpUsr(UsrVO usrVO) throws Exception {
		stdMapper.deleteStdGrpUsr(usrVO);
	}

}
