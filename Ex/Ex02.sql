select * from employees;

SELECT
    *
FROM departments;

select employee_id, first_name, last_name from employees;

--사원의 이름과 전화번호 입사일 연봉을 출력하세요
select first_name, phone_number, hire_date, salary 
from employees;

--사원의 이름과 성 급여, 전화번호, 이메일, 입사일을 출력하세요
select  first_name, 
        last_name, 
        salary,
        phone_number, 
        email, 
        hire_date 
from employees;

/*select 문 별명*/
select  employee_id as empNO,
        first_name "E-name",
        salary as "급여"
from employees;

--사원의 이름(first_name)과 전화번호 입사일 급여로 표시되도록 출력하세요
select  first_name "이름",
        last_name "성",       
        phone_number "전화번호",
        hire_date "입사일",
        salary "급여"
from employees;

--사원의 사원번호 이름(first_name)과 전화번호 이메일 입사일로 표시되도록 출력하세요
select  employee_id "사원번호",
        first_name "이름",
        last_name "성",
        salary "급여",
        phone_number "전화번호",
        email "이메일",
        hire_date "입사일"
from employees;

/*select 문 컬럼 합치기*/
select first_name || last_name
from employees;

select first_name || ' ' || last_name
from employees;

select first_name || ' hire date is ' || hire_date empInfo
from employees;


/*산술 연산자 사용하기*/
select first_name, salary
from employees;

select first_name, salary*12
from employees;

select first_name, salary, salary*12
from employees;

select first_name, salary, (salary+300)*12, salary/30
from employees;

--산술 연산자 안됨
select job_id*12
from employees;


/*예제*/
select  first_name || '-' || last_name 성명,
        salary "급여",
        salary*12 "연봉",
        salary*12+5000 "연봉2",
        phone_number "전화번호"
from employees;

select first_name
from employees
where department_id = 10;

select first_name, salary
from employees
where salary >= 15000;

select salary
from employees
where first_name = 'Lex';


select first_name, hire_date
from employees
where hire_date >= '07/01/01';


select *
from employees


select first_name, salary
from employees
where salary <= 14000
or salary >= 17000;

select first_name, salary
from employees
where salary >= 14000
and salary <= 17000;


select first_name, salary
from employees
where salary between 14000 and 17000;


select first_name, hire_date
from employees
where hire_date >= '04/01/01' 
and hire_date <= '05/12/31';

--in 사용
select first_name, last_name, salary
from employees
where first_name in ('Neena', 'Lex', 'John');


select first_name, last_name, salary
from employees
where first_name = 'Neena' 
or first_name = 'Lex' 
or first_name = 'John';


select first_name, salary
from employees
where salary in (2100, 3100, 4100, 5100);


--Like 연산자 사용
select first_name, last_name, salary
from employees
where first_name like 'L%'; --L을 포함한 글자

select first_name, last_name, salary
from employees
where first_name like 'L___'; --L로 시작해서 네글자인


--이름에 am을 포함한 사원의 이름과 연봉을 출력하세요
select first_name, salary
from employees
where first_name like '%am%';


--이름의 두번째 글자가 a인 사원의 이름과 연봉을 출력하세요
select first_name, salary
from employees
where first_name like '_a%';


--이름의 네번째 글자가 a인 사원의 이름과 연봉을 출력하세요
select first_name, salary
from employees
where first_name like '___a%';


select first_name, salary, commission_pct, salary*commission_pct
from employees
where salary between 13000 and 15000;

select first_name, salary, commission_pct
from employees
where commission_pct is null;


select first_name, salary, commission_pct
from employees
where commission_pct is not null;

select first_name
from employees
where manager_id is null
and commission_pct is null;


select first_name, salary
from employees
where salary >= 9000
order by salary desc, first_name asc;


--부서번호를 오름차순으로 정렬하고 부서번호, 급여, 이름을 출력하세요
select department_id, salary, first_name
from employees
order by department_id asc;


--급여가 1000이상인 직원의 이름 급여를 급여가 큰직원부터 출력하세요
select first_name, salary
from employees
where salary >= 1000
order by salary desc;


--부서번호를 오름차순으로 정렬하고 부서번호가 같은면 급여가 높은 사람부터 부서번호 급여 이름을 출력하세요
select department_id, first_name, salary
from employees
where salary >= 1000
order by department_id asc, salary desc;



/*단일행 함수*/


/*문자 함수*/


--initcap()
select  email, 
        initcap(email)
from employees;

--SQL이 작동하는 원리 확인
select  email, 
        initcap('aaaaa')
from employees;

--Dual 가상의 테이블로 테스트
select  initcap('aaaaa')
from dual; --가상의 테이블


select email, initcap(email), department_id
from employees
where department_id = 100;

--LOWER(칼럼명) / UPPER(칼럼명)
select lower('aAaAaAaA')
from dual;

select upper('aAaAaAaA')
from dual;

select first_name, lower('first_name'), upper('first_name')
from employees
where department_id = 100;

--substr (칼럼명, 시작위치, 글자수)
select substr('abcdefg', 2, 3)
from dual;

select  first_name,
        substr(first_name, 1, 3),
        substr(first_name, -3, 2)
from employees
where department_id = 100;

--LPAD(칼럼명, 자리수, '채울문자')/ RPAD(칼럼명, 자리수, '채울문자') 
select  first_name,
        lpad(first_name, 10, '*'),
        rpad(first_name, 10, '#')
from employees;


select  first_name,
        replace(first_name, 'a', '*')
from employees
where department_id = 100;

select first_name,
        replace(first_name, 'a', '*'),
        substr(first_name, 2, 3),
        replace(first_name, substr(first_name, 2, 3), '***')
from employees
where department_id = 100;


--공백 없애기
select  ltrim('           aaa          ') || '------',
        rtrim('           aaa          ') || '------'
from dual;



/*숫자 함수*/

--ROUND(숫자, 출력을 원하는 자리수)
select  round(123.343, 2) as "r2",--소수점 두째자리까지 나오게 하고 마지막 수 반올림
        round(123.956, 0) as "r0", --소수점까지 나오게 하고 이하 마지막 수 반올림
        round(123.456, -1) as "r-1" --소수점 앞자리 두번째까지 나오게하고 마지막 수 반올림
from dual;

select  trunc(123.343, 2) as "r2",--소수점 두째자리까지 나오게 하고 마지막 수 버림
        trunc(123.956, 0) as "r0", --t소수점까지 나오게 하고 이하 마지막 수 버림
         trunc(123.456, -2) as "r-2"       
from dual;



/*날짜 함수*/

select sysdate --가상의 컬럼이므로 모든 테이블에서 출력됨
from employees;


--날짜 함수  -MONTH_BETWEEN(d1, d2)
select  sysdate, 
        hire_date,
        months_between(sysdate, hire_date)
from employees;
where department_id = 110;


select  last_day('20/06/06'),
        last_day(sysdate)
from dual;



/*변환 함수*/

select to_char(9876, '99999')
from employees
where department_id =110;


--to_char(n, fmt)
select  to_char(9876, '99999'),
        to_char(9876, '099999'), --9876이 네 자리이므로 앞에 0이 두번 붙음
        to_char(9876, '$9999'),
        to_char(9876, '9999.99'),
        to_char(9876, '99.999')
from dual;


select  sysdate,
        to_char(sysdate, 'YYYY-MM-DD HH24:MI:SS')
from dual;


--NVL(컬럼명, null일때값)/NVL2(컬럼명, null아닐때값, 
select  first_name,
        commission_pct,
        nvl(commission_pct, 0), -- commission_pct의 깂이 null이면 0으로 표시
        salary * commission_pct,
        salary *  nvl(commission_pct, 0), --commission_pct의 null 값을 0으로 바꾸어 산술
        nvl2(commission_pct, 100, 0) ---- commission_pct의 깂이 null이 아니면 100으로 null이면 0으로 표시
from employees;
