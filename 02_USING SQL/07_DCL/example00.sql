-- 2. 유저와 권한

-- 가. 유저 생성과 시스템 권한 부여
grant create user to scott; -- scott 에게 유저 생성 권한 부여 by system

conn scott/tiger    -- scott login

create user pjs identified by korea7;   -- 유저 생성 by scott(id : pjs / pass : korea7) 

grant create session to pjs;    -- pjs에게 로그인 권한 부여 by scott

conn system/manger; -- system login

grant create table to pjs;  -- pjs 에게 테이블 생성 권한 부여 by system

conn pjs/korea7;    -- pjs login

-- create table by pjs
create table menu (
    menu_seq number not null,
    title varchar2(10)
);

-- 나. object에 대한 권한 부여

-- soctt에게 테이블 조회 권한(select) 부여
grant select on menu to scott;

-- 다른 유저가 소유한 객체에 접근(oracle)
conn scott/tiger;

-- scott 계정으로 pjs의 menu 테이블 접근
select *
from pjs.menu;