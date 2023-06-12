<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
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
			}else{
				return true;
			}
		}
		function Master(){
			var master_code = "MASTER";
			var user_input = prompt("코드를 입력해주세요"+"");
			if(master_code != user_input){
				alert("관리자 코드를 다시 입력하세요");
				return false;
			} else{
				alert("관리자 페이지로 이동합니다.");
				window.location.href='company_regist_confirm.jsp';
				return true;
			}
		}
	</script>
</head>
<body>
	<center>
		<h3>필수입력사항</h3>
	</center>
	
	<form name="registForm" action="company_regist_ok.jsp" method="get" onSubmit="return emptyCheck()">
	<table align="center">
		<tr class="input">
			<th>부서 선택: </th>
			<td><select name="depart">
					<option ></option>
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
			 	<input type="text" name="emp_name" id="emp_name">
			 </td>
		</tr>
		
		<tr>
			<td style="text-align: center;" colspan="2">
				<input type="submit" id="btn_submit" value="input">
			</td>
		</tr>
	</table>
	</form>
	<center>
		<tr>
			<button class="button" onClick="return Master()">master</button>
		</tr>
	</center>	
</body>
</html>