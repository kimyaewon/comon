<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"	   uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"	   uri="http://egovframework.gov/ctl/ui" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<style>
body {
	font-size:9pt;
}
button{
	font-size:9pt;
}
table {
	width:600px;
	border-collapse:collapse;
}
th,td {
	border:1px solid #cccccc;
	padding:3px;
}
.input1 {
	width:98%;
}
.textarea {
	width:98%;
	height:70px;
}

</style>

<body>
<table>
	<caption>
	<div>일반게시판 목록</div>
	</caption>
	<tr>
		<th width="45%">제목</th>
		<th width="15%">글쓴이</th>
		<th width="15%">등록일</th>
		<th width="15%">조회수</th>
	</tr>
	
	<c:forEach var="result" items="${resultList }">
	
	<tr align="center">
		<td align="left">
			<a href="boardDetail.do?unq=${result.unq }"><c:out value="${result.title }"/></a>	
	</td>
	<td><c:out value="${result.name }"/></td>
	<td><c:out value="${result.rdate }"/></td>
	<td><c:out value="${result.hits }" /></td>
	</tr>
	</c:forEach>
	
</table>

<div style="width:600px; margin-top:5px; text-align:right;">
	<button type="button" onclick="location='board.do">글쓰기</button>
</div>



</body>
</html>