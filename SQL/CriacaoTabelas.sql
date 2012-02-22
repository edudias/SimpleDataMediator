
CREATE TABLE [tb_campo]
( 
	[id_campo]           bigint  NOT NULL  IDENTITY ( 1,1 ) ,
	[nome_campo]         varchar(100)  NOT NULL ,
	[id_tipo_dado]       bigint  NOT NULL ,
	[semantica_campo]    varchar(250)  NULL 
)
go

ALTER TABLE [tb_campo]
	ADD CONSTRAINT [XPKtb_campo] PRIMARY KEY  CLUSTERED ([id_campo] ASC)
go

CREATE TABLE [tb_campo_entidade_global]
( 
	[id_campo]           bigint  NOT NULL ,
	[id_entidade_global] bigint  NOT NULL ,
	[id_campo_entidade_global] bigint  NOT NULL  IDENTITY ( 1,1 ) ,
	[is_pk]              bit  NOT NULL ,
	[is_fk]              bit  NOT NULL 
)
go

ALTER TABLE [tb_campo_entidade_global]
	ADD CONSTRAINT [XPKtb_campo_entidade] PRIMARY KEY  CLUSTERED ([id_campo_entidade_global] ASC)
go

ALTER TABLE [tb_campo_entidade_global]
	ADD CONSTRAINT [XAK1tb_campo_entidade] UNIQUE ([id_campo]  ASC,[id_entidade_global]  ASC)
go

CREATE TABLE [tb_campo_entidade_local]
( 
	[id_campo_entidade_local] integer  NOT NULL  IDENTITY ( 1,1 ) ,
	[id_campo]           bigint  NULL ,
	[id_entidade_local]  bigint  NULL ,
	[is_pk]              bit  NOT NULL ,
	[is_fk]              bit  NOT NULL 
)
go

ALTER TABLE [tb_campo_entidade_local]
	ADD CONSTRAINT [XPKtb_campo_entidade_local] PRIMARY KEY  CLUSTERED ([id_campo_entidade_local] ASC)
go

ALTER TABLE [tb_campo_entidade_local]
	ADD CONSTRAINT [XAK1tb_campo_entidade_local] UNIQUE ([id_campo]  ASC,[id_entidade_local]  ASC)
go

CREATE TABLE [tb_campo_global_local]
( 
	[id_campo_global_local] bigint  NOT NULL  IDENTITY ( 1,1 ) ,
	[id_campo_entidade_global] bigint  NULL ,
	[id_campo_entidade_local] integer  NULL 
)
go

ALTER TABLE [tb_campo_global_local]
	ADD CONSTRAINT [XPKtb_campo_global_local] PRIMARY KEY  CLUSTERED ([id_campo_global_local] ASC)
go

ALTER TABLE [tb_campo_global_local]
	ADD CONSTRAINT [XAK1tb_campo_global_local] UNIQUE ([id_campo_entidade_local]  ASC,[id_campo_entidade_global]  ASC)
go

CREATE TABLE [tb_config_datasource_local]
( 
	[id_config_datasource_local] bigint  NOT NULL  IDENTITY ( 1,1 ) ,
	[server]             varchar(50)  NOT NULL ,
	[username]           varchar(50)  NOT NULL ,
	[password]           varchar(50)  NOT NULL ,
	[connectionstring]   varchar(250)  NULL ,
	[timeout]            integer  NOT NULL 
)
go

ALTER TABLE [tb_config_datasource_local]
	ADD CONSTRAINT [XPKtb_config_datasource_local] PRIMARY KEY  CLUSTERED ([id_config_datasource_local] ASC)
go

CREATE TABLE [tb_entidade_global]
( 
	[id_entidade_global] bigint  NOT NULL  IDENTITY ( 1,1 ) ,
	[nome_entidade_global] varchar(100)  NOT NULL 
)
go

ALTER TABLE [tb_entidade_global]
	ADD CONSTRAINT [XPKtb_entidade_global] PRIMARY KEY  CLUSTERED ([id_entidade_global] ASC)
go

CREATE TABLE [tb_entidade_global_local]
( 
	[id_entidade_global] bigint  NOT NULL ,
	[id_entidade_local]  bigint  NOT NULL ,
	[id_entidade_global_local] bigint  NOT NULL  IDENTITY ( 1,1 ) 
)
go

ALTER TABLE [tb_entidade_global_local]
	ADD CONSTRAINT [XPKtb_entidade_global_local] PRIMARY KEY  CLUSTERED ([id_entidade_global_local] ASC)
go

ALTER TABLE [tb_entidade_global_local]
	ADD CONSTRAINT [XAKtb_entidade_global_local] UNIQUE ([id_entidade_global]  ASC,[id_entidade_local]  ASC)
go

CREATE TABLE [tb_entidade_local]
( 
	[id_entidade_local]  bigint  NOT NULL  IDENTITY ( 1,1 ) ,
	[nome_entidade_local] varchar(100)  NOT NULL ,
	[id_config_datasource_local] bigint  NULL 
)
go

ALTER TABLE [tb_entidade_local]
	ADD CONSTRAINT [XPKtb_entidade_local] PRIMARY KEY  CLUSTERED ([id_entidade_local] ASC)
go

CREATE TABLE [tb_formula_transformacao]
( 
	[id_campo_global_local] bigint  NOT NULL  IDENTITY ( 1,1 ) ,
	[id_formula_transformacao] bigint  NOT NULL ,
	[formula]            varchar(100)  NULL 
)
go

ALTER TABLE [tb_formula_transformacao]
	ADD CONSTRAINT [XPKtb_formula_transformacao] PRIMARY KEY  CLUSTERED ([id_formula_transformacao] ASC)
go

CREATE TABLE [tb_tipo_dado]
( 
	[id_tipo_dado]       bigint  NOT NULL  IDENTITY ( 1,1 ) ,
	[nome_tipo_dado]     varchar(100)  NULL 
)
go

ALTER TABLE [tb_tipo_dado]
	ADD CONSTRAINT [XPKtb_tipo_dado] PRIMARY KEY  CLUSTERED ([id_tipo_dado] ASC)
go

CREATE TABLE [tb_view_gav]
( 
	[id_view_gav]        bigint  NOT NULL  IDENTITY ( 1,1 ) ,
	[sql_view]           varchar(5000)  NOT NULL ,
	[id_entidade_global] bigint  NULL 
)
go

ALTER TABLE [tb_view_gav]
	ADD CONSTRAINT [XPKtb_view_gav] PRIMARY KEY  CLUSTERED ([id_view_gav] ASC)
go

ALTER TABLE [tb_view_gav]
	ADD CONSTRAINT [XAK1tb_view_gav] UNIQUE ([id_entidade_global]  ASC)
go

CREATE TABLE [tb_view_lav]
( 
	[id_entidade_local]  bigint  NULL ,
	[id_view_lav]        bigint  NOT NULL  IDENTITY ( 1,1 ) ,
	[sql_view]           varchar(5000)  NOT NULL 
)
go

ALTER TABLE [tb_view_lav]
	ADD CONSTRAINT [XPKtb_view_lav] PRIMARY KEY  CLUSTERED ([id_view_lav] ASC)
go

ALTER TABLE [tb_view_lav]
	ADD CONSTRAINT [XAK1tb_view_lav] UNIQUE ([id_entidade_local]  ASC)
go


ALTER TABLE [tb_campo]
	ADD CONSTRAINT [fk_tipo_campo] FOREIGN KEY ([id_tipo_dado]) REFERENCES [tb_tipo_dado]([id_tipo_dado])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go


ALTER TABLE [tb_campo_entidade_global]
	ADD CONSTRAINT [R_3] FOREIGN KEY ([id_campo]) REFERENCES [tb_campo]([id_campo])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go

ALTER TABLE [tb_campo_entidade_global]
	ADD CONSTRAINT [R_7] FOREIGN KEY ([id_entidade_global]) REFERENCES [tb_entidade_global]([id_entidade_global])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go


ALTER TABLE [tb_campo_entidade_local]
	ADD CONSTRAINT [R_18] FOREIGN KEY ([id_campo]) REFERENCES [tb_campo]([id_campo])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go

ALTER TABLE [tb_campo_entidade_local]
	ADD CONSTRAINT [R_19] FOREIGN KEY ([id_entidade_local]) REFERENCES [tb_entidade_local]([id_entidade_local])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go


ALTER TABLE [tb_campo_global_local]
	ADD CONSTRAINT [R_20] FOREIGN KEY ([id_campo_entidade_global]) REFERENCES [tb_campo_entidade_global]([id_campo_entidade_global])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go

ALTER TABLE [tb_campo_global_local]
	ADD CONSTRAINT [R_21] FOREIGN KEY ([id_campo_entidade_local]) REFERENCES [tb_campo_entidade_local]([id_campo_entidade_local])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go


ALTER TABLE [tb_entidade_global_local]
	ADD CONSTRAINT [R_10] FOREIGN KEY ([id_entidade_global]) REFERENCES [tb_entidade_global]([id_entidade_global])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go

ALTER TABLE [tb_entidade_global_local]
	ADD CONSTRAINT [R_11] FOREIGN KEY ([id_entidade_local]) REFERENCES [tb_entidade_local]([id_entidade_local])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go


ALTER TABLE [tb_entidade_local]
	ADD CONSTRAINT [R_12] FOREIGN KEY ([id_config_datasource_local]) REFERENCES [tb_config_datasource_local]([id_config_datasource_local])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go


ALTER TABLE [tb_formula_transformacao]
	ADD CONSTRAINT [R_22] FOREIGN KEY ([id_campo_global_local]) REFERENCES [tb_campo_global_local]([id_campo_global_local])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go


ALTER TABLE [tb_view_gav]
	ADD CONSTRAINT [R_14] FOREIGN KEY ([id_entidade_global]) REFERENCES [tb_entidade_global]([id_entidade_global])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go


ALTER TABLE [tb_view_lav]
	ADD CONSTRAINT [R_23] FOREIGN KEY ([id_entidade_local]) REFERENCES [tb_entidade_local]([id_entidade_local])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go


CREATE TRIGGER tD_tb_campo ON tb_campo FOR DELETE AS
/* ERwin Builtin Trigger */
/* DELETE trigger on tb_campo */
BEGIN
  DECLARE  @errno   int,
           @errmsg  varchar(255)
    /* ERwin Builtin Trigger */
    /* tb_campo  tb_campo_entidade_local on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00037172", PARENT_OWNER="", PARENT_TABLE="tb_campo"
    CHILD_OWNER="", CHILD_TABLE="tb_campo_entidade_local"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_18", FK_COLUMNS="id_campo" */
    IF EXISTS (
      SELECT * FROM deleted,tb_campo_entidade_local
      WHERE
        /*  %JoinFKPK(tb_campo_entidade_local,deleted," = "," AND") */
        tb_campo_entidade_local.id_campo = deleted.id_campo
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete tb_campo because tb_campo_entidade_local exists.'
      GOTO error
    END

    /* ERwin Builtin Trigger */
    /* tb_campo  tb_campo_entidade_global on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="tb_campo"
    CHILD_OWNER="", CHILD_TABLE="tb_campo_entidade_global"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_3", FK_COLUMNS="id_campo" */
    IF EXISTS (
      SELECT * FROM deleted,tb_campo_entidade_global
      WHERE
        /*  %JoinFKPK(tb_campo_entidade_global,deleted," = "," AND") */
        tb_campo_entidade_global.id_campo = deleted.id_campo
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete tb_campo because tb_campo_entidade_global exists.'
      GOTO error
    END

    /* ERwin Builtin Trigger */
    /* tb_tipo_dado  tb_campo on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="tb_tipo_dado"
    CHILD_OWNER="", CHILD_TABLE="tb_campo"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="fk_tipo_campo", FK_COLUMNS="id_tipo_dado" */
    IF EXISTS (SELECT * FROM deleted,tb_tipo_dado
      WHERE
        /* %JoinFKPK(deleted,tb_tipo_dado," = "," AND") */
        deleted.id_tipo_dado = tb_tipo_dado.id_tipo_dado AND
        NOT EXISTS (
          SELECT * FROM tb_campo
          WHERE
            /* %JoinFKPK(tb_campo,tb_tipo_dado," = "," AND") */
            tb_campo.id_tipo_dado = tb_tipo_dado.id_tipo_dado
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last tb_campo because tb_tipo_dado exists.'
      GOTO error
    END


    /* ERwin Builtin Trigger */
    RETURN
error:
    raiserror @errno @errmsg
    rollback transaction
END

go


CREATE TRIGGER tU_tb_campo ON tb_campo FOR UPDATE AS
/* ERwin Builtin Trigger */
/* UPDATE trigger on tb_campo */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insid_campo bigint,
           @errno   int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* ERwin Builtin Trigger */
  /* tb_campo  tb_campo_entidade_local on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="0003bde9", PARENT_OWNER="", PARENT_TABLE="tb_campo"
    CHILD_OWNER="", CHILD_TABLE="tb_campo_entidade_local"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_18", FK_COLUMNS="id_campo" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(id_campo)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,tb_campo_entidade_local
      WHERE
        /*  %JoinFKPK(tb_campo_entidade_local,deleted," = "," AND") */
        tb_campo_entidade_local.id_campo = deleted.id_campo
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update tb_campo because tb_campo_entidade_local exists.'
      GOTO error
    END
  END

  /* ERwin Builtin Trigger */
  /* tb_campo  tb_campo_entidade_global on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="tb_campo"
    CHILD_OWNER="", CHILD_TABLE="tb_campo_entidade_global"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_3", FK_COLUMNS="id_campo" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(id_campo)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,tb_campo_entidade_global
      WHERE
        /*  %JoinFKPK(tb_campo_entidade_global,deleted," = "," AND") */
        tb_campo_entidade_global.id_campo = deleted.id_campo
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update tb_campo because tb_campo_entidade_global exists.'
      GOTO error
    END
  END

  /* ERwin Builtin Trigger */
  /* tb_tipo_dado  tb_campo on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="tb_tipo_dado"
    CHILD_OWNER="", CHILD_TABLE="tb_campo"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="fk_tipo_campo", FK_COLUMNS="id_tipo_dado" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(id_tipo_dado)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,tb_tipo_dado
        WHERE
          /* %JoinFKPK(inserted,tb_tipo_dado) */
          inserted.id_tipo_dado = tb_tipo_dado.id_tipo_dado
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update tb_campo because tb_tipo_dado does not exist.'
      GOTO error
    END
  END


  /* ERwin Builtin Trigger */
  RETURN
error:
    raiserror @errno @errmsg
    rollback transaction
END

go




CREATE TRIGGER tD_tb_campo_entidade_global ON tb_campo_entidade_global FOR DELETE AS
/* ERwin Builtin Trigger */
/* DELETE trigger on tb_campo_entidade_global */
BEGIN
  DECLARE  @errno   int,
           @errmsg  varchar(255)
    /* ERwin Builtin Trigger */
    /* tb_campo_entidade_global  tb_campo_global_local on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00042b69", PARENT_OWNER="", PARENT_TABLE="tb_campo_entidade_global"
    CHILD_OWNER="", CHILD_TABLE="tb_campo_global_local"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_20", FK_COLUMNS="id_campo_entidade_global" */
    IF EXISTS (
      SELECT * FROM deleted,tb_campo_global_local
      WHERE
        /*  %JoinFKPK(tb_campo_global_local,deleted," = "," AND") */
        tb_campo_global_local.id_campo_entidade_global = deleted.id_campo_entidade_global
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete tb_campo_entidade_global because tb_campo_global_local exists.'
      GOTO error
    END

    /* ERwin Builtin Trigger */
    /* tb_entidade_global  tb_campo_entidade_global on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="tb_entidade_global"
    CHILD_OWNER="", CHILD_TABLE="tb_campo_entidade_global"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_7", FK_COLUMNS="id_entidade_global" */
    IF EXISTS (SELECT * FROM deleted,tb_entidade_global
      WHERE
        /* %JoinFKPK(deleted,tb_entidade_global," = "," AND") */
        deleted.id_entidade_global = tb_entidade_global.id_entidade_global AND
        NOT EXISTS (
          SELECT * FROM tb_campo_entidade_global
          WHERE
            /* %JoinFKPK(tb_campo_entidade_global,tb_entidade_global," = "," AND") */
            tb_campo_entidade_global.id_entidade_global = tb_entidade_global.id_entidade_global
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last tb_campo_entidade_global because tb_entidade_global exists.'
      GOTO error
    END

    /* ERwin Builtin Trigger */
    /* tb_campo  tb_campo_entidade_global on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="tb_campo"
    CHILD_OWNER="", CHILD_TABLE="tb_campo_entidade_global"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_3", FK_COLUMNS="id_campo" */
    IF EXISTS (SELECT * FROM deleted,tb_campo
      WHERE
        /* %JoinFKPK(deleted,tb_campo," = "," AND") */
        deleted.id_campo = tb_campo.id_campo AND
        NOT EXISTS (
          SELECT * FROM tb_campo_entidade_global
          WHERE
            /* %JoinFKPK(tb_campo_entidade_global,tb_campo," = "," AND") */
            tb_campo_entidade_global.id_campo = tb_campo.id_campo
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last tb_campo_entidade_global because tb_campo exists.'
      GOTO error
    END


    /* ERwin Builtin Trigger */
    RETURN
error:
    raiserror @errno @errmsg
    rollback transaction
END

go


CREATE TRIGGER tU_tb_campo_entidade_global ON tb_campo_entidade_global FOR UPDATE AS
/* ERwin Builtin Trigger */
/* UPDATE trigger on tb_campo_entidade_global */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insid_campo_entidade_global bigint,
           @errno   int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* ERwin Builtin Trigger */
  /* tb_campo_entidade_global  tb_campo_global_local on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="00044bf5", PARENT_OWNER="", PARENT_TABLE="tb_campo_entidade_global"
    CHILD_OWNER="", CHILD_TABLE="tb_campo_global_local"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_20", FK_COLUMNS="id_campo_entidade_global" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(id_campo_entidade_global)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,tb_campo_global_local
      WHERE
        /*  %JoinFKPK(tb_campo_global_local,deleted," = "," AND") */
        tb_campo_global_local.id_campo_entidade_global = deleted.id_campo_entidade_global
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update tb_campo_entidade_global because tb_campo_global_local exists.'
      GOTO error
    END
  END

  /* ERwin Builtin Trigger */
  /* tb_entidade_global  tb_campo_entidade_global on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="tb_entidade_global"
    CHILD_OWNER="", CHILD_TABLE="tb_campo_entidade_global"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_7", FK_COLUMNS="id_entidade_global" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(id_entidade_global)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,tb_entidade_global
        WHERE
          /* %JoinFKPK(inserted,tb_entidade_global) */
          inserted.id_entidade_global = tb_entidade_global.id_entidade_global
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update tb_campo_entidade_global because tb_entidade_global does not exist.'
      GOTO error
    END
  END

  /* ERwin Builtin Trigger */
  /* tb_campo  tb_campo_entidade_global on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="tb_campo"
    CHILD_OWNER="", CHILD_TABLE="tb_campo_entidade_global"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_3", FK_COLUMNS="id_campo" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(id_campo)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,tb_campo
        WHERE
          /* %JoinFKPK(inserted,tb_campo) */
          inserted.id_campo = tb_campo.id_campo
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update tb_campo_entidade_global because tb_campo does not exist.'
      GOTO error
    END
  END


  /* ERwin Builtin Trigger */
  RETURN
error:
    raiserror @errno @errmsg
    rollback transaction
END

go




CREATE TRIGGER tD_tb_campo_entidade_local ON tb_campo_entidade_local FOR DELETE AS
/* ERwin Builtin Trigger */
/* DELETE trigger on tb_campo_entidade_local */
BEGIN
  DECLARE  @errno   int,
           @errmsg  varchar(255)
    /* ERwin Builtin Trigger */
    /* tb_campo_entidade_local  tb_campo_global_local on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00041365", PARENT_OWNER="", PARENT_TABLE="tb_campo_entidade_local"
    CHILD_OWNER="", CHILD_TABLE="tb_campo_global_local"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_21", FK_COLUMNS="id_campo_entidade_local" */
    IF EXISTS (
      SELECT * FROM deleted,tb_campo_global_local
      WHERE
        /*  %JoinFKPK(tb_campo_global_local,deleted," = "," AND") */
        tb_campo_global_local.id_campo_entidade_local = deleted.id_campo_entidade_local
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete tb_campo_entidade_local because tb_campo_global_local exists.'
      GOTO error
    END

    /* ERwin Builtin Trigger */
    /* tb_entidade_local  tb_campo_entidade_local on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="tb_entidade_local"
    CHILD_OWNER="", CHILD_TABLE="tb_campo_entidade_local"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_19", FK_COLUMNS="id_entidade_local" */
    IF EXISTS (SELECT * FROM deleted,tb_entidade_local
      WHERE
        /* %JoinFKPK(deleted,tb_entidade_local," = "," AND") */
        deleted.id_entidade_local = tb_entidade_local.id_entidade_local AND
        NOT EXISTS (
          SELECT * FROM tb_campo_entidade_local
          WHERE
            /* %JoinFKPK(tb_campo_entidade_local,tb_entidade_local," = "," AND") */
            tb_campo_entidade_local.id_entidade_local = tb_entidade_local.id_entidade_local
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last tb_campo_entidade_local because tb_entidade_local exists.'
      GOTO error
    END

    /* ERwin Builtin Trigger */
    /* tb_campo  tb_campo_entidade_local on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="tb_campo"
    CHILD_OWNER="", CHILD_TABLE="tb_campo_entidade_local"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_18", FK_COLUMNS="id_campo" */
    IF EXISTS (SELECT * FROM deleted,tb_campo
      WHERE
        /* %JoinFKPK(deleted,tb_campo," = "," AND") */
        deleted.id_campo = tb_campo.id_campo AND
        NOT EXISTS (
          SELECT * FROM tb_campo_entidade_local
          WHERE
            /* %JoinFKPK(tb_campo_entidade_local,tb_campo," = "," AND") */
            tb_campo_entidade_local.id_campo = tb_campo.id_campo
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last tb_campo_entidade_local because tb_campo exists.'
      GOTO error
    END


    /* ERwin Builtin Trigger */
    RETURN
error:
    raiserror @errno @errmsg
    rollback transaction
END

go


CREATE TRIGGER tU_tb_campo_entidade_local ON tb_campo_entidade_local FOR UPDATE AS
/* ERwin Builtin Trigger */
/* UPDATE trigger on tb_campo_entidade_local */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insid_campo_entidade_local integer,
           @errno   int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* ERwin Builtin Trigger */
  /* tb_campo_entidade_local  tb_campo_global_local on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="000478ee", PARENT_OWNER="", PARENT_TABLE="tb_campo_entidade_local"
    CHILD_OWNER="", CHILD_TABLE="tb_campo_global_local"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_21", FK_COLUMNS="id_campo_entidade_local" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(id_campo_entidade_local)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,tb_campo_global_local
      WHERE
        /*  %JoinFKPK(tb_campo_global_local,deleted," = "," AND") */
        tb_campo_global_local.id_campo_entidade_local = deleted.id_campo_entidade_local
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update tb_campo_entidade_local because tb_campo_global_local exists.'
      GOTO error
    END
  END

  /* ERwin Builtin Trigger */
  /* tb_entidade_local  tb_campo_entidade_local on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="tb_entidade_local"
    CHILD_OWNER="", CHILD_TABLE="tb_campo_entidade_local"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_19", FK_COLUMNS="id_entidade_local" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(id_entidade_local)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,tb_entidade_local
        WHERE
          /* %JoinFKPK(inserted,tb_entidade_local) */
          inserted.id_entidade_local = tb_entidade_local.id_entidade_local
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    select @nullcnt = count(*) from inserted where
      inserted.id_entidade_local IS NULL
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update tb_campo_entidade_local because tb_entidade_local does not exist.'
      GOTO error
    END
  END

  /* ERwin Builtin Trigger */
  /* tb_campo  tb_campo_entidade_local on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="tb_campo"
    CHILD_OWNER="", CHILD_TABLE="tb_campo_entidade_local"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_18", FK_COLUMNS="id_campo" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(id_campo)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,tb_campo
        WHERE
          /* %JoinFKPK(inserted,tb_campo) */
          inserted.id_campo = tb_campo.id_campo
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    select @nullcnt = count(*) from inserted where
      inserted.id_campo IS NULL
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update tb_campo_entidade_local because tb_campo does not exist.'
      GOTO error
    END
  END


  /* ERwin Builtin Trigger */
  RETURN
error:
    raiserror @errno @errmsg
    rollback transaction
END

go




CREATE TRIGGER tD_tb_campo_global_local ON tb_campo_global_local FOR DELETE AS
/* ERwin Builtin Trigger */
/* DELETE trigger on tb_campo_global_local */
BEGIN
  DECLARE  @errno   int,
           @errmsg  varchar(255)
    /* ERwin Builtin Trigger */
    /* tb_campo_global_local  tb_formula_transformacao on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="000495d6", PARENT_OWNER="", PARENT_TABLE="tb_campo_global_local"
    CHILD_OWNER="", CHILD_TABLE="tb_formula_transformacao"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_22", FK_COLUMNS="id_campo_global_local" */
    IF EXISTS (
      SELECT * FROM deleted,tb_formula_transformacao
      WHERE
        /*  %JoinFKPK(tb_formula_transformacao,deleted," = "," AND") */
        tb_formula_transformacao.id_campo_global_local = deleted.id_campo_global_local
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete tb_campo_global_local because tb_formula_transformacao exists.'
      GOTO error
    END

    /* ERwin Builtin Trigger */
    /* tb_campo_entidade_local  tb_campo_global_local on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="tb_campo_entidade_local"
    CHILD_OWNER="", CHILD_TABLE="tb_campo_global_local"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_21", FK_COLUMNS="id_campo_entidade_local" */
    IF EXISTS (SELECT * FROM deleted,tb_campo_entidade_local
      WHERE
        /* %JoinFKPK(deleted,tb_campo_entidade_local," = "," AND") */
        deleted.id_campo_entidade_local = tb_campo_entidade_local.id_campo_entidade_local AND
        NOT EXISTS (
          SELECT * FROM tb_campo_global_local
          WHERE
            /* %JoinFKPK(tb_campo_global_local,tb_campo_entidade_local," = "," AND") */
            tb_campo_global_local.id_campo_entidade_local = tb_campo_entidade_local.id_campo_entidade_local
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last tb_campo_global_local because tb_campo_entidade_local exists.'
      GOTO error
    END

    /* ERwin Builtin Trigger */
    /* tb_campo_entidade_global  tb_campo_global_local on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="tb_campo_entidade_global"
    CHILD_OWNER="", CHILD_TABLE="tb_campo_global_local"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_20", FK_COLUMNS="id_campo_entidade_global" */
    IF EXISTS (SELECT * FROM deleted,tb_campo_entidade_global
      WHERE
        /* %JoinFKPK(deleted,tb_campo_entidade_global," = "," AND") */
        deleted.id_campo_entidade_global = tb_campo_entidade_global.id_campo_entidade_global AND
        NOT EXISTS (
          SELECT * FROM tb_campo_global_local
          WHERE
            /* %JoinFKPK(tb_campo_global_local,tb_campo_entidade_global," = "," AND") */
            tb_campo_global_local.id_campo_entidade_global = tb_campo_entidade_global.id_campo_entidade_global
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last tb_campo_global_local because tb_campo_entidade_global exists.'
      GOTO error
    END


    /* ERwin Builtin Trigger */
    RETURN
error:
    raiserror @errno @errmsg
    rollback transaction
END

go


CREATE TRIGGER tU_tb_campo_global_local ON tb_campo_global_local FOR UPDATE AS
/* ERwin Builtin Trigger */
/* UPDATE trigger on tb_campo_global_local */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insid_campo_global_local bigint,
           @errno   int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* ERwin Builtin Trigger */
  /* tb_campo_global_local  tb_formula_transformacao on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="0004e640", PARENT_OWNER="", PARENT_TABLE="tb_campo_global_local"
    CHILD_OWNER="", CHILD_TABLE="tb_formula_transformacao"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_22", FK_COLUMNS="id_campo_global_local" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(id_campo_global_local)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,tb_formula_transformacao
      WHERE
        /*  %JoinFKPK(tb_formula_transformacao,deleted," = "," AND") */
        tb_formula_transformacao.id_campo_global_local = deleted.id_campo_global_local
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update tb_campo_global_local because tb_formula_transformacao exists.'
      GOTO error
    END
  END

  /* ERwin Builtin Trigger */
  /* tb_campo_entidade_local  tb_campo_global_local on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="tb_campo_entidade_local"
    CHILD_OWNER="", CHILD_TABLE="tb_campo_global_local"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_21", FK_COLUMNS="id_campo_entidade_local" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(id_campo_entidade_local)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,tb_campo_entidade_local
        WHERE
          /* %JoinFKPK(inserted,tb_campo_entidade_local) */
          inserted.id_campo_entidade_local = tb_campo_entidade_local.id_campo_entidade_local
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    select @nullcnt = count(*) from inserted where
      inserted.id_campo_entidade_local IS NULL
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update tb_campo_global_local because tb_campo_entidade_local does not exist.'
      GOTO error
    END
  END

  /* ERwin Builtin Trigger */
  /* tb_campo_entidade_global  tb_campo_global_local on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="tb_campo_entidade_global"
    CHILD_OWNER="", CHILD_TABLE="tb_campo_global_local"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_20", FK_COLUMNS="id_campo_entidade_global" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(id_campo_entidade_global)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,tb_campo_entidade_global
        WHERE
          /* %JoinFKPK(inserted,tb_campo_entidade_global) */
          inserted.id_campo_entidade_global = tb_campo_entidade_global.id_campo_entidade_global
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    select @nullcnt = count(*) from inserted where
      inserted.id_campo_entidade_global IS NULL
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update tb_campo_global_local because tb_campo_entidade_global does not exist.'
      GOTO error
    END
  END


  /* ERwin Builtin Trigger */
  RETURN
error:
    raiserror @errno @errmsg
    rollback transaction
END

go




CREATE TRIGGER tD_tb_config_datasource_local ON tb_config_datasource_local FOR DELETE AS
/* ERwin Builtin Trigger */
/* DELETE trigger on tb_config_datasource_local */
BEGIN
  DECLARE  @errno   int,
           @errmsg  varchar(255)
    /* ERwin Builtin Trigger */
    /* tb_config_datasource_local  tb_entidade_local on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="0001321e", PARENT_OWNER="", PARENT_TABLE="tb_config_datasource_local"
    CHILD_OWNER="", CHILD_TABLE="tb_entidade_local"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_12", FK_COLUMNS="id_config_datasource_local" */
    IF EXISTS (
      SELECT * FROM deleted,tb_entidade_local
      WHERE
        /*  %JoinFKPK(tb_entidade_local,deleted," = "," AND") */
        tb_entidade_local.id_config_datasource_local = deleted.id_config_datasource_local
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete tb_config_datasource_local because tb_entidade_local exists.'
      GOTO error
    END


    /* ERwin Builtin Trigger */
    RETURN
error:
    raiserror @errno @errmsg
    rollback transaction
END

go


CREATE TRIGGER tU_tb_config_datasource_local ON tb_config_datasource_local FOR UPDATE AS
/* ERwin Builtin Trigger */
/* UPDATE trigger on tb_config_datasource_local */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insid_config_datasource_local bigint,
           @errno   int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* ERwin Builtin Trigger */
  /* tb_config_datasource_local  tb_entidade_local on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="000153e3", PARENT_OWNER="", PARENT_TABLE="tb_config_datasource_local"
    CHILD_OWNER="", CHILD_TABLE="tb_entidade_local"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_12", FK_COLUMNS="id_config_datasource_local" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(id_config_datasource_local)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,tb_entidade_local
      WHERE
        /*  %JoinFKPK(tb_entidade_local,deleted," = "," AND") */
        tb_entidade_local.id_config_datasource_local = deleted.id_config_datasource_local
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update tb_config_datasource_local because tb_entidade_local exists.'
      GOTO error
    END
  END


  /* ERwin Builtin Trigger */
  RETURN
error:
    raiserror @errno @errmsg
    rollback transaction
END

go




CREATE TRIGGER tD_tb_entidade_global ON tb_entidade_global FOR DELETE AS
/* ERwin Builtin Trigger */
/* DELETE trigger on tb_entidade_global */
BEGIN
  DECLARE  @errno   int,
           @errmsg  varchar(255)
    /* ERwin Builtin Trigger */
    /* tb_entidade_global  tb_view_gav on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00037f18", PARENT_OWNER="", PARENT_TABLE="tb_entidade_global"
    CHILD_OWNER="", CHILD_TABLE="tb_view_gav"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_14", FK_COLUMNS="id_entidade_global" */
    IF EXISTS (
      SELECT * FROM deleted,tb_view_gav
      WHERE
        /*  %JoinFKPK(tb_view_gav,deleted," = "," AND") */
        tb_view_gav.id_entidade_global = deleted.id_entidade_global
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete tb_entidade_global because tb_view_gav exists.'
      GOTO error
    END

    /* ERwin Builtin Trigger */
    /* tb_entidade_global  tb_entidade_global_local on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="tb_entidade_global"
    CHILD_OWNER="", CHILD_TABLE="tb_entidade_global_local"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_10", FK_COLUMNS="id_entidade_global" */
    IF EXISTS (
      SELECT * FROM deleted,tb_entidade_global_local
      WHERE
        /*  %JoinFKPK(tb_entidade_global_local,deleted," = "," AND") */
        tb_entidade_global_local.id_entidade_global = deleted.id_entidade_global
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete tb_entidade_global because tb_entidade_global_local exists.'
      GOTO error
    END

    /* ERwin Builtin Trigger */
    /* tb_entidade_global  tb_campo_entidade_global on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="tb_entidade_global"
    CHILD_OWNER="", CHILD_TABLE="tb_campo_entidade_global"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_7", FK_COLUMNS="id_entidade_global" */
    IF EXISTS (
      SELECT * FROM deleted,tb_campo_entidade_global
      WHERE
        /*  %JoinFKPK(tb_campo_entidade_global,deleted," = "," AND") */
        tb_campo_entidade_global.id_entidade_global = deleted.id_entidade_global
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete tb_entidade_global because tb_campo_entidade_global exists.'
      GOTO error
    END


    /* ERwin Builtin Trigger */
    RETURN
error:
    raiserror @errno @errmsg
    rollback transaction
END

go


CREATE TRIGGER tU_tb_entidade_global ON tb_entidade_global FOR UPDATE AS
/* ERwin Builtin Trigger */
/* UPDATE trigger on tb_entidade_global */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insid_entidade_global bigint,
           @errno   int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* ERwin Builtin Trigger */
  /* tb_entidade_global  tb_view_gav on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="0003e240", PARENT_OWNER="", PARENT_TABLE="tb_entidade_global"
    CHILD_OWNER="", CHILD_TABLE="tb_view_gav"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_14", FK_COLUMNS="id_entidade_global" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(id_entidade_global)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,tb_view_gav
      WHERE
        /*  %JoinFKPK(tb_view_gav,deleted," = "," AND") */
        tb_view_gav.id_entidade_global = deleted.id_entidade_global
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update tb_entidade_global because tb_view_gav exists.'
      GOTO error
    END
  END

  /* ERwin Builtin Trigger */
  /* tb_entidade_global  tb_entidade_global_local on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="tb_entidade_global"
    CHILD_OWNER="", CHILD_TABLE="tb_entidade_global_local"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_10", FK_COLUMNS="id_entidade_global" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(id_entidade_global)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,tb_entidade_global_local
      WHERE
        /*  %JoinFKPK(tb_entidade_global_local,deleted," = "," AND") */
        tb_entidade_global_local.id_entidade_global = deleted.id_entidade_global
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update tb_entidade_global because tb_entidade_global_local exists.'
      GOTO error
    END
  END

  /* ERwin Builtin Trigger */
  /* tb_entidade_global  tb_campo_entidade_global on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="tb_entidade_global"
    CHILD_OWNER="", CHILD_TABLE="tb_campo_entidade_global"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_7", FK_COLUMNS="id_entidade_global" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(id_entidade_global)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,tb_campo_entidade_global
      WHERE
        /*  %JoinFKPK(tb_campo_entidade_global,deleted," = "," AND") */
        tb_campo_entidade_global.id_entidade_global = deleted.id_entidade_global
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update tb_entidade_global because tb_campo_entidade_global exists.'
      GOTO error
    END
  END


  /* ERwin Builtin Trigger */
  RETURN
error:
    raiserror @errno @errmsg
    rollback transaction
END

go




CREATE TRIGGER tD_tb_entidade_global_local ON tb_entidade_global_local FOR DELETE AS
/* ERwin Builtin Trigger */
/* DELETE trigger on tb_entidade_global_local */
BEGIN
  DECLARE  @errno   int,
           @errmsg  varchar(255)
    /* ERwin Builtin Trigger */
    /* tb_entidade_local  tb_entidade_global_local on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00031a1a", PARENT_OWNER="", PARENT_TABLE="tb_entidade_local"
    CHILD_OWNER="", CHILD_TABLE="tb_entidade_global_local"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_11", FK_COLUMNS="id_entidade_local" */
    IF EXISTS (SELECT * FROM deleted,tb_entidade_local
      WHERE
        /* %JoinFKPK(deleted,tb_entidade_local," = "," AND") */
        deleted.id_entidade_local = tb_entidade_local.id_entidade_local AND
        NOT EXISTS (
          SELECT * FROM tb_entidade_global_local
          WHERE
            /* %JoinFKPK(tb_entidade_global_local,tb_entidade_local," = "," AND") */
            tb_entidade_global_local.id_entidade_local = tb_entidade_local.id_entidade_local
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last tb_entidade_global_local because tb_entidade_local exists.'
      GOTO error
    END

    /* ERwin Builtin Trigger */
    /* tb_entidade_global  tb_entidade_global_local on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="tb_entidade_global"
    CHILD_OWNER="", CHILD_TABLE="tb_entidade_global_local"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_10", FK_COLUMNS="id_entidade_global" */
    IF EXISTS (SELECT * FROM deleted,tb_entidade_global
      WHERE
        /* %JoinFKPK(deleted,tb_entidade_global," = "," AND") */
        deleted.id_entidade_global = tb_entidade_global.id_entidade_global AND
        NOT EXISTS (
          SELECT * FROM tb_entidade_global_local
          WHERE
            /* %JoinFKPK(tb_entidade_global_local,tb_entidade_global," = "," AND") */
            tb_entidade_global_local.id_entidade_global = tb_entidade_global.id_entidade_global
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last tb_entidade_global_local because tb_entidade_global exists.'
      GOTO error
    END


    /* ERwin Builtin Trigger */
    RETURN
error:
    raiserror @errno @errmsg
    rollback transaction
END

go


CREATE TRIGGER tU_tb_entidade_global_local ON tb_entidade_global_local FOR UPDATE AS
/* ERwin Builtin Trigger */
/* UPDATE trigger on tb_entidade_global_local */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insid_entidade_global_local bigint,
           @errno   int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* ERwin Builtin Trigger */
  /* tb_entidade_local  tb_entidade_global_local on child update no action */
  /* ERWIN_RELATION:CHECKSUM="000311c9", PARENT_OWNER="", PARENT_TABLE="tb_entidade_local"
    CHILD_OWNER="", CHILD_TABLE="tb_entidade_global_local"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_11", FK_COLUMNS="id_entidade_local" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(id_entidade_local)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,tb_entidade_local
        WHERE
          /* %JoinFKPK(inserted,tb_entidade_local) */
          inserted.id_entidade_local = tb_entidade_local.id_entidade_local
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update tb_entidade_global_local because tb_entidade_local does not exist.'
      GOTO error
    END
  END

  /* ERwin Builtin Trigger */
  /* tb_entidade_global  tb_entidade_global_local on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="tb_entidade_global"
    CHILD_OWNER="", CHILD_TABLE="tb_entidade_global_local"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_10", FK_COLUMNS="id_entidade_global" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(id_entidade_global)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,tb_entidade_global
        WHERE
          /* %JoinFKPK(inserted,tb_entidade_global) */
          inserted.id_entidade_global = tb_entidade_global.id_entidade_global
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update tb_entidade_global_local because tb_entidade_global does not exist.'
      GOTO error
    END
  END


  /* ERwin Builtin Trigger */
  RETURN
error:
    raiserror @errno @errmsg
    rollback transaction
END

go




CREATE TRIGGER tD_tb_entidade_local ON tb_entidade_local FOR DELETE AS
/* ERwin Builtin Trigger */
/* DELETE trigger on tb_entidade_local */
BEGIN
  DECLARE  @errno   int,
           @errmsg  varchar(255)
    /* ERwin Builtin Trigger */
    /* tb_entidade_local  tb_view_lav on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00052518", PARENT_OWNER="", PARENT_TABLE="tb_entidade_local"
    CHILD_OWNER="", CHILD_TABLE="tb_view_lav"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_23", FK_COLUMNS="id_entidade_local" */
    IF EXISTS (
      SELECT * FROM deleted,tb_view_lav
      WHERE
        /*  %JoinFKPK(tb_view_lav,deleted," = "," AND") */
        tb_view_lav.id_entidade_local = deleted.id_entidade_local
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete tb_entidade_local because tb_view_lav exists.'
      GOTO error
    END

    /* ERwin Builtin Trigger */
    /* tb_entidade_local  tb_campo_entidade_local on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="tb_entidade_local"
    CHILD_OWNER="", CHILD_TABLE="tb_campo_entidade_local"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_19", FK_COLUMNS="id_entidade_local" */
    IF EXISTS (
      SELECT * FROM deleted,tb_campo_entidade_local
      WHERE
        /*  %JoinFKPK(tb_campo_entidade_local,deleted," = "," AND") */
        tb_campo_entidade_local.id_entidade_local = deleted.id_entidade_local
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete tb_entidade_local because tb_campo_entidade_local exists.'
      GOTO error
    END

    /* ERwin Builtin Trigger */
    /* tb_entidade_local  tb_entidade_global_local on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="tb_entidade_local"
    CHILD_OWNER="", CHILD_TABLE="tb_entidade_global_local"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_11", FK_COLUMNS="id_entidade_local" */
    IF EXISTS (
      SELECT * FROM deleted,tb_entidade_global_local
      WHERE
        /*  %JoinFKPK(tb_entidade_global_local,deleted," = "," AND") */
        tb_entidade_global_local.id_entidade_local = deleted.id_entidade_local
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete tb_entidade_local because tb_entidade_global_local exists.'
      GOTO error
    END

    /* ERwin Builtin Trigger */
    /* tb_config_datasource_local  tb_entidade_local on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="tb_config_datasource_local"
    CHILD_OWNER="", CHILD_TABLE="tb_entidade_local"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_12", FK_COLUMNS="id_config_datasource_local" */
    IF EXISTS (SELECT * FROM deleted,tb_config_datasource_local
      WHERE
        /* %JoinFKPK(deleted,tb_config_datasource_local," = "," AND") */
        deleted.id_config_datasource_local = tb_config_datasource_local.id_config_datasource_local AND
        NOT EXISTS (
          SELECT * FROM tb_entidade_local
          WHERE
            /* %JoinFKPK(tb_entidade_local,tb_config_datasource_local," = "," AND") */
            tb_entidade_local.id_config_datasource_local = tb_config_datasource_local.id_config_datasource_local
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last tb_entidade_local because tb_config_datasource_local exists.'
      GOTO error
    END


    /* ERwin Builtin Trigger */
    RETURN
error:
    raiserror @errno @errmsg
    rollback transaction
END

go


CREATE TRIGGER tU_tb_entidade_local ON tb_entidade_local FOR UPDATE AS
/* ERwin Builtin Trigger */
/* UPDATE trigger on tb_entidade_local */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insid_entidade_local bigint,
           @errno   int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* ERwin Builtin Trigger */
  /* tb_entidade_local  tb_view_lav on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="0005a527", PARENT_OWNER="", PARENT_TABLE="tb_entidade_local"
    CHILD_OWNER="", CHILD_TABLE="tb_view_lav"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_23", FK_COLUMNS="id_entidade_local" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(id_entidade_local)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,tb_view_lav
      WHERE
        /*  %JoinFKPK(tb_view_lav,deleted," = "," AND") */
        tb_view_lav.id_entidade_local = deleted.id_entidade_local
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update tb_entidade_local because tb_view_lav exists.'
      GOTO error
    END
  END

  /* ERwin Builtin Trigger */
  /* tb_entidade_local  tb_campo_entidade_local on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="tb_entidade_local"
    CHILD_OWNER="", CHILD_TABLE="tb_campo_entidade_local"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_19", FK_COLUMNS="id_entidade_local" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(id_entidade_local)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,tb_campo_entidade_local
      WHERE
        /*  %JoinFKPK(tb_campo_entidade_local,deleted," = "," AND") */
        tb_campo_entidade_local.id_entidade_local = deleted.id_entidade_local
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update tb_entidade_local because tb_campo_entidade_local exists.'
      GOTO error
    END
  END

  /* ERwin Builtin Trigger */
  /* tb_entidade_local  tb_entidade_global_local on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="tb_entidade_local"
    CHILD_OWNER="", CHILD_TABLE="tb_entidade_global_local"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_11", FK_COLUMNS="id_entidade_local" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(id_entidade_local)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,tb_entidade_global_local
      WHERE
        /*  %JoinFKPK(tb_entidade_global_local,deleted," = "," AND") */
        tb_entidade_global_local.id_entidade_local = deleted.id_entidade_local
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update tb_entidade_local because tb_entidade_global_local exists.'
      GOTO error
    END
  END

  /* ERwin Builtin Trigger */
  /* tb_config_datasource_local  tb_entidade_local on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="", PARENT_TABLE="tb_config_datasource_local"
    CHILD_OWNER="", CHILD_TABLE="tb_entidade_local"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_12", FK_COLUMNS="id_config_datasource_local" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(id_config_datasource_local)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,tb_config_datasource_local
        WHERE
          /* %JoinFKPK(inserted,tb_config_datasource_local) */
          inserted.id_config_datasource_local = tb_config_datasource_local.id_config_datasource_local
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    select @nullcnt = count(*) from inserted where
      inserted.id_config_datasource_local IS NULL
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update tb_entidade_local because tb_config_datasource_local does not exist.'
      GOTO error
    END
  END


  /* ERwin Builtin Trigger */
  RETURN
error:
    raiserror @errno @errmsg
    rollback transaction
END

go




CREATE TRIGGER tD_tb_formula_transformacao ON tb_formula_transformacao FOR DELETE AS
/* ERwin Builtin Trigger */
/* DELETE trigger on tb_formula_transformacao */
BEGIN
  DECLARE  @errno   int,
           @errmsg  varchar(255)
    /* ERwin Builtin Trigger */
    /* tb_campo_global_local  tb_formula_transformacao on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00019ff1", PARENT_OWNER="", PARENT_TABLE="tb_campo_global_local"
    CHILD_OWNER="", CHILD_TABLE="tb_formula_transformacao"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_22", FK_COLUMNS="id_campo_global_local" */
    IF EXISTS (SELECT * FROM deleted,tb_campo_global_local
      WHERE
        /* %JoinFKPK(deleted,tb_campo_global_local," = "," AND") */
        deleted.id_campo_global_local = tb_campo_global_local.id_campo_global_local AND
        NOT EXISTS (
          SELECT * FROM tb_formula_transformacao
          WHERE
            /* %JoinFKPK(tb_formula_transformacao,tb_campo_global_local," = "," AND") */
            tb_formula_transformacao.id_campo_global_local = tb_campo_global_local.id_campo_global_local
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last tb_formula_transformacao because tb_campo_global_local exists.'
      GOTO error
    END


    /* ERwin Builtin Trigger */
    RETURN
error:
    raiserror @errno @errmsg
    rollback transaction
END

go


CREATE TRIGGER tU_tb_formula_transformacao ON tb_formula_transformacao FOR UPDATE AS
/* ERwin Builtin Trigger */
/* UPDATE trigger on tb_formula_transformacao */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insid_formula_transformacao bigint,
           @errno   int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* ERwin Builtin Trigger */
  /* tb_campo_global_local  tb_formula_transformacao on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00018691", PARENT_OWNER="", PARENT_TABLE="tb_campo_global_local"
    CHILD_OWNER="", CHILD_TABLE="tb_formula_transformacao"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_22", FK_COLUMNS="id_campo_global_local" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(id_campo_global_local)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,tb_campo_global_local
        WHERE
          /* %JoinFKPK(inserted,tb_campo_global_local) */
          inserted.id_campo_global_local = tb_campo_global_local.id_campo_global_local
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update tb_formula_transformacao because tb_campo_global_local does not exist.'
      GOTO error
    END
  END


  /* ERwin Builtin Trigger */
  RETURN
error:
    raiserror @errno @errmsg
    rollback transaction
END

go




CREATE TRIGGER tD_tb_tipo_dado ON tb_tipo_dado FOR DELETE AS
/* ERwin Builtin Trigger */
/* DELETE trigger on tb_tipo_dado */
BEGIN
  DECLARE  @errno   int,
           @errmsg  varchar(255)
    /* ERwin Builtin Trigger */
    /* tb_tipo_dado  tb_campo on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="0000fe42", PARENT_OWNER="", PARENT_TABLE="tb_tipo_dado"
    CHILD_OWNER="", CHILD_TABLE="tb_campo"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="fk_tipo_campo", FK_COLUMNS="id_tipo_dado" */
    IF EXISTS (
      SELECT * FROM deleted,tb_campo
      WHERE
        /*  %JoinFKPK(tb_campo,deleted," = "," AND") */
        tb_campo.id_tipo_dado = deleted.id_tipo_dado
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete tb_tipo_dado because tb_campo exists.'
      GOTO error
    END


    /* ERwin Builtin Trigger */
    RETURN
error:
    raiserror @errno @errmsg
    rollback transaction
END

go


CREATE TRIGGER tU_tb_tipo_dado ON tb_tipo_dado FOR UPDATE AS
/* ERwin Builtin Trigger */
/* UPDATE trigger on tb_tipo_dado */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insid_tipo_dado bigint,
           @errno   int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* ERwin Builtin Trigger */
  /* tb_tipo_dado  tb_campo on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="00011add", PARENT_OWNER="", PARENT_TABLE="tb_tipo_dado"
    CHILD_OWNER="", CHILD_TABLE="tb_campo"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="fk_tipo_campo", FK_COLUMNS="id_tipo_dado" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(id_tipo_dado)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,tb_campo
      WHERE
        /*  %JoinFKPK(tb_campo,deleted," = "," AND") */
        tb_campo.id_tipo_dado = deleted.id_tipo_dado
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update tb_tipo_dado because tb_campo exists.'
      GOTO error
    END
  END


  /* ERwin Builtin Trigger */
  RETURN
error:
    raiserror @errno @errmsg
    rollback transaction
END

go




CREATE TRIGGER tD_tb_view_gav ON tb_view_gav FOR DELETE AS
/* ERwin Builtin Trigger */
/* DELETE trigger on tb_view_gav */
BEGIN
  DECLARE  @errno   int,
           @errmsg  varchar(255)
    /* ERwin Builtin Trigger */
    /* tb_entidade_global  tb_view_gav on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00017139", PARENT_OWNER="", PARENT_TABLE="tb_entidade_global"
    CHILD_OWNER="", CHILD_TABLE="tb_view_gav"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_14", FK_COLUMNS="id_entidade_global" */
    IF EXISTS (SELECT * FROM deleted,tb_entidade_global
      WHERE
        /* %JoinFKPK(deleted,tb_entidade_global," = "," AND") */
        deleted.id_entidade_global = tb_entidade_global.id_entidade_global AND
        NOT EXISTS (
          SELECT * FROM tb_view_gav
          WHERE
            /* %JoinFKPK(tb_view_gav,tb_entidade_global," = "," AND") */
            tb_view_gav.id_entidade_global = tb_entidade_global.id_entidade_global
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last tb_view_gav because tb_entidade_global exists.'
      GOTO error
    END


    /* ERwin Builtin Trigger */
    RETURN
error:
    raiserror @errno @errmsg
    rollback transaction
END

go


CREATE TRIGGER tU_tb_view_gav ON tb_view_gav FOR UPDATE AS
/* ERwin Builtin Trigger */
/* UPDATE trigger on tb_view_gav */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insid_view_gav bigint,
           @errno   int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* ERwin Builtin Trigger */
  /* tb_entidade_global  tb_view_gav on child update no action */
  /* ERWIN_RELATION:CHECKSUM="0001a40b", PARENT_OWNER="", PARENT_TABLE="tb_entidade_global"
    CHILD_OWNER="", CHILD_TABLE="tb_view_gav"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_14", FK_COLUMNS="id_entidade_global" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(id_entidade_global)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,tb_entidade_global
        WHERE
          /* %JoinFKPK(inserted,tb_entidade_global) */
          inserted.id_entidade_global = tb_entidade_global.id_entidade_global
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    select @nullcnt = count(*) from inserted where
      inserted.id_entidade_global IS NULL
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update tb_view_gav because tb_entidade_global does not exist.'
      GOTO error
    END
  END


  /* ERwin Builtin Trigger */
  RETURN
error:
    raiserror @errno @errmsg
    rollback transaction
END

go




CREATE TRIGGER tD_tb_view_lav ON tb_view_lav FOR DELETE AS
/* ERwin Builtin Trigger */
/* DELETE trigger on tb_view_lav */
BEGIN
  DECLARE  @errno   int,
           @errmsg  varchar(255)
    /* ERwin Builtin Trigger */
    /* tb_entidade_local  tb_view_lav on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00016377", PARENT_OWNER="", PARENT_TABLE="tb_entidade_local"
    CHILD_OWNER="", CHILD_TABLE="tb_view_lav"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_23", FK_COLUMNS="id_entidade_local" */
    IF EXISTS (SELECT * FROM deleted,tb_entidade_local
      WHERE
        /* %JoinFKPK(deleted,tb_entidade_local," = "," AND") */
        deleted.id_entidade_local = tb_entidade_local.id_entidade_local AND
        NOT EXISTS (
          SELECT * FROM tb_view_lav
          WHERE
            /* %JoinFKPK(tb_view_lav,tb_entidade_local," = "," AND") */
            tb_view_lav.id_entidade_local = tb_entidade_local.id_entidade_local
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last tb_view_lav because tb_entidade_local exists.'
      GOTO error
    END


    /* ERwin Builtin Trigger */
    RETURN
error:
    raiserror @errno @errmsg
    rollback transaction
END

go


CREATE TRIGGER tU_tb_view_lav ON tb_view_lav FOR UPDATE AS
/* ERwin Builtin Trigger */
/* UPDATE trigger on tb_view_lav */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insid_view_lav bigint,
           @errno   int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* ERwin Builtin Trigger */
  /* tb_entidade_local  tb_view_lav on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00019ede", PARENT_OWNER="", PARENT_TABLE="tb_entidade_local"
    CHILD_OWNER="", CHILD_TABLE="tb_view_lav"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="R_23", FK_COLUMNS="id_entidade_local" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(id_entidade_local)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,tb_entidade_local
        WHERE
          /* %JoinFKPK(inserted,tb_entidade_local) */
          inserted.id_entidade_local = tb_entidade_local.id_entidade_local
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    select @nullcnt = count(*) from inserted where
      inserted.id_entidade_local IS NULL
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update tb_view_lav because tb_entidade_local does not exist.'
      GOTO error
    END
  END


  /* ERwin Builtin Trigger */
  RETURN
error:
    raiserror @errno @errmsg
    rollback transaction
END

go


