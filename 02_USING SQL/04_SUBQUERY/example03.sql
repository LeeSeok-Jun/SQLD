-- 04. 연관 서브쿼리
-- 서브쿼리 내에 메인쿼리 칼럼이 사용된 서브쿼리를 의미

-- 선수 사신이 속한 팀의 평균 키보다 작은 K-리그 소속 선수들의 정보를 출력
SELECT T.TEAM_NAME, M.PLAYER_NAME, M.POSITION, M.BACK_NO, M.P_HEIGHT
FROM PLAYER M, TEAM T
WHERE M.TEAM_D < (SELECT AVG(S.P_HEIGHT)
                    FROM PLAYER S
                    -- 서브쿼리에 메인쿼리의 칼럼인 M_TEAM_ID 사용
                    WHERE S.TEAM_ID = M.TEAM_ID AND S.P_HEIGHT IS NOT NULL
                    GROUP BY S.TEAM_ID)
ORDER BY M.PLAYER_NAME;

-- EXSIST 서브쿼리는 항상 연관 서브쿼리로 사용된다.
-- 아무리 조건을 만족하는 건이 여러 건이더라도 조건을 만족하는 1건만 찾으면 추가적인 검색을 진행하지 않는다.
-- 20210502부터 20210503 사이에 경기가 있는 경기장을 조회
SELECT STADIUM_ID, STADIUM_NAME
FROM STADIUM A
WHERE EXSIST (SELECT 1
                FROM SCHEDULE X
                WHERE X.STADIUM_ID = A.STADIUM_ID AND X.SCHE_DATE BETWEEN '20120501' AND '20120502');