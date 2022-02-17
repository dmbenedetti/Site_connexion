/*Portal Rede D'Or
 *Data de criação:11/12/2013
 *Data de alteração: 
 *Desenvolvedor: Diego Amaral
 *Owner: Connexion
 */
 
 create database db_rede_dor;
 use db_rede_dor;
  /*
  * NÃO ESQUECER DE RODAR O SCRIPT DE ESTADOS E CIDADES ANTES DE EXECUTAR OS COMANDOS ABAIXO!!!!
  */
 create table TB_STATUS(
 id_status int not null identity primary key,
 nm_status varchar(50)
 );	
 insert into TB_STATUS values('ATIVO');
 insert into TB_STATUS values('DESATIVADO');
 insert into TB_STATUS values('PENDENTE');
 
 create table TB_HOSPITAL(
 id_hospital int not null primary key identity,
 nm_hospital varchar(100) not null,
 ds_hospital varchar(max),
 ds_site_hospital varchar(250),
 ds_endereco_hospital varchar(max),
 nr_telefone_hospital varchar(100),
 id_estado int not null,
 id_status int not null,
 constraint fk_estado_hosp Foreign Key (id_estado) references uf(cd_uf),
 constraint fk_status_hosp Foreign Key (id_status) references TB_STATUS(id_status)
 );
 insert into TB_HOSPITAL values('Portal','Portal Rede Dor','www.rededor.com.br','','',19,1);
 insert into TB_HOSPITAL values('Copa Dor','Hospital Copa Dor','www.copador.com.br','Rua Figueiredo de Magalhães, 875 Copacabana - RJ','21 2545-3600',19,1);
 create table TB_IDIOMA(
 id_idioma int not null identity primary key,
 nm_idioma varchar(50),
 ds_flag varchar(50),
 id_status int, 
 constraint fk_status_idioma Foreign Key (id_status) references TB_STATUS(id_status)
 );
 insert into TB_IDIOMA values('PT - BR','flag_brasil.png',1);
 insert into TB_IDIOMA values('EN - USA','flag_eua.png',1);
 insert into TB_IDIOMA values('ES - SP','flag_espanha.png',1);
 /*avaliar necessidade deste código, escrevi mas não lembro o porque.
  *analizando o cod agora não lembro o pq escrevi mas deixarei comentado caso precise depois
 create table TB_ESTADO(
 id_estado int not null primary key identity,
 nm_estado varchar(100),
 id_status int not null
 constraint fk_status_estado Foreign Key (id_status) references TB_STATUS(id_status)
 );
 */
 create table TB_EPSECIALIDADE(
 id_especialidade int not null identity primary key,
 nm_especialidade varchar(100),
 ds_especialidade varchar(max),
 id_status int,
 constraint fk_status_especialidade Foreign Key (id_status) references TB_STATUS(id_status)
 );
 create table TB_EXAME(
 id_exame int not null identity primary key,
 nm_exame varchar(100),
 ds_exame varchar(max),
 id_status int,
 constraint fk_status_exame Foreign Key (id_status) references TB_STATUS(id_status)
 );
 create table TB_PRONTOSOCORRO(
 id_prontosocorro int not null identity primary key,
 nm_prontosocorro varchar(100),
 ds_prontosocorro varchar(max),
 id_status int,
 constraint fk_status_prontosocorro Foreign Key (id_status) references TB_STATUS(id_status)
 );
 /*TABELAS DE RELACIONAMENTO*/
 create table TB_ESPECIALIDADE_HOSPITAL(
 id_especialidade_hospital int not null primary key identity,
 id_hospital int not null,
 id_especialidade int not null,
 constraint fk_especialidade_hospital_id_hospital foreign key (id_hospital) references TB_HOSPITAL(id_hospital),
 constraint fk_especialidade_hospital_id_especialidade foreign key (id_especialidade) references TB_EPSECIALIDADE(id_especialidade)
 );
 create table TB_EXAME_HOSPITAL(
 id_exame_hospital int not null primary key identity,
 id_hospital int not null,
 id_exame int not null,
 constraint fk_exame_hospital_id_hospital foreign key (id_hospital) references TB_HOSPITAL(id_hospital),
 constraint fk_exame_hospital_id_exame foreign key (id_exame) references TB_EXAME(id_exame)
 );
 create table TB_PRONTOSOCORRO_HOSPITAL(
 id_prontosocorro_hospital int not null primary key identity,
 id_hospital int not null,
 id_prontosocorro int not null,
 constraint fk_prontosocorro_hospital_id_hospital foreign key (id_hospital) references TB_HOSPITAL(id_hospital),
 constraint fk_prontosocorro_hospital_prontosocorro foreign key (id_prontosocorro) references TB_PRONTOSOCORRO(id_prontosocorro)
 );
 /******/
 
 /*login admin*/
 create table TB_ADMIN_USER(
 id_user int not null primary key identity,
 nm_user varchar(200),
 ds_login varchar(200),
 ds_password varchar(24),
 ds_email varchar(200),
 id_status int,
 constraint fk_status_user Foreign Key (id_status) references TB_STATUS(id_status)
 );
 insert into TB_ADMIN_USER values('Administrador','connexion','conn001@','ds.suporting@gmail.com',1);
 insert into TB_ADMIN_USER values('Usuário Teste','user','teste','ds.suporting@gmail.com',1);
 
 create table TB_PERMISSAO_ADMIN(
 id_permissao int not null primary key identity,
 id_user int,
 id_hospital int,
 constraint fk_permissoes_user Foreign Key (id_user) references TB_ADMIN_USER(id_user),
 constraint fk_permissoes_hospital foreign key (id_hospital) references TB_HOSPITAL(id_hospital)
 );
 insert into TB_PERMISSAO_ADMIN values (1,1);
 insert into TB_PERMISSAO_ADMIN values (2,2);
 
 
 /*HOME PAGE*/
 create table TB_PORTAL_SLIDER(
 id_slider int not null identity primary key,
 ds_imagem varchar(200),
 ds_link varchar(max),
 id_status int,
 constraint fk_slider_status Foreign Key (id_status) references TB_STATUS(id_status)
 )
 alter table TB_PORTAL_SLIDER add id_idioma int;
 alter table TB_PORTAL_SLIDER add Constraint FK_slider_idioma foreign key (id_idioma) references TB_IDIOMA(id_idioma);
 
 
 
 create table TB_PORTAL_BANNER(
 id_banner int not null identity primary key,
 ds_imagem varchar(200),
 ds_link varchar(max),
 ds_descrição varchar(200),
 id_status int,
 constraint fk_banner_status Foreign Key (id_status) references TB_STATUS(id_status)
 );
 insert into TB_PORTAL_BANNER values ('banner1.jpg','pagina1.aspx','banner nossas unidades',1);
 insert into TB_PORTAL_BANNER values ('banner2.jpg','pagina2.aspx','banner agende seu check up',1);
 insert into TB_PORTAL_BANNER values ('banner3.jpg','pagina3.aspx','banner Dor Soluções',1);
 insert into TB_PORTAL_BANNER values ('banner4.jpg','pagina4.aspx','banner Centro de Oncologia Dor',1);
 
 alter table TB_PORTAL_BANNER add id_idioma int;
 alter table TB_PORTAL_BANNER add Constraint FK_banner_idioma foreign key (id_idioma) references TB_IDIOMA(id_idioma);
 update TB_PORTAL_BANNER set id_idioma = 1;
 insert into TB_PORTAL_BANNER values ('banner1_en.jpg','pagina1.aspx','banner nossas unidades',1,2);
 insert into TB_PORTAL_BANNER values ('banner2_en.jpg','pagina2.aspx','banner agende seu check up',1,2);
 insert into TB_PORTAL_BANNER values ('banner3_en.jpg','pagina3.aspx','banner Dor Soluções',1,2);
 insert into TB_PORTAL_BANNER values ('banner4_en.jpg','pagina4.aspx','banner Centro de Oncologia Dor',1,2);
 
 insert into TB_PORTAL_BANNER values ('banner1_es.jpg','pagina1.aspx','banner nossas unidades',1,3);
 insert into TB_PORTAL_BANNER values ('banner2_es.jpg','pagina2.aspx','banner agende seu check up',1,3);
 insert into TB_PORTAL_BANNER values ('banner3_es.jpg','pagina3.aspx','banner Dor Soluções',1,3);
 insert into TB_PORTAL_BANNER values ('banner4_es.jpg','pagina4.aspx','banner Centro de Oncologia Dor',1,3);
 
  
  
create table TB_NEWSLETTER(
id_newsletter int not null identity primary key,
id_hospital int,
dt_data datetime,
ds_email varchar(250)
constraint fk_newsletter_hospital foreign key (id_hospital) references TB_HOSPITAL(id_hospital)
 );
 /******/
 
 create table TB_PORTAL_SESSAO(
 id_sessao int not null primary key identity,
 nm_sessao varchar(50),
 id_status int,
 constraint fk_sessao_status Foreign Key (id_status) references TB_STATUS(id_status)
 );
 insert into TB_PORTAL_SESSAO values('O grupo',1);
 insert into TB_PORTAL_SESSAO values('Nossas Unidades',1);
 insert into TB_PORTAL_SESSAO values('Publicações e Campanhas',1);
 insert into TB_PORTAL_SESSAO values('Institutos Estudos e pesquisas',1);
 insert into TB_PORTAL_SESSAO values('Imprensa',1);
 insert into TB_PORTAL_SESSAO values('Fale Conosco',1);
 insert into TB_PORTAL_SESSAO values('Profissionais da Saúde',1);
 
 /*tabela TB_PORTAL_TIPO
  *aqui estão os tipos de conteúdo que poderão ser cadastrado no site
  *na tabela de conteúdo deverá conter o id do tipo de conteúdo a que se refere
  */
 create table TB_PORTAL_TIPO(
 id_tipo int not null primary key identity,
 nm_tipo varchar(50),
 id_status int, 
 constraint fk_sessao_tipo Foreign Key (id_status) references TB_STATUS(id_status)
 );
 insert into TB_PORTAL_TIPO values('Páginas Internas',1);
 insert into TB_PORTAL_TIPO values('Link Interno',1);
 insert into TB_PORTAL_TIPO values('Link Externo',1);
 insert into TB_PORTAL_TIPO values('Campanhas Publicitárias',1);
 insert into TB_PORTAL_TIPO values('Notícias',1);
 insert into TB_PORTAL_TIPO values('Releases',1);
 insert into TB_PORTAL_TIPO values('IEP',1);
 insert into TB_PORTAL_TIPO values('PodCast',1);
 insert into TB_PORTAL_TIPO values('Revista Sua Saúde',1);
 insert into TB_PORTAL_TIPO values('Formulário',1);
 insert into TB_PORTAL_TIPO values('Histórico',1);
 
 
 /*tabela tb_portal_controle_noticia
  *Essa tabela serve para cadastrar um id para cada notícia ou release.
  *Toda notícia, independente para qual site for publicada, será cadastrada um id nesta tabela que será vinculado
  na tabela tb_portal_conteudo junto com todo o conteúdo da notícia ou release
  *Nos casos que a mesma notícia for publicada em mais de um site, será inserido uma linha na tabela tb_portal_conteudo
  para cada site vinculada com o id desta tabela, assim quando for atualizar a noticia usaremos o id da coluna id_noticia e não o id_conteudo.
  */
 create table TB_CONTROLE_NOTICIA(
 id_noticia int not null primary key identity,
 dt_noticia datetime,
 id_status int, 
 id_usuario int,/**/
 constraint fk_controle_noticia_status Foreign Key (id_status) references TB_STATUS(id_status)
 );
 create table TB_CONTROLE_RELEASE(
 id_release int not null primary key identity,
 dt_release datetime,
 id_status int, 
 id_usuario int,/**/
 constraint fk_controle_noticia_status Foreign Key (id_status) references TB_STATUS(id_status)
 );
 /*Tabela TB_PORTAL_EDICAO_REVISTA
  *A edição será cadastrada nesta tabela mas todo seu conteúdo será cadastrado na tabela tb_portal_conteudo
  *vinculado ao id da edição aqui cadastrado.
  */
 create table TB_PORTAL_EDICAO_REVISTA(
 id_edicao int not null primary key identity,
 nr_edicao int not null,
 dt_edicao datetime,
 id_status int,
 constraint fk_edicao_revista_status Foreign Key (id_status) references TB_STATUS(id_status)
 );
 alter table TB_PORTAL_EDICAO_REVISTA add ds_arquivo varchar(200);
 alter table TB_PORTAL_EDICAO_REVISTA add ds_imagem varchar(200);
 alter table TB_PORTAL_EDICAO_REVISTA add ds_destaque varchar(200);
 alter table TB_PORTAL_EDICAO_REVISTA add ds_descricao varchar(200);


 create table TB_PORTAL_ESPECIALISTA(
 id_especialista int not null primary key identity,
 nm_especialista varchar(200),
 id_status int,
 constraint fk_portal_especialistas_status Foreign Key (id_status) references TB_STATUS(id_status)
 );

 create table TB_PORTAL_TEMA(
 id_tema int not null primary key identity,
 nm_tema varchar(200),
 id_status int,
 constraint fk_portal_tema_status Foreign Key (id_status) references TB_STATUS(id_status)
 );

 create table TB_PORTAL_SAUDE_HSL_DOR(
 id_saude int not null primary key identity,
 nm_titulo varchar(200),
 id_espedcialista int,
 id_tema int,
 id_status int,
 constraint fk_portal_saude_status Foreign Key (id_status) references TB_STATUS(id_status),
 constraint fk_portal_saude_tema Foreign Key (id_tema) references TB_PORTAL_TEMA(id_tema),
 constraint fk_portal_saude_especialista Foreign Key (id_espedcialista) references TB_PORTAL_ESPECIALISTA(id_especialista)
 );
 
 create table TB_PORTAL_PROGRAMETES(
 id_programete int not null primary key identity,
 nm_titulo varchar(200),
 ds_video varchar(max),
 id_status int,
 constraint fk_portal_programente_status Foreign Key (id_status) references TB_STATUS(id_status),
 );
 create table TB_PORTAL_PROGRAMETES_DESTAQUE(
 id_programete int not null primary key identity,
 nm_titulo varchar(200),
 ds_video varchar(max)
 );
 insert into TB_PORTAL_PROGRAMETES_DESTAQUE values('titulo exemplo','codigo do video exemplo');
 
 create table TB_PORTAL_PROGRAMETES_TEXTO(
 id_programete int not null primary key identity,
 ds_texto varchar(MAX),
 );
 insert into TB_PORTAL_PROGRAMETES_TEXTO values('texto de exemplo');

 /* parei aqui ---------*/


 create table TB_FORMULARIOS(
 id_formulario int not null primary key identity,
 id_hospital int,
 id_status int,
 nm_formulário varchar(100),
 ds_arquivo varchar(100),
 constraint fk_formulario_hospital Foreign Key (id_hospital) references TB_HOSPITAL(id_hospital),
 constraint fk_formulario_status Foreign Key (id_status) references TB_STATUS(id_status)
 );
 insert into TB_FORMULARIOS values(1,1,'Fale Conosco','form1.aspx');


 create table TB_PORTAL_CONTEUDO(
 id_conteudo int not null primary key identity,
 --id_hospital int,/*indica a qual hospital pertence*/
 id_idioma int, /*indica qual idioma está escrito*/
 id_status int, /*indica a situação do conteúdo*/
 id_sessao int, /*indica onde será exibido o conteúdo*/
 id_tipo int, /*indica qual tipo de conteúdo se refere*/
 dt_conteudo datetime, /*data em que o conteúdo fou publicado*/
 ds_visivel bit, /*quando setado true exibe no menu, quando for false o conteúdo mesmo com status ativo não aparecerá no menu*/
 nm_titulo varchar(200), /*Titulo do conteúdo, seja página, noticia, revista, podcast release, formulário, etc....*/
 ds_resumo varchar(max), /*um breve resumo do conteúdo, usado mais em noticias releases e nas ferra,ferramentas de busca*/
 ds_conteudo varchar(max),/*todo conteúdo html*/
 ds_imgDestaque varchar(200), /*quando nescessário exibir uma imagem para chamada*/
 ds_url varchar(200), /*quando for link externo/interno ou formulário especificar pra qual url deve ir*/
 id_noticia int, /*quando for notícia ou release vincular o id da notícia que se refere*/
 nr_edicaorevista int, /*quando for revista vincular o id da edição a qual se refere*/
 ds_sessao_revista varchar(200), /*escrever o nome da sessão da revista que pertence a matéria.*/
 ds_materiaDestaque bit, /*true quando a for a matéria destaque da capa*/
 constraint fk_interna_status Foreign Key (id_status) references TB_STATUS(id_status),
 constraint fk_interna_idioma Foreign Key (id_idioma) references TB_IDIOMA(id_idioma), 
 --constraint fk_interna_hospital Foreign Key (id_hospital) references TB_HOSPITAL(id_hospital),
 constraint fk_interna_sessao Foreign Key (id_sessao) references TB_PORTAL_SESSAO(id_sessao),
 constraint fk_interna_tipo Foreign Key (id_tipo) references TB_PORTAL_TIPO(id_tipo),
 constraint fk_interna_noticia Foreign Key (id_noticia) references TB_CONTROLE_NOTICIA(id_noticia),
 constraint fk_interna_edicao Foreign Key (nr_edicaorevista) references TB_PORTAL_EDICAO_REVISTA(id_edicao)
 );
 /*tabela tb_portal_arquivo
  * quando for podcast ou qualquer outro tipo de conteúdo em que precise subir arquivos ao servidor
  * vincular o id do conteúdo que se refere e o nome do arquivo.
  */
 create table TB_PORTAL_ARQUIVO(
 id_arquivo int not null primary key identity,
 id_conteudo int,
 mn_arquivo varchar(200),
 ds_arquivo varchar(200),
 dt_arquivo datetime,
 id_status int,
 constraint fk_arquivo_status Foreign Key (id_status) references TB_STATUS(id_status),
 constraint fk_arquivo_conteudo Foreign Key (id_conteudo) references TB_PORTAL_CONTEUDO(id_conteudo)
 );
 
 /*Tableas da área médica*/
 create table TB_AREA_MEDICA_SEXO_USER(
 id_sexo int not null primary key identity,
 nm_sexo varchar(10)
 );
 insert into TB_AREA_MEDICA_SEXO_USER values('Masculino');
 insert into TB_AREA_MEDICA_SEXO_USER values('Feminino');
 
 create table TB_AREA_MEDICA_OCUPACAO_USER(
 id_ocupacao int not null primary key identity,
 nm_ocupacao varchar(10),
 id_status int,
 constraint fk_ocupacao_status Foreign Key (id_status) references TB_STATUS(id_status)
 );
 insert into TB_AREA_MEDICA_OCUPACAO_USER values('Médico',1);
 insert into TB_AREA_MEDICA_OCUPACAO_USER values('Estudante de medicina',1);
 insert into TB_AREA_MEDICA_OCUPACAO_USER values('Outros profissionais de saúde',1);

  --cadastro de usuários
 create table TB_AREA_MEDICA_USERS(
cod_user int not null primary key identity,
nm_user varchar(200),
nm_sobrenome_user varchar(200),
ds_login varchar(200),
id_sexo int,
ds_email varchar(200),
ds_senha varchar(18),
id_ocupacao int,
ds_telefone varchar(60),
id_uf int,
id_cidade int,
id_status int,
constraint FK_AREA_MEDICA_USERS_estado foreign key (id_uf) references uf(cd_uf),
constraint FK_AREA_MEDICA_USERS_cidade foreign key (id_cidade) references cidades(cd_cidade),
constraint fk_AREA_MEDICA_USERS_status Foreign Key (id_status) references TB_STATUS(id_status),
constraint fk_AREA_MEDICA_USERS_sexo Foreign Key (id_status) references TB_AREA_MEDICA_SEXO_USER(id_sexo),
constraint fk_AREA_MEDICA_USERS_ocupacao Foreign Key (id_ocupacao) references TB_AREA_MEDICA_OCUPACAO_USER(id_ocupacao)
 );
 
 --revista Med'Dor
 create table TB_REVISTA_MEDDOR_EDICAO(
 id_edicao int not null primary key identity,
 dt_edicao datetime,
 ds_dados_edicao varchar(200),
 ds_destaque varchar(200),
 ds_arquivo varchar(50),
 ds_tamanho_arquivo varchar(20),
 ds_imagem_edicao varchar(50),
 id_status int,
 constraint fk_REVISTA_MEDDOR_status Foreign Key (id_status) references TB_STATUS(id_status),
 );
 
 create table TB_REVISTA_MEDDOR_MATERIAS(
 id_materia int not null primary key identity,
 id_edicao int,
 nm_sessao varchar(200),
 nm_titulo varchar(200),
 ds_conteudo varchar(MAX),
 id_status int,
 constraint FK_REVISTA_MEDDOR_MATERIAS_edicao foreign key (id_edicao) references TB_REVISTA_MEDDOR_EDICAO(id_edicao),
 constraint fk_REVISTA_MEDDOR_MATERIAS_status Foreign Key (id_status) references TB_STATUS(id_status)
 );
 
 -- CURSOS E PALESTRAS
 create table TB_CURSOS_PALESTRAS(
 id_curso_palestra int not null primary key identity,
 nm_titulo varchar(200),
 dt_data datetime,
 ds_horario varchar(50),
 ds_local varchar(100),
 ds_endereco varchar(200),
 dt_inscricoes datetime,
 ds_taxa varchar(20),
 ds_conteudo varchar(max),
 id_status int, 
 constraint fk_CURSOS_PALESTRAS_status Foreign Key (id_status) references TB_STATUS(id_status)
 );
 
 create table TB_CURSOS_PALESTRAS_ESPECIALIDADES(
 id_controle int not null primary key identity,
 id_especialidade int,
 id_cursos_palestra int,
 constraint fk_TB_CURSOS_PALESTRAS_ESPECIALIDADES_curos_palestra foreign key (id_cursos_palestra) references TB_CURSOS_PALESTRAS(id_curso_palestra),
 constraint fk_TB_CURSOS_PALESTRAS_ESPECIALIDADES_especialidade foreign key (id_especialidade) references TB_EPSECIALIDADE(id_especialidade)
 );
 /*
  *Perguntar sobre o local, se será vinculado a um hospital ou será um campo livre
  *vide exemplo de um caso do site em produção
  *http://www.rededor.com.br/cursos-e-palestras/diagnosticos-de-morte-encefalica
  *http://www.ictuspos.com.br/curso_individual.asp?codal=124720120126
  *percebi também que alguns dos cursos e palestras são nos hospitais associados que não serão gerenciados pelo cms
  *caso necessite sugerir uma tabela de cadastro de unidades/locais de cursos e palestras
  *daí na hora de cadastrar é só escolher um local cadastrado nesta tabela.
  *
  *outra questão é referente a inscrição. Eu ví que alguns deles são gratuitos sendo nescessário apenas comparecer 
  *no local na data e horario. Não é nescessario cadastro de inscrição.
  * Para os que necessitam de inscrição, serão formulário internos ou externos?
  * se forem internos o que fazer? armazena no banco de dados ou apenas envia por email?
  */
  
  /*
  * outra questão a levantar é referente ao EDUCAÇÃO CONTINUADA
  * o que deve ser feito com esse formulario??
  */
  
  
  /*início do script para os outros hospitais*/
  
  create table TB_HOSPITAIS_SESSAO(
 id_sessao int not null primary key identity,
 nm_sessao varchar(50),
 id_status int,
 constraint fk_HOSPITAIS_sessao_status Foreign Key (id_status) references TB_STATUS(id_status)
 );
 insert into TB_HOSPITAIS_SESSAO values('O Hospital',1);
 insert into TB_HOSPITAIS_SESSAO values('Servicos',1);
 insert into TB_HOSPITAIS_SESSAO values('Exames e Especialidades',1);
 insert into TB_HOSPITAIS_SESSAO values('Imprensa',1);
 insert into TB_HOSPITAIS_SESSAO values('Profissionais da Saúde',1);
 insert into TB_HOSPITAIS_SESSAO values('Fale Conosco',1);
 
 
 /*tabela TB_PORTAL_TIPO
  *aqui estão os tipos de conteúdo que poderão ser cadastrado no site
  *na tabela de conteúdo deverá conter o id do tipo de conteúdo a que se refere
  */
 create table TB_HOSPITAIS_TIPO(
 id_tipo int not null primary key identity,
 nm_tipo varchar(50),
 id_status int, 
 constraint fk_HOSPITAIS_tipo_CONTEUDO Foreign Key (id_status) references TB_STATUS(id_status)
 );
 insert into TB_HOSPITAIS_TIPO values('Páginas Internas',1);
 insert into TB_HOSPITAIS_TIPO values('Notícias',1);
 insert into TB_HOSPITAIS_TIPO values('Releases',1);
 insert into TB_HOSPITAIS_TIPO values('Formulário',1);
 insert into TB_HOSPITAIS_TIPO values('Link Interno',1);
 insert into TB_HOSPITAIS_TIPO values('Link Externo',1);
  
  
  create table TB_HOSPITAIS_CONTEUDO(
 id_conteudo int not null primary key identity,
 id_hospital int,/*indica a qual hospital pertence*/
 id_idioma int, /*indica qual idioma está escrito*/
 id_status int, /*indica a situação do conteúdo*/
 id_sessao int, /*indica onde será exibido o conteúdo*/
 id_tipo int, /*indica qual tipo de conteúdo se refere*/
 dt_conteudo datetime, /*data em que o conteúdo fou publicado*/
 ds_visivel bit, /*quando setado true exibe no menu, quando for false o conteúdo mesmo com status ativo não aparecerá no menu*/
 nm_titulo varchar(200), /*Titulo do conteúdo, seja página, noticia, revista, podcast release, formulário, etc....*/
 ds_resumo varchar(max), /*um breve resumo do conteúdo, usado mais em noticias releases e nas ferra,ferramentas de busca*/
 ds_conteudo varchar(max),/*todo conteúdo html*/
 ds_imgDestaque varchar(200), /*quando nescessário exibir uma imagem para chamada*/
 ds_url varchar(200), /*quando for link externo/interno ou formulário especificar pra qual url deve ir*/
 id_noticia int, /*quando for notícia ou release vincular o id da notícia que se refere*/
 nr_edicaorevista int, /*quando for revista vincular o id da edição a qual se refere*/
 ds_sessao_revista varchar(200), /*escrever o nome da sessão da revista que pertence a matéria.*/
 ds_materiaDestaque bit, /*true quando a for a matéria destaque da capa*/
 constraint fk_interna_status Foreign Key (id_status) references TB_STATUS(id_status),
 constraint fk_interna_idioma Foreign Key (id_idioma) references TB_IDIOMA(id_idioma), 
 constraint fk_interna_hospital Foreign Key (id_hospital) references TB_HOSPITAL(id_hospital),
 constraint fk_interna_sessao Foreign Key (id_sessao) references TB_PORTAL_SESSAO(id_sessao),
 constraint fk_interna_tipo Foreign Key (id_tipo) references TB_PORTAL_TIPO(id_tipo),
 constraint fk_interna_noticia Foreign Key (id_noticia) references TB_CONTROLE_NOTICIA(id_noticia),
 constraint fk_interna_edicao Foreign Key (nr_edicaorevista) references TB_PORTAL_EDICAO_REVISTA(id_edicao)
 );
 
 create table TB_HOSPITAIS_SLIDER(
 id_slider int not null identity primary key,
 id_hospital int not null,
 ds_imagem varchar(200),
 ds_link varchar(max),
 id_status int,
 constraint fk_HOSPITAIS_slider_hospital foreign key (id_hospital) references TB_HOSPITAL(id_hospital),
 constraint fk_HOSPITAIS_slider_status Foreign Key (id_status) references TB_STATUS(id_status)
 )
 create table TB_HOSPITAIS_BANNER(
 id_banner int not null identity primary key,
 id_hospital int not null,
 ds_imagem varchar(200),
 ds_link varchar(max),
 ds_descrição varchar(200),
 id_status int,
 constraint fk_HOSPITAIS_banner_hospital foreign key (id_hospital) references TB_HOSPITAL(id_hospital),
 constraint fk_HOSPITAIS_banner_status Foreign Key (id_status) references TB_STATUS(id_status)
 );


 /*13/12/2014*************************
 ALTER SCHEMA [dbo] TRANSFER [LAT\damar002].[TB_ESPECIALIDADE_HOSPITAL];
 ALTER SCHEMA [dbo] TRANSFER [LAT\damar002].[TB_EXAME_HOSPITAL];
 ALTER SCHEMA [dbo] TRANSFER [LAT\damar002].[TB_PRONTOSOCORRO_HOSPITAL];
 ALTER SCHEMA [dbo] TRANSFER [LAT\damar002].[TB_PORTAL_SLIDER];
 ALTER SCHEMA [dbo] TRANSFER [LAT\damar002].[TB_PORTAL_BANNER];
 
 ALTER SCHEMA [dbo] TRANSFER [LAT\damar002].[TB_CONTROLE_NOTICIA];
 ALTER SCHEMA [dbo] TRANSFER [LAT\damar002].[TB_CONTROLE_RELEASE];
 ALTER SCHEMA [dbo] TRANSFER [LAT\damar002].[TB_PORTAL_ARQUIVO];
 ALTER SCHEMA [dbo] TRANSFER [LAT\damar002].[TB_PORTAL_CONTEUDO];
 ALTER SCHEMA [dbo] TRANSFER [LAT\damar002].[TB_PORTAL_EDICAO_REVISTA];
 ALTER SCHEMA [dbo] TRANSFER [LAT\damar002].[TB_PORTAL_SESSAO];
 ALTER SCHEMA [dbo] TRANSFER [LAT\damar002].[TB_PORTAL_TIPO]; 
 ALTER SCHEMA [dbo] TRANSFER [LAT\damar002].[TB_PORTAL_PROGRAMETES];
 ALTER SCHEMA [dbo] TRANSFER [LAT\damar002].[TB_PORTAL_PROGRAMETES_DESTAQUE];
 ALTER SCHEMA [dbo] TRANSFER [LAT\damar002].[TB_PORTAL_PROGRAMETES_TEXTO];
 */
 
