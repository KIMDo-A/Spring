# 개발환경

- **전자정부표준프레임워크**
- **IDE**: Eclipse
- **Spring**: 5.0.1
- **JDK**: 11.0.5
- **MySQL**: 5.7.32
- **MyBatis**

---

# 게시판 주요 기능

1. 글목록(/boardList.do)
2. 글쓰기(/boardForm.do)
3. 글조회(/boardContent.do?idx={idx})
4. 글수정(//boardUpdateForm.do?idx={idx})
    - 상세화면에서 수정 버튼 클릭
    - 서버에서 해당 게시글의 정보를 가지고 수정 화면 출력
    - 제목, 내용 수정 입력 받아서 서버로 요청
    - 수정 처리 
5. 글삭제(//boardDelete.do?idx={idx})
6. 
