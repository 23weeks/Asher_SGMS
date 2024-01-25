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

import org.springframework.stereotype.Repository;

import egovframework.example.usr.vo.UsrVO;
import egovframework.rte.psl.dataaccess.EgovAbstractDAO;

/**
 * @Class Name : AdminDAO.java
 * @Description : Admin DAO Class
 * @Modification Information
 * @
 * @  수정일      수정자              수정내용
 * @ ---------   ---------   -------------------------------
 * @ 2024.01.12           최초생성
 *
 * @author SJLEE
 */

@Repository("adminDAO")
public class AdminDAO extends EgovAbstractDAO {

	/**
	 * 유저 목록 조회
	 * @param
	 * @return List<usrVO>
	 * @exception Exception
	 */
	List<?> selectUsrList(UsrVO usrVO) throws Exception {
		return list("adminDAO.selectUsrList", usrVO);
	}
}
