-- 02. 셀프 조인

-- 자신과 상위, 차상위 관리자를 같은 줄에 표시하라
-- INNER JOIN으로는 자신의 관리자가 존재하지 않는 경우 해당 데이터는 결과에서 누락
SELECT E1.EMPNO 사원, E1.MGR 관리자, E2.MGR 차상위_관리자
FROM EMP E1, EMP E2
WHERE E1.MGR = E2.EMPNO
ORDER BY E2.MGR DESC, E1.MGR, E1.EMPNO;

-- OUTER JOIN으로 구현
SELECT E1.EMPNO 사원, E1.MGR 관리자, E2.MGR 차상위_관리자
FROM EMP E1 LEFT OUTER JOIN EMP E2
WHERE E1.MGR = E2.EMPNO
ORDER BY E2.MGR DESC, E1.MGR, E1.EMPNO;
