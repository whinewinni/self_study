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
				<th colspan="5">�Խ��� ���</th>
			</tr>
			<tr>
				<td>�۹�ȣ</td>
				<td style="width: 200px">����</td>
				<td>�ۼ���</td>
				<td>�ۼ���</td>
				<td>��ȸ��</td>
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
					<input type="button" value="��ư1">
				</th>
			</tr>
		</tfoot>
	</table>

</body>
</html>