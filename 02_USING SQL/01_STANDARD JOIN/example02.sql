-- 05. USING 조건절
-- 같은 이름을 가진 칼럼들 중에서 원하는 칼럼에 대해서만 선택적으로 EQUI JOIN을 할 수 있다.

-- 세 개의 칼럼명이 모두 같은 EDPT와 DEPT_TEMP 테이블을 DEPTNO 칼럼을 이용한 INNER JOIN의 USING 조건절로 실행
-- JOIN 칼럼에 대해서는 ALIAS나 접두사를 사용할 수 없다.
SELECT *
FROM DEPT JOIN DEPT_TEMP
USING (DEPTNO);