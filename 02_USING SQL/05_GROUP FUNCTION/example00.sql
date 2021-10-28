-- 02. ROLLUP �Լ�

-- STEP 1. �Ϲ����� GROUP BY �� ���
-- �μ���� �������� �������� ������� �޿� ���� ������ �Ϲ����� GROUP BY SQL ������ ����
SELECT DNAME, JOB, COUNT(*) "Total Empl", SUM(SAL) "Total Sal"
FROM EMP, DEPT
WHERE DEPT.DEPTNO = EMP.DEPTNO
GROUP BY DNAME, JOB;

-- STEP 1-2. GROUP BY + ORDER BY ���
-- �μ���, ������ ����
SELECT DNAME, JOB, COUNT(*) "Total Empl", SUM(SAL) "Total Sal"
FROM EMP, DEPT
WHERE DEPT.DEPTNO = EMP.DEPTNO
GROUP BY DNAME, JOB
ORDER BY DNAME, JOB;

-- STEP 2. ROLLUP �Լ� ���
-- ���� ������� 2���� GROUPING COLUMNS(DNAME, JOB)�� ���Ͽ� ������ ���� �߰� LEVEL�� ���谡 ����
-- L1 : GROUP BY ����� �����Ǵ� ǥ�� ����
-- L2 : DNAME �� ��� JOB�� SUBTOTAL
-- L3 : GRAND TOTAL
SELECT DNAME, JOB, COUNT(*) "Total Empl", SUM(SAL) "Total Sal"
FROM EMP, DEPT
WHERE DEPT.DEPTNO = EMP.DEPTNO
GROUP BY ROLLUP (DNAME, JOB);   -- �ش� �μ��� ������ �ٲ�� ����� �޶���

-- STEP 2-2. ROLLUP �Լ� + ORDER BY �� ���
SELECT DNAME, JOB, COUNT(*) "Total Empl", SUM(SAL) "Total Sal"
FROM EMP, DEPT
WHERE DEPT.DEPTNO = EMP.DEPTNO
GROUP BY ROLLUP (DNAME, JOB)
ORDER BY DNAME, JOB;

-- STEP 3. GROUPING �Լ� ���
-- ROLLUP�̳� CUBE �� ���ο� �׷� �Լ��� �����ϱ� ���� �Լ�
-- ���ο� �׷� �Լ��� ���� �Ұ谡 ���� ������� GROUPING(EXPR) = 1 ǥ��
-- �� ���� ������� 0�� ǥ��
SELECT DNAME, GROUPING(DNAME), JOB, GROUPING(JOB), COUNT(*) "Total Empl", SUM(SAL) "Total Sal"
FROM EMP, DEPT
WHERE DEPT.DEPTNO = EMP.DEPTNO
GROUP BY ROLLUP (DNAME, JOB)
ORDER BY DNAME, JOB;

-- STEP 4. GROUPING �Լ� + CASE ���
SELECT
    CASE GROUPING(DNAME) WHEN 1 THEN 'All Departments' ELSE DNAME END AS DNAME, -- ���� ���ڵ� ������ ���� �Լ�
    CASE GROUPING(JOB) WHEN 1 THEN 'All Jobs' ELSE JOB END AS JOB,
    COUNT(*) "Total Empl",
    SUM(SAL) "Total Sal"
FROM EMP, DEPT
WHERE DEPT.DEPTNO = EMP.DEPTNO
GROUP BY ROLLUP (DNAME, JOB);

-- STEP 4-2. ROLLUP �Լ� �Ϻ� ���
-- ROLLUP �Լ����� DNAME�� ������� ����
-- ALL DEPARTMENTS �� ���� ����� �̷����� �ʴ´�.
SELECT
    CASE GROUPING(DNAME) WHEN 1 THEN 'All Departments' ELSE DNAME END AS DNAME, -- ���� ���ڵ� ������ ���� �Լ�
    CASE GROUPING(JOB) WHEN 1 THEN 'All Jobs' ELSE JOB END AS JOB,
    COUNT(*) "Total Empl",
    SUM(SAL) "Total Sal"
FROM EMP, DEPT
WHERE DEPT.DEPTNO = EMP.DEPTNO
GROUP BY ROLLUP (JOB);

-- STEP 4-3. ROLLUP �Լ� ���� Į�� ���
-- JOB�� MGR�� �ϳ��� �������� �����ϰ�, �μ���, JOB & MGR�� ���� ROLLUP ����� ����Ѵ�.
SELECT DNAME, JOB, MGR, SUM(SAL) "Total Sal"
FROM EMP, DEPT
WHERE DEPT.DEPTNO = EMP.DEPTNO
GROUP BY ROLLUP (DNAME, (JOB, MGR));