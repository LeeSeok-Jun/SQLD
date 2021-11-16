-- 5. �׷� �� ���� �Լ�

-- ��. ratio_to_report() : �ش� �÷��� ��ü ���� ���� ����� ǥ��
-- job�� SALESMAN�� ������� ������� ��ü �޿����� ������ �����ϴ� ������ ���
select ename, sal, round(ratio_to_report(sal) over (), 2) as ratio_to_report
from emp
where job = 'SALESMAN';

-- ��. precent_rank() : ��Ƽ�Ǻ� �����쿡�� ���� ���� ������ ���� 0, ���� �ʰ� ������ ���� 1(SQL server ���� X)
-- ���� �μ� �Ҽ� ������� ���տ��� ������ �޿��� ������ �� ��° ��ġ�뿡 �ִ��� 0 �� 1 ������ ������ ǥ��
select deptno, rname, sal,
        percent_rank() over (partition by deptno order by sal desc) as p_r
from emp;

-- ��. cume_dist() : ��Ƽ�Ǻ� �������� ��ü �Ǽ����� ���� �ຸ�� �۰ų� ���� �Ǽ��� ���� ����������� ���Ѵ�.
select deptno, ename, sal,
        cume_dist() over (partition by deptno order by sal desc) as cume_dist   -- ���� ������ �� ���� �Լ� ������� ����
from emp;

-- ��. ntile() : ��Ƽ�ų� ��ü �Ǽ��� argument ������ n ����� ���
-- ��ü ����� �޿��� ���� ������ �����ϰ�, �޿��� �������� 4���� �׷����� �з��Ѵ�.
select ename, sal, 
        ntile(4) over (order by sal desc) as quar_tile
from emp;