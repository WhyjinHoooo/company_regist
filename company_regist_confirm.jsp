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
		function EmpName_delete(id) {
			if (confirm(id + "을(를) 삭제하시겠습니까?") == true) {
				location.href="company_regist_delete.jsp?target=" + id;
			} else {
				return false;
			}
		}
		
		function EmpName_update(id) {
			if (confirm(id + "의 정보를 변경하시겠습니까?") == true) {
				location.href="company_regist_update.jsp?target=" + id;
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
	<h1>등록된 사원 정보</h1>
		<table border=1 bordercolor="blue">
			<tr style="text-align: center; background: rgb(111,167,235); color: white ;">
				<th>ComCode</th><th>Depart</th><th>EmpName</th><th>Delete</th><th>Update</th>
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
				<td><button id = <%=EmpName %> onClick = "EmpName_delete(this.id);">Delete</button></td>
				<td><button id = <%=EmpName %> onClick = "EmpName_update(this.id);">Update</button></td>
			</tr>
			<% 
			}
			%>	
		</table>	
	</center>
<!--  
	<center>
	<table>
		<tr><td style="text-align: center;"><form action="company_regist.jsp" method="get" name="regist_back" id="regist_back" size="20">
			<input type="submit" value="재입력">
		</form></td></tr>
	</table>
	</center>
-->		
</body>
</html>