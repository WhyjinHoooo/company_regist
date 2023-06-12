<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<%@ include file="mydbcon.jsp" %>
<title>Insert title here</title>
</head>
<body>
	<%
		String EmpName_code = request.getParameter("target");
		PreparedStatement pstmt = null;
		String sql = "DELETE FROM company WHERE EmpName ='" + EmpName_code + "'";
		pstmt = conn.prepareStatement(sql);
		pstmt.executeUpdate();
		pstmt.close();
	%>
	
	<script>
		alert("<%=EmpName_code%>씨의 등록이 삭제되었습니다.");
		window.location.href="./company_regist_confirm.jsp";
	</script>
	
</body>
</html>