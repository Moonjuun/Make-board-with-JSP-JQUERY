<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 글쓰기</title>

<link rel = "stylesheet" type= "text/css" href="../css/board.sss">

</head>
	<table cellpadding="0" cellspacing="0" width = "600px" align = "center" border = "1">
	<form method = "post" action= "./write_ok.jsp">
		
		<tr>
			<td width = "120px" height = "30px" align = "center">
				작성자
			</td>
			
			<td width = "480px" height = "30px">
				<input type = "text" name = "userID" id = "userID" class = "text1" style="width:150px; height:30px" />			
			</td>
		</tr>
		
		<tr>			
			<td width = "120px" height = "30px" align = "center">
				글제목
			</td>
			<td width = "480px" height = "30px">
				<input type = "text" name = "title" id = "title" class = "text1" style="width:470px; height:30px"/>			
			</td>
		</tr>
		
		<tr>			
			<td width = "600px" height = "120px" align = "center" colspan = "2">
				<textarea name = "content" id="content" class = "text1" style = "width:590px;height:230px"></textarea>
			</td>
		</tr>
		
		<tr>
			<td width = "600px" height = "30px" align = "center" colspan="2">
				<input type = "submit" value="저장"/>		
			</td>
			
		</tr>
	</table>

</body>
</html>