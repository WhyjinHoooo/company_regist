<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.SQLException"%>    

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>등록완료</title>
</head>
<body>
<%
	Connection conn = null;

	String url = "jdbc:mysql://localhost:3306/campusdb";
	String id = "root"; // MySQL에 접속을 위한 계정의 ID
	String pwd = "jinsang1027#"; // MySQL에 접속을 위한 계정의 암호
	Class.forName("com.mysql.jdbc.Driver");
	conn = DriverManager.getConnection(url, id, pwd);
	
	String ComCode = request.getParameter("depart");
	String EmpName = request.getParameter("emp_name");
	String Depart = "";
	//out.println("<script>alert('"+EmpName+"');</script>");
	if(ComCode != null){
		switch(ComCode){
			case "E100": 
				Depart = "경리부";
				break;
			case "E200":
				Depart = "인사과";
				break;
			case "E300":
				Depart = "총무부";
				break;
			case "E400":
				Depart = "영업1팀";
				break;
			case "E500":
				Depart = "영업2팀";
				break;
			case "E600":
				Depart = "홍보실";
				break;
			case "E700":
				Depart = "영업기획팀";
				break;
			case "E800":
				Depart = "영업지원팀";
				break;	
		}
	}
	
	String sql = "INSERT INTO company VALUES(?,?,?)";
	String sql2 = "SELECT * FROM company";
	
	PreparedStatement pstmt = conn.prepareStatement(sql);
	PreparedStatement pstmt2 = conn.prepareStatement(sql2);
	
	ResultSet rs = null;
	try{
		rs = pstmt2.executeQuery();
		
		while(rs.next()){
			String EmpName_confirm = rs.getString("EmpName");
			
			if(EmpName_confirm.equals(EmpName)){
				out.println("<script>alert('"+EmpName_confirm+"님은 이미 등록되었습니다.'); location.href='company_regist.jsp'</script>");
				
				conn.close();
				return;
			}
		}
	} catch(SQLException e){
		e.printStackTrace();
	} finally{
		if(rs != null){
			rs.close();
		}
	}
	
	try{
		session.setAttribute("emp_name", EmpName);
		
		pstmt.setString(1,ComCode);
		pstmt.setString(2,Depart);
		pstmt.setString(3,EmpName);
		
		
		pstmt.executeUpdate();
	} catch(SQLException e){
		e.printStackTrace();
	} finally{
		try{
			if(pstmt !=null && !pstmt.isClosed()){
				pstmt.close();
			}
		} catch(SQLException e){
			e.printStackTrace();
		}
	}
	
	conn.close();
%>
	<script>
		alert('등록되었습니다.');
		window.location.href='company_regist_confirm.jsp';
		//history.back();
	</script>


</body>
</html>