--문제1.
select em.employee_id 사번,
       em.first_name 이름,
       em.last_name 성,
       de.department_name 부서명
from employees em, departments de
where em.department_id = de.department_id
order by de.department_name asc, em.employee_id desc
;


--문제2.
select em.employee_id 사번,
       em.first_name 이름,
       em.salary 급여,
       de.department_name 부서명,
       jo.job_title 현재업무
from employees em, departments de, jobs jo
where em.department_id = de.department_id
  and em.job_id = jo.job_id
order by em.employee_id asc
;


--문제2-1.
select em.employee_id 사번,
       em.first_name 이름,
       em.salary 급여,
       de.department_name 부서명,
       jo.job_title 현재업무
from employees em
     left outer join departments de
     on em.department_id = de.department_id
     left outer join jobs jo
     on em.job_id = jo.job_id
order by em.employee_id asc
;


--문제3)
select de.location_id 도시아이디,
       lo.city 도시명,
       de.department_name 부서명,
       de.department_id 부서아이디
from departments de, locations lo
where de.location_id = lo.location_id
order by de.location_id asc
;


--문제3-1)
select de.location_id 도시아이디,
       lo.city 도시명,
       de.department_name 부서명,
       de.department_id 부서아이디
from departments de right outer join locations lo
  on de.location_id = lo.location_id
order by de.location_id asc
;


--문제4)
select re.region_name,
       co.country_name
from countries co, regions re
where re.region_id = co.region_id
order by re.region_name asc, co.country_name desc
;


--문제5)
select em.employee_id 사번,
       em.first_name 이름,
       em.hire_date 채용일,
       ma.first_name 매니저이름,
       ma.hire_date 매니저입사일
from employees em, employees ma
where em.manager_id = ma.employee_id
and em.hire_date < ma.hire_date
;


--문제6)
select co.country_name 나라명,
       co.country_id 나라아이디,
       lo.city 도시명,
       lo.location_id 도시아이디,
       de.department_name 부서명,
       de.department_id 부서아이디
from departments de, locations lo, countries co
where de.location_id = lo.location_id
  and lo.country_id = co.country_id
order by co.country_name asc
;


--문제7)
select em.employee_id 사번,
       em.first_name ||' '|| em.last_name 이름,
       em.job_id 업무아이디,
       jo.start_date 시작일,
       jo.end_date 종료일
from employees em, job_history jo
where em.employee_id = jo.employee_id
  and jo.job_id = 'AC_ACCOUNT'
;


--문제8)
select de.department_id 부서번호,
       de.department_name 부서이름,
       em.first_name ||' '||em.last_name 매니저이름,
       lo.city 도시,
       co.country_name 나라명,
       re.region_name 지역명
from employees em, departments de, locations lo, countries co, regions re
where em.employee_id = de.manager_id
  and de.location_id = lo.location_id
  and lo.country_id = co.country_id
  and co.region_id = re.region_id
;


--문제9)
select em.employee_id 사번,
       em.first_name 이름,
       em.department_id 부서명,
       ma.first_name "매니저의 이름"
from employees em, employees ma
where em.manager_id = ma.employee_id
;


