<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<link href="css/style.css" rel="stylesheet" type="text/css">
</head>
<body topmargin="0" leftmargin="0">
<form id="modify" method="post" action="modify_save" enctype="multipart/form-data">
<input type="hidden" name="attach"/>
<table width="640" border="0" cellspacing="0" cellpadding="0">
  <tr> 
    <td width="640">&nbsp;</td>
  </tr>
  <tr> 
    <td height="25"><img src="image/icon.gif" width="9" height="9" align="absmiddle"> 
      <strong>사원 기본 정보 수정</strong>
      <input type="hidden" name="id" value="${vo.id }"></td>
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
                                    <td height="110" bgcolor="#FFFFFF">
                                    <div id="image_container">
                                    	<img id="preview" 	src="${vo.picture }" style="width: 100px; height: 110px;"/>
                                    </div>
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
                              <input type="hidden" name="idnum" />
                              </td>
                              <td height="26">
                              <input id="idnum1" name="idnum1" type="text" size="15" value="${ data.get('idnum1') }" readonly/>
      														-
        						<input id="idnum2" name="idnum2" type="text" size="15"  value="${data.get('idnum2') }" readonly></td>
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
	                            <input type="file" id="image" src="image/bt_search.gif"
	                            name="file" onchange="setThumbnail(event);"/>
	                            
	                            </font>
                            </td>
                          </tr>
                        </table></td>
                    </tr>
                    <tr> 
                      <td bgcolor="#E4EBF1"><table width="500" border="0" cellspacing="1" cellpadding="1">
                          <tr> 
                            <td width="102" align="right"><strong>생년월일:&nbsp;</strong>
                            <input type="hidden" name="birth" /> </td>
                            <td width="391">
                              <input name="birth1" type="text" size="10"value="${data.get('birth1')}">
                              년 
                              <input name="birth2" type="text" size="7" value="${data.get('birth2')}">
                              월 
                              <input name="birth3" type="text" size="7" value="${data.get('birth3')}">
                              일( 
                              <input type="radio" name="birth_calendar" value="양력" ${data.get('birth4') eq "양력" ? "checked" : ''}/>
                              양력 
                              <input type="radio" name="birth_calendar" value="음력" ${data.get('birth4') eq "음력" ? "checked" : ''}/>
                              음력)</td>
                          </tr>
                        </table></td>
                    </tr>
                    <tr> 
                      <td bgcolor="#E4EBF1"><table width="500" border="0" cellspacing="1" cellpadding="1">
                          <tr> 
                            <td width="102" align="right"><strong>성별:&nbsp; </strong></td>
                            <td width="391"> 
                             <input type="radio" name="gender" value="남자" ${vo.gender eq "남자" ? "checked" : '' }>
                              남자
                              <input type="radio" name="gender" value="여자" ${vo.gender eq "여자" ? "checked" : '' }>
                              여자</td>
                          </tr>
                        </table></td>
                    </tr>
                    <tr> 
                      <td bgcolor="#E4EBF1"><table width="500" border="0" cellspacing="1" cellpadding="1">
                          <tr> 
                            <td width="102" align="right"><strong>결혼유무 :&nbsp;</strong></td>
                            <td width="391">
                            <input type="radio" name="married" value="기혼" ${vo.married eq "기혼" ? "checked" : '' }>유
                            <input type="radio" name="married" value="미혼" ${vo.married eq "미혼" ? "checked" : '' }>무</td>
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
                                <option value="month" ${vo.salary_type eq "month" ? "selected" : '' }>월급</option>
                                <option value="week" ${vo.salary_type eq "week" ? "selected" : '' }>주급</option>
                              </select> </td>
                          </tr>
                        </table></td>
                    </tr>
                    <tr> 
                      <td bgcolor="#E4EBF1"><table width="500" border="0" cellspacing="1" cellpadding="1">
                          <tr> 
                            <td width="101" align="right"><strong>희망직무 :&nbsp;</strong></td>
                            <td width="392"> <select name="job">
                                <option value = "SI" ${vo.job eq 'SI' ? "selected" : '' }>SI</option>
                                <option value = "SM" ${vo.job eq 'SM' ? "selected" : '' }>SM</option>
                              </select> </td>
                          </tr>
                        </table></td>
                    </tr>
                    <tr> 
                      <td bgcolor="#E4EBF1"><table width="500" border="0" cellspacing="1" cellpadding="1">
                          <tr> 
                            <td width="101" align="right"><strong>입사유형:&nbsp;</strong></td>
                            <td width="392"> <select name="hire_type">
                                <option value="정규직"  ${vo.hire_type eq '정규직' ? "selected" : '' }>정규직</option>
                                <option value="계약직"  ${vo.hire_type eq '계약직' ? "selected" : '' }>계약직</option>
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
                            	<input type="hidden" name="contact" /></td>
                            <td width="392">
                            <input name="contact1" type="text" size="10" value="${data.get('contact1')}" maxlength="3">
                              - 
                              <input name="contact2" type="text" size="10" value="${data.get('contact2')}" maxlength="4">
                              - 
                              <input name="contact3" type="text" size="10" value="${data.get('contact3')}" maxlength="4"></td>
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
              <td width="49"><a onclick="on_submit()"><img src="image/bt_remove.gif" width="49" height="18"></a></td>
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
	<script src="http://code.jquery.com/jquery-latest.js"></script>
	<!-- 유효성검사 -->
<script type="text/javascript">
var pattern_num = /[0-9]/;	// 숫자 
var pattern_str = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣|a-zA-Z]/; // 문자 체크

$('[name="name"]').on('keyup', function(){
	var str = $('[name="name"]').val();
	if( (pattern_str.test(str) )){
		return true;}
	else{
		//$('[name="name"] span).text("문자만 입력가능합니다.");
		alert("문자만 입력가능합니다."); 
		$('[name="name"]').val('');
		return false;}
});	
$('[name="name_eng"]').on('keyup', function(){
	var str = $('[name="name_eng"]').val();
	if( (pattern_str.test(str) )){return true;}
	else{ 
		alert("문자만 입력가능합니다."); 
		$('[name="name_eng"]').val('');
		return false;}
});	
$('[name="name_chn"]').on('keyup', function(){
	var str = $('[name="name_chn"]').val();
	if( (pattern_str.test(str) )){return true;}
	else{ 
		alert("문자만 입력가능합니다."); 
		$('[name="name_chn"]').val('');
		return false;}
});	
$('[name="tech_grade"]').on('keyup', function(){
	var str = $('[name="tech_grade"]').val();
	if( (pattern_str.test(str) )){return true;}
	else{ 
		alert("문자만 입력가능합니다."); 
		$('[name="tech_grade"]').val('');
		return false;}
});	

$('[name="idnum1"]').on('keyup', function(){
	var str = $('[name="idnum1"]').val();
	if( (pattern_num.test(str) )){return true;}
	else{ 
		alert("숫자만 입력가능합니다."); 
		$('[name="idnum1"]').val('');
		return false;}
});	
$('[name="idnum2"]').on('keyup', function(){
	var str = $('[name="idnum2"]').val();
	if( (pattern_num.test(str) )){return true;}
	else{ 
		alert("숫자만 입력가능합니다."); 
		$('[name="idnum2"]').val('');
		return false;}
});	
$('[name="birth1"]').on('keyup', function(){
	var str = $('[name="birth1"]').val();
	if( (pattern_num.test(str) )){return true;}
	else{ 
		alert("숫자만 입력가능합니다."); 
		$('[name="birth1"]').val('');
		return false;}
});	
$('[name="birth2"]').on('keyup', function(){
	var str = $('[name="birth1"]').val();
	if( (pattern_num.test(str) )){return true;}
	else{ 
		alert("숫자만 입력가능합니다."); 
		$('[name="birth1"]').val('');
		return false;}
});	
$('[name="birth3"]').on('keyup', function(){
	var str = $('[name="birth1"]').val();
	if( (pattern_num.test(str) )){return true;}
	else{ 
		alert("숫자만 입력가능합니다."); 
		$('[name="birth1"]').val('');
		return false;}
});	
$('[name="contact1"]').on('keyup', function(){
	var str = $('[name="contact1"]').val();
	if( (pattern_num.test(str) )){return true;}
	else{ 
		alert("숫자만 입력가능합니다."); 
		$('[name="contact1"]').val('');
		return false;}
});	
$('[name="contact2"]').on('keyup', function(){
	var str = $('[name="contact2"]').val();
	if( (pattern_num.test(str) )){return true;}
	else{ 
		alert("숫자만 입력가능합니다."); 
		$('[name="contact2"]').val('');
		return false;}
});	
$('[name="contact3"]').on('keyup', function(){
	var str = $('[name="contact3"]').val();
	if( (pattern_num.test(str) )){return true;}
	else{ 
		alert("숫자만 입력가능합니다."); 
		$('[name="contact3"]').val('');
		return false;}
});	
$('[name="career"]').on('keyup', function(){
	var str = $('[name="career"]').val();
	if( (pattern_num.test(str) )){return true;}
	else{ 
		alert("숫자만 입력가능합니다."); 
		$('[name="career"]').val('');
		return false;}
});	

</script>
	
<script type="text/javascript">
	
	
	if ( ${ ! empty vo.picture} ) {
		// 첨부 파일이 이미지 파일인 경우 미리보기 되게
		if ( isImage ( '${vo.picture}' ) ){
			$('#preview').html('<img src="${vo.picture}");
			$('[name=file]').setAttribute(value, $(vo.file));
			var attach = document.createElement("input"); 
			attach.setAttribute("type", "hidden");
			attach.setAttriute("value", "yes" );
		}
	}

</script>
	
<script type="text/javascript">
	function setThumbnail(event) {
		debugger;
		var reader = new FileReader();
		
		var file = $('[name=file]').val();
		if( file.substr(file.length-3)!='jpg'){
			alert("jpg파일만 올릴 수 있습니다.");
			$('[name="file"]').val('');
			return false;
		}
		
		reader.onload = function(event) {
			
			if($('#preview').length>0){//선택해놓은 이미지가 있을 때
				$('#preview').remove();
				var img = document.createElement("img"); 
				img.setAttribute("id", "preview");
				img.setAttribute("src", event.target.result);
				img.setAttribute("style", "width:100px; height:110px;");
				document.querySelector("div#image_container").appendChild(img);
				}
			else{//선택해놓은 이미지가 없을 때
				var img = document.createElement("img"); 
				img.setAttribute("id", "preview");
				img.setAttribute("src", event.target.result);
				img.setAttribute("style", "width:100px; height:110px;");
				document.querySelector("div#image_container").appendChild(img);
			
				}
		}
		reader.readAsDataURL(event.target.files[0]);
		}
	
	function on_submit() {
		if(confirm("입력한 정보로 수정하시겠습니까?")){
		//주민번호 묶기
		var idnum1 = $('[name="idnum1"]').val();
		var idnum2 = $('[name="idnum2"]').val();
		$('[name = idnum]').val(idnum1+"-"+idnum2);
		
		//전화번호 묶기
		var contact1 = $('[name="contact1"]').val();
		var contact2 = $('[name="contact2"]').val();
		var contact3 = $('[name="contact3"]').val();
		$('[name = contact]').val(contact1+"-"+contact2+"-"+contact3);
		
		//생년월일 묶기
		var birth1 = $('[name="birth1"]').val();
		var birth2 = $('[name="birth2"]').val();
		var birth3 = $('[name="birth3"]').val();
		var birth_calendar = $('[name="birth_calendar"]').val();
		var birth = birth1+birth2+birth3+birth_calendar;
		$('[name = birth]').val(birth); 
		$('[name=attach]').val($('#image').text());
			$('form').submit();
			alert("수정되었습니다.");
			return true;
		}else{
			return false;
		}
		
	}

	</script>
	


</body>
</html>
