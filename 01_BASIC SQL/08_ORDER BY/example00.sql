-- 01. ORDER BY 정렬

-- PLAYER 테이블에서 PLAYER_NAME을 기준으로 내림차순으로 정렬
-- ASC(Ascending) : 오름차순으로 정렬(Default)
-- DESC(Descending) : 내림차순으로 정렬
SELECT PLAYER_NAME 선수명, POSITION 포지션, BACK_NO 백넘버
FROM PLAYER
ORDER BY PLAYER_NAME DESC;

-- PLAYER 테이블에서 POSITION의 ALIAS를 이용하여 내림차순으로 정렬
-- Oracle에서는 NULL 값이 가장 큰 값으로 인식되어 내림차순 시 제일 먼저 출력된다.(SQL Sever는 반대)
SELECT PLAYER_NAME 선수명, POSITION 포지션, BACK_NO 백넘버
FROM PLAYER
ORDER BY 포지션 DESC;

-- 한 개의 COLUMN이 아닌 여러 가지 기준으로 정렬
-- 먼저 키가 큰 순서대로 정렬하고, 키가 같은 경우 등번호 순으로 정렬
-- 키 값의 NULL인 경우는 제외
SELECT PLAYER_NAME, POSITION, BACK_NO, P_HEIGHT
FROM PLAYER
WHERE P_HEIGHT IN NOT NULL          -- 키가 NULL인 경우 제외
ORDER BY P_HEIGHT DESC, BACK_NO     -- 키를 내림차순으로 정렬, 키가 같으면 등번호를 기준으로 오름 차순으로 정렬

-- ORDER BY 에서 COLUMN 이름이나 ALIAS 대신에 SELECT 문의 COLUMN 순서 번호를 사용할 수 있지만 비추천




