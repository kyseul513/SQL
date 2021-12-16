/*********************************
* 그룹함수
*********************************/


--오류발생 이유 확인: 1개의 row에 표현 불가.
select avg(salary), first_name
from employees;

--그룹함수 avg()
select round(avg(salary),2)
from employees;

--그룹함수 count()
select count(*),
       count(commission_pct),    -- coulmn명을 제시해주면 null값은 제외됨.
       count(department_id)
from employees;

select count(*)
from employees
where salary >= 16000;

--부서번호가 100인 사람의 수
select count(*)
from employees
where department_id = 100;

--그룹함수 sum()
select sum(salary), count(*), avg(salary)
from employees;

select sum(salary), count(*), avg(salary)
from employees
where salary > 16000;

--그룹함수 avg()
select count(*),
       sum(salary)/count(*) avg,
       avg(salary)  --null이 있는 경우 빼고 계산(nvl함수와 사용)
from employees;

select count(*),
       sum(salary),
       avg(nvl(salary,0))
from employees;

--그룹함수 max() / min()
select count(*),
       max(salary),
       min(salary)
from employees;


/*********************************
* group by 절
*********************************/
select avg(salary), department_id   -- id별로 그룹지어서 deprtment_id 표시가 가능
from employees
group by department_id;

