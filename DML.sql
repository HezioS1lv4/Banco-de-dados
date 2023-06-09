-- Criando biblioteca pra add tables
create database infosBiblioteca;
use infosBiblioteca;

-- Criando tables
create table tb_livro(
	isbn int not null primary key,
    titulo char(50),
    cd_editora int,
    cd_genero int,
    preco double
);

create table tb_genero(
	cd_genero int not null primary key,
    genero char(30)
);

create table tb_editora(
	cd_editora int not null primary key,
    editora char(30)
);

-- Fazendo relacionamento entre as tables

alter table tb_livro
add constraint fk_cd_editora foreign key (cd_editora)
references tb_editora (cd_editora);

alter table tb_livro
add constraint fk_cd_genero foreign key (cd_genero)
references tb_genero (cd_genero);

-- Fazendo insert de valores nas colunas

select * from tb_genero;
insert into tb_genero
(cd_genero, genero)
values
(1, 'Informatica'),
(2, 'Direito'),
(3, 'Engenharia Civil'),
(4, 'Engenharia Elétrica'),
(5, 'Enfermagem'),
(6, 'Medicina');


select * from tb_editora;
insert into tb_editora
(cd_editora, editora)
values
(1, 'person'),
(2, 'erica'),
(3, 'Pearson'),
(4, 'Saraiva'),
(5, 'Editora FTD'),
(6, 'ABRIL'),
(7, 'ÁTICA'),
(8, 'NOVA FRONTEIRA');


-- ###############################################

select * from tb_livro;

alter table tb_livro
add dt_livro date;

insert into tb_livro

(isbn, titulo, cd_editora, cd_genero, preco, dt_livro)
values
(1, 'banco de dados', 1, 1, 100.00, '2015-08-10'),
(2, 'engenharia de software', 1, 2, 200.00,'2014-08-20'),
(3, 'Algoritmos: Teoria e Prática', 3, 2, 220.00, '2015-01-10'),
(4, 'Livro - Eletrônico Estudante e Técnicos', 4, 3, 110.00, '2014-01-10'),
(5, 'Livro - Hardware: Versão Revisada e Atualizada', 2, 4, 100.00, '2014-02-10'),
(6, 'Livro - Redes de Computadores', 3, 5, 200.00, '2014-03-10'),
(7, 'Livro - Guyton & Hall - Tratado de Fisiologia', 2, 2, 300.00, '2014-04-10');

-- ###############################################

select * from infosBiblioteca;

use infosBiblioteca;

select * from tb_livro where preco > 200;
select * from tb_livro where preco = 100;
select * from tb_livro where titulo = 'redes';
select * from tb_livro where titulo like '%redes%';
select * from tb_livro where titulo like '%banco de dado%';
select * from tb_livro where preco between 150 and 250;
select * from tb_livro limit 3;
select * from tb_livro order by preco desc;
select * from tb_livro order by preco desc limit 3;
select * from tb_livro order by dt_livro desc limit 3;
select * from tb_livro order by dt_livro limit 3;
select * from tb_livro where cd_editora in (2,3);
select * from tb_livro where cd_editora = 3 and preco = 200;
select preco, titulo, dt_livro from tb_livro;
