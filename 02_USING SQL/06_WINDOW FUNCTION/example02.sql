-- 4. 그룹 내 순서 함수

-- 가. first_value() : sql server 지원하지 않는 함수로 파티션별 윈도우에서 가장 먼저 나온 값을 구함(=min)
-- 부서별 직원들을 연봉이 높은 순서대로 정렬, 파티션 내에서 가장 먼저 나온 값을 출력
select deptno, ename, sal,
        first_value(ename) over (partition by deptno order by sal desc rows unbounded preceding) as dept_rich
        -- rows unbounded preceding : 현재 행을 기준으로 파티션 내의 첫 번째 행까지의 범위를 지정
from emp;

-- 같은 값을 가진 first_value를 처리하기 위해 order by 정렬 조건 추가
select deptno, ename, sal,
        first_value(ename) over (partition by deptno order by sal desc, ename asc rows unbounded preceding) as dept_rich
        -- 두 번째 정렬조건으로 이름을 추가
from emp;

-- 나. last_value()
-- 부서별 직원들을 연봉이 높은 순서부터 정렬하고, 파티션 내에서 가장 마지막에 나온 값을 출력(=max)
select deptno, ename, sal,
        last_value(ename) over (partition by deptno order by sal desc rows between current row and unbounded following) as dept_poor
        -- rows between current row and unbounded following : 현재 행을 포함해서 파티션 내의 마지막 행까지의 범위를 지정
from emp;

-- 다. lag() : 파티션별 윈도우에서 이전 몇 번째 행의 값을 가져오기(sql server 지원 X)
-- 직원들을 입사일자가 빠른 기준으로 정렬하고, 본인보다 입사일자가 한 명 앞선 사원의 급여를 본인의 급여와 함께 출력
select ename, hiredate, sal,
        lag(sal) over (order by hiredate) as pre_sal
from emp
where job = 'SALESMAN';

-- lag(arg1, arg2, arg3)
select ename, hiredate, sal,
        lag(sal, 2, 0) over (order by hiredate) as prev_sal
        -- arg2 : n번째 앞의 행을 가져올지 결정
        -- arg3 : null 값이 들어오는 경우 처리
from emp
where job = 'SALESMAN';

-- 라. lead() : 파티션별 윈도우에서 이후 몇 번째 행의 값을 가져오기
-- 직원들을 입사일자가 빠른 기준으로 정렬하고, 바로 다음에 입하산 인력의 입사일자를 함께 출력
select ename, hiredate,
        lead(hiredate, 1) over (order by hiredate) as nexthired
from emp;
