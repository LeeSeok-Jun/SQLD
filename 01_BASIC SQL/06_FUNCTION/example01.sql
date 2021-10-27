-- 07. NULL 관련 함수

-- (1) NVL(exp1, exp2)
-- exp1이 NULL 이면 exp2의 값을 출력
SELECT PLAYER_NAME 선수명, POSITION, NVL(POSITION, '없음') 포지션
FROM PLAYER
WHERE TEAM_ID = 'K08';

-- (2) NULLIF(exp1, exp2)
-- exp1 == exp2 이면 null 아니면 exp1 반환
SELECT ENAME, EMPNO, MGR, NULLIF(MGR, 7698) AS NUIF
FROM EMP;

-- CASE로 표현한 경우
SELECT ENAME, EMPNO, MGR,
       CASE WHEN MGR = 7698 THEN NULL
       ELSE MGR
       END  NUIF
FROM EMP;

-- (3) COALESCE(exp1, exp2, ...)
-- 임의의 exp에서 NULL이 아닌 최초의 exp의 값을 나타낸다.
SELECT ENAME, COMM, SAL, COALESCE(COMM, SAL) AS COALESCE
FROM EMP;

-- 두 개의 중첩된 CASE로 표현 가능
SELECT ENAME, COMM, SAL,
       CASE WHEN COMM IS NOT NULL THEN COMM
       ELSE (CASE WHEN SAL IN NOT NULL THEN SAL
             ELSE NULL
             END)
       END COAL
FROM EMP;
