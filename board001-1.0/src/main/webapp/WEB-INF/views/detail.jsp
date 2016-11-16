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
		<thead>
			<tr>
				<th class="back">번호 <!-- 요기 --></th><td colspan="2">title</td>
			</tr>
			<tr  class="back">
				<td>작성자</td><td>날짜</td><td>hit</td>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td colspan="3">내용</td>
			</tr>
		</tbody>
		<tfoot class="back">
			<tr>
				<td colspan="3">
					<input type="button" value="버튼1">
					<input type="button" value="버튼2">
					<input type="button" value="버튼3">
				</td>
			</tr>
		</tfoot>
	</table>

</body>
</html>