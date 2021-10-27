-- 05. 그 밖에 위치에서 사용하는 서브쿼리

-- 가. SELECT 절에 서브쿼리 사용하기
-- SCALAR SUBQUERY : 한 행(ROW), 한 칼럼(COLUMN)만을 반환하는 서브쿼리를 말한다.
-- 선수 정보와 해당 선수가 속한 팀의 평균 키를 함께 출력
-- ROUND() : 소수점 자리수 반올림 및 표기 함수
SELECT PLAYER_NAME, P_HEIGHT, ROUND( (SELECT AVG(P_HEIGHT)
                                        FROM PLAYER X
                                        WHERE X.TEAM_ID = P.TEAM_ID), 3)    -- 팀 평균키를 나타내는 스칼라 서브함수
FROM PLAYER

-- 나. FROM 절에 서브쿼리 사용하기
-- INLINE VIEW : FROM 절에서 선언되어 실행 시에 동적으로 생성된 테이블인 것처럼 사용 가능
--                  인라인 뷰의 칼럼은 SQL문을 자유롭게 참조가능
-- K-리그 선수들 중에서 포지션이 미드필더인 선수들의 소속팀명 및 선수 정보를 출력
SELECT T.TEAM_NAME, P.PLAYER_NAME, P.BACK_NO
FROM (SELECT TEAM_ID, PLAYER_NAME, BACK_NO
        FROM PLAYER
        WHERE POSITION = 'MF') P,
        TEAM T
WHERE P.TEAM_ID = T.TEAM_ID
ORDER BY P.PLAYER_NAME;

-- TOP-N 쿼리
-- 인라인 뷰에서는 ORDER BY 절을 사용할 수 있다.
-- 인라인 뷰에서 먼저 정렬을 수행하고 정렬된 결과 중에서 일부 데이터를 추출하는 것

SELECT PLAYER_NAME, POSITION, BACK_NO, P_HEIGHT
FROM (SELECT PLAYER_NAME, POSITION, BACK_NO, P_HEIGHT
        FROM PLAYER
        WHERE P_HEIGHT IS NOT NULL
        ORDER BY P_HEIGHT DESC)
WHERE ROWNUM <= 5;  -- Oracle

-- 다. HAVING 절에서 서브쿼리 사용하기
-- 평균 키가 삼성블루윙즈의 평균 키보다 작은 팀의 이름과 해당 팀의 평균키를 구하는 SQL문
SELECT P.TEAM_ID, T.TEAM_NAME, AVG(P.HEIGHT)
FROM PLAYER P, TEAM T
WHERE P.TEAM_ID = T.TEAM_ID
GROUP BY P.TEAM_ID, T.TEAM_NAME
HAVING AVG(P.P_HEIGHT) < (SELECT AVG(P_HEIGHT)
                            FROM PLAYER
                            WHERE TEAM_ID = 'K02');

-- 라. UPDATE문의 SET 절에서 사용하기
-- TEAM 테이블에 STADIUM_NAME 칼럼을 추가하기
ALTER TABLE ADD TEAM
ADD (E_TEAM_NAME VARCHAR)

-- STADIUM 테이블을 이용해서 TEAM 테이블의 STADIUM_NAME의 값을 변경
UPDATE TEAM A
SET A.E_TEAM_NAME = (SELECT X.STADIUM_NAME
                        FROM STADIUM X
                        WHERE X.STADIUM_ID = A.STADIUM_ID);

-- 마. INSERT문의 VALUE절에서 사용하기
-- PLAYER 테이블에 '홍길동'선수를 삽입하고자 한다. 이때 PLAYER_ID의 값을 현재 사용중인 PLAYER_ID에 1을 더한 값을 넣고자 한다.
INSERT INTO PLAYER(PLAYER_ID, PLAYER_NAME, TEAM_ID)
VALUES ((SELECT TO_CHAR(MAX(TO_NUMBER(PLAYER_ID)) + 1) FROM PLYAER), '홍길동', 'K06');