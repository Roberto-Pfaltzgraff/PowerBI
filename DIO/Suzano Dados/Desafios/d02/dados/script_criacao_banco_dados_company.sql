-- Criação do Esquema/DB azure_company
create schema if not exists azure_company;

-- Acessando o Esquema criado, azure_company
use azure_company;

-- Query para verificar constraints criadas, poderá ser utilizad após criação deste objetos para verificação
select * from information_schema.table_constraints where constraint_schema = 'azure_company';

-- Criação da tabela employee
CREATE TABLE employee(
	Fname varchar(15) not null,
    Minit char,
    Lname varchar(15) not null,
    Ssn char(9) not null, 
    Bdate date,
    Address varchar(30),
    Sex char,
    Salary decimal(10,2),
    Super_ssn char(9),
    Dno int not null,
    constraint chk_salary_employee check (Salary> 2000.0),
    constraint pk_employee primary key (Ssn)
);

-- Criação do auto-relacionamento da tabela employee para associar líder/gerente a subordinado
alter table employee 
	add constraint fk_employee 
	foreign key(Super_ssn) references employee(Ssn)
    on delete set null
    on update cascade;

-- Modificação da tabela employee para que a coluna Dno passe a ter o valor padrão 1, caso não seja informado valor em sua criação
alter table employee modify Dno int not null default 1;

-- Visualizar estrutura da tabela employee
desc employee;

-- Criação da tabela departament
create table departament(
	Dname varchar(15) not null,
    Dnumber int not null,
    Mgr_ssn char(9) not null,
    Mgr_start_date date, 
    Dept_create_date date,
    constraint chk_date_dept check (Dept_create_date < Mgr_start_date),
    constraint pk_dept primary key (Dnumber),
    constraint unique_name_dept unique(Dname),
    foreign key (Mgr_ssn) references employee(Ssn)
);

-- Alteração da FK 'departament_ibfk_1' que estabelece o relacionamento entre departament e employee
-- Para isso, é necessário excluir a FK e em seguida recriá-la da forma desejada. Logo usaremos: drop e add
-- Executando a query que visualiza as constraints, temos:
-- 'def', 'company_constraints', 'departament_ibfk_1', 'company_constraints', 'departament', 'FOREIGN KEY', 'YES'
alter table departament drop constraint departament_ibfk_1;
alter table departament 
		add constraint fk_dept foreign key(Mgr_ssn) references employee(Ssn)
        on update cascade;

-- Visualizar estrutura da tabela departament
desc departament;

-- Criação da tabela dept_locations
create table dept_locations(
	Dnumber int not null,
	Dlocation varchar(15) not null,
    constraint pk_dept_locations primary key (Dnumber, Dlocation),
    constraint fk_dept_locations foreign key (Dnumber) references departament (Dnumber)
);

-- Excluindo a FK fk_dept_locations (1ª etapa para modificação da FK)
alter table dept_locations drop constraint fk_dept_locations;

-- Recriando a FK fk_dept_locations da forma desejada (2ª e última etapa para modificação da FK)
alter table dept_locations 
	add constraint fk_dept_locations foreign key (Dnumber) references departament(Dnumber)
	on delete cascade
    on update cascade;

-- Criando a tabela project
create table project(
	Pname varchar(15) not null,
	Pnumber int not null,
    Plocation varchar(15),
    Dnum int not null,
    primary key (Pnumber),
    constraint unique_project unique (Pname),
    constraint fk_project foreign key (Dnum) references departament(Dnumber)
);

-- Criando a tabela works_on
create table works_on(
	Essn char(9) not null,
    Pno int not null,
    Hours decimal(3,1) not null,
    primary key (Essn, Pno),
    constraint fk_employee_works_on foreign key (Essn) references employee(Ssn),
    constraint fk_project_works_on foreign key (Pno) references project(Pnumber)
);

-- Criando a tabela dependent
create table dependent(
	Essn char(9) not null,
    Dependent_name varchar(15) not null,
    Sex char,
    Bdate date,
    Relationship varchar(8),
    primary key (Essn, Dependent_name),
    constraint fk_dependent foreign key (Essn) references employee(Ssn)
);

-- Visualizando estrutura da tabela dependent
desc dependent;

-- Visualizando as tabelas criadas
show tables;
