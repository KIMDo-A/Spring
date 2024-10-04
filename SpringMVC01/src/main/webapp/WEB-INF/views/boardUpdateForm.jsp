<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!--  추가함! 자동완성 사용하기 -->
<!-- 자바언어를 표준어처럼 사용하겠다! 자바코드를 태그처럼 사용하기 -->
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
 <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>

<body>
	<div class="container">
	  <h2>AI School Board</h2>
	  <div class="panel panel-default">
	    <div class="panel-heading">Board Insert</div>
	    <div class="panel-body">		  
	      
	    	<!-- 내가 입력한 데이터를 서버로 전달할때는 form태그 : 어디로 제출할 지 주소 입력하는 부분 -->
	    	<!-- action : 어디로 제출할지 주소를 입력하는 부분-->
	    	<!-- method : post방식 -->
	    	
	    	
	    	<!-- http://localhost:8081/controller/boardUpdateForm.do/4-->
	    	<!-- action="/" http://localhost:8081/controller/boardUpdate.do -->
	    	<form action="/controller/boardUpdate.do" method="post"> 
		    	<table class="table table-bordered table-hover">
		    		<!-- 이 게시물을 식별하기 위한 인덱스 번호는 사용자에게 필요없음 -> 사용자 눈에는 안보임! 
		    		form태그에 포함해서 서버로 전송할 수 있도록 만듬! 무조건 input태그에 작성 -->
		    		<input type="hidden" name="idx" value="${dto.idx}">
		    		<tr>
		    			<td>제목</td>
		    			<!-- input태그안에 name꼭적기 ="board.java"-->
		    			<td><input name="title" type="text" value="${dto.title}" class="form-control"></td>		    		
		    		</tr>
		    		
		    		<tr>
		    			<td>내용</td>
		    			<td><textarea name="content" class="form-control" rows="7" cols="">${dto.content}</textarea></td>		    		
		    		</tr>
		    		
		    		<tr>
		    			<td>작성자</td>
		    			<td><input name="writer" value="${dto.writer}" type="text" class="form-control" readonly></td>		    		
		    		</tr>
		    		
		    		<tr>
		    			<!-- 열병합 colspan, 정렬 align -->
		    			<td colspan="2" align="center">
		    				<!-- 목록으로 이동 -->
		    				<a href="/controller/boardList.do"><button type="button" class="btn btn-info">목록</button></a>	
		    				<!-- reset 초기화면으로 돌리겠다, 입력된 정보를 지움 -->	    				
		    				<button type="reset" class="btn btn-danger">취소</button>
		    				<!-- submit 특정주소로 제출하겠다 -->
		    				<button type="submit" class="btn btn-warning">수정</button>	    				
		    			</td>
		    		</tr>	    		
		    	</table>
	    	</form>  
	    
	    </div>
	    	<div class="panel-footer">사물지능 - 박병관</div>
	  	</div>
	</div>

</body>
</html>