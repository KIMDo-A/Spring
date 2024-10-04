package kr.board.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import kr.board.entity.Board;
import kr.board.mapper.BoardMapper;

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
	
	
}
