/***********************************
*Sub Query
***********************************/

--1)전체쿼리문 구조
select first_name,
       salary
from employees
where salary > "Den의 급여"
;

--2) Den의 급여
select salary
 from employees
 where first_name = 'Den'
;

--3) sub query
select first_name,
       salary,
       phone_number,
       department_id
from employees
where salary > (select salary
                 from employees
                 where first_name = 'Den')
;

--예제)
--급여를 가장 적게 받는 사람의 이름, 급여, 사원번호
select first_name,
       salary,
       employee_id
from employees
where salary = (select min(salary)
                from employees)
;


--평균 급여보다 적게 받는 사람의 이름, 급여
select first_name,
       salary
from employees
where salary < (select avg(salary)
                from employees)
;