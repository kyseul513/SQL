/**************************
*join
**************************/

/*
equi join   양쪽 다 만족하는 경우만 조인됨. (null은 제외됨)
*/
select first_name,
       salary,
       de.department_id,
       de.department_name
from employees em, departments de     --이부분은 별명 붙일 때 as를 쓰지 않음.
where em.department_id = de.department_id
;


--예)
select em.first_name,
       de.department_name,
       jo.job_title
from employees em, departments de, jobs jo
where em.department_id = de.department_id
and em.job_id = jo.job_id
;


/*
outer join    null을 포함한 값 반환  
*/
-- left outer join      --왼쪽 테이블의 모든 row를 결과 테이블에 나타냄
select em.first_name,
       em.salary,
       em.department_id,
       de.department_id,
       de.department_name
from employees em left outer join departments de
on em.department_id = de.department_id      --where가 아닌 on 사용
;


--오라클 표현
select em.first_name,
       em.salary,
       em.department_id,
       de.department_id,
       de.department_name
from employees em, departments de
where em.department_id = de.department_id(+)    --(+)의 반대쪽 테이블이 기준이 되는 테이블. 따라서 em.department_id가 기준이 되며, 이 테이블의 모든 내용이 출력됨.
;                                               -- 값이 없는 조인측에 (+)를 위치시킴


--right outer join
select em.first_name,
       em.salary,
       em.department_id,
       de.department_id,
       de.department_name
from employees em right outer join departments de   --오른쪽을 기준으로 조인. 오른쪽 테이블 값은 전부 표시.
on em.department_id = de.department_id       
;


--오라클 표현
select em.first_name,
       em.salary,
       em.department_id,
       de.department_id,
       de.department_name
from employees em, departments de   
where em.department_id(+) = de.department_id  
;


--right outer join -> left outer join
select em.first_name,
       em.salary,
       em.department_id,
       de.department_id,
       de.department_name
from departments de left outer join employees em
on de.department_id = em.department_id   
;


select em.first_name,
       em.salary,
       em.department_id,
       de.department_id,
       de.department_name
from departments de, employees em
where de.department_id = em.department_id(+)   
;


--full outer join           (+)형태 쓰지 않음.
select em.first_name,
       em.salary,
       em.department_id,
       de.department_id,
       de.department_name
from employees em full outer join departments de
on em.department_id =  de.department_id
;

--self join -> 직원테이블, 부서테이블 조인 문과 비교
select em.employee_id,
       em.first_name,
       em.salary,
       em.phone_number,
       em.manager_id,
       ma.employee_id,
       ma.first_name,
       ma.phone_number,
       ma.email,
       ma.salary
from employees em, employees ma    --같은 테이블에 있는 manager_id를 가져와야해서
where em.manager_id = ma.manager_id
;

