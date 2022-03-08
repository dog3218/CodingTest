<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>

<title>TEST</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">

</head>
<div>

<a  style="display: inline-block; "><jsp:include page="left.jsp" flush="true"/></a>
<a style="display: inline-block; "><jsp:include page="main.jsp" flush="true"/></a>

</div>
<!-- <frameset cols="180,*" frameborder="NO" border="0" framespacing="0">
  <frame src="left" name="leftFrame" scrolling="NO" noresize>
  <frame src="main" name="mainFrame">
</frameset>
<noframes> -->

<body>

</body>
<!-- </noframes> -->
</html>