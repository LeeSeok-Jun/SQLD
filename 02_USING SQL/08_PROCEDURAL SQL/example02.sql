-- 6. trigger의 생성과 활용

-- 예제, 트리거를 사용하여 주문한 건이 입력될 때마다, 일자별 상품별로 판매수량과 판매금액을 집계하여 집계자료를 보관

-- 테이블 생성
-- 주문 정보 테이블
create table order_list (
    order_date char(8) not null,
    product varchar2(10) not null,
    qty number not null,
    amount number not null
);

-- 일자별 판매집계 테이블
create table sales_per_date (
    sale_date char(8) not null,
    product varchar2(10) not null,
    qty number not null,
    amout number not null
);

-- trigger 작성
-- oracle
create or replace trigger summary_sales
    after insert    
    on order_list   
    for each row   -- order_list 테이블에 insert 선언 시 각 row마다 트리거 적용

declare
    o_date order_list.order_date % type;
    o_prod order_list.product % type;

begin
    o_date := :new.order_date;  -- new : 신규로 입력된 레코드의 정보를 가지고 있는 구조체
    o_prod := :new.product;

    update sales_per_date
        set qty = qty + :new.qty,
        amount = amount + :new.amount
    where sale_date = o_date
        and product = o_prod;
    if sql % notfound then      -- 해당 주문 일자의 주문 상품 실적이 존재하지 않는 경우 새로운 집계 데이터 입력
        insert into sales_per_date
        values (o_date, o_prod, :new.qty, :new.amount);
    end if;
end;

-- sql server
create trigger dbo.summary_sales
    on order_list
    after insert
as
declare
    @o_date datetime,
    @o_prod int,
    @qty int,
    @amount int
begin
    select @o_date = order_date, @o_prod=product, @qty=qty, @amount=amount
    from inserted   -- 신규로 입력된 레코드의 정보를 가지고 있는 구조체
                    -- deleted : 수정, 삭제되기 전의 레코드를 가지고 있는 구조체
    
    update sales_per_date
        set qty = qty + @qty,
            amount = amount + @amount
    where sale_date = @o_date
        and product = @o_prod;

    if @@rowcount = 0
        insert into sales_per_date
        values (@o_date, @o_prod, @qty, @amount)
end;

