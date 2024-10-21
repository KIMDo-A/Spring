package kr.board.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import kr.board.entity.Board;

// sql쓰는곳
// 인터페이스는 하나의 틀, 규격임
@Mapper
public interface BoardMapper {
	
	// 게시글 전체 조회
	// 그 하나의 게시글은 6개의 정보가 Board 데이터 타입으로 묶여진 ArrayList!
	@Select("SELECT * FROM BOARD")
	public ArrayList<Board> boardList();

	@Insert("INSERT INTO BOARD(TITLE, CONTENT, WRITER) VALUES(#{title}, #{content}, #{writer})")
	// 물음표가 아니라 참조해서 넣어줌 #{}
	public void boardInsert(Board dto);
	//     int : 삽입된 행의 갯수 정상 동작 => 1 이상의 값이 리턴 / 실패 => 0
	
	// 특정 게시글 조회
	@Select("SELECT * FROM BOARD WHERE IDX = #{idx}")
	public Board boardContent(int idx);
	// 아래 매개변수가 소문자 이므로 위에도 소문자임!

	@Delete("DELETE FROM BOARD WHERE IDX = #{idx}")
	public void boardDelete(int idx);
	
	@Update("UPDATE BOARD SET TITLE=#{title}, CONTENT=#{content} WHERE IDX = #{idx}")
	public void boardUpdate(Board dto);
	// 결과값이 없으므로 void
	// dto안에 title, context, idx가 있음!
	
	
	
	// 특정 게시물만 조회수 -> idx값 식별
	// boardContent에서 idx값 어차피 넘어옴
	// 현재조회수에서 1만 증가
	// 현재 가지고 있는 컬럼에서 1 증가해서 다시 저장
	@Update("UPDATE BOARD SET COUNT=COUNT+1 WHERE IDX = #{idx}")
	public void boardCountUpdate(int idx);
	// 넘어온 idx

	
}

