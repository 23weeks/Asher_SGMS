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
package egovframework.example.usr.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import egovframework.example.std.vo.StdVO;
import egovframework.example.usr.service.UsrService;
import egovframework.example.usr.vo.UsrVO;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import egovframework.rte.fdl.idgnr.EgovIdGnrService;

/**
 * @Class Name : UsrServiceImpl.java
 * @Description : Usr Business Implement Class
 * @Modification Information
 * @ @ 수정일 수정자 수정내용 
 * @ --------- --------- ------------------------------- 
 *   2024.01.11 최초생성
 *
 * @author SJLEE
 */

@Service("usrService")
public class UsrServiceImpl extends EgovAbstractServiceImpl implements UsrService {

	@SuppressWarnings("unused")
	private static final Logger LOGGER = LoggerFactory.getLogger(UsrServiceImpl.class);

	// TODO mybatis 사용
	@Resource(name = "usrMapper")
	private UsrMapper usrMapper;

	/** ID Generation */
	@Resource(name = "egovIdGnrService")
	private EgovIdGnrService egovIdGnrService;

	/**
	 * 유저 목록 조회
	 * @param 
	 * @return List<usrVO>
	 * @exception Exception
	 */
	@Override
	public List<UsrVO> selectUsrList(UsrVO usrVO) throws Exception {
		return usrMapper.selectUsrList(usrVO);
	}

	/**
	 * ID중복체크
	 * @param usrVO - usr_id
	 * @return int
	 * @exception Exception
	 */
	@Override
	public int usrDupCheck(UsrVO usrVO) throws Exception {
		return usrMapper.usrDupCheck(usrVO);
	}

	/**
	 * 회원가입
	 * @param usrVO
	 * @return int
	 * @exception Exception
	 */
	@Override
	public int insertUsr(UsrVO usrVO) throws Exception {
		return usrMapper.insertUsr(usrVO);
	}

	/**
	 * 로그인
	 * @param usrVO - usr_id, usr_pwd
	 * @return usrVO
	 * @exception Exception
	 */
	@Override
	public UsrVO loginUsrInfo(UsrVO usrVO) throws Exception {
		return usrMapper.loginUsrInfo(usrVO);
	}

	/**
	 * ID찾기
	 * @param usrVO - usr_name, usr_brth, usr_phone
	 * @return usrVO
	 * @exception Exception
	 */
	@Override
	public UsrVO findId(UsrVO usrVO) throws Exception {
		return usrMapper.findId(usrVO);
	}

	/**
	 * 비밀번호 찾기
	 * @param usrVO - usr_id, usr_name, usr_brth, usr_phone
	 * @return usrVO
	 * @exception Exception
	 */
	@Override
	public UsrVO findPwd(UsrVO usrVO) throws Exception {
		return usrMapper.findPwd(usrVO);
	}

	/**
	 * 회원 비밀번호 가져오기
	 * @param usrVO - usr_id
	 * @return usrVO - usr_pwd
	 * @exception Exception
	 */
	public UsrVO selectUsrInfo(UsrVO usrVO) throws Exception {
		return usrMapper.selectUsrInfo(usrVO);
	}

	/**
	 * 회원 정보 수정
	 * @param usrVO - usr_id, usr_pwd, usr_brth, usr_phone, usr_addr
	 * @return void
	 * @exception Exception
	 */
	@Override
	public void updateInfo(UsrVO usrVO) throws Exception {
		usrMapper.updateInfo(usrVO);
	}

	/**
	 * 회원 삭제
	 * @param usrVO - usr_id
	 * @return void
	 * @exception Exception
	 */
	@Override
	public void deleteUsr(UsrVO usrVO) throws Exception {
		usrMapper.deleteUsr(usrVO);
	}
}
