<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!-- 함수사용 -->

<%
	pageContext.setAttribute("newline", "\n");
%>

<c:set var="content"
	value="${fn:replace(boardVO.content,newline,'<br>' ) } " />
<!-- br -->




<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>상세화면</title>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

</head>
<style>
body {
	font-size: 9pt;
}

button {
	font-size: 9pt;
}

table {
	width: 600px;
	border-collapse: collapse;
}

th, td {
	border: 1px solid #cccccc;
	padding: 3px;
}

.input1 {
	width: 98%;
}

.textarea {
	width: 98%;
	height: 70px;
}
</style>

<script>
	function fn_submit() {

		if ($.trim($("#title").val()) == "") {
			alert("제목을 입력해주세요.");
			$("#title").focus();
			return false;
		}
		$("#title").val($.trim($("#title").val()));

		if ($.trim($("#pass").val()) == "") {
			alert("암호를 입력해주세요.");
			$("#pass").focus();
			return false;
		}
		$("#pass").val($.trim($("#pass").val()));

		console.log($("#pass").val());

		var formData = $("#frm").serialize();

		$.ajax({
			type : "POST",
			data : formData,
			url : "boardsave.do",
			dataType : "text",
			/* 전송 후 세팅 */
			success : function(data) {
				if (data == "ok") {
					alert("저장완료");
					location = "List.do";
				} 
				else {
					alert("저장실패");
				}
			},
			error : function() { //	장애발생
				alert("오류발생");
			}
		});

	}
</script>


<body>
	<form id="frm">
		<table>
			<caption>
				<div>게시판 상세</div>
			</caption>
			<tr>
				<th width="20%">제목</th>
				<td width="80%">${boardVO.title }</td>
			</tr>

			<tr>
				<th>글쓴이</th>
				<td><c:out value="${boardVO.name }" /></td>
			</tr>
			<tr>
			<th>내용</th>
			<td height="50">
			${content }<!-- <br>인식 위에 첨부 -->
			</td>
			</tr>
			<tr>
				<th>등록일</th>
				<td>${boardVO.rdate }</td>
			</tr>
			<tr>
				<th colspan="2">
					<button type="button" onclick="location='list.do'">목록</button>
					<button type="button" onclick="location='board.do?unq=${boardVO.unq}'">수정</button>
					<button type="button" onclick="location='passWrite.do?unq=${boardVO.unq }'">삭제</button>
				</th>

			</tr>
		</table>
	</form>

</body>
</html>