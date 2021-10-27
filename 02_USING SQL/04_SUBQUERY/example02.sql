-- 03. 다중 칼럼 서브쿼리
-- 서브쿼리의 결과로 여러 개의 칼럼이 반환되어 메인쿼리의 조건과 동시에 비교되는 것을 의미한다.

-- 소속팀별 키가 가장 작은 사람들의 정보를 출력
SELECT TEAM_ID, PLAYER_NAME, POSITION, BACK_NO, P_HEIGHT
FROM PLAYER
-- 반환 COLUMN이 2개 이므로 조건 절에 괄호를 사용해 서브쿼리 결과와 비교하는 COLUMN을 명시
WHERE (TEAM_ID, P_HEIGHT) IN (SELECT TEAM_ID, MIN(P_HEIGHT)
                                FROM PLAYER
                                GROUP BY TEAM_ID)
ORDER BY TEAM_ID, PLAYER_NAME;
