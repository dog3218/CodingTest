<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<% request.setCharacterEncoding("UTF-8");%>

<!DOCTYPE html>
<html>
<head>
<link href="css/style.css" rel="stylesheet" type="text/css">
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
	
	function go_search(){
		debugger
		var keyword = $('[name= keyword]').val();
		
		$('form').attr('action', 'index');
		$('form').submit();
		
	}
	
	function do_delete(){
		var leng = $('input:checkbox[name="id"]:checked').length;
		if(leng==0){
			alert("삭제할 회원을 선택하십시오.");
		}
		if(leng> 1){
			alert("삭제 처리는 한개씩만 가능합니다.");
			return;
		}
		if(leng==1){
			if(confirm("삭제하시겠습니까?")){
			$('input:checkbox[name="checkbox"]').val();
			$('form').attr('action', 'member_delete');
			$('form').submit();
			}else{
				return;
			}

		}
		return;
	}
	
	function do_modify(){
		var leng = $('input:checkbox[name="id"]:checked').length;
		if(leng==0){
			alert("수정할 회원을 선택하십시오.");
		}
		if(leng> 1){
			alert("수정은 한명씩만 가능합니다.");
			return;
		}
		if(leng==1){
			if(confirm("수정하시겠습니까?")){
			$('input:checkbox[name="checkbox"]').val();
			$('form').attr('action', 'member_modify');
			$('form').submit();
			}else{
				return;
			}

		}
		return;
	}

</script>
</head>
<body topmargin="0" leftmargin="0">

<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr> 
    <td>&nbsp;</td>
  </tr>
  <tr> 
    <td height="25"><img src="image/icon.gif" width="9" height="9" align="absmiddle"> 
      <strong>사원조회</strong></td>
  </tr>
  <form method="post" action="index" accept-charset="utf-8">
  <tr> 
    <td><table width="640" border="0" cellspacing="0" cellpadding="0">
        <tr> 
          <td height="30" align="right">
	          <select name="select" class="INPUT">
	              <option value="all" selected>::::: 전체 :::::</option>
	              <option value="name">이름</option>
	              <option value="gender">성별</option>
	              <option value="tech_grade">기술등급</option>
	            </select> <input name="keyword" type="text" class="INPUT">
	            	<a onclick="go_search()">
	            	<img src="image/search.gif" width="49" height="18" border="0" align="absmiddle"
	            	/>
	            	</a>
            
            </td>
        </tr>
        <tr> 
          <td><table width="640" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td height="3" background="image/bar_bg1.gif"></td>
              </tr>
              <tr align="center" bgcolor="F8F8F8"> 
                <td height="26" align="right" bgcolor="F8F8F8" style="padding-right:10"><img src="image/all_icon.gif" width="11" height="11" align="absmiddle"> 
                  <a onclick="do_modify()">수정</a> <img src="image/all_icon.gif" width="11" height="11" align="absmiddle"> 
                  <a href="#">인사기록카드</a> <img src="image/all_icon.gif" width="11" height="11" align="absmiddle"> 
                  <a href="#">경력정보</a> <img src="image/all_icon.gif" width="11" height="11" align="absmiddle"> 
                  <a href="#">근무정보</a> </td>
              </tr>
              <tr align="center" bgcolor="F8F8F8"> 
                <td height="1" align="right" bgcolor="B1B1B1"></td>
              </tr>
              <tr> 
                <td>
				<!-------------------------  ����Ʈ ------------------------------>
				<table width="640" border="0" cellspacing="0" cellpadding="0">
				<c:if test="${empty page.list }">
				<tr><td height="35" colspan="7" align="center">등록된 회원이 없습니다.</td></tr></c:if>
				
					<c:forEach items="${page.list }" var ="vo">
	                   <tr> 
	                     <td width="35" height="20" align="center"><input type="checkbox" name="id" value="${vo.id }"></td>
	                     <td width="85" align="center">${vo.name }</td>
	                     <td width="153" align="center">${vo.idnum }</td>
	                     <td width="91" align="center">${vo.gender}</td>
	                     <td width="91" align="center">${vo.tech_grade }</td>
	                     <td width="91" align="center">${vo.hire_type }</td>
	                     <td width="94" align="center">${vo.job }</td>
	                   </tr>
                    </c:forEach>
                    <tr> 
                      <td colspan="7" background="image/line_bg.gif"></td>
                    </tr>
                    
                    <tr> 
                      <td height="35" colspan="7" align="center" style="padding-bottom:3">
                      <jsp:include page="/WEB-INF/views/page.jsp"></jsp:include></td>
                    </tr>
                  </table>
 				<!-------------------------  ����Ʈ ------------------------------>
				  </td>
              </tr>
              
              <tr align="center" bgcolor="F8F8F8"> 
                <td height="1" align="right" bgcolor="B1B1B1"></td>
              </tr>
              <tr align="center" bgcolor="F8F8F8"> 
                <td height="26" align="right" bgcolor="F8F8F8" style="padding-right:10"><img src="image/all_icon.gif" width="11" height="11" align="absmiddle"> 
                  <a onclick="do_delete()">삭제</a> <img src="image/all_icon.gif" width="11" height="11" align="absmiddle"> 
                  <a href="#">인사기록카드</a> <img src="image/all_icon.gif" width="11" height="11" align="absmiddle"> 
                  <a href="#">경력정보</a> <img src="image/all_icon.gif" width="11" height="11" align="absmiddle"> 
                  <a href="#">근무정보</a> </td>
              </tr>
            </table></td>
        </tr>
        </form>
        <tr> 
          <td height="3" background="image/bar_bg1.gif"></td>
        </tr>
      </table></td>
  </tr>
</table>
<script type="text/javascript">
	function do_delete() {
		var leng = $('input:checkbox[name="id"]:checked').length;

		if(leng> 1){
			alert{"삭제 처리는 한개씩만 가능합니다."};
			return;
		}else if(leng==0){
			alert{"삭제할 회원을 선택해야합니다."}
		}else{
			if(confirm{"삭제하시겠습니까?"}){
			$('input:checkbox[name="checkbox"]').val();
			$('form').attr('action', 'member_delete');
			$('form').submit();
			}else{
				return;
			}

		}
		return;
	}
</script>
</body>
</html>
	