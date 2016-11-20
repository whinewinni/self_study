<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Save</title>
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

	<form action="saveBoard" method="post">
		<table>
			<thead class="back">
				<tr>
					<td colspan="2">게시글 쓰기</td>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td class="back">작성자</td>
					<td><input name="writer" id="writer"></td>
				</tr>			
				<tr>
					<td class="back">제목</td>
					<td><input name="title" id="title"></td>
				</tr>			
				<tr>
					<td class="back">내용</td>
					<td><input style="height: 150px" name="content" id="content"></td>
				</tr>			
			</tbody>
			<tfoot class="back">
				<tr>
					<td colspan="2">
						<button type="button" onclick="location='main'">Back To List</button>
						<button type="submit">Create Done</button>
						<input type="button" value="버튼3">
					</td>
				</tr>			
			</tfoot>
		
		</table>
	
	</form>



</body>
</html>