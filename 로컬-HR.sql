select * from HR.employees;                                                     //사원 전체 출력
select * from employees where EMPLOYEE_ID >= 120 and employee_id < 130;         //사원 중 아이디가 120 이상 130 미만인 애들
select * from EMPLOYEES where salary > 5000 or salary < 1000;                   //월급 1000 초과부터 5000 미만들
select * from employees where first_name='Adam';                                //성(첫번째 이름)이 아담인 애
select * from employees where first_name like 'A%';                             //성이 A로 시작하는 애들
select * from employees where first_name like '_%a';                            //성의 2번째 글자가 a인 애들
select * from employees where first_name like '%a%';                            //성에 a들어간 애들
select * from employees where first_name like '%a%' order by salary desc;       //↑를 월급 오름차순 정렬
select department_id, department_name from departments;                         //department 부서원들의 아이디랑 이름
select hire_date from employees;                                                //사원들 입사일
select distinct hire_date from employees;                                       //↑ 여기에서 중복된건 제거
