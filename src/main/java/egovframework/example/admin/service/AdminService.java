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
package egovframework.example.admin.service;

import java.util.List;

import egovframework.example.usr.vo.UsrVO;

/**
 * @Class Name : UsrService.java
 * @Description : UsrService Class
 * @Modification Information
 * @
 * @  수정일      수정자              수정내용
 * @ ---------   ---------   -------------------------------
 * @ 2024.01.11           최초생성
 *
 * @author SJLEE
 */
public interface AdminService {

	/**
	 * 유저 목록 조회
	 * @param 
	 * @return List<usrVO>
	 * @exception Exception
	 */
	List<UsrVO> selectUsrList(UsrVO usrVO) throws Exception;

	/**
	 * ID 중복 체크
	 * @param usrVO - usr_id
	 * @return int
	 * @exception Exception
	 */
	int usrDupCheck(UsrVO usrVO) throws Exception;
	
	/**
	 * 회원가입
	 * @param usrVO
	 * @return int
	 * @exception Exception
	 */
	int insertUsr(UsrVO usrVO) throws Exception;
	
	/**
	 * 로그인
	 * @param usrVO - usr_id, usr_pwd
	 * @return usrVO
	 * @exception Exception
	 */
	UsrVO loginUsrInfo(UsrVO usrVO) throws Exception;
	
	/**
	 * ID찾기
	 * @param usrVO - usr_name, usr_brth, usr_phone
	 * @return usrVO
	 * @exception Exception
	 */
	UsrVO findId(UsrVO usrVO) throws Exception;
	
	/**
	 * 비밀번호 찾기
	 * @param usrVO - usr_id, usr_name, usr_brth, usr_phone
	 * @return usrVO
	 * @exception Exception
	 */
	UsrVO findPwd(UsrVO usrVO) throws Exception;
}