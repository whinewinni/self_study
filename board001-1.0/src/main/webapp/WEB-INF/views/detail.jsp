<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Detail</title>
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
		<thead>
			<tr>
				<th class="back">${getBoardDetail.boardNum}</th>
				<td colspan="2">${getBoardDetail.title}</td>
			</tr>
			<tr  class="back">
				<td>${getBoardDetail.writer}</td>
				<td>${getBoardDetail.boardDate}</td>
				<td>${getBoardDetail.hit}</td>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td colspan="3">${getBoardDetail.content}</td>
			</tr>
		</tbody>
		<tfoot class="back">
			<tr>
				<td colspan="3">
					<button type="button" onclick="location='main'">Back To List</button>
					<button type="button" onclick="location='getModifyForm?boardNum=${getBoardDetail.boardNum}'">Modify</button>
					<input type="button" value="버튼2">
					<input type="button" value="버튼3">
				</td>
			</tr>
		</tfoot>
	</table>

</body>
</html>