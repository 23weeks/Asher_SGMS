/********************************************************************************/
/*								                                                */
/*  Create SJLEE     			                                                */
/*  Date : 2024-01-17		                                                  	*/
/*      				         			                                    */
/*									                                            */
/********************************************************************************/

/* Session 체크 */
function getSessionValue() {
	if(!sessionStorage.getItem("usr_id")){
		alert("Session 정보가 없어 로그인페이지로 이동합니다.");
		}
	}