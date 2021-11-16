-- 3. sum function

-- ��. sum()
-- ������� �޿��� ���� �Ŵ����� �ΰ� �ִ� ������� salary ���� ���Ѵ�.
select mgr, ename, sal,
        sum(sal) over (partition by mgr) mgr_sum    -- �Ŵ������� �����͸� ��Ƽ��ȭ
from emp;

-- over �� ���� order by ���� �߰��� ��Ƽ�� �� �����͸� �����ϰ� ���� salary �����ͱ����� ������ ���
select mgr, ename, sal,
        sum(sal) over (partition by mgr order by sal range unbounded preceding) as mgr_sum
from emp;

-- ��. max()
-- ������� �޿��� ���� �Ŵ����� �ΰ� �ִ� ������� salary �� �ִ��� ���Ѵ�.
select mgr, ename, sal,
        max(sal) over (partition by mgr) as mrg_max
from emp;

-- inline view�� �̿��� ��Ƽ�Ǻ� �ִ��� ���� �ุ ����
select mgr, ename, sal
from (
    select mgr, ename, sal, max(sal) over (partition by mgr) as iv_max_sal
    from emp
)
where sal = iv_max_sal;

-- ��. min()
-- ������� �޿��� ���� �Ŵ����� �ΰ� �ִ� ������� �Ի����ڸ� �������� �����ϰ�, salary�� �ּڰ��� ���� ����
select mgr, ename, hiredate, sal,
        min(sal) over (partition by mgr order by hiredate) as mgr_min
from emp;

-- ��. avg()
-- emp ���̺��� ���� �Ŵ����� �ΰ� �ִ� ������� ��� salary�� ���ϴµ�, ������ ���� �Ŵ��� ������ �ڱ� �ٷ� ���� ����� �ٷ� ���� ����� �������� ������� �Ѵ�.
select mgr, ename, hiredate, sal,
        round(avg(sal) over (partition by mgr order by hiredate rows between 1 preceding and 1 following)) as mgr_avg
        -- rows : ���� ���� �յ� �Ǽ�
        -- rows between 1 preceding and 1 following : ���� ���� �������� ��Ƽ�� ������ ���� �� ��, ���� ��, ���� �� ���� ������ �����Ѵ�.
from emp;

-- ��. count()
-- ������� �޿� �������� �����ϰ�, ������ �޿����� 50 ���ϰ� ���ų� 150 ���Ϸ� ���� �޿��� �޴� �ο����� ���
select ename, sla,
        count(*) over (
            order by sal
            -- range : ���� ���� ������ ���� �������� �յ� ������ ���� ������ ǥ��
            range between 50 preceding and 150 following
        ) as sim_cnt
from emp;