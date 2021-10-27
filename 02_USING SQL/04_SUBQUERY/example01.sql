-- 02. 다중 행 서브쿼리
-- 서브쿼리의 결과가 2건 이상 반환될 수 있다면 반드시 다중 행 비교 연산자(IN, ALL, ANY, SOME)과 함께 사용해야 한다.

-- '정현수' 선수가 소속되어 있는 팀 정보를 출력
SELECT REGION_NAME, TEAM_NAME, E_TEAM_NAME
FROM TEAM
-- 서브쿼리
-- '정현수'선수는 동명이인이 있어서 2건 이상 검색될 수 있으므로 다중 행 비교 연산자를 사용
WHERE TEAM_ID IN (SELECT TEAM_ID
                    FROM PLAYER
                    WHERE PLAYER_NAME = '정현수')
ORDER BY TEAM_NAME;