create database biblioteca;
use biblioteca;

-- Criando base de dados

create table Categoria(
	idCategoria int not null primary key,
    nmCategoria varchar(50)
);

create table Editora( 
	IdEditora  int not null primary key, 
	nuEditora varchar(255), 
	nuTelefone varchar(10), 
	nuCNPJ varchar(14) 
);

create table TituloLivro(
	idTituloLivro int not null primary key,
    deTitulo varchar(255),
    COISBN varchar(50),
    nuAno varchar(4),
    idEditora int,
    idCategoria int 
);

create table AutorTituloLivro(
	idAutorLivro int not null primary key,
    idTituloLivro int,
    idAutor int 
);

create table Autor(
	idAutor int not null primary key,
    rmAutor varchar(100),
    nuCPF varchar(11)
);

create table Livro(
	idLivro int not null primary key,
    nuSerieLivro int,
    idTituloLivro int
);

create table EmprestimoLivro(
	idEmprestimoLivro int not null primary key,
    dtDevolucao date,
    idLivro int,
    idEmprestimo int
);

create table Emprestimo(
	idEmprestimo int not null primary key,
    dtEmprestimo date,
	idAluno int
);

create table Aluno(
	idAluno int not null primary key,
    nuRA varchar(8),
    naAluno varchar(100),
    nuTelefone varchar(10),
    deEndereco varchar(255)
);

-- Fazendo relacionamentos entre elas

alter table TituloLivro
add constraint fk_idEditora foreign key (IdEditora)
references editora (IdEditora);

alter table TituloLivro
add constraint fk_idCategoria foreign key (IdCategoria)
references Categoria (IdCategoria);

alter table AutorTituloLivro
add constraint fk_idTituloLivro foreign key (idTituloLivro)
references TituloLivro (idTituloLivro);

alter table AutorTituloLivro
add constraint fk_idAutor foreign key (idAutor)
references Autor (idAutor);

alter table Livro
add constraint fk_testeTituloLivro foreign key (idTituloLivro)
references TituloLivro (idTituloLivro);

alter table EmprestimoLivro
add constraint fk_idLivro foreign key (idLivro)
references Livro (idLivro);

alter table EmprestimoLivro
add constraint fk_idEmprestimo foreign key (idEmprestimo)
references Emprestimo (idEmprestimo);

alter table Emprestimo
add constraint fk_idAluno foreign key (idAluno)
references Aluno (idAluno);

