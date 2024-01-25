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
package egovframework.example.std.vo;

import java.io.Serializable;

import egovframework.example.usr.vo.UsrVO;

/**
 * @Class Name : StdVO.java
 * @Description : StdVO Class
 * @Modification Information
 * @
 * @  수정일      수정자              수정내용
 * @ ---------   ---------   -------------------------------
 * @ 2024.01.22           최초생성
 *
 * @author SJLEE
 */
public class StdVO extends UsrVO implements Serializable {

	/**
	 *  serialVersion UID
	 */
	private static final long serialVersionUID = -858838578081269359L;
	
	private String grp_id;
	private String grp_name;
	private String grp_master;
	private String grp_type;
	private String dsc;
	private String cre_date;
	
	private String std_yyyymm;
	private String std_schd_noti;
	
	public String getStd_yyyymm() {
		return std_yyyymm;
	}
	public void setStd_yyyymm(String std_yyyymm) {
		this.std_yyyymm = std_yyyymm;
	}
	public String getStd_schd_noti() {
		return std_schd_noti;
	}
	public void setStd_schd_noti(String std_schd_noti) {
		this.std_schd_noti = std_schd_noti;
	}
	public String getGrp_id() {
		return grp_id;
	}
	public void setGrp_id(String grp_id) {
		this.grp_id = grp_id;
	}
	public String getGrp_name() {
		return grp_name;
	}
	public void setGrp_name(String grp_name) {
		this.grp_name = grp_name;
	}
	public String getGrp_master() {
		return grp_master;
	}
	public void setGrp_master(String grp_master) {
		this.grp_master = grp_master;
	}
	public String getGrp_type() {
		return grp_type;
	}
	public void setGrp_type(String grp_type) {
		this.grp_type = grp_type;
	}
	public String getDsc() {
		return dsc;
	}
	public void setDsc(String dsc) {
		this.dsc = dsc;
	}
	public String getCre_date() {
		return cre_date;
	}
	
	public void setCre_date(String cre_date) {
		this.cre_date = cre_date;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
	@Override
	public String toString() {
		return "StdVO [grp_id=" + grp_id + ", grp_name=" + grp_name + ", grp_master=" + grp_master + ", grp_type="
				+ grp_type + ", dsc=" + dsc + ", cre_date=" + cre_date + ", std_yyyymm=" + std_yyyymm
				+ ", std_schd_noti=" + std_schd_noti + "]";
	}
}
