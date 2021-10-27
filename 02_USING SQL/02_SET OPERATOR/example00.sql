-- 제 2절. 집합 연산자
-- column의 수가 동일하고 동일 위치에 존재하는 column의 데이터 타입이 상호 호환 가능할 때 사용

/* (1) K-리그 소속 선수 중 소속이 삼성블루윙즈인 선수들과 전남드래곤즈인 선수들에 대한 내용을 모두 확인
    -> K-리그 소속 선수 중 소속이 삼성블루윙즈인 선수들의 집합과  K-리그 소속 선수 중 소속이 전남드래곤즈인 선수들의 집합의 합집합 */

SELECT TEAM_ID, PLAYER_NAME, POSITION, BACK_NO, P_HEIGHT
FROM PLAYER
WHERE TEAM_ID = 'K02'
UNION   -- 합집합, WHERE 절에 IN 혹은 OR 연산자로 변환 가능
SELECT TEAM_ID, PLAYER_NAME, POSITION, BACK_NO, P_HEIGHT
FROM PLAYER
WHERE TEAM_ID = 'K07';

/* (2) K-리그 소속 선수들 중에서 소속이 삼성블루윙즈인 선수들과 포지션이 골키퍼인 선수들을 모두 보고 싶다.
    -> K-리그 소속 선수들 중 소속이 삼성블루윙즈인 선수들과 K-리그 선수들 중 포지션이 골키퍼인 선수들의 집합의 합집합 */

SELECT TEAM_ID, PLAYER_NAME, POSITION, BACK_NO, P_HEIGHT
FROM PLAYER
WHERE TEAM_ID = 'K02'
UNION ALL  -- UNION ALL : 중복 모두 포함
SELECT TEAP_ID, PLAYER_NAME, POSITION, BACK_NO, P_HEIGHT
FROM PLAYER
WHERE POSITION = 'GK';
ORDER BY 1, 2, 3, 4, 5; -- 중복된 결과를 확인하고자 할 때 유용(5개 COLUMN을 모두 오름차순으로)

/* (3) K-리그 소속 선수들에 대한 정보 중에서 포지션별 평균키와 팀별 평균키를 알고 싶다.
    -> K-리그 소속 선수 중 포지션별 평균키에 대한 집합과 K-리그 소속 선수 중 팀별 평균키에 대한 집합의 합집합 */

SELECT 'P' 구분코드, POSITION 포지션, AVG(P_HEIGHT) 평균키
FROM PLAYER
GROUP BY POSITION
UNION
SELECT 'T' 구분코드, TEAM_ID 팀명, AVG(P_HEIGHT) 평균키
FROM PLAYER
GROUP BY TEAM_ID
ORDER BY 1;

/* (4) K-리그 소속 선수들 중에서 소속이 삼성블루윙즈이면서 포지션이 미드필더(MF)가 아닌 선수들의 정보를 보고 싶다.
    -> K-리그 소속 선수 중 소속이 삼성블루윙즈인 선수들의 집합과 K-리그 소속 선수 중 포지션이 미드필더(MF)인 선수들의 차집합 */

SELECT TEAM_ID, PLAYER_NAME, POSITION, BACK_NO, P_HEIGHT
FROM PLAYER
WHERE TEAM_ID = 'K02'
EXCEPT  -- DB에 따라 MINUS, WHERE 절에 AND != 혹은 <> 연산자로 변환 가능
SELECT TEAM_ID, PLAYER_NAME, POSITION, BACK_NO, P_HEIGHT
FROM PLAYER
WHERE POSITION = 'MF'
ORDER BY 1, 2, 3, 4, 5;

/* (5) K-리그 소속 선수들 중에서 소속이 삼성블루윙즈팀이면서 포지션이 골키퍼인 선수들의 정보를 보고 싶다.
    -> K-리그 소속 선수 중 소속이 삼성블루윙즈팀인 선수들의 집합과 K-리그 소속 선수 중 포지션이 골키퍼인 선수들의 집합의 교집합 */

SELECT TEAM_ID, PLAYER_NAME, POSITION, BACK_NO, P_HEIGHT
FROM PLAYER
WHERE TEAM_ID = 'K02'
INTERSECT   -- 교집합, WHERE 절에서 AND 연산자로 변환 가능
SELECT TEAM_ID, PLAYER_NAME, POSITION, BACK_NO, P_HEIGHT
FROM PLAYER
WHERE POSITION = 'GK'
ORDER BY 1, 2, 3, 4, 5;
