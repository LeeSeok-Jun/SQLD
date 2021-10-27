/*
  2. UPDATE
  - 정보를 수정해야 하는 경우
*/

-- PLAYER 테이블에 있는 모든 데이터의 BACK_NO를 99로 변경
UPDATE PLAYER SET BACK_NO = 99;

-- PLAYER 테이블에 있는 모든 데이터의 POSITION을 MF로 변경
UPDATE PLAYER SET POSITION = 'MF';

/*
  3. DELETE
  - 데이터를 삭제해야 하는 경우
*/

-- PLAYER 테이블의 데이터를 모두 삭제
DELETE FROM PLAYER;

