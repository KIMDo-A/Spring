package kr.board.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import kr.board.entity.Board;
import kr.board.mapper.BoardMapper;

//Controller : View 반환 return "main" => /WEB-INF/view/main.jsp ~~
//RestController : Model(데이터)반환 return "main" "main" 문자열 데이터 변환
@RestController
public class RestBoardController {
	
	@Autowired
	private BoardMapper mapper; // mapper 가져오기
	
	// 게시글 전체 조회
	@RequestMapping("/boardList.do")
	public ArrayList<Board> boardList(){
		return mapper.boardList();
	}
	
	// 게시글 상세 조회
	@RequestMapping("/boardContent.do")
		public Board boardContent(@RequestParam("idx") int idx) {
			return mapper.boardContent(idx);
		}
	
	
	// 서버에서 받는 곳 수정하기
	// @ReauestMapping : 예전에만 사용했음 (/a -> GET, POST) 구별이 힘듬! -> 어노테이션 자체로 구분 getMapping, postMapping
	// @RequestBody : 요청 바디에 실어진 데이터 꺼내올 때 => 가지고 온 데이터를 자바 객체로 변환
	
	@PutMapping("/boardUpdate.do")
	public String boardUpdate(@RequestBody Board b) {
		System.out.println(b); // 이 값으로 수정하기
		
		mapper.boardUpdate(b);
		return "done";
	}
	
	@DeleteMapping("/boardDelete.do/{idx}")
	public String boardDelete(@PathVariable("idx") int idx) {
	
		// 숫자 받아오는지 확인하기
		// System.out.println(idx);
		
		mapper.boardDelete(idx);
		return "done";
	
	}
	
	@PostMapping("/boardInsert.do")
	public String boardInsert(Board b) {
		
		//@ModelAttribute(생략가능)
		//System.out.println(b);
		mapper.boardInsert(b);
		return "gone";
		
	}
	
	
	
}
