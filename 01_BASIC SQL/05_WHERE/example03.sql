--- 06. 부정 연산자

-- 삼성 블루윙즈 소식인 선수들 중에서 포지션이 미드필더가 아니고, 키카 175 cm 이상 185 cm 이하가 아닌 선수들의 자료 찾기
SELECT PLAYER_NAME 선수이름, POSITION 포지션, BACK_NO 백넘버, P_HEIGHT 키 FROM PLAYER
WHERE TEAM_ID = 'K02'
AND NOT POSITION = 'MF'    -- NOT POSITION <> 'MF' 동일
AND NOT P_HEIGHT BETWEEN 175 AND 185;

-- 국적 COLUMN이 NULL이 아닌 선수들의 국적 표시
SELECT PLAYER_NAME 선수이름, NATION 국적 FROM PLAYER
WHERE NATION IS NOT NULL;