-- 08. OUTER JOIN
-- JOIN 조건에서 동일한 값이 없는 행도 반환할 때 사용

-- (가) LEFT OUTER JOIN
-- STADIUM과 TEAM을 JOIN 하되 홈 팀이 없는 경기장의 정보도 같이 출력
SELECT STADIUM_NAME, STADIUM.STADIUM_ID, SEAT_COUNT, HOMETEAM_ID, TEAM_NAME
FROM STADIUM LEFT OUTER JOIN TEAM   -- STADIUM 테이블이 기준 테이블이 된다.
ON STADIUM.HOMETEAM_ID = TEAM.TEAM_ID
ORDER BY HOMETEAM_ID;

-- (나) RIGHT OUTER JOIN
SELECT E.ENAME, D.DEPTNO, D.DNAME, D.LOC
FROM EMP E RGIHT OUTER JOIN DEPT D  -- DEPT 테이블이 기준 테이블이 된다.
ON E.DEPTNO = D.DEPTNO;

-- (다) FULL OUTER JOIN
SELECT *
FROM DEPT FULL OUTER JOIN DEPT_TEMP
ON DEPT.DEPTNO = DEPT_TEMP.DEPTNO;

