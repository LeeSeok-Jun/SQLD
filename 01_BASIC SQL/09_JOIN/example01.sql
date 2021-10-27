-- 03. Non EQUI JOIN
-- Page 290~292

-- 사원의 급여등급을 출력
-- 사원 테이블과 급여등급 테이블은 PK-FK 관계가 아니므로 WHERE절에서 =를 통한 JOIN을 할 수 없다.
SELECT E.ENAME 사원명, E.SAL 급여, S.GRADE 급여등급
FROM EMP P, SALGRADE S
WHERE E.SAL BETWEEN S.LOSAL AND S.HISAL;