-- 03. CUBE �Լ�
-- ���� ������ ��� ���� ���Ͽ� ������ ���踦 ����

-- STEP 5. CUBE �Լ� �̿�
-- GROUPING COLUMN�� ���� �� �ִ� ��� ����� ���� ���Ͽ� Subtotal�� ����(COLUMN�� N���� 2^N�� ����)
SELECT
    CASE GROUPING(DNAME) WHEN 1 THEN 'All Departments' ELSE DNAME END AS DNAME,
    CASE GROUPING(JOB) WHEN 1 THEN 'All Jobs'   ELSE JOB END AS JOB,
    COUNT(*) "Total Empl",
    SUM(SAL) "Total Sal"
FROM EMP, DEPT
WHERE DEPT.DEPTNO = EMP.DEPTNO
GROUP BY CUBE(DENAM, JOB);  -- �μ��� ������ �ٲ� ����� ����
