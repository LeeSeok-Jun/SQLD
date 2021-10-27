-- page 162~163
-- CREATE TABLE
-- K-리그 선수들의 정보를 가지고 있는 테이블

-- Oracle
CREATE TABLE PLAYER (
    -- 속성명       DATATYPE    DEFAULT 형식
    PLAYER_ID       CHAR(7) NOT NULL,
    PLAYER_NAME     VARCHAR2(20) NOT NULL,
    TEAM_ID         CHAR(3) NOT NULL,
    E_PLAYER_NAME   VARCHAR2(40),
    NICKNAME        VARCHAR2(30),
    JOIN_YYYY       CHAR(4),
    POSITION        VARCHAR2(30),
    BACK_TO         NUMBER(2),
    NATION          VARCHAR2(20),
    BIRTH_DATE      DATE,
    SOLAR           CHAR(1),
    P_HEIGHT        NUMBER(3),
    P_WEIGHT        NUMBER(3),

    -- 제약조건 제약조건 이름 
    -- 기본키 설정
    CONSTRAINT PLAYER_PK    PRIMARY KEY (PLAYER_ID),
    -- 외래키 설정                                 참조 테이블 및 속성명
    CONSTRAINT PLAYER_FK    FOREIGN KEY (TEAM_ID) REFERENCES TEAM(TEAM_ID)
);