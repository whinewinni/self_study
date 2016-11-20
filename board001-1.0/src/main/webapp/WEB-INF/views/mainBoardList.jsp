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
				<th colspan="5">Boiard List</th>
			</tr>
			<tr>
				<td>No.</td>
				<td style="width: 200px">title</td>
				<td>writer</td>
				<td>Date</td>
				<td>hit</td>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="findWhineBoard" items="${findWhineBoardList}">
				<tr>
					<td>${findWhineBoard.boardNum}</td>
					<td>
						<a href="getDetail?boardNum=${findWhineBoard.boardNum}">
							${findWhineBoard.title}
						</a>
					</td>
					<td>${findWhineBoard.writer}</td>
					<td>${findWhineBoard.boardDate}</td>
					<td>${findWhineBoard.hit}</td>
				</tr>
			</c:forEach>
		</tbody>
		<tfoot class="back">
			<tr>
				<th colspan="5">
					<button type="button" onclick="location='getWritePage'">
						Create New Board
					</button>
				</th>
			</tr>
		</tfoot>
	</table>

</body>
</html>