-- 04. SAVEPOINT

SAVEPOINT SVPT1;    -- 저장점 생성

INSERT INTO PLAYER (PLAYER_ID, PLAYER_NAME, POSITION, P_HEIGHT, P_WEIGHT, BACK_NO)
VALUES ('1995035', 'K02', '이운재', 'GK', 182, 82, 1);

ROLLBACK TO SVPT1;
