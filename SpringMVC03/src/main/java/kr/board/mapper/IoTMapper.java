package kr.board.mapper;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import kr.board.entity.Iot;

@Mapper
public interface IoTMapper {
	
	@Select("SELECT * FROM IOT ORDER BY INDATE DESC LIMIT 1")
	// 오라클 - ROWNUM = 1
	public Iot loadIot();

	@Insert("INSERT INTO IOT(LED1, LED2, SERVO) VALUES(#{led1}, #{led2}, #{servo})")
	public void ledDo(Iot iot);

	@Insert("INSERT INTO IOT(LED1, LED2, SERVO) VALUES(#{led1}, #{led2}, #{servo})")
	public void servoDo(Iot iot);

}
