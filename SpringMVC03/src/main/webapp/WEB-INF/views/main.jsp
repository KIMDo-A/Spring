<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!--  추가함! 자동완성 사용하기 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
   href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script
   src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>

<body>
   <div class="container">
      <h2>AI School IoT</h2>
      <div class="panel panel-default">
         <div class="panel-heading">IoT List</div>
         <div class="panel-body">
            <table id="tlist" class="table table-bordered table-hover">
               <tr>
                  <td>LED1</td>
                  <td>
                     <button onclick="ledDo('LED1', 'ON')" id="btn1on" class="btn">ON</button>
                     <button onclick="ledDo('LED1', 'OFF')"id="btn1off" class="btn">OFF</button>
                  </td>
               </tr>
               <tr>
                  <td>LED2</td>
                  <td>
                     <button onclick="ledDo('LED2', 'ON')" id="btn2on" class="btn">ON</button>
                     <button onclick="ledDo('LED2', 'OFF')" id="btn2off" class="btn">OFF</button>
                  </td>
               </tr>
               <tr>
                  <td >Servo</td>
                  <td>
                     <input id="servo" type="number" class="form-control" style="width: 150px; float:left; margin :10px;">
                     &nbsp;&nbsp; 
                     <!-- 띄어쓰기 한칸 -->
                     <input type="range" id="servoRange" oninput="servoRange()" min="0" max="180" style="width:200px; float:left; margin-top:10px;">
                     <button onclick="servoDo()" type="button" class="btn">angle</button>
                  </td>
               </tr>
            </table>
         </div>
         <div class="panel-footer">사물지능 - 박병관</div>
      </div>
   </div>

   <script type="text/javascript">
   
   		loadIot(); // 프로그램 실행하자마자 실행되도록
   		function loadIot(){
   			$.ajax({
   			url : "loadIot",
   			type : "get",
   			dataType : "json",
   			success : makeView,
   			error : function(){alert("error...");}
   		});
   	}
   		
   		function servoRange(){
   			$("#servo").val($("#servoRange").val()); // 클릭했을 때 됌	
   		}
   		
   		
   		// DB에 있는 값 보여주기
   		function makeView(data){
   			console.log(data);
   			
   			// 모든태그에 btn-primary제거
   			$("#btn1on").removeClass("btn-primary");
   			$("#btn1off").removeClass("btn-primary");
   			$("#btn2on").removeClass("btn-primary");
   			$("#btn2off").removeClass("btn-primary");
 		
   			$("#servo").val(data.servo);
   			$("#servoRange").val(data.servo);
   	
   			if(data.led1 == "ON"){
   				$("#btn1on").addClass("btn-primary"); // 클래스 추가
   			}else{
   				$("#btn1off").addClass("btn-primary");
   			}
   			
   			if(data.led2 == "ON"){
   				$("#btn2on").addClass("btn-primary");
   			}else{
   				$("#btn2off").addClass("btn-primary");
   			}
   		}
   		
   		// LED
   		function ledDo(LED,POWER){
   			// LED : 1 or 2
   			// POWER : on or off
   			console.log("ledDo확인")
   			$.ajax({
   				url : "ledDo",
   				type : "get",
   				data : {"LED" : LED, "POWER" : POWER},
   				// LED라는 이름으로 위에서 받은 값을 보내줌
   				success : loadIot, //-> 콜백함수는 괄호X
   				error : function(){ alert("error...");}
   			})
   		}
   		
   		// SERVO
   		function servoDo() {
   		    console.log("servoDo클릭");
   		    // 매개변수 없어도 input태그 안에 있는 값 가져오기!
   		    var servoValue = $("#servo").val(); 
   		    console.log(servoValue);
   		    $.ajax({
   		        url: "servoDo", 
   		        type: "get",
   		        data: {"servo": servoValue }, 
   		     	success : loadIot,
   		     	error : function(){ alert("error...");}
   		    });
   		}

   </script>

</body>
</html>