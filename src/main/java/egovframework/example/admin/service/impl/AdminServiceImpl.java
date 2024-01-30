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
package egovframework.example.admin.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import egovframework.example.admin.service.AdminService;
import egovframework.example.std.vo.StdVO;
import egovframework.example.usr.vo.UsrVO;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import egovframework.rte.fdl.idgnr.EgovIdGnrService;

/**
 * @Class Name : AdminServiceImpl.java
 * @Description : Admin Business Implement Class
 * @Modification Information
 * @ @ 수정일 수정자 수정내용 
 * @ --------- --------- ------------------------------- 
 *   2024.01.18 최초생성
 *
 * @author SJLEE
 */

@Service("adminService")
public class AdminServiceImpl extends EgovAbstractServiceImpl implements AdminService {

	@SuppressWarnings("unused")
	private static final Logger LOGGER = LoggerFactory.getLogger(AdminServiceImpl.class);

	// TODO mybatis 사용
	@Resource(name = "adminMapper")
	private AdminMapper adminMapper;

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
		return adminMapper.selectUsrList(usrVO);
	}

	/**
	 * 그룹별 통계
	 * @param 
	 * @return List<stdVO>
	 * @exception Exception
	 */
	@Override
	public List<StdVO> selectGrpAttRate(StdVO stdVO) throws Exception {
		return adminMapper.selectGrpAttRate(stdVO);
	}
}
