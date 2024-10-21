package kr.board.entity;

import lombok.Data;

@Data
public class Iot {
	
	private String led1; // ON OFF가 들어가있음
	private String led2;
	private int servo;
	private String indate;
}
