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
	    <div class="panel-heading">Board List</div>
	    <div class="panel-body">
	    	<table class="table table-bordered table-hover">
	    		<thead>    		
		    		<tr class="info">
		    			<td>번호</td>
		    			<td>제목</td>
		    			<td>작성자</td>
		    			<td>작성일</td>
		    			<td>조회수</td>
		    		</tr>
	    		</thead>
	    		
	    		<tbody>    						
					<!-- forEach가 자바에서 사용하는 반복문 for(int i;)~와 같음 -->
					<!-- 반복문이 돌면서 item에 들어감, var라는 변수 만들기, 배열이 돌면서 값이 하나씩 꺼내지며 dto에 담김(6개의 데이터), 이제 담길때마다 값 꺼내오기$ {}, -->				
					<c:forEach var="dto" items="${list}" varStatus="status">
						<!-- varStatus : DB와 별개로 status를 사용! for문 돌면서 1부터 시작, index를 사용하면 0부터시작-->
						<tr>
							<!--<td>${dto.idx}</td>-->
							<td>${status.count}</td>
							
							<td>
							<!-- 게시글 클릭하면 상세보기 화면 넘어가기 -->
								<a href="boardContent.do?idx=${dto.idx}">${dto.title}</a>
								<!-- url안에 띄어쓰기 안넣기!!! idx는 고유값임! -->
							</td>
														
							<td>${dto.writer}</td>
							<td>${dto.indate}</td>
							<td>${dto.count}</td>
						</tr>							
					</c:forEach>
	    		    			    			
	    		</tbody>	    	
	    	</table>
	    	
	    	<!-- 페이지 이동 : a태그 -->
	    	<a href="boardInsertForm.do">
	    		<button class="btn btn-warning" >글쓰기</button>
	    	</a>  
	    	
	    	
	    </div>
	    	<div class="panel-footer">사물지능 - 박병관</div>
	  	</div>
	</div>

</body>
</html>