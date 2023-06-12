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
		function emptyCheck(){
			var ComCode = document.registForm.depart.value;
			var EmpName = document.registForm.emp_name.value;
		
			if( !ComCode || !EmpName){
				alert('모든 항목을 입력하세요.');
				return false;
			} else{
				return true;
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

	String emp_name = request.getParameter("target");	
	String ComCode = null;
	String Depart = null;
	
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	String sql = "SELECT * FROM company WHERE EmpName = '"+emp_name+"'";
	pstmt = conn.prepareStatement(sql);
	rs = pstmt.executeQuery();
	
	if(rs.next()){
		ComCode = rs.getString("ComCode");
		Depart = rs.getString("Depart");
	} else{
		
	}
%>
	<center>
	
	<form name="registForm" action="company_regist_update_ok.jsp" method="get" onSubmit="return emptyCheck()">
	<table align="center">
		<tr class="input">
			<th>부서 선택: </th>
			<td><select name="depart">
					<option value = <%= ComCode%>><%=Depart %></option>
					<option value="E100">경리부</option>
					<option value="E200">인사과</option>
					<option value="E300">총무부</option>
					<option value="E400">영업1팀</option>
					<option value="E500">영업2팀</option>
					<option value="E600">홍보실</option>
					<option value="E700">영업기획팀</option>
					<option value="E800">영업지원팀</option>
				</select>	
			</td>
		</tr>
		
		<tr class="input"><th>사원 이름: </th>
			 <td class="info_input">
			 	<input type="text" name="emp_name" id="emp_name" value=<%=emp_name %> >
			 </td>
		</tr>
		
		<tr>
			<td style="text-align: center;" colspan="2">
				<input type="submit" id="btn_submit" value="input">
			</td>
		</tr>
	</table>
	</form>
	
	</center>
</body>
</html>