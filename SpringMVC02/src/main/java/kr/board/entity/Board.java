package kr.board.entity;
// = DTO

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
//@da하고 자동완성 누르면 import, 오른쪽 outline이바뀜
@AllArgsConstructor
// 생성자 추가 함수 
@NoArgsConstructor
// 기본 생성자 함수 -> DTO안에는 기본생성자가 무조건 있어야함!
public class Board {
	
	private int idx; // 번호 
	private String title; // 제목
	private String content; // 내용
	private String writer; // 작성자
	private String indate; // 날짜
	private int count; // 조회수


}
