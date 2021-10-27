-- 06. CASE 표현

-- IF-THEN-ELSE 논리와 유사한 방식
-- IF SAL > 2000
-- THEN REVISED_SALARY = SAL
-- ELSE REVISED_SALARY = 2000
-- END-IF

-- SAL이 2000보다 크면 그대로 출력, 작으면 2000으로 출력
SELECT ENAME,
       CASE WHEN SAL > 2000 THEN SAL
            ELSE 2000
        END REVISED_SALARY
FROM EMP;

-- Oracle DECODE 함수
-- 부서 정보에서 부서 위치를 미국의 서부, 중부, 동부로 구분
SELECT LOC,
       CASE LOC
       WHEN 'NEW YORK' THEN 'EAST'
       WHEN 'BOSTON' THEN 'EAST'
       WHEN 'CHICAGO' THEN 'CENTER'
       WHEN 'DALLAS' THEN 'CENTER'
       ELSE 'ETC'
       END AS AREA
FROM DEPT;

-- 함수 중첩 사용
SELECT ENAME, SAL,
       CASE WHEN SAL >= 2000 THEN 1000
       ELSE (CASE WHEN SAL >= 1000 THEN 500
             END )
       END AS BONUS
FROM EMP;


