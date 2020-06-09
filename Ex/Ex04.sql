select *
from departments; --27개 데이터

select *
from employees; --107

select  employees.employee_id, 
        employees.first_name, 
        employees.department_id,
        departments.department_id,
        departments.department_name
from employees, departments;


select  employee_id, --칼럼명이 중복되지 않는 경우 별명 사용하지 않음
        first_name, 
        em.department_id, --칼럼명이 중복되는 경우 별명 사용
        de.department_id,
        de.department_name
from employees em, departments de  --칼럼명이 중복되는 경우르 위해 테이블에 별명
where em.department_id = de.department_id;


/*예제
모든 직원이름, 업무명을 출력하세요
*/
select  first_name,
        em.job_id ejob_id,
        jb.job_id jjob_id,
        job_title       
from employees em, jobs jb
where em.job_id = jb.job_id; 


/*예제
모든 직원이름, 부서명, 업무명을 출력
*/
select count(*)
from employees e, departments d, jobs j; --전체 테이블의 경우의 수를 다 곱한 결과가 나옴

select  e.employee_id,
        e.first_name,
        e.department_id, --확인용
        d.department_id,  --확인용
        d.department_name,
        e.job_id, --확인용
        j.job_id, --확인용
        j.job_title
from employees e, departments d, jobs j
where e.department_id = d.department_id -- join 테일블이 3개인 경우
and e.job_id = j.job_id;



select  first_name,
        em.job_id ejob_id,
        jb.job_id jjob_id,
        job_title       
from employees em, jobs jb
where em.job_id = jb.job_id; 

select *
from employees; --departments;

--right outer join~ on
select  e.employee_id,
        e.first_name,
        e.department_id,
        d.department_id,
        d.department_name
from employees e right outer join departments d
on e.department_id = d.department_id;


select *
from departments d left outer join employees
on e.department_id = d.department_id;


--full outer join : 모든 테이블의 
-- 반드시 full outer join ~ on 절을 사용하여야 함
select  emp.employee_id,
        emp.first_name,
        emp.salary,
        man.employee_id,
        man.first_name,
        man.salary
from employees emp, employees man
where emp.manager_id = man.employee_id;


select
from employees e, locations l



select *
from employees;