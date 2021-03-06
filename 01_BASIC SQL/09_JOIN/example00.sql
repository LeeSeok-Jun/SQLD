-- 02. EQUI(등가) JOIN

-- 선수 테이블과 팀 테이블에서 선수 이름과 소속된 팀의 이름을 출력
-- (1) FROM 절에 (,) 사용
SELECT PLAYER.PLAYER_NAME, TEAM.TEAM_NAME
FROM PLAYER, TEAM                       -- JOIN
WHERE PLAYER.TEAM_ID = TEAM.TEAM_ID     -- JOIN 조건

-- (2) INNER JOIN 명령어 사용
SELECT PLAYER.PLAYER_NAME, TEAM.TEAM_NAME
FROM PLAYER INNER JOIN TEAM             -- JOIN
WHERE PLAYER.TEAM_ID = TEAM.TEAM_ID     -- JOIN 조건

-- (3) 선수 테이블과 팀 테이블을 JOIN하여 선수의 소속팀과 팀의 연고지를 출력
SELECT PLAYER.PLAYER_NAME, PLAYER.BACK_NO, PLAYER.TEAM_ID, TEAM.TEAM_NAME, TEAM.REGION_NAME
FROM PLAYER, TEAM
WHERE PLAYER.TEAM_ID = TEAM.TEAM_ID;

-- ALIAS를 사용하여 생산성 높이기
-- 위와 동일한 내용으로 테이블명에 ALIAS를 적용
SELECT P.PLAYER_NAME, P.BACK_NO, P.TEAM_ID, T.TEAM_NAME, T.REGION_NAME
FROM PLAYER P, TEAM T
WHERE P.TEAM_ID = T.TEAM_ID;


-- (4) WHERE 절에서 JOIN 조건 이외의 검색 조건에 대한 제한 조건을 덧붙여 사용
-- 포지션이 골키퍼인 선수만 이름과 등번호, 연고지, 팀명 출력
SELECT P.PLAYER_NAME, P.BACK_NO, T.REGION_NAME, T.TEAM_NAME
FROM PLAYER P, TEAM TEA
WHERE P.TEAM_ID = T.TEAM_ID AND P.POSITION = 'GK'
ORDER BY P.BACK_NO;