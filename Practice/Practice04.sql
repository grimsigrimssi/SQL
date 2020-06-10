/*
서브쿼리(SubQuery) SQL 문제
*/

/*
문제1.
평균급여보다 적은 급여를 받는 직원은 몇명인지 구하시오.
(56건)
*/
select count(employee_id)
from employees 
where salary  < (select avg(salary)
                 from employees);

/*
문제2.
평균급여 이상, 최대급여 이하의 월급을 받는 사원의 
직원번호(employee_id), 이름(first-name), 급여(salary), 평균급여, 최대급여를 
급여의 오름차순으로 정렬하여 출력하세요.
(51건)
*/
select  employee_id,
        first_name,
        salary,
        (select round(avg(salary),0)
        from employees),
        (select max(salary)
        from employees)
from employees
where salary >= (select     avg(salary)
                from employees)
and salary <=   (select     max(salary)
                from employees)                  
order by salary asc;
                    
                

/*
문제3.
직원 중 Steven(first-name), king(last_name)이 소속된 부서(departments)가 있는 곳의 주소를 알아보려고 한다.
도시아이디(location_id), 거리명(street_address), 우편번호(postal_code), 도시명(city), 
주(state_province), 나라아이디(country_id)를 출력하세요.
(1건)
*/
select  e.first_name,
        e.last_name,
        l.location_id,
        l.street_address,
        l.postal_code,
        l.city,
        l.state_province,
        c.country_id        
from employees e, departments d, locations l, countries c 
where d.location_id = l.location_id 
and l.country_id = c.country_id
and d.department_id = e.department_id
and e.employee_id = (select em.employee_id
                     from employees em
                     where em.first_name = 'Steven'
                     and em.last_name = 'King');



/*
문제4.
job_id가 'ST_MAN'인 직원의 급여보다 작은 직원의 사번, 이름, 급여를 급여의 내림차순으로 출력하세요. -ANY연산자 사용
(74건)
*/
select  employee_id,
        first_name,
        salary
from    (select employee_id,
                first_name,
                salary
        from employees
        where salary < any  (select  salary
                            from employees
                            where job_id = 'ST_MAN')
        order by salary desc
        );                                

            
/*
문제5.
각 부서별로 최고의 급여를 받는 사원의 직원번호(employee_id), 이름(first_name)과 급여(salary),  
부서번호(department_id)를 조회하세요.
단 조회결과는 급여의 내림차순으로 정렬되어 나타나야 합니다.
조건절비교, 테이블조인 2가지 방법으로 작성하세요.
(11건)
*/
select employee_id, 
        first_name,
        salary, 
        department_id
from    (select employee_id, 
                first_name,
                salary, 
                department_id
        from employees
        where (department_id, salary)  in      (select department_id, max(salary)
                                                from employees
                                                group by department_id)
        order by salary desc); 




/*
문제6.
각 업무(job) 별로 연봉(salary)의 총합을 구하고자 합니다.
연봉 총합이 가장 높은 업무부터 업무명(job_title)과 연봉 총합을 조회하시오.
(19건)
*/
select  j.job_title,
        e.salary
from jobs j, employees e,
where j.job_id(+) = e.job_id
and e.salary in (select sum(salary)
                from employees
                group by job_id)
order by salary desc;



select *
from jobs;

select job_id
from employees;




select employee_id, 
        first_name,
        salary, 
        department_id
from    (select employee_id, 
                first_name,
                salary, 
                department_id
        from employees
        where (department_id, salary)  in      (select department_id, max(salary)
                                                from employees
                                                group by department_id)
        order by salary desc); 




/*
문제7.
자신의 부서 평균 급여보다 연봉(salary)이 많은 직원의 직원번호(employee_id), 이름(first_name)과 급여(salary)을 조회하세요.
(38건)
*/
select  employee_id, 
        first_name, 
        salary
from employees
where (department_id, salary)  >   (select department_id, salary
                                        from employees
                                        group by department_id 
                                        having avg(salary)
                                        ); 
                    





/*
문제8.
직원 입사일이 11번째에서 15번째의 직원의 사원, 이름, 급여, 입사일을 입사일 순서로 출력하세요.
*/



