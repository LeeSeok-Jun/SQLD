-- 2. rank function

-- ��. rank()
-- ��� �����Ϳ��� �޿��� ���� ������ job ���� �޿��� ���� ������ ���� ���
select job, ename, sal,
        rank() over (order by sal desc) all_rank,
        rank() over (partition by job order by sal desc) job_rank
from emp;

-- ���� �������� �������� salary ������ ���ϵ��� ����
select job, ename, sal,
        rank() over (partition by job order by sal desc) job_rank
from emp;

-- ��. dense_rank() : ������ ������ �ϳ��� �Ǽ��� ���
-- ��� �����Ϳ��� �޿��� ���� ������, ������ ������ �ϳ��� ����� ������ ����� ���� ���
select job, ename, sal,
        rank() over (order by sal desc) rank,               -- 4�� �� 2���� �� �� : 1 2 2 4
        dense_rank() over (order by sal desc) dense_rank    -- 4�� �� 2���� �� �� : 1 2 2 3
from emp;

-- ��. row_number() : ������ ���̶� ������ ���� �ο�
-- ��� �����Ϳ��� �޿��� ���� ������, ������ ������ �������� �ʴ� ����� ���� ���
select job, ename, sal,
        rank() over (order by sal desc) rank,
        row_number() over (order by sal desc) row_number    -- 4�� �� 2���� �� ���̴��� ���Ƿ� �� ���̿� ������ ����
from emp;

