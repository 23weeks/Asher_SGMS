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

}
