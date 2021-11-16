-- 2. rank function

-- 가. rank()
-- 사원 데이터에서 급여가 높은 순서와 job 별로 급여가 높은 순서를 같이 출력
select job, ename, sal,
        rank() over (order by sal desc) all_rank,
        rank() over (partition by job order by sal desc) job_rank
from emp;

-- 위의 문제에서 업무별로 salary 순서를 구하도록 변경
select job, ename, sal,
        rank() over (partition by job order by sal desc) job_rank
from emp;

-- 나. dense_rank() : 동일한 순위를 하나의 건수로 취급
-- 사원 데이터에서 급여가 높은 순서와, 동일한 순위를 하나의 등수로 간주한 결과를 같이 출력
select job, ename, sal,
        rank() over (order by sal desc) rank,               -- 4명 중 2등이 두 명 : 1 2 2 4
        dense_rank() over (order by sal desc) dense_rank    -- 4명 중 2등이 두 명 : 1 2 2 3
from emp;

-- 다. row_number() : 동일한 값이라도 고유한 순위 부여
-- 사원 데이터에서 급여가 높은 순서와, 동일한 순위를 인정하지 않는 등수도 같이 출력
select job, ename, sal,
        rank() over (order by sal desc) rank,
        row_number() over (order by sal desc) row_number    -- 4명 중 2등이 두 명이더라도 임의로 둘 사이에 순위를 정함
from emp;

