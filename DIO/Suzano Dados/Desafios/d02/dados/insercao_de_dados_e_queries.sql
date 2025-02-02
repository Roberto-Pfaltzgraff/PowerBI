-- Acessando o Esquema ou Base de Dados desejada
use azure_company;

-- *** Inicio da carga de dados ***

-- Inserindo ou carregando dados na tabela employee
insert into employee
   (Fname, Minit, Lname, Ssn, Bdate, Address, Sex, Salary, Super_ssn, Dno)
values
   ('James', 'E', 'Borg', 888665555, '1937-11-10', '450-Stone-Houston-TX', 'M', 55000, NULL, 1),
   ('Franklin', 'T', 'Wong', 333445555, '1955-12-08', '638-Voss-Houston-TX', 'M', 40000, 888665555, 5),
   ('John', 'B', 'Smith', 123456789, '1965-01-09', '731-Fondren-Houston-TX', 'M', 30000, 333445555, 5),
   ('Jennifer', 'S', 'Wallace', 987654321, '1941-06-20', '291-Berry-Bellaire-TX', 'F', 43000, 888665555, 4),
   ('Ramesh', 'K', 'Narayan', 666884444, '1962-09-15', '975-Fire-Oak-Humble-TX', 'M', 38000, 333445555, 5),
   ('Joyce', 'A', 'English', 453453453, '1972-07-31', '5631-Rice-Houston-TX', 'F', 25000, 333445555, 5),
   ('Ahmad', 'V', 'Jabbar', 987987987, '1969-03-29', '980-Dallas-Houston-TX', 'M', 25000, 987654321, 4),
   ('Alicia', 'J', 'Zelaya', 999887777, '1968-01-19', '3321-Castle-Spring-TX', 'F', 25000, 987654321, 4);

-- Inserindo ou carregando dados na tabela dependent
insert into dependent values (333445555, 'Alice', 'F', '1986-04-05', 'Daughter'),
							 (333445555, 'Theodore', 'M', '1983-10-25', 'Son'),
                             (333445555, 'Joy', 'F', '1958-05-03', 'Spouse'),
                             (987654321, 'Abner', 'M', '1942-02-28', 'Spouse'),
                             (123456789, 'Michael', 'M', '1988-01-04', 'Son'),
                             (123456789, 'Alice', 'F', '1988-12-30', 'Daughter'),
                             (123456789, 'Elizabeth', 'F', '1967-05-05', 'Spouse');

-- Inserindo ou carregando dados na tabela departament
insert into departament values ('Research', 5, 333445555, '1988-05-22','1986-05-22'),
							   ('Administration', 4, 987654321, '1995-01-01','1994-01-01'),
                               ('Headquarters', 1, 888665555,'1981-06-19','1980-06-19');

-- Inserindo ou carregando dados na tabela dept_locations
insert into dept_locations values (1, 'Houston'),
								 (4, 'Stafford'),
                                 (5, 'Bellaire'),
                                 (5, 'Sugarland'),
                                 (5, 'Houston');

-- Inserindo ou carregando dados na tabela project
insert into project values ('ProductX', 1, 'Bellaire', 5),
						   ('ProductY', 2, 'Sugarland', 5),
						   ('ProductZ', 3, 'Houston', 5),
                           ('Computerization', 10, 'Stafford', 4),
                           ('Reorganization', 20, 'Houston', 1),
                           ('Newbenefits', 30, 'Stafford', 4);

-- Inserindo ou carregando dados na tabela works_on
insert into works_on values (123456789, 1, 32.5),
							(123456789, 2, 7.5),
                            (666884444, 3, 40.0),
                            (453453453, 1, 20.0),
                            (453453453, 2, 20.0),
                            (333445555, 2, 10.0),
                            (333445555, 3, 10.0),
                            (333445555, 10, 10.0),
                            (333445555, 20, 10.0),
                            (999887777, 30, 30.0),
                            (999887777, 10, 10.0),
                            (987987987, 10, 35.0),
                            (987987987, 30, 5.0),
                            (987654321, 30, 20.0),
                            (987654321, 20, 15.0),
                            (888665555, 20, 0.0);


-- *** Consultas SQL p/ validar os dados carregados ***

-- Consultando dados carregados da tabela employee
select * from employee;

-- Consultando ssn da tabela employee com a respectiva quantidade de dependente
select e.Ssn, count(d.Essn)
from employee e, dependent d
where (e.Ssn = d.Essn)
group by e.Ssn;

-- Consultando dados carregados da tabela dependente
select * from dependent;

-- Consultando data de aniversário e endereço de um funcionário especifico
SELECT Bdate, Address FROM employee
WHERE Fname = 'John' AND Minit = 'B' AND Lname = 'Smith';

-- Consultando departamento especifico da tabela departament
select * from departament where Dname = 'Research';

-- Consultando o nome, sobrenome e endereço dos empregados do departamento Research
SELECT Fname, Lname, Address
FROM employee, departament
WHERE Dname = 'Research' AND Dnumber = Dno;

-- Consultando dados carregados da tabela project
select * from project;


-- *** Expressões e concatenação de strings ***

-- recuperando informações dos departamentos e relacionando com dept_locations
select Dname as Department, Mgr_ssn as Manager
from departament d, dept_locations l
where d.Dnumber = l.Dnumber;

-- Query anterior ajustada para obeter nome e sobrenome no lugar da matricula
-- padrão sql -> || no MySQL usa a função concat()
select Dname as Department, concat(Fname, ' ', Lname) as NomeSobrenome
from departament d, dept_locations l, employee e
where d.Dnumber = l.Dnumber
  and Mgr_ssn = e.Ssn;

-- recuperando info dos projetos em Stafford
select * from project, departament where Dnum = Dnumber and Plocation = 'Stafford';

-- recuperando info sobre os departamentos e projetos localizados em Stafford (Query completa)
SELECT p.Pnumber, p.Dnum, e.Lname, e.Address, e.Bdate
FROM project p, departament d, employee e
WHERE p.Dnum = d.Dnumber
  AND d.Mgr_ssn = e.Ssn
  AND p.Plocation = 'Stafford';

-- Consultando empregados dos departamentos de número 3, 6 e 9  (Não há)
SELECT * FROM employee WHERE Dno IN (3,6,9);


-- *** Operadores lógicos ***

-- Buscar data nascimento e endereço de funcionario especifico
SELECT Bdate, Address
FROM EMPLOYEE
WHERE Fname = 'John' AND Minit = 'B' AND Lname = 'Smith';

-- Buscar Nome, Sobrenome e Endereço de empregados do departamento Research
SELECT Fname, Lname, Address
FROM EMPLOYEE, DEPARTAMENT
WHERE Dname = 'Research' AND Dnumber = Dno;


-- *** Expressões e alias ***

-- recolhendo o valor do INSS-*
select Fname, Lname, Salary, Salary*0.011 from employee;
select Fname, Lname, Salary, Salary*0.011 as INSS from employee;
select Fname, Lname, Salary, round(Salary*0.011,2) as INSS from employee;

-- definir um aumento de salário para os gerentes que trabalham no projeto associado ao ProdutoX
select e.Fname, e.Lname, 1.1*e.Salary as increased_sal
from employee as e, works_on as w, project as p
where e.Ssn = w.Essn
  and w.Pno = p.Pnumber
  and p.Pname='ProductX';

-- concatenando nome com sobrenome e fornecendo alias para o nome do gerente de cada departamento
select Dname as Department, concat(Fname, ' ', Lname) as Manager
from departament d, dept_locations l, employee e
where d.Dnumber = l.Dnumber
  and Mgr_ssn = e.Ssn;

-- recuperando dados dos empregados que trabalham para o departamento de pesquisa
select Fname, Lname, Address
  from employee, departament
 where Dname = 'Research'
   and Dnumber = Dno;

-- definindo alias para legibilidade da consulta
select e.Fname, e.Lname, e.Address
  from employee e, departament d
 where d.Dname = 'Research'
   and d.Dnumber = e.Dno;
