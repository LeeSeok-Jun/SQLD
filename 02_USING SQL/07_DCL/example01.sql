-- 3. role�� �̿��� ���� �ο�

conn system/manager;

-- role ����
create role login_table;

-- role�� ���� �ο�
grant create session, create table to login_table;

-- �������� role �ο�
-- �ش� ������ login�� ���̺� ������ ���� ������ �����.
grant login_table to pjs;

