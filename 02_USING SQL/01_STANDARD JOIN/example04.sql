-- 07. CROSS JOIN
-- 일반 집합 연산자의 PRODUCT의 개념으로 테이블 간 JOIN 조건이 없는 경우 생길 수 있는 모든 데이터의 조합을 말함

-- 양쪽 집합의 M*N 건의 데이터 조합이 발생
-- ex. EMP 14건 DNAME이 4인 경우 14*4=56건의 데이터 조합이 출력된다.
SELECT ENAME, DANME
FROM EMP CROSS JOIN DEPT
ORDER BY ENAME;
