/*
  4. SELECT
  - 데이터를 조회하는 경우
*/

-- 조회하기 원하는 COLUMN 명을 SELECT 다음에 (,)로 구분하여 나열하고, FROM 다음에 해당 COLUMN이 존재하는 테이블을 입력하여 실행
SELECT PLAYER_ID, PLAYER_NAME, TEAM_ID, POSITION, P_HEIGHT, P_WEIGHT, BACK_NO FROM PLAYER;

-- DISTINCT
-- COLUMN 값의 종류를 출력
-- EX) GK, DF, MF, FW, NULL
SELECT DISTINCT POSITION FROM PLAYER;

-- WILDCARD
-- 모든 COLUMN 정보 확인하기 : *(애스터리스크)
SELECT * FROM PLAYER;

-- ALIAS
-- COLUMN명에 일종의 별명을 부여
-- AS 생략 가능, 공백이 포함된 별명일 경우 "" 사용
SELECT PLAYER_NAME AS "선수 명", POSITION AS 위치, P_HEIGHT AS 키, P_WEIGHT AS 몸무게 FROM PLAYER;

