<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="oracle.jdbc.OracleTypes" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 리스트</title>
</head>
<body>
<%
	// 순서!!
	// 1. DB 연결
	// 2. SELECT // PKG_BOARD.PROC_SEL_BOARD
	// 3. 가지고 와서 데이터 for를 돌려서 보여주자 --> HTML
	
	// 1. DB 연결!
	String dbUrl = "jdbc:oracle:thin:@db202202180950_high?TNS_ADMIN=/Users/moonjunchoi/Public/Wallet_DB202202180950";
	String dbID = "Admin";
	String dbPass = "123Qweasdzxc";
	ResultSet rs1 = null;
	ResultSet rs2 = null;
	try{
		CallableStatement csmt = null;
		String strSql = "";
		
		Class.forName("oracle.jdbc.driver.OracleDriver");
		
		Connection dbCon = DriverManager.getConnection(dbUrl, dbID, dbPass);
		
		String strProcName = "{call PKG_BOARD.PROC_SEL_BOARD(?,?,?)}";
		
		csmt = dbCon.prepareCall(strProcName);
		csmt.setString(1, "");
		csmt.registerOutParameter(2, OracleTypes.CURSOR);
		csmt.registerOutParameter(3, OracleTypes.CURSOR);
		
		csmt.executeQuery();
		
		rs1 = (ResultSet)csmt.getObject(2);
	 	rs2 = (ResultSet)csmt.getObject(3);
	}
	catch(Exception e){
		e.printStackTrace();
	}
	
%>>

	<table cellpadding="0" cellspacing="0" width="650px" align="center" border="1">
		<tr>
			<td width="50" height="30" align="center">
				<input type="checkbox" name="" id="" />
			</td>
			<td width="50" height="30" align="center">
				글번호
			</td>	
			<td width="350" height="30" align="center">
				글제목
			</td>
			<td width="100" height="30" align="center">
				작성자
			</td>
			<td width="100" height="30" align="center">
				작성일
			</td>
		</tr>
		<%
			String strIDX = "";
			String strTITLE = "";
			String strUSERID = "";
			String strREGDATE = "";
			
			while(rs1.next()){
				
			strIDX = rs1.getString("IDX");
			strTITLE = rs1.getString("TITLE");
			strUSERID = rs1.getString("USERID");
			strREGDATE = rs1.getString("REGDATE");
		%>
		<tr>
			<td width="50" height="30" align="center">
				<input type="checkbox" name="" id="" />
			</td>
			<td width="50" height="30" align="center">
				<% out.println(strIDX); %>
			</td>	
			<td width="350" height="30">
				<a href="content.jsp?idx=<%=strIDX%>"><% out.println(strTITLE); %></a>
			</td>
			<td width="100" height="30" align="center">
				<% out.println(strUSERID); %>
			</td>
			<td width="100" height="30" align="center">
				<% out.println(strREGDATE); %>
			</td>
		</tr>
		<%
			}
		%>
		
		<tr>
			<td width="650px" colspan="5" height="30" align="right">
				<a href="./delete.jsp">삭제</a>
				<a href="./write.jsp">글쓰기</a>
			</td>
		</tr>
	</table>

</body>
</html>