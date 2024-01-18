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
package egoframework.example.admin.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @Class Name : CmmnController.java
 * @Description : CmmnController Class
 * @Modification Information
 * @
 * @  수정일      수정자              수정내용
 * @ ---------   ---------   -------------------------------
 * @ 2024.01.17           최초생성
 *
 * @author SJLEE
 */

@Controller
public class AdminController {

	/**
	 * 메인페이지
	 * @param 
	 * @param 
	 * @return 
	 * @exception Exception
	 */
	@RequestMapping(value = "/adminPage.do")
	public String mainPage() throws Exception {
		return "admin/adminPage";
	}
	
	/**
	* sessionCheck
	* @param 
	* @param
	* @see 
	*/
	/*
	 * @RequestMapping(value="/sessionCheck.ajax", method=RequestMethod.POST,
	 * produces="application/json") public String sessionCheck(HttpSession session)
	 * {
	 * 
	 * String sessionUsrId = (String) session.getAttribute("usr_id");
	 * 
	 * return sessionUsrId; }
	 */
}
