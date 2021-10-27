-- 03. TOP N 쿼리

-- ROWNUM

-- WRONG EXAMPLE
-- 사원 테이블에서 급여가 높은 3명만 내림차순으로 출력하고자 하는데, 잘못 사용된 SQL의 예
SELECT ENAME, SAL
FROM EMP
WHERE ROWNUM < 4    -- 급여 순서에 상관없이 무작위로 추출된 3명에 한해서 급여를 내림차순으로 정렬한 결과
ORDER BY SAL DESC;

-- CORRECT EXAPLE
-- 인라인 뷰를 사용하여 데이터 정렬을 먼저 수행한 후 메인 쿼리에서 ROWNUM 조건을 사용해야 한다.
SELECT ENAME, SAL
FROM (SELECT ENAME, SAL
      FROM EMP
      ORDER BY SAL DESC)
WHERE ROWNUM <4;

-- SQL Server의 경우 TOP() 을 통해 별도의 인라인 뷰 없이 사용 가능