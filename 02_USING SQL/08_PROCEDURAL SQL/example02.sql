-- 6. trigger�� ������ Ȱ��

-- ����, Ʈ���Ÿ� ����Ͽ� �ֹ��� ���� �Էµ� ������, ���ں� ��ǰ���� �Ǹż����� �Ǹűݾ��� �����Ͽ� �����ڷḦ ����

-- ���̺� ����
-- �ֹ� ���� ���̺�
create table order_list (
    order_date char(8) not null,
    product varchar2(10) not null,
    qty number not null,
    amount number not null
);

-- ���ں� �Ǹ����� ���̺�
create table sales_per_date (
    sale_date char(8) not null,
    product varchar2(10) not null,
    qty number not null,
    amout number not null
);

-- trigger �ۼ�
-- oracle
create or replace trigger summary_sales
    after insert    
    on order_list   
    for each row   -- order_list ���̺� insert ���� �� �� row���� Ʈ���� ����

declare
    o_date order_list.order_date % type;
    o_prod order_list.product % type;

begin
    o_date := :new.order_date;  -- new : �űԷ� �Էµ� ���ڵ��� ������ ������ �ִ� ����ü
    o_prod := :new.product;

    update sales_per_date
        set qty = qty + :new.qty,
        amount = amount + :new.amount
    where sale_date = o_date
        and product = o_prod;
    if sql % notfound then      -- �ش� �ֹ� ������ �ֹ� ��ǰ ������ �������� �ʴ� ��� ���ο� ���� ������ �Է�
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
    from inserted   -- �űԷ� �Էµ� ���ڵ��� ������ ������ �ִ� ����ü
                    -- deleted : ����, �����Ǳ� ���� ���ڵ带 ������ �ִ� ����ü
    
    update sales_per_date
        set qty = qty + @qty,
            amount = amount + @amount
    where sale_date = @o_date
        and product = @o_prod;

    if @@rowcount = 0
        insert into sales_per_date
        values (@o_date, @o_prod, @qty, @amount)
end;

