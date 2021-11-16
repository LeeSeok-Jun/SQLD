-- 3. role을 이용한 권한 부여

conn system/manager;

-- role 생성
create role login_table;

-- role에 권한 부여
grant create session, create table to login_table;

-- 유저에게 role 부여
-- 해당 유저는 login과 테이블 생성에 대한 권한이 생긴다.
grant login_table to pjs;

