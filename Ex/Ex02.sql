--단일행 함수

--문자함수 = INITCAP(컬럼명)
select email,
       initcap(email) "Email2",
       department_id
from employees
where department_id = 100
;

--문자함수 – LOWER(컬럼명) / UPPER(컬럼명
select first_name,
       lower(first_name) l_name,
       upper(first_name) u_name
from employees
where department_id = 100
;

--문자함수 – SUBSTR(컬럼명, 시작위치, 글자수)
select first_name,
       substr(first_name,1,3),
       substr(first_name,-3,2)  --끝에서부터 세는 것.
from employees
where department_id = 100
;

--문자함수 – LPAD(컬럼명, 자리수, ‘채울문자’) / RPAD(컬럼명, 자리수, ‘채울문자’)
select first_name,
       lpad(first_name,10,'*'),
       rpad(first_name,10,'*')
from employees
where department_id = 100
;

--문자함수 – REPLACE (컬럼명, 문자1, 문자2)
select first_name,
       replace(first_name,'a','*****'),
       replace(first_name,substr(first_name,2,3),'***')
from employees
where department_id = 100
;

--숫자함수 – ROUND(숫자, 출력을 원하는 자리수)
select round(123.346,2) "r2",
       round(123.856,0) "r0",
       round(123.456,-1) "r-1"
from dual  --가상의 테이블 (from절이 필수이기 때문에 round출력을 위해 넣은 것)
;

--숫자함수 – TRUNC(숫자, 출력을 원하는 자리수)
select trunc(123.456,2) "r2",
       trunc(123.956,0) "r0",
       trunc(123.456,-1) "r-1"
from dual;

--날짜함수 - SYSDATE()
select sysdate
from dual;

select sysdate,
       hire_date,
       MONTHS_BETWEEN(SYSDATE,hire_date),
       round(MONTHS_BETWEEN(SYSDATE,hire_date),0),
       trunc(MONTHS_BETWEEN(SYSDATE,hire_date),2)
from employees
where department_id = 100;

--TO_CHAR(숫자, ‘출력모양’) 숫자형문자형으로 변환
select first_name,
       salary,
       salary*12,
       to_char(salary*12,'$999999'), -- 9: 자리수 표현
       to_char(salary*12,'$099999'), -- 0: 빈 자리수를 0으로 채워넣음
       to_char(salary*12,'$999999.99999'),
       to_char(salary*12,'$999,999'),
       to_char(salary*12,'$999,999,999.999')
from employees
where department_id = 100
;

--단일함수>변환함수>TO_CHAR(날짜, ‘출력모양’) 날짜문자형으로 변환
select sysdate,
       to_char(sysdate, 'DD/MM/YYYY HH24:MI:SS')
from dual;

select sysdate,
       to_char(sysdate,'DD'),
       hire_date,
       to_char(hire_date,'MM')
from employees
;

--일반함수>NVL(컬럼명, null일때값)/NVL2(컬럼명, null아닐때값, null일때 값)
select first_name,
       commission_pct,
       nvl(commission_pct,0),
       nvl2(commission_pct,1,0)
from employees
;