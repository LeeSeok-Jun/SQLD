-- 2. ������ ����

-- ��. ���� ������ �ý��� ���� �ο�
grant create user to scott; -- scott ���� ���� ���� ���� �ο� by system

conn scott/tiger    -- scott login

create user pjs identified by korea7;   -- ���� ���� by scott(id : pjs / pass : korea7) 

grant create session to pjs;    -- pjs���� �α��� ���� �ο� by scott

conn system/manger; -- system login

grant create table to pjs;  -- pjs ���� ���̺� ���� ���� �ο� by system

conn pjs/korea7;    -- pjs login

-- create table by pjs
create table menu (
    menu_seq number not null,
    title varchar2(10)
);

-- ��. object�� ���� ���� �ο�

-- soctt���� ���̺� ��ȸ ����(select) �ο�
grant select on menu to scott;

-- �ٸ� ������ ������ ��ü�� ����(oracle)
conn scott/tiger;

-- scott �������� pjs�� menu ���̺� ����
select *
from pjs.menu;