/*
문제1.
담당 매니저가 배정되어있으나 커미션비율이 없고, 월급이 3000초과인 직원의 이름, 매니저아이디, 커미션 비율, 월급을 출력하세요.
(45건)
*/
select  first_name, 
        manager_id,
        commission_pct,
        salary
from employees
where manager_id is not null
and commission_pct is null
and salary > 3000;



/*
문제2.
각 부서별로 최고의 급여를 받는 사원의 직원번호(employee_id), 이름(first_name), 급여(salary), 입사일(hire_date), 
전화번호(phone_number), 부서번호(department_id)를 조회하세요.
-조건절비교 방법으로 작성하세요
-급여의 내림차순으로 정렬하세요
-입사일은 2001-01-13 토요일 형식으로 출력합니다.
-전화번호는 515-123-4567 형식으로 출력합니다.
(11건)
*/
select  e.employee_id,
        e.first_name,
        e.salary,
        to_char(e.hire_date, 'YYYY-MM-DD DAY'),
        replace(e.phone_number, '.', '-'),
        e.department_id
from employees e, (select max(salary) maxSalary
                    from employees
                    group by department_id) t
where e.salary = t.maxSalary
order by e.salary desc;

select *
from employees;



/*
문제3.
2005년 이후 입사자중 매니저별로 평균급여 최소급여 최대급여를 알아보려고 한다.
출력은 관리자별로 평균급여가 5000이상 중에
매니저아이디, 매니저이름(first_name), 매니저평균급여, 매니저별 최소급여, 매니저별 최대급여를 출력합니다.
(18건)
*/
select  e.manager_id,
        t.avgSalary,
        t.minSalary,
        t.maxSalary
from employees e, (select  manager_id, 
                         round(avg(salary), 0) avgSalary,
                         min(salary) minSalary,
                            max(salary) maxSalary
                 from employees
                 where hire_date >= '05/01/01'
                 group by manager_id) t 
where e.employee_id = t.manager_id                  
and t.avgSalary >= 5000
order by t.avgSalary desc;         





/*
문제4.
각 사원(employee)에 대해서 사번(employee_id), 이름(first_name), 부서명(department_name), 매니저(manager)의 이름(first_name)을
조회하세요. 부서가 없는 직원(Kimberly)도 표시합니다.
(106명)
*/
select  e.employee_id,
        e.first_name,
        d.department_name,
        d.manager_id as manager_name
from employees e, departments d
where e.employee_id = d.manager_id(+)
and e.manager_id is not null;





/*
문제5.
2005년 이후 입사한 직원중에 입사일이 11번째에서 20번째의 직원의 사번, 이름, 부서명, 급여, 입사일을 입사일 순서로 출력하세요.
*/
select  rn,
        tt.employee_id,
        tt.first_name,
        tt.department_name,
        tt.salary,
        tt.hire_date
from   (select  rownum rn,
                t.employee_id,
                t.first_name,
                t.department_name,
                t.salary,
                t.hire_date
        from    (select e.employee_id,
                        e.first_name,
                        d.department_name,
                        e.salary,
                        e.hire_date 
                from employees e, departments d
                where e.department_id = d.department_id
                and e.hire_date >= '05/01/01'
                order by e.hire_date asc
                ) t
        ) tt
where rn >= 11 
and rn <= 20;




/*
문제6.
가장 늦게 입사한 직원의 이름(first_name last_name)과 연봉(salary)과 근무하는 부서 이름(department_name)은?
*/
select  t.fName "이름",
        t.sal "연봉",
        d.department_name "부서이름",
        t.hd "HIRE_DATE"     
from departments d, (select    first_name || ' ' || last_name fName,
                               salary sal,
                               hire_date hd,
                               department_id
                     from employees
                     where hire_date  = (select max(hire_date)
                                        from employees) ) t
where d.department_id = t.department_id;
                    


/*
문제7.
평균 연봉(salary)이 가장 높은 부서 직원들의 직원번호(employee_id), 이름(first_name), 
성(last_name)과 업무(job_title), 연봉(salary)을 조회하시오.
*/
select  e.employee_id, 
        e.first_name, 
        e.last_name, 
        j.job_title, 
        e.salary,
        ttttt.department_id
from employees e, jobs j,    (select rn,
                                            tttt.department_id 
                                     from    (select rownum rn,
                                                    ttt.maxAvgSalary as Average_Salary,
                                                    ttt.department_id     
                                             from    (select max(tt.avgSalary) maxAvgSalary,
                                                           tt.department_id
                                                     from    (select t.avgSalary,
                                                                    t.department_id
                                                             from    (select round(avg(salary), 0) avgSalary,
                                                                            department_id
                                                                     from employees
                                                                    group by department_id) t
                                                            ) tt 
                                                     group by tt.department_id
                                                     order by maxAvgSalary desc
                                                     )ttt
                                             )tttt
                                     where rn = 1
                                     )ttttt
 where e.job_id = j.job_id
 and e.department_id = ttttt.department_id;
 
 


/*
문제8.
평균 급여(salary)가 가장 높은 부서는?
*/
select  d.department_id,
        d.department_name
from departments d, (select rn,
                            tttt.department_id 
                     from    (select rownum rn,
                                    ttt.maxAvgSalary as Average_Salary,
                                    ttt.department_id     
                            from    (select max(tt.avgSalary) maxAvgSalary,
                                            tt.department_id
                                    from    (select t.avgSalary,
                                                    t.department_id
                                            from    (select round(avg(salary), 0) avgSalary,
                                                             department_id
                                                    from employees
                                                    group by department_id) t
                                            ) tt 
                                    group by tt.department_id
                                    order by maxAvgSalary desc
                                    )ttt
                             )tttt
                    where rn = 1
                    )ttttt
where d.department_id = ttttt.department_id;



/*
문제9.
평균 급여(salary)가 가장 높은 지역은?
*/
select  re.region_name
from    regions re, (select rn,
                            tttt.region_id 
                    from    (select rownum rn,
                                    ttt.maxAvgSalary as Average_Salary,
                                    ttt.region_id     
                             from    (select max(tt.avgSalary) maxAvgSalary,
                                            tt.region_id
                                     from    (select t.avgSalary,
                                                     t.region_id
                                             from    (select  round(avg(e.salary), 0) avgSalary,
                                                              r.region_id
                                                     from     employees e, 
                                                              departments d, 
                                                              locations l, 
                                                              countries c, 
                                                              regions r 
                                                     where e.employee_id = d.manager_id
                                                     and d.location_id = l.location_id
                                                     and l.country_id = c.country_id
                                                     and c.region_id = r.region_id
                                                     and e.manager_id is not null
                                                     group by r.region_id
                                                     ) t
                                             ) tt 
                                     group by tt.region_id
                                     order by maxAvgSalary desc
                                     )ttt
                             )tttt
                 where rn = 1
                 )ttttt
where re.region_id = ttttt.region_id;




/*
문제10.
평균 급여(salary)가 가장 높은 업무는?
*/
select  jo.job_id
from jobs jo, (select rn,
                            tttt.job_id 
                     from    (select rownum rn,
                                    ttt.maxAvgSalary as Average_Salary,
                                    ttt.job_id     
                            from    (select max(tt.avgSalary) maxAvgSalary,
                                            tt.job_id
                                    from    (select t.avgSalary,
                                                    t.job_id
                                             from    (select round(avg(salary), 0) avgSalary,
                                                             e.job_id
                                                      from employees e, departments d, jobs j
                                                      where e.employee_id = d.manager_id
                                                      and e.job_id = j.job_id
                                                      and e.manager_id is not null
                                                      group by j.job_id
                                                      )t
                                              )tt
                                    group by tt.job_id
                                    order by maxAvgSalary desc
                                    )ttt
                             )tttt
                    where rn = 1
                    )ttttt
where jo.job_id = ttttt.job_id;









