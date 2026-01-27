use role accountadmin;
use warehouse my_warehouse;
use schema my_db.my_schema;
show procedures;
select * from information_schema.procedures;
execute immediate
$$
begin
    return 'Hello, Snowflake!';
end;
$$;
create or replace procedure pr_hello()
returns string
language sql
execute as caller
as
$$
begin
    return 'Hello, Snowflake!';
end;
$$;
call pr_hello();
create or replace procedure pr_add_numbers(a int, b int)
returns int
language sql
execute as caller
as
$$
begin
    return a + b;
end;
$$; 
call pr_add_numbers(5, 10);