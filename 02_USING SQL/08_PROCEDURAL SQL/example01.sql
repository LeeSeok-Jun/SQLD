-- 5. user defined function�� ������ Ȱ��

-- ����. K���� 8�� ������� �� ������ �������� abs �Լ��� ����Ͽ� ���밪���� ����Ѵ�.
-- oracle
select sche_date �������,
        hometeam_id || '-' || awayteam_id as ����,
        home_score || '-' || away_score as scroe,
        abs(home_score - away_score) as ������
from schedule
where gubun = 'Y'
    and sche_date between '20120801' and '20120831'
order by sche_date;

-- ����� ���� abs �Լ� �����(by oracle)
create or replace function util_abs (
    v_input in number
)
return number

is
    v_return number := 0;

begin
    if v_input < 0 then
        v_return := * -1
    
    else
        v_return := v_input;
    end if;

    return v_return;
end;
/

-- ����� ���� �Լ� ���
select sche_date �������,
        hometeam_id || '-' || awayteam_id as ����,
        home_score || '-' || away_score as scroe,
        util_abs(home_score - away_score) as ������
from schedule
where gubun = 'Y'
    and sche_date between '20120801' and '20120831'
order by sche_date;

-- ******************************************************************************

-- sql server
select sche_date �������,
        hometeam_id + '-' + awayteam_id as ����,
        home_score + '-' + away_score as score,
        abs(home_score - away_score) as ������
from schedule
where gubun = 'Y'
    and sche_date between '20120801' and '20120831'
order by sche_date;

-- abs �Լ� �����(by sql server)
create function dbo.util_abs (
    @v_input int
)
returns int

as

begin
    declare @v_return int
    set @v_return = 0
    if @v_input < 0
        set @v_return = @v_input * -1;
    else
        set @v_return = @v_input
    return @v_return;
end

-- ����� ���� �Լ� ���
select sche_date �������,
        hometeam_id + '-' + awayteam_id as ����,
        home_score + '-' + away_score as score,
        dbo.util_abs(home_score - away_score) as ������
from schedule
where gubun = 'Y'
    and sche_date between '20120801' and '20120831'
order by sche_date;