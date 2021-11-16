-- 4. Procedure의 생성과 활용

-- scott 유저가 소유하고 있는 dept 테이블에 새로운 부서를 등록하는 procedure를 작성

-- oracle
create or replace procedure p_dept_insert (
    v_deptno in number,     -- in : os에서 procedure로 변수 전달
    v_dname in varchar2,
    v_loc in varchar2,
    v_result out varchar2   -- out : procedure에서 os로 처리 결과 전달
)

is
cnt number := 0;    -- := : 대입 연산자

begin
    select count(*) into cnt
    from dept
    where deptno = v_deptno
        and rownum = 1;

    if cnt > 0 then
        v_result := '이미 등록된 부서번호이다.';
    else
        insert into dept (deptno, dname, loc)
        values (v_deptno, v_dname, v_loc);

        commit;
        v_result := '입력 완료!';
    end if;

exception
    when others then
        rollback;
        v_result := 'error 발생';

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
        set @v_reault = '이미 등록된 부서번호이다.'
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
            set @v_result = 'error 발생'
            return
        end

        else
        begin
            commit
            set @v_result = '입력 완료!'
            return
        end
    end
end
