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
<title>Insert title here</title>
  
	<script>

		function modifyPage() {
			if (confirm("다른 사원의 정보를 수정하시겠습니까?")) {
				location.href="company_regist_confirm.jsp";
			} else {
				return false;
			}
		}
		
		function initPage() {
			if (confirm("첫 페이지로 돌아가시겠습니까?")) {
				location.href="company_regist.jsp";
			} else {
				return false;
			}
		}
	</script>

</head>
<body>
<%
	Connection conn = null;

	String url = "jdbc:mysql://localhost:3306/campusdb";
	String id = "root"; //MySQL에 접속을 위한 계정의 ID
	String pwd = "jinsang1027#"; //MySQL에 접속을 위한 계정의 암호
	Class.forName("com.mysql.jdbc.Driver");
	conn = DriverManager.getConnection(url, id, pwd);
%>
	<center>
	<h1>수정된 사원 정보</h1>
		<table border=1 bordercolor="blue">
			<tr style="text-align: center; background: rgb(111,167,235); color: white ;">
				<th>ComCode</th><th>Depart</th><th>EmpName</th>
			</tr>	
			<%
			
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			
			String sql = "SELECT * FROM company";
			pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				
				
				String ComCode = rs.getString("ComCode");
				String Depart = rs.getString("Depart");
				String EmpName = rs.getString("EmpName");
			%>
			<tr style="text-align:center;">
				<td><%=ComCode %></td>
				<td><%=Depart %></td>
				<td><%=EmpName %></td>
			</tr>
			<% 
			}
			%>	
		</table>	
	</center>
	<center>
		<tr>
			<td style="text-align: center;">
				<button class="button" onClick="return initPage()">초기화면</button>
			</td>
			<td style="text-align: center;">
				<button class="button" onClick="return modifyPage()">재입력</button>
		</tr>
		<script>
			session.removeAttribute("emp_name");
		</script>
	</center>		

</body>
</html>