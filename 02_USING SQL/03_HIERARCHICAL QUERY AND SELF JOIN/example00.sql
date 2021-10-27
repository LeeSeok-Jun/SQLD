-- 제 3절. 계층형 질의와 셀프 조인
-- 01. 계층형 질의
-- 동일 테이블에 계층적으로 상위와 하위 데이터가 포함된 데이터
-- 데이터를 순환관계 데이터 모델로 설계할 경우 발생

-- LEVEL : ROOT = 1, 하위 데이터면 ROOT부터 1씩 증가
-- CONNECT_BY_ISLEAF : 전개 과정에서 해당 데이터가 리프 데이터면 1, 그렇지 않으면 0
-- CONNECT_BY_ISCYCLE : 전개 과정에서 자식을 갖는데, 해당 데이터가 조상으로서 존재하면 1, 그렇지 않으면 0
--                      조상 : 자신으로부터 루트까지의 경로에 존재하는 데이터 (CYCLE 옵션 사용 시에만 가능)
SELECT LEVEL, LPAD(" ", 4 * (LEVEL-1)) || EMPNO 사원, MGR 관리자, CONNECT_BY_ITSELF ISLEAF
-- LAPD() : 들여쓰기 함수
FROM EMPNO
START WITH MGR IS NULL  -- 계층 구조 전개의 시작 위치 지정(ROOT DATA 지정)
CONNECT BY PRIOR EMPNO = MGR;   -- 자식 데이터 지정
-- PRIOR 자식 = 부모 : 계층구조에서 부모 데이터에서 자식 데이터로 순방향 전개
-- PRIOR 부모 = 자식 : 계층구조에서 자식 데이터에서 부모 데이터로 역방향 전개


-- 역방향 전개
SELECT LEVEL, LPAD(" ", 4 * (LEVEL-1)) || EMPNO 사원, MGR 관리자, CONNECT_BY_ITSELF ISLEAF
FROM EMPNO
START WITH EMPNO = '7876'
CONNECT BY PRIOR MGR = EMPNO;


