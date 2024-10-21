package kr.board.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.board.entity.Iot;
import kr.board.mapper.IoTMapper;

@Controller
// 일반컨트롤러 -> 비동기통신
public class IoTController {
	
	@Autowired
	private IoTMapper mapper;
	
	@RequestMapping("/")
	public String main() {
		return "main";
	}
	
	// IoT센서값 가져오기
	@RequestMapping("/loadIot")
	public @ResponseBody Iot loadIot() {
		return mapper.loadIot();	
	}
	
	// LED 제어하기
	@RequestMapping("/ledDo")
	public @ResponseBody void ledDo(@RequestParam("LED") String LED, 
									@RequestParam("POWER") String POWER) {
		// void, @RequestParam		
		//System.out.println(LED + "/" + POWER);
		
		// LED 값이 LED1이고 ON일때 IoT Table에 LED1 컬럼에 ON 값을 넣어줘야한다
		// 단, 기존 LED2의 값과 Servo의 값은 유지한 상태로		
		Iot iot = mapper.loadIot(); // 최신값 가져오기
		if(LED.equals("LED1")) {
			iot.setLed1(POWER); // 		
		}else if(LED.equals("LED2")) {
			iot.setLed2(POWER);
		}
		mapper.ledDo(iot);
	}
	
	// servo Motor 제어하기
	@RequestMapping("/servoDo")
	public @ResponseBody void servoDo(@RequestParam("servo") int servo) {
		// servo라는 이름으로 int
		System.out.println(servo);
		
		Iot iot = mapper.loadIot();
		iot.setServo(servo);
		mapper.servoDo(iot);
	
	}
	

	

}
