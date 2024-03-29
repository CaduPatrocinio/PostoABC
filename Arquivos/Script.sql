/******************************************************************************/
/****         Generated by IBExpert 2023.1.3.1 16/02/2024 15:19:05         ****/
/******************************************************************************/

SET SQL DIALECT 3;

SET NAMES WIN1252;

SET CLIENTLIB 'C:\PostoABC\fbclient.dll';

CREATE DATABASE 'C:\PostoABC\DataBase\DataBase.fdb'
USER 'SYSDBA' PASSWORD 'masterkey'
PAGE_SIZE 16384
DEFAULT CHARACTER SET WIN1252 COLLATION WIN1252;



/******************************************************************************/
/****                              Generators                              ****/
/******************************************************************************/

CREATE GENERATOR GEN_ABASTECIMENTO_ID START WITH 0 INCREMENT BY 1;
SET GENERATOR GEN_ABASTECIMENTO_ID TO 47;

CREATE GENERATOR GEN_BOMBA_ID START WITH 0 INCREMENT BY 1;
SET GENERATOR GEN_BOMBA_ID TO 8;

CREATE GENERATOR GEN_COMBUSTIVEL_ID START WITH 0 INCREMENT BY 1;
SET GENERATOR GEN_COMBUSTIVEL_ID TO 3;

CREATE GENERATOR GEN_TANQUE_ID START WITH 0 INCREMENT BY 1;
SET GENERATOR GEN_TANQUE_ID TO 19;



/******************************************************************************/
/****                                Tables                                ****/
/******************************************************************************/



CREATE TABLE ABASTECIMENTO (
    ID_ABASTECIMENTO  INTEGER NOT NULL,
    ID_BOMBA          INTEGER NOT NULL,
    DT_ABASTECIMENTO  TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
    VALOR_LITRO       NUMERIC(18,2) NOT NULL,
    PERC_IMPOSTO      NUMERIC(15,1) NOT NULL,
    QTDE_LITROS       INTEGER NOT NULL,
    SUB_TOTAL         NUMERIC(15,2) NOT NULL,
    VALOR_IMPOSTO     NUMERIC(15,2) NOT NULL,
    VALOR_TOTAL       NUMERIC(15,2) NOT NULL
);

CREATE TABLE BOMBA (
    ID_BOMBA   INTEGER NOT NULL,
    ID_TANQUE  INTEGER NOT NULL,
    DESCRICAO  VARCHAR(80) NOT NULL
);

CREATE TABLE COMBUSTIVEL (
    ID_COMBUSTIVEL  INTEGER NOT NULL,
    DESCRICAO       VARCHAR(40) NOT NULL,
    VALOR_LITRO     NUMERIC(18,2) NOT NULL,
    PERC_IMPOSTO    NUMERIC(18,2) NOT NULL
);

CREATE TABLE TANQUE (
    ID_TANQUE       INTEGER NOT NULL,
    ID_COMBUSTIVEL  INTEGER NOT NULL,
    CAPACIDADE      DECIMAL(15,2) NOT NULL,
    DESCRICAO       VARCHAR(40)
);



/******************************************************************************/
/****                             Primary keys                             ****/
/******************************************************************************/

ALTER TABLE ABASTECIMENTO ADD CONSTRAINT PK_ABASTECIMENTO PRIMARY KEY (ID_ABASTECIMENTO);
ALTER TABLE BOMBA ADD CONSTRAINT PK_BOMBA PRIMARY KEY (ID_BOMBA);
ALTER TABLE COMBUSTIVEL ADD CONSTRAINT PK_COMBUSTIVEL PRIMARY KEY (ID_COMBUSTIVEL);
ALTER TABLE TANQUE ADD CONSTRAINT PK_TANQUE PRIMARY KEY (ID_TANQUE);


/******************************************************************************/
/****                             Foreign keys                             ****/
/******************************************************************************/

ALTER TABLE ABASTECIMENTO ADD CONSTRAINT FK_ABASTECIMENTO_BOMBA FOREIGN KEY (ID_BOMBA) REFERENCES BOMBA (ID_BOMBA);
ALTER TABLE BOMBA ADD CONSTRAINT FK_BOMBA_TANQUE FOREIGN KEY (ID_TANQUE) REFERENCES TANQUE (ID_TANQUE);
ALTER TABLE TANQUE ADD CONSTRAINT FK_TANQUE_COMBUSTIVEL FOREIGN KEY (ID_COMBUSTIVEL) REFERENCES COMBUSTIVEL (ID_COMBUSTIVEL)
  USING INDEX FK_TANQUE_1;


/******************************************************************************/
/****                               Triggers                               ****/
/******************************************************************************/



SET TERM ^ ;



/******************************************************************************/
/****                         Triggers for tables                          ****/
/******************************************************************************/



/* Trigger: ABASTECIMENTO_ID */
CREATE TRIGGER ABASTECIMENTO_ID FOR ABASTECIMENTO
ACTIVE BEFORE INSERT POSITION 0
AS
BEGIN
  IF (NEW.ID_ABASTECIMENTO IS NULL) THEN
    NEW.ID_ABASTECIMENTO = GEN_ID(GEN_ABASTECIMENTO_ID,1);
END
^

/* Trigger: BOMBA_ID */
CREATE TRIGGER BOMBA_ID FOR BOMBA
ACTIVE BEFORE INSERT POSITION 0
as
begin
  if (new.id_bomba is null) then
    new.id_bomba = gen_id(gen_bomba_id,1);
end
^

/* Trigger: COMBUSTIVEL_ID */
CREATE TRIGGER COMBUSTIVEL_ID FOR COMBUSTIVEL
ACTIVE BEFORE INSERT POSITION 0
as
begin
  if (new.id_combustivel is null) then
    new.id_combustivel = gen_id(gen_combustivel_id,1);
end
^

/* Trigger: TANQUE_ID */
CREATE TRIGGER TANQUE_ID FOR TANQUE
ACTIVE BEFORE INSERT POSITION 0
as
begin
  if (new.id_tanque is null) then
    new.id_tanque = gen_id(gen_tanque_id,1);
end
^
SET TERM ; ^

