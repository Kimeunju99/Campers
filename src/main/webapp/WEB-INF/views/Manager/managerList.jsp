<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div align="center">
		<div>
			<h1>회원 목록</h1>
		</div>
		<div>
			<form id="frm" method="post">
				<label>검색할 항목 선택 : </label> <select id="key" name="key">
					<option value="all">전체</option>
					<option value="userId">아이디</option>
					<option value="userEmail">이메일</option>
					<option value="userName">이름</option>
					<option value="userTel">전화번호</option>
					<option value="userAddr">주소</option>
					<option value="userAuth">권한</option>
				</select> <input type="text" id="val" name="val">
				<button type="button" onclick="managerSearch()">검색</button>
			</form>
		</div>
		<div>
			<table border="1">
				<thead>
					<tr>
						<th width="200">아이디</th>
						<th width="200">이메일</th>
						<th width="200">이름</th>
						<th width="200">전화번호</th>
						<th width="200">주소</th>
						<th width="200">권한</th>
						<th width="200">계정상태</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${list }" var="l">
						<tr>
							<td align="center">${l.userId }</td>
							<td align="center">${l.userEmail }</td>
							<td align="center"><a href="managerInfoControl.do?id=${l.userId}">${l.userName }</a></td>
							<td align="center">${l.userTel }</td>
							<td>${l.userAddr }</td>
							<td align="center">${l.userAuth }</td>
							<td align="center">${l.userActivation }</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		<script type="text/javascript">
		
	    function managerSearch(){
	        let key = document.getElementById("key").value;
	        let val = document.getElementById("val").value;
	        let payload = "key="+key+"&val="+val;
	        let url = "ajaxManagerSearchList.do";
	        fetch(url, {
	            method: "POST",
	            headers: {
	                'Content-Type' : 'application/x-www-form-urlencoded'
	            	},
	            body: payload
	        }).then(response => response.json())
	          .then(json => viewHtml(json));
	    }
	    
	    function viewHtml(datas){
	        document.querySelector('tbody').remove();
	        const tbody = document.createElement('tbody');
	        tbody.innerHTML = datas.map(data => htmlConvert(data)).join('');
	        document.querySelector('table').appendChild(tbody);
	    }
	    
	    function htmlConvert(data){
			let t = (data.userAddr == null)? '' : data.userAddr;
// 			return `
// 				<tr>
// 					<td align="center">\${l.userId }</td>
// 					<td align="center">\${l.userEmail }</td>
// 					<td align="center">\${l.userName }</td>
// 					<td align="center">\${l.userTel }</td>
// 					<td>\${t }</td>
// 					<td align="center">\${l.userAuth }</td>
// 				</tr>
// 			`;
// 	    }
	    
	        let str = '<tr>';
	            str +='<td align="center">' + data.userId + '</td>';
	            str +='<td align="center">' + data.userEmail + '</td>';
	            str +='<td align="center"><a href="managerInfoControl.do?id="' + data.userId + '>' + data.userName + '</a></td>';
	            str +='<td align="center">' + data.userTel + '</td>';
	            str +='<td>' + t + '</td>';
	            str +='<td align="center">' + data.userAuth;
	            str +='</td></tr>'
	            return str;
	    }


</script>
	</div>
</body>
</html>