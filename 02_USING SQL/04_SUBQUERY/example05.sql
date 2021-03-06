-- 06. 뷰(View)
-- 뷰는 실제 데이터를 가지고 있지 않다.

-- 뷰 생성
CREATE VIEW V_PLAYER_TEAM AS
SELECT P.PLAYER, P.POSITION, P.BACK_NO, P.TEAM_ID, T.TEAM_NAME
FROM PLAYER P, TEAM T
WHERE P.TEAM_ID = T.TEAM_ID;

-- 뷰는 기존의 다른 뷰를 참조해서 생성할 수 있다.
CREATE VIEW V_PLAYER_TEAM_FILTER AS
SELECT PLAYER_NAME, POSITION, BACK_NO, TEAM_NAME
FROM V_PLAYER_TEAM
WHERE POSITION IN ('GK', 'MF');

-- 뷰를 사용하기 위해서는 해당 뷰의 이름을 이용하면 된다.
SELECT PLAYER_NAME, POSITION, BACK_NO, TEAM_ID, TEAM_NAME
FROM V_PLAYER_TEAM
WHERE PLAYER_NAME LIEK '황%';

-- 뷰 제거
DROP VIEW V_PLAYER_TEAM;
DROP VIEW V_PLAYER_TEAM_FILTER;