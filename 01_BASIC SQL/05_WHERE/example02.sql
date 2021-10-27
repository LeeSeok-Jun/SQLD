-- 05. 논리 연산자

-- AND
-- 소속이 삼성 블루윙즈 '이고' 키가 170cm 이상인 선수
SELECT PLAYER_NAME 선수이름, POSITION 포지션, BACK_NO 백넘버, P_HEIGHT 키 FROM PLAYER
WHERE TEAM_ID = 'K02'
AND P_HEIGHT >= 170;

-- 소속이 (삼성 블루윙즈 혹은 전남 드래곤즈) '이고' 포지션이 미드필더인 선수
SELECT PLAYER_NAME 선수이름, POSITION 포지션, BACK_NO 백넘버, P_HEIGHT 키 FROM PLAYER
WHERE TEAM_ID IN ('K02', 'K07')
AND POSITION = 'MF';

-- 소속팀이 삼성 블루윙즈이거나 전남 드래곤즈에 소속된 선수들이어야 하고,
-- 포지션이 미드필더이어야 한다.
-- 키는 170cm 이상이고 180cm 이하여야 한다.
SELECT PLAYER_NAME 선수이름, POSITION 포지션, BACK_NO 백넘버, P_HEIGHT 키 FROM PLAYER
WHERE (TEAM_ID = 'K02' OR TEAM_ID = 'K07')  -- 괄호() 를 사용하지 않는 경우 연산자 우선순위에 의해 원하지 않는 결과가 출력된다.
AND POSITION = 'MF'
AND P_HEIGHT >= 170
AND P_HEIGHT <= 180;

-- IN, BETWEEN 연산자의 활용
SELECT PLAYER_NAME 선수이름, POSITION 포지션, BACK_NO 백넘버, P_HEIGHT 키 FROM PLAYER
WHERE TEAM_ID IN ('KO2', 'K07')
AND POSITION = 'MF'
AND P_HEIGHT BETWEEN 170 AND 180;