/*
  1. INSERT
  - 테이블에 데이터를 입력
*/

-- 첫 번째 유형, 데이터를 입력할 COLUMN을 정의하고 입력
-- 정의하지 않은 COLUMN은 NULL로 입력된다.
-- PK나 NOT NULL로 정의된 COLUMN은 반드시 정의해야 한다.

INSERT INTO PLAYER (PLAYER_ID, PLAYER_NAME, TEAM_ID, POSITION, P_HEIGHT, P_WEIGHT, BACK_NO)
VALUES ('2002007', '박지성', 'K07', 'MF', 178, 78, 7);

-- 두 번째 유형, 데이터를 입력할 COLUMN을 정의하지 않고 입력
-- 테이블에 정의된 COLUMN의 순서를 지켜 빠짐없이 데이터가 입력되어야 한다.
-- 미지의 값의 경우 '' 혹은 NULL로 명시적 표기를 해야 한다.

INSERT INTO PLAYER
VALUES ('2002010', '이청용', 'K07', '', 'BlueDragon', '2002', 'MF', '17', NULL, NULL, '1', 180, 69);
