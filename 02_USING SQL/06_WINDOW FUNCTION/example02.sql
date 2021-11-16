-- 4. �׷� �� ���� �Լ�

-- ��. first_value() : sql server �������� �ʴ� �Լ��� ��Ƽ�Ǻ� �����쿡�� ���� ���� ���� ���� ����(=min)
-- �μ��� �������� ������ ���� ������� ����, ��Ƽ�� ������ ���� ���� ���� ���� ���
select deptno, ename, sal,
        first_value(ename) over (partition by deptno order by sal desc rows unbounded preceding) as dept_rich
        -- rows unbounded preceding : ���� ���� �������� ��Ƽ�� ���� ù ��° ������� ������ ����
from emp;

-- ���� ���� ���� first_value�� ó���ϱ� ���� order by ���� ���� �߰�
select deptno, ename, sal,
        first_value(ename) over (partition by deptno order by sal desc, ename asc rows unbounded preceding) as dept_rich
        -- �� ��° ������������ �̸��� �߰�
from emp;

-- ��. last_value()
-- �μ��� �������� ������ ���� �������� �����ϰ�, ��Ƽ�� ������ ���� �������� ���� ���� ���(=max)
select deptno, ename, sal,
        last_value(ename) over (partition by deptno order by sal desc rows between current row and unbounded following) as dept_poor
        -- rows between current row and unbounded following : ���� ���� �����ؼ� ��Ƽ�� ���� ������ ������� ������ ����
from emp;

-- ��. lag() : ��Ƽ�Ǻ� �����쿡�� ���� �� ��° ���� ���� ��������(sql server ���� X)
-- �������� �Ի����ڰ� ���� �������� �����ϰ�, ���κ��� �Ի����ڰ� �� �� �ռ� ����� �޿��� ������ �޿��� �Բ� ���
select ename, hiredate, sal,
        lag(sal) over (order by hiredate) as pre_sal
from emp
where job = 'SALESMAN';

-- lag(arg1, arg2, arg3)
select ename, hiredate, sal,
        lag(sal, 2, 0) over (order by hiredate) as prev_sal
        -- arg2 : n��° ���� ���� �������� ����
        -- arg3 : null ���� ������ ��� ó��
from emp
where job = 'SALESMAN';

-- ��. lead() : ��Ƽ�Ǻ� �����쿡�� ���� �� ��° ���� ���� ��������
-- �������� �Ի����ڰ� ���� �������� �����ϰ�, �ٷ� ������ ���ϻ� �η��� �Ի����ڸ� �Բ� ���
select ename, hiredate,
        lead(hiredate, 1) over (order by hiredate) as nexthired
from emp;
