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
	    	<!-- enctype : 기본값 - application/x-www-form-urlencoded -->
	    	<form action="boardInsert.do" method="post" enctype="multipart/form-data">   
		    	<table class="table table-bordered table-hover">
		    		<tr>
		    			<td>제목</td>
		    			<!-- input태그안에 name꼭적기 ="board.java"-->
		    			<td><input name="title" type="text" class="form-control"></td>		    		
		    		</tr>
		    		
		    		<tr>
		    			<td>내용</td>
		    			<td><textarea name="content" class="form-control" rows="7" cols=""></textarea></td>		    		
		    		</tr>
		    		
		    		<tr>
		    			<td>이미지</td>
		    			<td><input type="file" name="photo" class="form-control"></td>		    		
		    		</tr>
		    		
		    		
		    		<tr>
		    			<td>작성자</td>
		    			<td><input name="writer" type="text" class="form-control"></td>		    		
		    		</tr>
		    		
		    		<tr>
		    			<!-- 열병합 colspan, 정렬 align -->
		    			<td colspan="2" align="center">
		    				<!-- 목록으로 이동 -->
		    				<a href="boardList.do"><button type="button" class="btn btn-info">목록</button></a>	
		    				<!-- reset 초기화면으로 돌리겠다, 입력된 정보를 지움 -->	    				
		    				<button type="reset" class="btn btn-danger">취소</button>
		    				<!-- submit 특정주소로 제출하겠다 -->
		    				<button type="submit" class="btn btn-warning">작성</button>	    				
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