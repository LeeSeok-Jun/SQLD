-- 5. user defined function의 생성과 활용

-- 예제. K리그 8월 경기결과와 두 팀간의 점수차를 abs 함수를 사용하여 절대값으로 출력한다.
-- oracle
select sche_date 경기일자,
        hometeam_id || '-' || awayteam_id as 팀들,
        home_score || '-' || away_score as scroe,
        abs(home_score - away_score) as 점수차
from schedule
where gubun = 'Y'
    and sche_date between '20120801' and '20120831'
order by sche_date;

-- 사용자 정의 abs 함수 만들기(by oracle)
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

-- 사용자 정의 함수 사용
select sche_date 경기일자,
        hometeam_id || '-' || awayteam_id as 팀들,
        home_score || '-' || away_score as scroe,
        util_abs(home_score - away_score) as 점수차
from schedule
where gubun = 'Y'
    and sche_date between '20120801' and '20120831'
order by sche_date;

-- ******************************************************************************

-- sql server
select sche_date 경기일자,
        hometeam_id + '-' + awayteam_id as 팀들,
        home_score + '-' + away_score as score,
        abs(home_score - away_score) as 점수차
from schedule
where gubun = 'Y'
    and sche_date between '20120801' and '20120831'
order by sche_date;

-- abs 함수 만들기(by sql server)
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

-- 사용자 정의 함수 사용
select sche_date 경기일자,
        hometeam_id + '-' + awayteam_id as 팀들,
        home_score + '-' + away_score as score,
        dbo.util_abs(home_score - away_score) as 점수차
from schedule
where gubun = 'Y'
    and sche_date between '20120801' and '20120831'
order by sche_date;