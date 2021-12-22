/*************************************
* rownum
**************************************/


--01. rownum 이해
select rownum,      --일련번호가 데이터로 부여된 것.
       first_name,
       salary
from employees
;


--02. 급여순으로 정렬 -> rownum 순서가 섞여버림
--정렬이 가장 나중에 실행되어 rownum이 섞임
select rownum,
       first_name,
       salary
from employees
order by salary desc
;


--03. 해결방법
--->(1)정렬을 하고  (2)rowmum 붙이고  (3)where절 사용
select r.rno,             --rno가 아닌 rownum으로 쓰면 새로 숫자를 매겨서 안됨.
       r.first_name,
       r.salary
from (select rownum rno,
             o.first_name,
             o.salary
      from (select first_name,        -- 쿼리문으로 테이블 만들기
                   salary             -- 정렬이 되어있는 테이블을 가지고 시작. 따라서 여기에 포함되어 있는 first_name, salary만 사용 가능
            from employees            
            order by salary desc) o      ----(1)
      ) r        ----(2)
where rno >=2
and rno <=4      ----(3)
;



select rownum,
       name,                        -- 컬럼명을 name으로 맞춰줘야 인식함.
       salary
from (select first_name name,       -- first_name name 값을 사용하기 때문에 name으로 맞춰주기.. 
             salary                 
      from employees            
      order by salary desc)
;

select rownum,
       first_name,                       
       salary
from (select *              
      from employees            
      order by salary desc)
where rownum >= 1               --1번부터 가져오는건 가능한데 2번부터는 안됨. 이 경우 아래 예제 참고
and rownum <= 15                
;




/**********************************************************/
--예제
--07년에 입사한 직원중 급여가 많은 직원중 3에서 7등의 이름 급여 입사일은?
--->  (1)정렬을 하고  (2)rowmum 붙이고  (3)where절 사용

select nu.ro,
       nu.first_name,
       nu.salary,
       nu.hire_date       
from (select rownum ro,
             hi.first_name,
             hi.salary,
             hi.hire_date
      from (select first_name,
                   salary,
                   hire_date
            from employees
            where hire_date >= '07/01/01'
              and hire_date <= '07/12/31'
            order by salary desc) hi    ----(1)
     ) nu   -----(2)
where ro >= 3
  and ro <= 7  ----(3)
;


--07년에 입사한 직원중 급여가 많은 직원중 3에서 7등의 이름 급여 입사일 + 부서명은?

select nu.ronu,
       nu.name,
       nu.salary,
       nu.hdate,
       nu.dep
from (select rownum ronu,
             hi.name,
             hi.salary,
             hi.hdate,
             hi.dep
        from (select em.first_name name,
                     em.salary salary,
                     em.hire_date hdate,
                     de.department_name dep
              from employees em, departments de     ---부서명 때문에 조인
              where em.department_id = de.department_id
                and hire_date >= '07/01/01'
                and hire_date <= '07/12/31'
              order by salary desc) hi
      )nu
where nu.ronu >= 3
  and nu.ronu <= 7
;



