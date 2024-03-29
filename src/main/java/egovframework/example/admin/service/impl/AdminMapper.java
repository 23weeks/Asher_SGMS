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
package egovframework.example.admin.service.impl;

import java.util.List;

import egovframework.example.std.vo.StdVO;
import egovframework.example.usr.vo.UsrVO;
import egovframework.rte.psl.dataaccess.mapper.Mapper;

/**
 * admin에 관한 데이터처리 매퍼 클래스
 *
 * @author  SJLEE
 * @since 2024.01.18
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
@Mapper("adminMapper")
public interface AdminMapper {

	/**
	 * 유저 목록 조회
	 * @param
	 * @return List<usrVO>
	 * @exception Exception
	 */
	List<UsrVO> selectUsrList(UsrVO usrVO) throws Exception;
	
	/**
	 * 그룹별 통계
	 * @param 
	 * @return List<stdVO>
	 * @exception Exception
	 */
	List<StdVO> selectGrpAttRate(StdVO stdVO) throws Exception;
}
