-- 03. HAVING 절

-- K-리그 선수들의 포지션별 평균키를 구하는데, 평균키가 180CM 이상인 정보만 표시
SELECT POSITION 포지션, ROUND(AVG(P_HEIGHT), 2) 평균키
FROM PLAYER
GROUP BY POSITION
HAVING AVG(P_HEIGHT) >= 180;

-- 포지션별로 평균키만 출력하는데, 최대키가 190cm 이상인 선수를 가지로 있는 포지션 정보만 출력
SELECT POSITION 포지션, ROUND(AVG(P_HEIGHT), 2) 평균키
FROM PLAYER
GROUP BY POSITION
HAVING MAX(P_HEIGHT) >= 190;