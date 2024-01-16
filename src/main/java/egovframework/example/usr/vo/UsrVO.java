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
package egovframework.example.usr.vo;

import java.io.Serializable;

/**
 * @Class Name : UsrVO.java
 * @Description : UsrVO Class
 * @Modification Information
 * @
 * @  수정일      수정자              수정내용
 * @ ---------   ---------   -------------------------------
 * @ 2024.01.11           최초생성
 *
 * @author SJLEE
 */
public class UsrVO implements Serializable {

	/**
	 *  serialVersion UID
	 */
	private static final long serialVersionUID = -858838578081269359L;

	private String usr_id;			//ID
	private String usr_pwd;			//비밀번호
	private String usr_name;		//이름
	private String usr_brth;		//생년월일
	private String usr_phone;		//전화번호
	private String usr_addr;		//주소
	private String usr_levl;		//등급
	private String cre_date;		//생성일자
	
	
	public String getUsr_id() {
		return usr_id;
	}
	public void setUsr_id(String usr_id) {
		this.usr_id = usr_id;
	}
	public String getUsr_name() {
		return usr_name;
	}
	public void setUsr_name(String usr_name) {
		this.usr_name = usr_name;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	public String getUsr_pwd() {
		return usr_pwd;
	}
	public void setUsr_pwd(String usr_pwd) {
		this.usr_pwd = usr_pwd;
	}
	public String getUsr_brth() {
		return usr_brth;
	}
	public void setUsr_brth(String usr_brth) {
		this.usr_brth = usr_brth;
	}
	public String getUsr_phone() {
		return usr_phone;
	}
	public void setUsr_phone(String usr_phone) {
		this.usr_phone = usr_phone;
	}
	public String getUsr_addr() {
		return usr_addr;
	}
	public void setUsr_addr(String usr_addr) {
		this.usr_addr = usr_addr;
	}
	public String getUsr_levl() {
		return usr_levl;
	}
	public void setUsr_levl(String usr_levl) {
		this.usr_levl = usr_levl;
	}
	public String getCre_date() {
		return cre_date;
	}
	public void setCre_date(String cre_date) {
		this.cre_date = cre_date;
	}
	@Override
	public String toString() {
		return "UsrVO [usr_id=" + usr_id + ", usr_name=" + usr_name + "]";
	}
	
}
