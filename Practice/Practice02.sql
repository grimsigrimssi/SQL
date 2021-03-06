/*문제1
매니저가 있는 직원은 몇 명입니까? 아래의 결과가 나오도록 쿼리문을 작성하세요
*/
select count(*) haveMngCnt
from employees
where manager_id is not null;


/*문제2
직원 중에 최고임금(salary)과 최저임금을 "최고임금, 최저임금"프로젝션 타이틀로 함께 출력해 보세요.
두 임금의 차이는 얼마인가요? "최고임금 - 최저임금"이란 타이틀로 함께 출력해 보세요.
*/
select  max(salary) || '    ' || min(salary) as "최고임금, 최저임금",  
        max(salary) - min(salary) as "최고임금 - 최저임금"
from employees;


/*문제3
마지막으로 신입사원이 들어온 날은 언제 입니까? 다음 형식으로 출력해주세요.
예)2014년 07월 10일
*/
select to_char(min(hire_date), 'YYYY') || '년 ' || to_char(min(hire_date), 'MM') || '월 ' || to_char(min(hire_date), 'DD') ||'일' as "latestHireDate"
from employees;


/*문제4
부서별로 평균임금, 최고임금, 최저임금을 부서아이디(department_id)와 함께 출력합니다.
정렬순서는 부서번호(department_id) 내림차순입니다.
*/
select  round(avg(salary), 0),
        max(salary),
        min(salary)
from employees
group by department_id
order by department_id desc;



/*문제5
업무(job_id)별로 평균임금, 최고임금, 최저임금을 업무아이디(job_id)와 함께 출력하고 정렬 순서는 최저임금 내림차순, 평균임금(소수점 반올림), 오름차순 순입니다.
(정렬순서는 최소임금 2500 구간일때 확인해볼 것)
*/
select  job_id,
        min(salary),
        round(avg(salary), 0)      
from employees
group by job_id
order by min(salary) desc, avg(salary) asc;




/*문제6
가장 오래 근속한 직원의 입사일은 언제인가요? 다음 형식으로 출력해주세요
예)2001-01-13 토요일
*/
select  min(to_char(start_date, 'YYYY-MM-DD DAY'))
from job_history
order by length(max(end_date) - min(start_date));


/*문제7
평균임금과 최저임금의 차이가 2000 미만인 부서(department_id), 평균임금, 최저임금 
그리고 (평균임금 -최저임금)의 내림차순으로 정렬해서 출력하세요.
*/
select  department_id, 
        avg(salary), 
        min(salary),
        avg(salary)- min(salary) as "평균임금-최저임금"       
from employees
group by department_id 
having avg(salary)-min(salary) < 2000
order by avg(salary)- min(salary) desc;


/*문제8
업무(jobs)별로 최고임금과 최저임금의 차이을 출력해보세요.
차이를 확인할 수 있도록 내림차순으로 정렬하세요.
*/
select  job_id,
        max(max_salary), 
        min(min_salary)
from jobs
group by job_id
order by max(max_salary) desc, min(min_salary) desc;
        


/*문제9
2005년 이후 입사자중 관리자별로 평균급여 최소급여 최대급여를 알아보려고 한다.
출력은 관리자별로 평균급여가 5000이상 중에 평균급여 최소급여 최대급여를 출력합니다.
평균급여의 내림차순으로 정렬하고 평균급여는 소수점 첫째자리에서 반올림하여 출력합니다.
*/
select  round(avg(salary), 1),
        min(salary), 
        max(salary)
from employees
where hire_date >= '05/01/01'
group by manager_id
having avg(salary) >= 5000
order by avg(salary) desc;



/*문제10
아래회사는 보너스 지급을 위해 직원을 입사일 기준으로 나눌려고 합니다.
입사일이 02/12/31일 이전이면 '창립멤버', 03년은 '03년 입사', 04년은 '04년입사'
이후입사자는 '상장이후입사' optDate 컬럼의 데이터로 출력하세요.
정렬은 입사일로 오름차순으로 정렬합니다.
*/
select  case    when hire_date <= '02/12/31'                            then '창립멤버'
                when hire_date >= '03/01/01'  and  hire_date <= '03/12/31'  then '03년 입사'
                when hire_date >= '04/01/01'  and  hire_date <= '04/12/31'  then '04년 입사'
                else '상장이후입사'
        end "optDate"
from employees
order by hire_date asc;



select *
from employees;


