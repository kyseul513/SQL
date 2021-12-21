/************************
* group by 절
************************/


select department_id, avg(salary)
from employees
group by department_id
order by department_id asc
;

select department_id, count(*), avg(salary)
from employees
group by department_id
;

select department_id, job_id, count(*), avg(salary)
from employees
group by department_id, job_id
order by department_id asc, job_id desc
;


--where절에는 그룹함수를 쓸 수 없다.
select department_id, count(*), sum(salary)
from employees
--where sum(salary) >= 20000    
group by department_id
;

--예제 (having절 이용한 오류수정)
select department_id, count(*), sum(salary)
from employees
group by department_id
having sum(salary) >= 20000    --having절에는 그룹함수와 group by에 참여한 컬럼만 사용할 수 있음.
and department_id = 100
;


--case ~ end 문
select employee_id,
       first_name,
       salary,
       job_id,
       case when job_id = 'AC_ACCOUNT' then salary + salary*0.1
            when job_id = 'SA_REP' then salary + salary*0.2
            when job_id = 'ST_CLERK' then salary + salary*0.3
            else salary
        end realSalary  --컬럼명 지정
from employees
;


--DECODE()
select employee_id,
       first_name,
       salary,
       job_id,
       decode(job_id, 'AC_ACCOUNT', salary+ salary*0.1,
                      'SA_REP', salary + salary*0.2,
                      'ST_CLERK', salary + salary*0.3,
              salary) as realsalary     --위 3개에 포함되지 않으면 salary 출력
from employees
;


--예제
/*
직원의 이름, 부서, 팀을 출력하세요
팀은 코드로 결정하며 
부서코드가 10~50 이면 ‘A-TEAM’
          60~100이면 ‘B-TEAM’  
          110~150이면 ‘C-TEAM’ 
나머지는 ‘팀없음’ 으로 출력하세요.
*/
select first_name 이름,
       department_id 부서,
       case when department_id between 10 and 50 then 'A-TEAM'
            when department_id between 60 and 100 then 'B-TEAM'
            when department_id between 110 and 150 then 'C-TEAM'
            else '팀없음'
       end as 팀
from employees
;


select first_name,
       department_id,
       decode(department_id, between 10 and 50, 'A-TEAM',
                             between 60 and 100, 'B-TEAM',
                             between 110 and 150, 'C-TEAM',
              없음) as 팀없음
from employees
;


