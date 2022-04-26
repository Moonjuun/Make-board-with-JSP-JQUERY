<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import = "java.sql.*" %>    
<% 
	/* out.println("<font color='red'>게시판 저장할거야</font>"); */
	// 1. Java request를 통해 값을 3개를 받는다. 작성자, 글제목, 본문
	String strUserID = request.getParameter("userID");
	String strTitle = request.getParameter("title");
	String strContent = request.getParameter("content");

	// 2. DB 연결
	String dbUrl = "jdbc:oracle:thin:@db202202180950_high?TNS_ADMIN=/Users/moonjunchoi/Public/Wallet_DB202202180950";
	String dbID = "Admin";
	String dbPass = "123Qweasdzxc";
	
	try{
		PreparedStatement psmt = null;
		String strSql = "";
		
		Class.forName("oracle.jdbc.driver.OracleDriver");
		// "oracle.jdbc.driver.OracleDriver"
		
		Connection dbCon = DriverManager.getConnection(dbUrl, dbID, dbPass);
		
		//IDX, 글번호랑 가져오자
		strSql = "SELECT NVL(MAX(IDX), 0) + 1 AS IDX FROM BOARDS";
		psmt = dbCon.prepareStatement(strSql);
		ResultSet rs = psmt.executeQuery();
		rs.next();
		
		String strIDX = rs.getString("IDX");
		
		rs.close();
		psmt = null;
		
		
		strSql = "INSERT INTO BOARDS(IDX, TITLE, CONTENT, USERID, REGNUM, REGDATE)";
		strSql += "VALUES(?,?,?,?,?, SYSDATE)";
		
		psmt = dbCon.prepareStatement(strSql);
		psmt.setString(1, strIDX);
		psmt.setString(2, strTitle);
		psmt.setString(3, strContent);
		psmt.setString(4, strUserID);
		psmt.setString(5, "1");
		
		psmt.executeUpdate();
		
		psmt.close();
		dbCon.close();
		
		response.sendRedirect("./list.jsp");
		}
		catch(SQLException e){
			e.printStackTrace();
		}
		catch(Exception e){
			e.printStackTrace();
		}
	
%>