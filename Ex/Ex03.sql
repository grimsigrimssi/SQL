select count(*) --null포함
from employees;

select count(manager_id) --특정 데이터명일 경우 null 제외
from employees;

select count(*) --null 포함
from employees;

select count(commission_pct) --null제외
from employees;

select count(*), count(commission_pct), avg(salary)
from employees;

select count(*)
from employees
where salary > 16000;

select count(manager_id)
from employees
where salary > 16000;

select sum(salary)
from employees;

--manager_id 테스트(논리적x) ---> avg() null 계산에 포함하지 않는다
select avg(manager_id)
from employees
where salary > 16000;

select avg(nvl(manager_id, 0)) ---> null 데이터를 0으로 변경
from employees
where salary > 16000;

/*max(), min() 함수; 입력된 값들중 가장 큰값/작은값d을 구하는 함수
*/
select *
from employees;

select max(salary)
from employees;

select min(salary)
from employees;

select max(salary), min(salary) --속도문제
from employees;


--Group by 절
select sum(salary), department_id
from employees
group by department_id;


select sum(salary), department_id, job_id
from employees
group by department_id, job_id;


/* having 그룹함수에서 쓰는 조건절
having             --그룹함수에서 쓰는 조건절
/*예제
연봉의 합계가 20000이상인 부서의 부서번호와, 인원수, 급여합계를 출력하세요
*/
select department_id, count(*), sum(salary)
from employees
group by department_id
having sum(salary) > 20000
and sum(salary) < 50000;


/*
case ~ end 문 
*/ 
select  employee_id,
        first_name,
        job_id,
        salary,
        case    when salary >= 20000                        then salary
                when salary >= 10000 and salary < 20000     then salary + salary * 0.2
                when job_id = 'SA_CLERK'                    then salary + salary * 0.3
                else salary
        end realSalary
from employees;

/*
DECODE
*/

/*직원의 이름, 부서, 팀을 출력하세요
팀은 코드로 결정하며 부서코드가 10-50이면 'A-TEAM'
60~100이면 '8-TEAM' 100~150이면 'C-TEAM' 나머지는 'xladjqtdma'으로 출력하세요.
*/
select  first_name, 
        department_id, 
        case    when department_id >= 10 and department_id <= 50 then 'A-TEAM'
                when department_id >= 60 and department_id <= 100 then '8-TEAM'
                when department_id >= 100 and department_id <= 150 then 'C-TEAM'
                else '팀없음'
        end team
from employees
order by team asc;






