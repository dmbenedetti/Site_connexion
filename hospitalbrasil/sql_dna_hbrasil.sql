use db_hosp_brasil;
create table tb_dna(
id_dna int identity primary key,
titulo varchar(250),
edicao varchar(50),
arquivo varchar(250),
imagem varchar(100)
);
create table tb_texto_dna(
id int identity primary key,
conteudo varchar(MAX)
);
insert into tb_texto_dna(conteudo) values('texto');
