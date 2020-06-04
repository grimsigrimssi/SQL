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







        



