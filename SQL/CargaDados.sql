insert into tb_entidade_global (nome_entidade_global) values ('funcionario');

insert into tb_config_datasource_local (password,server,timeout,username,connectionstring) values
('xxdduu', 'localhost\globalServer', 120000, 'sa', '');
insert into tb_entidade_local (nome_entidade_local,id_config_datasource_local) values ('empregado', @@IDENTITY);


insert into tb_tipo_dado (nome_tipo_dado) values ('Integer');
insert into tb_tipo_dado (nome_tipo_dado) values ('String');
insert into tb_tipo_dado (nome_tipo_dado) values ('Boolean');
insert into tb_tipo_dado (nome_tipo_dado) values ('Decimal');
insert into tb_tipo_dado (nome_tipo_dado) values ('Datetime');

--select * from tb_tipo_dado

--Funcionario
insert into tb_campo (id_tipo_dado, nome_campo, semantica_campo) values (1,'codigo', '');
insert into tb_campo (id_tipo_dado, nome_campo, semantica_campo) values (1,'rg', '');
insert into tb_campo (id_tipo_dado, nome_campo, semantica_campo) values (2,'name', '');
insert into tb_campo (id_tipo_dado, nome_campo, semantica_campo) values (2,'sobrenome', '');
insert into tb_campo (id_tipo_dado, nome_campo, semantica_campo) values (2,'endereco', '');
insert into tb_campo (id_tipo_dado, nome_campo, semantica_campo) values (4,'altura', 'aulto do funcionario dada em centimetros');

--Empregado
insert into tb_campo (id_tipo_dado, nome_campo, semantica_campo) values (1,'rg', '');
insert into tb_campo (id_tipo_dado, nome_campo, semantica_campo) values (2,'name', '');
insert into tb_campo (id_tipo_dado, nome_campo, semantica_campo) values (5,'dataNascimento', '');
insert into tb_campo (id_tipo_dado, nome_campo, semantica_campo) values (2,'endereco', '');
insert into tb_campo (id_tipo_dado, nome_campo, semantica_campo) values (4,'altura', 'aulto do funcionario dada em metros');

-- select * from tb_campo

insert into tb_campo_entidade_global (id_campo,id_entidade_global,is_fk,is_pk) values (1, 1, 0, 1);
insert into tb_campo_entidade_global (id_campo,id_entidade_global,is_fk,is_pk) values (2, 1, 0, 0);
insert into tb_campo_entidade_global (id_campo,id_entidade_global,is_fk,is_pk) values (3, 1, 0, 0);
insert into tb_campo_entidade_global (id_campo,id_entidade_global,is_fk,is_pk) values (4, 1, 0, 0);
insert into tb_campo_entidade_global (id_campo,id_entidade_global,is_fk,is_pk) values (5, 1, 0, 0);
insert into tb_campo_entidade_global (id_campo,id_entidade_global,is_fk,is_pk) values (6, 1, 0, 0);

insert into tb_campo_entidade_local (id_campo,id_entidade_local,is_fk,is_pk) values (7,1,0,1);
insert into tb_campo_entidade_local (id_campo,id_entidade_local,is_fk,is_pk) values (8,1,0,0);
insert into tb_campo_entidade_local (id_campo,id_entidade_local,is_fk,is_pk) values (9,1,0,0);
insert into tb_campo_entidade_local (id_campo,id_entidade_local,is_fk,is_pk) values (10,1,0,0);
insert into tb_campo_entidade_local (id_campo,id_entidade_local,is_fk,is_pk) values (11,1,0,0);

-- select * from tb_campo_entidade_local

insert into tb_campo_global_local (id_campo_entidade_global, id_campo_entidade_local) values (2,1);
insert into tb_campo_global_local (id_campo_entidade_global, id_campo_entidade_local) values (3,2);
insert into tb_campo_global_local (id_campo_entidade_global, id_campo_entidade_local) values (5,4);
insert into tb_campo_global_local (id_campo_entidade_global, id_campo_entidade_local) values (6,5);


