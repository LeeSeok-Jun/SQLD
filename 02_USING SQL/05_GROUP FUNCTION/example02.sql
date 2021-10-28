-- 04. GROUPING SETS �Լ�

-- �Ϲ� �׷��Լ��� �̿��� SQL
-- �Ϲ� �׷��Լ��� �̿��Ͽ� �μ���, JOB�� �ο����� �޿� ���� ���϶�.
SELECT DNAME, 'All Jobs' JOB, COUNT(*) "Total Empl", SUM(SAL) "Total Sal"
FROM EMP, DEPT
WHERE DEPT.DEPTNO = EMP.DEPTNO
GROUP BY DNAME
UNION ALL
SELECT 'All Departments' DNAME, JOB, COUNT(*) "Total Empl", SUM(SAL) "Total Sal"
FROM EMP, DEPT
WHERE DEPT.DEPTNO = EMP.DEPTNO
GROUP BY JOB;

-- GROUPING SETS ��� SQL
-- �Ϲ� �׷��Լ��� GROUPING SETS �Լ��� �����Ͽ� �μ���, JOB�� �ο����� �޿� ���� ���϶�
SELECT 
    DECODE(GROUPING(DNAME), 1, 'All Departments', DNAME) AS DNAME
    DECODE(GROUPING(JOB), 1, 'All Jobs', JOB) AS JOB,
    COUNT(*) "Total Empl", SUM(SAL) "Total Sal"
FROM EMP, DEPT
WHERE DEPT.DEPTNO = EMP.DEPTNO
GROUP BY GROUPING SETS (DNAME, JOB);    -- �ش� �μ��� ������ �ٲ� ����� ����

-- 3���� �μ��� �̿��� GROUPING SETS �̿�
SELECT DNAME, JOB, MGR, SUM(SAL) "Total Sal"
FROM EMP, DEPT
WHERE DEPT.DEPTNO = EMP.DEPTNO
GROUP BY GROUPING SETS
    ((DNAME, JOB, MGR), (DNAME, JOB), (JOB, MGR));
