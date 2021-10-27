-- 01. 단일 행 서브쿼리
-- 단일 행 비교 연산자(=, <, <=, >, >=, <>)와 함께 사용할 때는 서브쿼리의 결과 건수가 반드시 1건 이하

-- 정남일 선수가 소속된 팀의 선수들에 대한 정보를 표시하는 문제
SELECT PLAYER_NAME, POSITION, BACK_NO
FROM PLAYER
-- 서브쿼리
-- '정남일' 선수가 2명 이상일 경우 런타임 오류 발생
WHERE TEAM_ID = (SELECT TEAM_ID
                FROM PLAYER
                WHERE PLAYER_NAME = '정남일')
ORDER BY PLAYER_NAME;   -- ORDER BY 절은 오직 한 개만 사용 가능하다. (서브 쿼리에서 사용 불가능)

-- 선수들의 평균키를 알아내고 이 결과를 이용해 키가 평균 이하의 선수들의 정보를 출력
SELECT PLAYER_NAME, POSITION, BACK_NO
FROM PLAYER
-- 서브쿼리
WHERE P_HEIGHT <= ( SELECT AVG(P_HEIGHT) FROM PLAYER)
ORDER BY PLAYER_NAME;


