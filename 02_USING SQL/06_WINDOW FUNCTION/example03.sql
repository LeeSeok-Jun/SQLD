-- 5. 그룹 내 비율 함수

-- 가. ratio_to_report() : 해당 컬럼을 전체 더한 값의 백분위 표시
-- job이 SALESMAN인 사원들을 대상으로 전체 급여에서 본인이 차지하는 비율을 출력
select ename, sal, round(ratio_to_report(sal) over (), 2) as ratio_to_report
from emp
where job = 'SALESMAN';

-- 나. precent_rank() : 파티션별 윈도우에서 제일 먼저 나오는 것을 0, 제일 늦게 나오는 것을 1(SQL server 지원 X)
-- 같은 부서 소속 사원들의 집합에서 본인의 급여가 순서상 몇 번째 위치쯤에 있는지 0 과 1 사이의 값으로 표현
select deptno, rname, sal,
        percent_rank() over (partition by deptno order by sal desc) as p_r
from emp;

-- 다. cume_dist() : 파티션별 윈도우의 전체 건수에서 현재 행보다 작거나 같은 건수에 대한 누적백분율을 구한다.
select deptno, ename, sal,
        cume_dist() over (partition by deptno order by sal desc) as cume_dist   -- 동일 순서면 뒤 행의 함수 결과값을 기준
from emp;

-- 라. ntile() : 파티셔녈 전체 건수를 argument 값으로 n 등분한 결과
-- 전체 사원을 급여갸 높은 순서로 정렬하고, 급여를 기준으로 4개의 그룹으로 분류한다.
select ename, sal, 
        ntile(4) over (order by sal desc) as quar_tile
from emp;