-- 03. 비교 연산자

-- 소속팀이 삼성 블루윙즈이거나 전남 드래곤즈에 소속된 선수들이어야 하고,
-- 포지션이 미드필더이어야 한다.
-- 키는 170cm 이상이고 180cm 이하여야 한다.

-- 팀 소속이 삼성 블루윙즈
SELECT PLAYER_NAME 선수이름, POSITION 포지션, BACK_NO 백넘버, P_HEIGHT 키 FROM PLAYER
WHERE TEAM_ID = 'K02';

-- 포지션이 미드필더
SELECT PLAYER_NAME 선수이름, POSITION 포지션, BACK_NO 백넘버, P_HEIGHT 키 FROM PLAYER
WHERE POSITION = 'MF';

-- 키가 170cm 이상
SELECT PLAYER_NAME 선수이름, POSITION 포지션, BACK_NO 백넘버, P_HEIGHT 키 FROM PLAYER
WHERE P_HEIGHT >= 170;


