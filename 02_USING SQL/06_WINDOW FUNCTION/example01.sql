-- 3. sum function

-- 가. sum()
-- 사원들의 급여와 같은 매니저를 두고 있는 사원들의 salary 합을 구한다.
select mgr, ename, sal,
        sum(sal) over (partition by mgr) mgr_sum    -- 매니저별로 데이터를 파티션화
from emp;

-- over 절 내에 order by 절을 추가해 파티션 내 데이터를 정렬하고 이전 salary 데이터까지의 누적값 출력
select mgr, ename, sal,
        sum(sal) over (partition by mgr order by sal range unbounded preceding) as mgr_sum
from emp;

-- 나. max()
-- 사원들의 급여와 같은 매니저를 두고 있는 사원들의 salary 중 최댓값을 구한다.
select mgr, ename, sal,
        max(sal) over (partition by mgr) as mrg_max
from emp;

-- inline view를 이용해 파티션별 최댓값을 가진 행만 추출
select mgr, ename, sal
from (
    select mgr, ename, sal, max(sal) over (partition by mgr) as iv_max_sal
    from emp
)
where sal = iv_max_sal;

-- 다. min()
-- 사원들의 급여와 같은 매니저를 두고 있는 사원들의 입사일자를 기준으로 정렬하고, salary의 최솟값을 같이 구함
select mgr, ename, hiredate, sal,
        min(sal) over (partition by mgr order by hiredate) as mgr_min
from emp;

-- 라. avg()
-- emp 테이블에서 같은 매니저를 두고 있는 사원들의 평균 salary를 구하는데, 조건은 같은 매니저 내에서 자기 바로 앞의 사번과 바로 뒤의 사번인 직원만을 대상으로 한다.
select mgr, ename, hiredate, sal,
        round(avg(sal) over (partition by mgr order by hiredate rows between 1 preceding and 1 following)) as mgr_avg
        -- rows : 현재 행의 앞뒤 건수
        -- rows between 1 preceding and 1 following : 현재 행을 기준으로 파티션 내에서 앞의 한 건, 현재 행, 뒤의 한 건을 범위로 지정한다.
from emp;

-- 마. count()
-- 사원들을 급여 기준으로 정렬하고, 본인의 급여보다 50 이하가 적거나 150 이하로 많은 급여를 받는 인원수를 출력
select ename, sla,
        count(*) over (
            order by sal
            -- range : 현재 행의 데이터 값을 기준으로 앞뒤 데이터 값의 범위를 표시
            range between 50 preceding and 150 following
        ) as sim_cnt
from emp;