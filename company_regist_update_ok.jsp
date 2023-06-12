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
<title>Update Complete</title>
</head>
<body>
<%

	Connection conn = null;

	String url = "jdbc:mysql://localhost:3306/campusdb";
	String id = "root"; //MySQL에 접속을 위한 계정의 ID
	String pwd = "jinsang1027#"; //MySQL에 접속을 위한 계정의 암호
	Class.forName("com.mysql.jdbc.Driver");
	conn = DriverManager.getConnection(url, id, pwd);
	
	String emp_name = request.getParameter("emp_name");
	String ComCode = request.getParameter("depart");
	String Depart = "";
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
	
	//out.println("<script>alert('"+emp_name+"');</script>");
	//out.println("<script>alert('"+ComCode+"');</script>");
	//out.println("<script>alert('"+Depart+"');</script>");
	
	String sql="UPDATE company SET ComCode= '"+ComCode +"', Depart= '"+Depart+"' WHERE EmpName='"+emp_name+"' ";
	
	PreparedStatement pstmt = conn.prepareStatement(sql);
	
	try{
		pstmt.executeUpdate();
	} catch(SQLException e){
		e.printStackTrace();
	} finally{
		try{
			if(pstmt !=null && !pstmt.isClosed()){
				pstmt.close();
			}
		}catch(SQLException e){
			e.printStackTrace();
		}
	}
%>
	<script>
		alert('회원정보가 수정되었습니다.');
		window.location.href='company_regist_update_confirm.jsp';
	</script>

</body>
</html>