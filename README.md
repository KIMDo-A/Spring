# 개발환경

### 1. 개발환경
- **JDK**: 11.0.5  
- **IDE**: Eclipse  
- **Database**: MySQL Server 5.7.32  
- **Framework**: Spring 5.0.1  

### 2. Library or Framework
- **전자정부표준프레임워크**  
- **MyBatis**  
- **JSP**  
- **Lombok**

---

# 게시판 주요 기능

1. 글목록(/boardList.do)
2. 글쓰기(/boardForm.do)
3. 글조회(/boardContent.do?idx={idx})
4. 글수정(/boardUpdateForm.do/idx={idx})
    - 상세화면에서 수정 버튼 클릭
    - 서버에서 해당 게시글의 정보를 가지고 수정 화면 출력
    - 제목, 내용 수정 입력 받아서 서버로 요청
    - 수정 처리 
5. 글삭제(/boardDelete.do?idx={idx})
6. 파일(이미지)첨부하기

---

# 프로젝트
1. SpringMVC01 : @Controller를 이용한 게시판 구현 
2. SpringMVC02 : @RestController를 이용한 게시판 구현 
3. SpringMVC03 : 센서 데이터 기반 게시판 구현

