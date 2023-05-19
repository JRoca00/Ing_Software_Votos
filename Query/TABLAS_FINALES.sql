CREATE TABLE tbl_empadronamiento(
    pk_ID_empadronamiento number GENERATED ALWAYS AS IDENTITY START WITH 1 INCREMENT BY 1,
    nombre_persona varchar2(256),
    apellido_persona varchar2(256),
    correo_persona varchar2(256),
    direccion_persona varchar2(256),
    DPI_persona varchar2(15),
    fk_mesa number
);
ALTER TABLE tbl_empadronamiento ADD CONSTRAINT
"pk_empadronamiento" primary key (pk_ID_empadronamiento);

ALTER TABLE tbl_empadronamiento ADD CONSTRAINT 
"fk_empadronamiento" foreign key (fk_mesa) REFERENCES TBL_MESA(PK_ID_MESA);


CREATE TABLE tbl_sucursal(
    pk_ID_sucursal number GENERATED ALWAYS AS IDENTITY START WITH 1 INCREMENT BY 1,
    fk_municipio number,
    descripcion varchar2(256)
);
ALTER TABLE tbl_sucursal ADD CONSTRAINT
"pk_sucursal" primary key (pk_ID_sucursal);

ALTER TABLE tbl_sucursal ADD CONSTRAINT 
"fk_sucursal" foreign key (fk_municipio) REFERENCES tbl_municipio(pk_ID_municipio);



CREATE TABLE tbl_municipio(
    pk_ID_municipio number GENERATED ALWAYS AS IDENTITY START WITH 1 INCREMENT BY 1,
    descripcion varchar2(256),
    fk_departamento number
);
ALTER TABLE tbl_municipio ADD CONSTRAINT
"pk_municipio" primary key (pk_ID_municipio);
ALTER TABLE tbl_municipio ADD CONSTRAINT 
"fk_municipio" foreign key (fk_departamento) REFERENCES tbl_departamento(pk_ID_departamento);
ALTER TABLE tbl_empadronamiento ADD municipio_persona NUMBER;
ALTER TABLE tbl_empadronamiento ADD CONSTRAINT 
"fk_empadronamiento2" foreign key (municipio_persona) REFERENCES tbl_municipio(pk_ID_municipio);


CREATE TABLE tbl_departamento(
    pk_ID_departamento number GENERATED ALWAYS AS IDENTITY START WITH 1 INCREMENT BY 1,
    descripcion varchar2(256)
);
ALTER TABLE tbl_departamento ADD CONSTRAINT
"pk_departamento" primary key (pk_ID_departamento);


create table tbl_encargado(
    pk_ID_encargado number GENERATED ALWAYS AS IDENTITY START WITH 1 INCREMENT BY 1,
    nombre varchar2(256),
    apellido varchar2(256)
);
ALTER TABLE tbl_encargado ADD CONSTRAINT
"pk_encargado" primary key (pk_ID_encargado);



CREATE TABLE tbl_mesa (
    pk_ID_mesa number GENERATED ALWAYS AS IDENTITY START WITH 1 INCREMENT BY 1,
    fk_sucursal number,
    fk_encargado number
);
ALTER TABLE tbl_mesa ADD CONSTRAINT
"pk_mesa" primary key (pk_ID_mesa);
alter table "WKSP_JYAPEX"."TBL_MESA" add
("CODIGO_MESA" NUMBER not null);

ALTER TABLE tbl_mesa ADD CONSTRAINT 
"fk_mesa1" foreign key (fk_sucursal) REFERENCES tbl_sucursal(pk_ID_sucursal);
ALTER TABLE tbl_mesa ADD CONSTRAINT 
"fk_mesa2" foreign key (fk_encargado) REFERENCES tbl_encargado(pk_ID_encargado);



CREATE TABLE tbl_partido (
    pk_ID_partido number GENERATED ALWAYS AS IDENTITY START WITH 1 INCREMENT BY 1,
    descripcion varchar2(256)
);
ALTER TABLE tbl_partido ADD CONSTRAINT
"pk_partido" primary key (pk_ID_partido);
alter table "WKSP_JYAPEX"."TBL_PARTIDO" add
("FOTO" BLOB);
alter table "WKSP_JYAPEX"."TBL_PARTIDO" add
("MIME_TYPE" VARCHAR2(256));


CREATE TABLE tbl_tipoCandidato (
    pk_ID_tipoCandidato number GENERATED ALWAYS AS IDENTITY START WITH 1 INCREMENT BY 1,
    descripcion varchar2(256)
);
ALTER TABLE tbl_tipoCandidato ADD CONSTRAINT
"pk_tipoCandidato" primary key (pk_ID_tipoCandidato);


CREATE TABLE tbl_candidato (
    pk_ID_candidato number GENERATED ALWAYS AS IDENTITY START WITH 1 INCREMENT BY 1,
    fk_tipoCandidato number,
    fk_partido number,
    nombre_candidato varchar2(256),
    apellido_candidato varchar2(256)
);
ALTER TABLE tbl_candidato ADD CONSTRAINT
"pk_candidato" primary key (pk_ID_candidato);
alter table "WKSP_JYAPEX"."TBL_CANDIDATO" add
("FOTO" BLOB not null);
alter table "WKSP_JYAPEX"."TBL_CANDIDATO" add
("MIME_TYPE" VARCHAR2(256));
alter table "WKSP_JYAPEX"."TBL_CANDIDATO" add
("FILE_NAME" VARCHAR2(256));
alter table "WKSP_JYAPEX"."TBL_CANDIDATO" add
("FILE_CHARSET" VARCHAR2(512));

ALTER TABLE tbl_candidato ADD CONSTRAINT 
"fk_candidato1" foreign key (fk_tipoCandidato) REFERENCES tbl_tipoCandidato(pk_ID_tipoCandidato);
ALTER TABLE tbl_candidato ADD CONSTRAINT 
"fk_candidato2" foreign key (fk_partido) REFERENCES tbl_partido(pk_ID_partido);



CREATE TABLE tbl_voto (
    pk_ID_voto number GENERATED ALWAYS AS IDENTITY START WITH 1 INCREMENT BY 1,
    fk_candidato number,
    fk_mesa number
);
ALTER TABLE tbl_voto ADD CONSTRAINT
"pk_voto" primary key (pk_ID_voto);

ALTER TABLE tbl_voto ADD CONSTRAINT 
"fk_voto1" foreign key (fk_candidato) REFERENCES tbl_candidato(pk_ID_candidato);
ALTER TABLE tbl_voto ADD CONSTRAINT 
"fk_voto2" foreign key (fk_mesa) REFERENCES tbl_mesa(pk_ID_mesa);



CREATE TABLE tbl_estatusPadrono (
    pk_ID_estatusPadrono number GENERATED ALWAYS AS IDENTITY START WITH 1 INCREMENT BY 1,
    fk_empadronamiento number,
    estatus varchar2(1)
);
ALTER TABLE tbl_estatusPadrono ADD CONSTRAINT
"pk_estatusPadrono" primary key (pk_ID_estatusPadrono);

ALTER TABLE tbl_estatusPadrono ADD CONSTRAINT 
"fk_estatusPadrono" foreign key (fk_empadronamiento) REFERENCES tbl_empadronamiento(pk_ID_empadronamiento);


CREATE TABLE tbl_usuarios (
    pk_ID_usuario number GENERATED ALWAYS AS IDENTITY START WITH 1 INCREMENT BY 1,
    nombre varchar2(256),
    password varchar2(256)
);
ALTER TABLE tbl_usuarios ADD CONSTRAINT
"pk_usuarios" primary key (pk_ID_usuario);

CREATE TABLE tbl_candidatoAlcalde (
    pk_ID_candidato number GENERATED ALWAYS AS IDENTITY START WITH 1 INCREMENT BY 1,
    fk_tipoCandidato number,
    fk_partido number,
    nombre_candidato varchar2(256),
    apellido_candidato varchar2(256),
    fk_municipio number
);
ALTER TABLE tbl_candidatoAlcalde ADD CONSTRAINT
"pk_candidatoAlcalde" primary key (pk_ID_candidato);
alter table tbl_candidatoAlcalde add
("FOTO" BLOB not null);
alter table tbl_candidatoAlcalde add
("MIME_TYPE" VARCHAR2(256));
alter table tbl_candidatoAlcalde add
("FILE_NAME" VARCHAR2(256));
alter table tbl_candidatoAlcalde add
("FILE_CHARSET" VARCHAR2(512));

ALTER TABLE tbl_candidatoAlcalde ADD CONSTRAINT 
"fk_candidatoAlcalde1" foreign key (fk_tipoCandidato) REFERENCES tbl_tipoCandidato(pk_ID_tipoCandidato);
ALTER TABLE tbl_candidatoAlcalde ADD CONSTRAINT 
"fk_candidatoAlcalde2" foreign key (fk_partido) REFERENCES tbl_partido(pk_ID_partido);
ALTER TABLE tbl_candidatoAlcalde ADD CONSTRAINT 
"fk_candidatoAlcalde3" foreign key (fk_municipio) REFERENCES tbl_municipio(pk_ID_municipio);



CREATE TABLE tbl_candidatoDiputadoDepartamental (
    pk_ID_candidato number GENERATED ALWAYS AS IDENTITY START WITH 1 INCREMENT BY 1,
    fk_tipoCandidato number,
    fk_partido number,
    nombre_candidato varchar2(256),
    apellido_candidato varchar2(256),
    fk_departamento number
);
ALTER TABLE tbl_candidatoDiputadoDepartamental ADD CONSTRAINT
"pk_candidatoDiputado" primary key (pk_ID_candidato);
alter table tbl_candidatoDiputadoDepartamental add
("FOTO" BLOB not null);
alter table tbl_candidatoDiputadoDepartamental add
("MIME_TYPE" VARCHAR2(256));
alter table tbl_candidatoDiputadoDepartamental add
("FILE_NAME" VARCHAR2(256));
alter table tbl_candidatoDiputadoDepartamental add
("FILE_CHARSET" VARCHAR2(512));

ALTER TABLE tbl_candidatoDiputadoDepartamental ADD CONSTRAINT 
"fk_candidatoDiputado1" foreign key (fk_tipoCandidato) REFERENCES tbl_tipoCandidato(pk_ID_tipoCandidato);
ALTER TABLE tbl_candidatoDiputadoDepartamental ADD CONSTRAINT 
"fk_candidatoDiputado2" foreign key (fk_partido) REFERENCES tbl_partido(pk_ID_partido);
ALTER TABLE tbl_candidatoDiputadoDepartamental ADD CONSTRAINT

CREATE TABLE tbl_diputadoPartido (
    pk_ID_diputadoPartido number GENERATED ALWAYS AS IDENTITY START WITH 1 INCREMENT BY 1,
    fk_partido number
);
ALTER TABLE tbl_diputadoPartido ADD CONSTRAINT
"pk_diputadoPartido" primary key (pk_ID_diputadoPartido);
ALTER TABLE tbl_diputadoPartido ADD CONSTRAINT 
"fk_diputadoPartido" foreign key (fk_partido) REFERENCES tbl_partido (pk_ID_partido );

CREATE TABLE tbl_votoAlcalde (
    pk_ID_voto number GENERATED ALWAYS AS IDENTITY START WITH 1 INCREMENT BY 1,
    fk_candidato number,
    fk_mesa number
);
ALTER TABLE tbl_votoAlcalde ADD CONSTRAINT
"pk_votoAlcalde" primary key (pk_ID_voto);

ALTER TABLE tbl_votoAlcalde ADD CONSTRAINT 
"fk_votoAlcalde1" foreign key (fk_candidato) REFERENCES TBL_CANDIDATOALCALDE(pk_ID_candidato);
ALTER TABLE tbl_votoAlcalde ADD CONSTRAINT 
"fk_votoAlcalde2" foreign key (fk_mesa) REFERENCES tbl_mesa(pk_ID_mesa);

CREATE TABLE tbl_votoDiputadoDepa (
    pk_ID_voto number GENERATED ALWAYS AS IDENTITY START WITH 1 INCREMENT BY 1,
    fk_candidato number,
    fk_mesa number
);
ALTER TABLE tbl_votoDiputadoDepa ADD CONSTRAINT
"pk_votoDiputadoDepa" primary key (pk_ID_voto);

ALTER TABLE tbl_votoDiputadoDepa ADD CONSTRAINT 
"fk_votoDiputadoDepa1" foreign key (fk_candidato) REFERENCES TBL_CANDIDATODIPUTADODEPARTAMENTAL(pk_ID_candidato);
ALTER TABLE tbl_votoDiputadoDepa ADD CONSTRAINT 
"fk_votoDiputadoDepa2" foreign key (fk_mesa) REFERENCES tbl_mesa(pk_ID_mesa);

CREATE TABLE tbl_votoDiputadoPartido (
    pk_ID_voto number GENERATED ALWAYS AS IDENTITY START WITH 1 INCREMENT BY 1,
    fk_candidato number,
    fk_mesa number
);
ALTER TABLE tbl_votoDiputadoPartido ADD CONSTRAINT
"pk_votoDiputadoPartido" primary key (pk_ID_voto);

ALTER TABLE tbl_votoDiputadoPartido ADD CONSTRAINT 
"fk_votoDiputadoPartido1" foreign key (fk_candidato) REFERENCES TBL_DIPUTADOPARTIDO(PK_ID_DIPUTADOPARTIDO);
ALTER TABLE tbl_votoDiputadoPartido ADD CONSTRAINT 
"fk_votoDiputadoPartido2" foreign key (fk_mesa) REFERENCES tbl_mesa(pk_ID_mesa);