-- 04. SQL 연산자

-- (1) IN (list)
-- 팀 소속이 삼성 블루윙즈 혹은 전남 드래곤즈
SELECT PLAYER_NAME 선수이름, POSITION 포지션, BACK_NO 백넘버, P_HEIGHT 키 FROM PLAYER
WHERE TEAM_ID IN ('KO2', 'K07');

-- 다중 리스트를 이용한 IN 연산자
-- EMP 테이블에서 JOB이 MANAGER이면서 20번 부서에 속하거나, JOB이 CLERK이면서 30번 부서에 속하는 사원의 정보
SELECT ENAME, JOB, DEPTNO FROM EMP WHERE (JOB, DEPTNO) IN (('MANAGER', 20), ('CLERK', 30));

-- 다음과 같은 연산과는 다른 결과를 도출
SELECT ENAME, JOB, DEPTNO FROM EMP
WHERE JOB IN ('MANAGER', 'CLERK') AND DEPTNO IN (20, 30);

-- (2) LIKE 연산자
-- 일반적으로는 = 연산자와 동일
-- 와일드카드(%, _)와 조합하여 사용 가능
SELECT PLAYER_NAME 선수이름, POSITION 포지션, BACK_NO 백넘버, P_HEIGHT 키 FROM PLAYER
WHERE POSITION LIKE 'MF';

-- % : 0개 이상의 어떤 문자를 의미
-- _ : 1개 이상의 단일 문자를 의미

-- 성이 '장'씨 성을 가진 선수들의 정보를 조회
SELECT PLAYER_NAME 선수이름, POSITION 포지션, BACK_NO 백넘버, P_HEIGHT 키 FROM PLAYER
WHERE PLAYER_NAME LIKE '장%';

-- (3) BETWEEN a AND b
-- a 이상 b 이하의 범위의 값
SELECT PLAYER_NAME 선수이름, POSITION 포지션, BACK_NO 백넘버, P_HEIGHT 키 FROM PLAYER
WHERE P_HEIGHT BETWEEN 170 AND 180;

-- (4) IS NULL / IS NOT NULL
-- POSITION COLUMN의 값 중 NULL 값인지를 판단
SELECT PLAYER_NAME 선수이름, POSITION 포지션, TEAM_ID FROM PLAYER
WHERE POSITION IS NULL;