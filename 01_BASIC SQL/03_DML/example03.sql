-- 5. 산술 연산자와 합성 연산자

-- 산술 연산자
-- 일반적인 사칙연산의 우선순위를 갖는다.
SELECT PLAYER_NAME 이름, P_HEIGHT - P_WEIGHT "키-몸무게" FROM PLAYER;

-- 산술 연산자를 이용해 BMI 측정해보기
-- ROUND() : 반올림 내장 함수
SELECT PLAYER_NAME 이름, ROUND(P_WEIGHT / ((P_HEIGHT / 100) * (P_HEIGHT / 100)), 2) "BMI 비만지수" FROM PLAYER;

-- 합성 연산자 : COLUMN의 값을 연결해 문자 표현식의 결과에 의한 새로운 COLUMN을 생성한다.
-- Oracle : ||
-- SQL Server : +
-- CONCAT(STR1, STR2)
SELECT PLAYER_NAME || '선수, ' || P_HEIGHT || 'CM, ' || P_WEIGHT || 'KG' AS 체격정보 FROM PLAYER;
-- 출럭 : 박지성선수, 178CM, 70KG