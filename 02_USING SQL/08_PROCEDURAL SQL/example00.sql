-- 4. Procedure�� ������ Ȱ��

-- scott ������ �����ϰ� �ִ� dept ���̺� ���ο� �μ��� ����ϴ� procedure�� �ۼ�

-- oracle
create or replace procedure p_dept_insert (
    v_deptno in number,     -- in : os���� procedure�� ���� ����
    v_dname in varchar2,
    v_loc in varchar2,
    v_result out varchar2   -- out : procedure���� os�� ó�� ��� ����
)

is
cnt number := 0;    -- := : ���� ������

begin
    select count(*) into cnt
    from dept
    where deptno = v_deptno
        and rownum = 1;

    if cnt > 0 then
        v_result := '�̹� ��ϵ� �μ���ȣ�̴�.';
    else
        insert into dept (deptno, dname, loc)
        values (v_deptno, v_dname, v_loc);

        commit;
        v_result := '�Է� �Ϸ�!';
    end if;

exception
    when others then
        rollback;
        v_result := 'error �߻�';

end;
/

-- sql server
create procedure dbo.p_dept_insert
@v_deptno int,
@v_dname varchar(30),
@v_loc varchar(30),
@v_result varchar(100) output

as
declare @cnt int
set @cnt = 0

begin
    select @cnt = count(*)
    from dept
    where deptno = @v_deptno

    if @cnt > 0
    begin
        set @v_reault = '�̹� ��ϵ� �μ���ȣ�̴�.'
        return
    end

    else
    begin
        begin tran
        insert into (deptno, dname, loc)
        values (@v_deptno, @v_name, @v_loc)

        if @@error <> 0
        begin
            rollback
            set @v_result = 'error �߻�'
            return
        end

        else
        begin
            commit
            set @v_result = '�Է� �Ϸ�!'
            return
        end
    end
end
