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
	    <div class="panel-heading">Board List2222</div>
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
	    		
	    		<tbody id="view" >						
					    		    			    			
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
	
	<script type="text/javascript">
	
		loadList();
	
		function loadList(){
			// 서버와의 비동기통신
			$.ajax({
				url : "boardList.do", // 요청 url
				type : "get", // 요청방식
				dataType : "json", // 받아올 데이터 타입
				success : makeView, // 통신 성공 -> Call Back : 요청하고 나중에 실행되는 함수
				error : function(){ alert("error..."); } // 이름이 없는 함수 익명함수
			});
		}
		
		function makeView(data){
			console.log(data);
			
			let listHtml = "";
			
			for(let i = 0; i < data.length; i++){
				//console.log(data[i]);
				//console.log(data[i].title);
				listHtml += "<tr>";
				listHtml += "<td>" + ( i + 1 ) + "</td>";
				listHtml += "<td>";
				listHtml += "<a href='javascript:goContent("+data[i].idx+")'>";
				listHtml += data[i].title + "</a></td>";
				listHtml += "<td>" + data[i].writer + "</td>"
				listHtml += "<td>" + data[i].indate + "</td>"
				listHtml += "<td>" + data[i].count + "</td>"
				listHtml += "</tr>";	
				
				listHtml += "<tr id='c"+data[i].idx+"' style='display:none;'>";
				// 안보임 -> 제목을 클릭했을때 해당내용만 나오게 하기
				listHtml += "<td>내용</td>";
				listHtml += "<td colspan='4'>";
				listHtml += "<textarea id='ta"+data[i].idx+"' readonly rows='7' class='form-control'></textarea>";
				listHtml += "</td>";
				listHtml += "</tr>";
			}
			$("#view").html(listHtml);
			// view요소 선택하겠다
			//.html : html로 인식
		}
		
		function goContent(idx){
			
			if($("#c"+idx).css("display") == "none"){		
				
				$.ajax({
					url : "boardContent.do",
					type : "get",
					data : {"idx" : idx},
					// 데이터 보냄 매개변수 안 idx
					dataType : "json",
					success : function(data){ // 콜백함수 말고 바로 작동
						// idx받아와서 특정게시물보내야함
						console.log(data);
					$("#ta"+idx).val(data.content)
					// input태그 함수 val
					},
					error : function(){ alert("error..."); }				
				});
				
				$("#c"+idx).css("display", "table-row");
				// display -> tr태그	
			}else{
				$("#c"+idx).css("display", "none");
			}			
		}
	
	</script>

</body>
</html>