select * from HR.employees;                                                     //��� ��ü ���
select * from employees where EMPLOYEE_ID >= 120 and employee_id < 130;         //��� �� ���̵� 120 �̻� 130 �̸��� �ֵ�
select * from EMPLOYEES where salary > 5000 or salary < 1000;                   //���� 1000 �ʰ����� 5000 �̸���
select * from employees where first_name='Adam';                                //��(ù��° �̸�)�� �ƴ��� ��
select * from employees where first_name like 'A%';                             //���� A�� �����ϴ� �ֵ�
select * from employees where first_name like '_%a';                            //���� 2��° ���ڰ� a�� �ֵ�
select * from employees where first_name like '%a%';                            //���� a�� �ֵ�
select * from employees where first_name like '%a%' order by salary desc;       //�踦 ���� �������� ����
select department_id, department_name from departments;                         //department �μ������� ���̵�� �̸�
select hire_date from employees;                                                //����� �Ի���
select distinct hire_date from employees;                                       //�� ���⿡�� �ߺ��Ȱ� ����
