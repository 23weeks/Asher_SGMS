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
 * @Class Name : AdminService.java
 * @Description : AdminService Class
 * @Modification Information
 * @
 * @  수정일      수정자              수정내용
 * @ ---------   ---------   -------------------------------
 * @ 2024.01.18           최초생성
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
}
