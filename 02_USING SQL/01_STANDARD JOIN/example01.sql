-- 04. NATURAL JOIN
-- 두 테이블 간의 동일한 이름을 갖는 모든 칼럼들에 대해  EQUI JOIN을 수행
-- NATURAL JOIN이 명시되면 USING, ON, WHERE 절에서 JOIN 조건 정의 불가능

-- EMP와 DEPT 테이블의 DEPTNO라는 공통 칼럼을 자동으로 인식
-- 데이터 유형이 같아야 하며, ALIAS나 테이블명과 같은 접두사 사용 불가능
SELECT DEPTNO, EMPNO, ENAME, DNAME
FROM EMP NATURAL JOIN DEPT;

-- (*) 사용 시 NATURAL JOIN이 되는 기준 칼럼이 최우선 출력
-- DEPTNO가 제일 먼저 출력
SELECT *
FROM EMP NATURAL JOIN DEPT;

-- INNER JOIN의 경우 첫 번째 테이블, 두 번째 테이블의 칼럼 순서대로 출력
SELECT *
FROM EMP INNER JOIN DEPT
ON EMP.DEPTNO = DEPT.DEPTNO;

