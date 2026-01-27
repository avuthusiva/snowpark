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
execute immediate 
$$
declare
    first_name varchar default 'siva';
    last_name varchar default 'reddy';
    full_name varchar;
begin
    let middle_name := 'vardhana';
    full_name := first_name || ' ' || middle_name || ' ' || last_name;
    --select :first_name || ' ' || :middle_name || ' ' || :last_name into :full_name from dual;
    return full_name;
end;
$$;
set age = 34;
select $age from dual;
execute immediate
$$
declare 
    out_str varchar := '';
begin
    for i in 1 to 20 
    loop
        out_str := out_str || ' ' || i;
    end loop;
    return out_str;
end;
$$;
execute immediate
$$
declare
    out_str varchar := '';
    cnt int := 1;
begin
    while (cnt <=20)
    loop
        out_str := out_str || ' ' || cnt;
        cnt := cnt + 1;
    end loop;
    return trim(out_str);
end;
$$;