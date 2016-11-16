<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<style>
	.back{
		background-color: #98fb98;
		text-align: center;
	}
	table{
		border: white 1px;
	}
</style>
</head>
<body>
	<table>
		<thead class="back">
			<tr>
				<th colspan="5">게시판 목록</th>
			</tr>
			<tr>
				<td>글번호</td>
				<td style="width: 200px">제목</td>
				<td>작성자</td>
				<td>작성일</td>
				<td>조회수</td>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="findWhineBoard" items="${findWhineBoardList}">
				<tr>
					<td>${findWhineBoard.boardnum}</td>
					<td>${findWhineBoard.title}</td>
					<td>${findWhineBoard.writer}</td>
					<td>${findWhineBoard.boarddate}</td>
					<td>${findWhineBoard.hit}</td>
				</tr>
			</c:forEach>
		</tbody>
		<tfoot class="back">
			<tr>
				<th colspan="5">
					<input type="button" value="버튼1">
				</th>
			</tr>
		</tfoot>
	</table>

</body>
</html>