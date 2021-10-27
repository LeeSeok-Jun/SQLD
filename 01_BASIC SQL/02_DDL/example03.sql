/*
  4. RANAME TABLE
  테이블 이름 변경
*/

-- Oracle
RANAME TEAM TO TEAM_BACKUP;

RENAME TEAM_BACKUP TO TEAM;

/*
  5. DROP TABLE
  테이블 자체 삭제
*/

DROP TALBE PLAYER; -- 실행 이후 테이블의 구조 확인 불가능

/*
  6. TRUNCATE TABLE
  테이블에 들어있던 모든 행들을 제거하고 저장 공간을 재사용 가능하도록 해제
*/

TRUNCATE TABLE TEAM; -- 실행 이후에도 테이블의 구조 확인 가능