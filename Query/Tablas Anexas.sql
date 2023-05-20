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


CREATE TABLE tbl_sucursal(
    pk_ID_sucursal number GENERATED ALWAYS AS IDENTITY START WITH 1 INCREMENT BY 1,
    fk_municipio number,
    descripcion varchar2(256)
);
ALTER TABLE tbl_sucursal ADD CONSTRAINT
"pk_sucursal" primary key (pk_ID_sucursal);


CREATE TABLE tbl_municipio(
    pk_ID_municipio number GENERATED ALWAYS AS IDENTITY START WITH 1 INCREMENT BY 1,
    descripcion varchar2(256),
    fk_departamento number
);
ALTER TABLE tbl_municipio ADD CONSTRAINT
"pk_municipio" primary key (pk_ID_municipio);


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


CREATE TABLE tbl_partido (
    pk_ID_partido number GENERATED ALWAYS AS IDENTITY START WITH 1 INCREMENT BY 1,
    descripcion varchar2(256)
);
ALTER TABLE tbl_partido ADD CONSTRAINT
"pk_partido" primary key (pk_ID_partido);


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


CREATE TABLE tbl_voto (
    pk_ID_voto number GENERATED ALWAYS AS IDENTITY START WITH 1 INCREMENT BY 1,
    fk_candidato number,
    fk_mesa number
);
ALTER TABLE tbl_voto ADD CONSTRAINT
"pk_voto" primary key (pk_ID_voto);

CREATE TABLE tbl_estatusPadrono (
    pk_ID_estatusPadrono number GENERATED ALWAYS AS IDENTITY START WITH 1 INCREMENT BY 1,
    fk_empadronamiento number,
    estatus varchar2(1)
);
ALTER TABLE tbl_estatusPadrono ADD CONSTRAINT
"pk_estatusPadrono" primary key (pk_ID_estatusPadrono);