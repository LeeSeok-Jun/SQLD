-- 03. CUBE 함수
-- 결합 가능한 모든 값에 대하여 다차원 집계를 생성

-- STEP 5. CUBE 함수 이용
-- GROUPING COLUMN이 가질 수 있는 모든 경우의 수에 대하여 Subtotal을 생성(COLUMN이 N개면 2^N개 생성)
SELECT
    CASE GROUPING(DNAME) WHEN 1 THEN 'All Departments' ELSE DNAME END AS DNAME,
    CASE GROUPING(JOB) WHEN 1 THEN 'All Jobs'   ELSE JOB END AS JOB,
    COUNT(*) "Total Empl",
    SUM(SAL) "Total Sal"
FROM EMP, DEPT
WHERE DEPT.DEPTNO = EMP.DEPTNO
GROUP BY CUBE(DENAM, JOB);  -- 인수의 순서가 바뀌어도 결과는 동일
