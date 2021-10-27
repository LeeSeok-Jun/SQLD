/* 
  page 165
  CONSTRAINT
  K-리그 선수들의 소속팀에 대한 정보를 가지고 있는 테이블
*/

-- Oracle
CREATE TABLE TEAM (
    TEAM_ID             CHAR(3) NOT NULL,
    REGION_NAME         VARCHAR2(8) NOT NULL,
    TEAM_NAME           VARCHAR2(40) NOT NULL,
    E_TEAM_NAME         VARCHAR2(50),
    ORIG_YYYY           CHAR(4),
    STADIUM_ID          CHAR(3), NOT NULL,
    ZIP_CODE1           CHAR(3),
    ZIP_CODE2           CHAR(3),
    T_ADDRESS           VARCHAR2(80),
    DDD                 VARCHAR2(3),
    TEL                 VARCHAR2(10),
    FAX                 VARCHAR2(10),
    HOMEPAGE            VARCHAR2(50),
    T_OWNER             VARCHAR2(10),

    CONSTRAINT TEAM_PK PRIMARY KEY (TEAM_ID),
    CONSTRAINT TEAM_PK FOREIGN KEY (STADIUM_ID) REFERENCES STADIUM_ID(STADIUM_ID)
);

-- Oracle 테이블 구조 확인
DESC PLAYER;

-- SQL Server 테이블 구조 확인
exec sp_help 'dbo.PLAYER'
go