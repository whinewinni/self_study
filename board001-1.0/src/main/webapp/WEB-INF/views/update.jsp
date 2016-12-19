<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
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

	<form action="modifyBoard" method="post">
		<input type="text" name="boardNum" value="${modifyData.boardNum}"/>
		<%--<input type="text" name="boardDate" value="${modifyData.boardDate}"/>
		<input type="text" name="hit" value="${modifyData.hit}"/>--%>
		<table>
			<thead class="back">
				<tr>
					<td colspan="2">게시글 쓰기</td>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td class="back">작성자</td>
					<td><input name="writer" id="writer" value="${modifyData.writer}"/></td>
				</tr>			
				<tr>
					<td class="back">제목</td>
					<td><input name="title" id="title" value="${modifyData.title}"/></td>
				</tr>			
				<tr>
					<td class="back">내용</td>
					<td>
						<input style="height: 150px" name="content" id="content" value="${modifyData.content}"/>
					</td>
				</tr>			
			</tbody>
			<tfoot class="back">
				<tr>
					<td colspan="2">
						<button type="submit">Update</button>
						<button type="button" onclick="location='main'">Back To List</button>
					</td>
				</tr>			
			</tfoot>
		
		</table>
	
	</form>

</body>
</html>