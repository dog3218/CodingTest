<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript">
	
	
function go_modify(){
	
	$("form").submit();
	if(alert("회원정보가 수정되었습니다.")){
		location.href="index";
		return true;
	}else{
		return false;
	}

}
</script>
<meta charset="utf-8">
<link href="css/style.css" rel="stylesheet" type="text/css">
</head>
<body topmargin="0" leftmargin="0">
<form method="post" action="modify_save" enctype="multipart/form-data">
<table width="640" border="0" cellspacing="0" cellpadding="0">
  <tr> 
    <td width="640">&nbsp;</td>
  </tr>
  <tr> 
    <td height="25"><img src="image/icon.gif" width="9" height="9" align="absmiddle"> 
      <strong>사원 기본 정보 등록</strong>
      <input type="hidden" nane="id" value="${vo.id }"></td>
  </tr>
  <tr> 
    <td><table width="640" border="0" cellspacing="0" cellpadding="0">
        <tr> 
          <td height="15" align="left"><table width="640" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td><table width="640" border="0" cellspacing="1" cellpadding="0">
                    <tr> 
                      <td height="2" background="image/bar_bg1.gif"></td>
                    </tr>
                    <tr align="center" bgcolor="F8F8F8"> 
                      <td height="26" align="center" bgcolor="#E4EBF1" style="padding-right:10"><table width="600" border="0" cellspacing="0" cellpadding="0">
                          <tr> 
                            <td align="center"><strong>교육정보 | 자격증. 보유기술정보 | 프로젝트 정보 |경력정보 | 근무정보</strong></td>
                          </tr>
                        </table></td>
                    </tr>
                    <tr align="center" bgcolor="F8F8F8"> 
                      <td height="3" align="right" background="image/bar_bg1.gif"></td>
                    </tr>
                  </table></td>
              </tr>
            </table></td>
        </tr>
        <tr> 
          <td height="6" align="center" valign="top">&nbsp;</td>
        </tr>
        <tr>
          <td height="7" align="center" valign="top"><table width="600" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td bgcolor="#CCCCCC"><table width="600" border="0" cellspacing="1" cellpadding="0">
                    <tr> 
                      <td height="135" align="center" bgcolor="#E4EBF1"><table width="600" border="0" cellpadding="0" cellspacing="0">
                        <tr>
                          <td width="144" height="119" align="center"><table width="100" border="0" cellspacing="0" cellpadding="0">
                            <tr>
                              <td height="112" bgcolor="#CCCCCC"><table width="100" border="0" cellspacing="1" cellpadding="0">
                                  <tr>
                                    <td height="110" bgcolor="#FFFFFF"><span id="preview"></span>&nbsp;</td>
                                  </tr>
                              </table></td>
                            </tr>
                          </table></td>
                          <td width="456"><table width="423" border="0" cellspacing="2" cellpadding="0">
                            <tr>
                              <td height="2" colspan="2"></td>
                              </tr>
                            <tr>
                              <td width="107" height="26" align="right"><strong>한글이름 :</strong>&nbsp;</td>
                              <td width="310" height="26">
                                <input type="text" name="name" value="${vo.name != null ? vo.name : '' }">
                              </td>
                            </tr>
                            <tr>
                              <td height="26" align="right"><strong>영문이름 :&nbsp;</strong></td>
                              <td height="26"><input type="text" name="name_eng" value="${vo.name_eng != null ? vo.name_eng : '' }"></td>
                            </tr>
                            <tr>
                              <td height="26" align="right"><strong>한문이름:</strong>&nbsp;</td>
                              <td height="26"><input type="text" name="name_chn" value="${vo.name_chn != null ? vo.name_chn : '' }"></td>
                            </tr>
                            <tr>
                              <td height="26" align="right"><strong>주민등록번호:</strong>&nbsp;
                              <input type="hidden" name="idnum" value="${vo.idnum}"/>
                              </td>
                              <td height="26"><input id="idnum1" name="idnum1" type="text" size="15">
      														-
        						<input id="idnum2" name="idnum2" type="text" size="15"></td>
                            </tr>
                          </table></td>
                        </tr>
                      </table></td>
                    </tr>
                  </table></td>
              </tr>
            </table></td>
        </tr>
        <tr> 
          <td height="7" align="center" valign="top">&nbsp;</td>
        </tr>
        <tr> 
          <td height="13" align="center"><table width="600" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td bgcolor="#CCCCCC"><table width="600" border="0" cellspacing="1" cellpadding="0">
                    <tr> 
                      <td bgcolor="#E4EBF1"><table width="526" border="0" cellspacing="1" cellpadding="1">
                          <tr> 
                            <td width="102" align="right"><strong>사진파일명:&nbsp;</strong></td>
                            <td width="146">
	                            <font color="#FF0000">
	                            <input type="file" id='attach-file' src="image/bt_search.gif" name="file" accept="image/*"
	                            value="${vo.picture }"/>
	                            
	                            </font>
                            </td>
                          </tr>
                        </table></td>
                    </tr>
                    <tr> 
                      <td bgcolor="#E4EBF1"><table width="500" border="0" cellspacing="1" cellpadding="1">
                          <tr> 
                            <td width="102" align="right"><strong>생년월일:&nbsp;</strong>
                            <input type="hidden" name="birth" value="${vo.birth }"/> </td>
                            <td width="391"><input name="birth1" type="text" size="10">
                              년 
                              <input name="birth2" type="text" size="7">
                              월 
                              <input name="birth3" type="text" size="7">
                              일( 
                              <input type="radio" name="birth_calendar" value="radiobutton">
                              양력 
                              <input type="radio" name="birth_calendar" value="radiobutton">
                              음력)</td>
                          </tr>
                        </table></td>
                    </tr>
                    <tr> 
                      <td bgcolor="#E4EBF1"><table width="500" border="0" cellspacing="1" cellpadding="1">
                          <tr> 
                            <td width="102" align="right"><strong>성별:&nbsp; </strong></td>
                            <td width="391"> <input type="radio" name="gender" value="남자" ${vo.gender != '남자' ? checked : '' }>
                              남자
                              <input type="radio" name="gender" value="여자" ${vo.gender != '여자' ? checked : '' }>
                              여자</td>
                          </tr>
                        </table></td>
                    </tr>
                    <tr> 
                      <td bgcolor="#E4EBF1"><table width="500" border="0" cellspacing="1" cellpadding="1">
                          <tr> 
                            <td width="102" align="right"><strong>결혼유무 :&nbsp;</strong></td>
                            <td width="391">
                            <input type="radio" name="married" value="기혼" ${vo.married != '기혼' ? checked : '' }>유
                            <input type="radio" name="married" value="미혼" ${vo.married != '미혼' ? checked : '' }>무</td>
                          </tr>
                        </table></td>
                    </tr>
                    <tr> 
                      <td bgcolor="#E4EBF1"><table width="500" border="0" cellspacing="1" cellpadding="1">
                          <tr> 
                            <td width="101" align="right"><strong>년차 :&nbsp;</strong></td>
                            <td width="392"><input name="career" type="text" size="10" value=" ${vo.career != null ? vo.career : '' }"> 
                            </td>
                          </tr>
                        </table></td>
                    </tr>
                    <tr> 
                      <td bgcolor="#E4EBF1"><table width="500" border="0" cellspacing="1" cellpadding="1">
                          <tr> 
                            <td width="101" align="right"><strong>급여 지급유형 :&nbsp;</strong></td>
                            <td width="392"> <select name="salary_type">
                                <option value="month" ${vo.salary_type != 'month' ? selected : '' }>월급</option>
                                <option value="week" ${vo.salary_type != 'week' ? selected : '' }>주급</option>
                              </select> </td>
                          </tr>
                        </table></td>
                    </tr>
                    <tr> 
                      <td bgcolor="#E4EBF1"><table width="500" border="0" cellspacing="1" cellpadding="1">
                          <tr> 
                            <td width="101" align="right"><strong>희망직무 :&nbsp;</strong></td>
                            <td width="392"> <select name="job">
                                <option value = "SI" ${vo.job != 'SI' ? selected : '' }>SI</option>
                                <option value = "SM" ${vo.job != 'SM' ? selected : '' }>SM</option>
                              </select> </td>
                          </tr>
                        </table></td>
                    </tr>
                    <tr> 
                      <td bgcolor="#E4EBF1"><table width="500" border="0" cellspacing="1" cellpadding="1">
                          <tr> 
                            <td width="101" align="right"><strong>입사유형:&nbsp;</strong></td>
                            <td width="392"> <select name="hire_type">
                                <option value="정규직"  ${vo.hire_type != '정규직' ? selected : '' }>정규직</option>
                                <option value="계약직"  ${vo.hire_type != '계약직' ? selected : '' }>계약직</option>
                              </select> </td>
                          </tr>
                        </table></td>
                    </tr>
                    <!-- <tr> 
                      <td bgcolor="#E4EBF1"><table width="500" border="0" cellspacing="1" cellpadding="1">
                          <tr> 
                            <td width="101" align="right"><strong>주소:&nbsp;</strong></td>
                            <td width="392"> <select name="select4">
                                <option>������</option>
                              </select> </td>
                          </tr>
                        </table></td>
                    </tr> -->
                    <tr> 
                      <td bgcolor="#E4EBF1"><table width="500" border="0" cellspacing="1" cellpadding="1">
                          <tr> 
                            <td width="101" align="right"><strong>주소:&nbsp;</strong></td>
                            <td width="392"><input name="address" type="text" size="10"> 
                              <input name="textfield333" type="text" size="40"  value="${vo.address != null ? vo.address : '' }"> 
                            </td>
                          </tr>
                        </table></td>
                    </tr>
                    <tr> 
                      <td bgcolor="#E4EBF1"><table width="500" border="0" cellspacing="1" cellpadding="1">
                          <tr> 
                            <td width="101" align="right"><strong>연락처:&nbsp;</strong>
                            	<input type="hidden" name="contact" value="${vo.contact }"/></td>
                            <td width="392"><input name="contact1" type="text" size="10">
                              - 
                              <input name="contact2" type="text" size="10">
                              - 
                              <input name="contact3" type="text" size="10"></td>
                          </tr>
                        </table></td>
                    </tr>
                    <tr> 
                      <td bgcolor="#E4EBF1"><table width="500" border="0" cellspacing="1" cellpadding="1">
                          <tr> 
                            <td width="101" align="right"><strong>이메일:&nbsp;</strong></td>
                            <td width="392"><input name="email" type="text" size="20"
                             value="${vo.email != null ? vo.email : '' }"> 
                            </td>
                          </tr>
                        </table></td>
                    </tr>
                    <tr> 
                      <td bgcolor="#E4EBF1"><table width="500" border="0" cellspacing="1" cellpadding="1">
                          <tr> 
                            <td width="101" align="right"><strong>기술등급:&nbsp;</strong></td>
                            <td width="392"><input name="tech_grade" type="text" size="20"
                            value="${vo.tech_grade != null ? vo.tech_grade : '' }"> 
                            </td>
                          </tr>
                        </table></td>
                    </tr>
                    <tr> 
                      <td bgcolor="#E4EBF1"><table width="500" border="0" cellspacing="1" cellpadding="1">
                          <tr> 
                            <td width="101" align="right"><strong>주량:&nbsp;</strong></td>
                            <td width="392"><input name="alcohol" type="text" size="20"
                             value="${vo.alcohol != null ? vo.alcohol : '' }"> 
                            </td>
                          </tr>
                        </table></td>
                    </tr>
                  </table></td>
              </tr>
            </table></td>
        </tr>
        <tr> 
          <td height="3" align="center">&nbsp;</td>
        </tr>
        <tr>
          <td height="3" align="center">
          <table width="107" border="0" cellpadding="1" cellspacing="1">
            <tr>
              <td width="49"><a onclick="go_modify()"><img src="image/bt_remove.gif" width="49" height="18"></a></td>
              <td width="51"><a href="/hello/index"><img src="image/bt_cancel.gif" width="49" height="18"></a></td>
            </tr>
          </table>
         </td>
        </tr>
        <tr> 
          <td height="7" align="right">&nbsp;</td>
        </tr>
      </table></td>
  </tr>
</table>
</form>
<script type="text/javascript">


if ( ${ ! empty vo.picture} ) {
	// 첨부 파일이 이미지 파일인 경우 미리보기 되게
	if ( isImage ( '${vo.picture}' ) )
		$('#preview').html('<img src="${vo.picture}" id="preview-img" /> ');
}


	$(document).ready(function() {
	var idnum1 = (${vo.idnum}).substring(0, (${vo.idnum}).indexOf("-"));
	var idnum2 = (${vo.idnum}).substring((${vo.idnum}).indexOf("-") );
	
	$('[name=idnum1]').val(idnum1);
	$('[name=idnum2]').val(idnum2);

	var contact1 = (${vo.idnum}).substring(0, (${vo.idnum}).indexOf("-"));
	var contact2 = (${vo.idnum}).substring((${vo.idnum}).indexOf("-"), ${vo.idnum}).substring((${vo.idnum}).lastindexOf("-") );
	var contact3 = (${vo.idnum}).substring((${vo.idnum}).lastindexOf("-") );
	
	$('#idnum1').val(idnum1);
	$('#idnum2').val(idnum2);
	
});
</script>

<script type="text/javascript" src='js/file_check.js?v<%=new Date().getTime()%>'></script>

</body>
</html>
