CREATE OR REPLACE FUNCTION VERIFICAR_LOGIN (
    v_nombre in varchar2,
    v_password in varchar2
)
RETURN BOOLEAN
IS
    v_contador number;
BEGIN
    select count(*) INTO v_contador 
    FROM TBL_USUARIOS
    WHERE NOMBRE = v_nombre AND PASSWORD = v_password;

    IF  v_contador = 1 THEN
    RETURN TRUE;
    ELSE 
    RETURN FALSE;
    END IF;
END VERIFICAR_LOGIN;

CREATE OR REPLACE PROCEDURE INSERTAR_VOTO (
    v_candidato in number,
    v_dpi in varchar2
)
AS 
 v_mesa number;
BEGIN 
SELECT FK_MESA INTO v_mesa FROM TBL_EMPADRONAMIENTO WHERE DPI_PERSONA = v_dpi;
INSERT INTO TBL_VOTO (FK_CANDIDATO, FK_MESA) VALUES (v_candidato, v_mesa);
END INSERTAR_VOTO;

create or replace PROCEDURE INSERTAR_VOTO_DIPUTADODEPA (
    v_candidato in number,
    v_dpi in varchar2
)
AS 
 v_mesa number;
BEGIN 
SELECT FK_MESA INTO v_mesa FROM TBL_EMPADRONAMIENTO WHERE DPI_PERSONA = v_dpi;
INSERT INTO TBL_VOTODIPUTADODEPA (FK_CANDIDATO, FK_MESA) VALUES (v_candidato, v_mesa);
END INSERTAR_VOTO_DIPUTADODEPA;

create or replace PROCEDURE INSERTAR_VOTO_DIPUTADOCONGRESO (
    v_candidato in number,
    v_dpi in varchar2
)
AS 
 v_mesa number;
BEGIN 
SELECT FK_MESA INTO v_mesa FROM TBL_EMPADRONAMIENTO WHERE DPI_PERSONA = v_dpi;
INSERT INTO TBL_VOTODIPUTADOPARTIDO (FK_CANDIDATO, FK_MESA) VALUES (v_candidato, v_mesa);
END INSERTAR_VOTO_DIPUTADOCONGRESO;

CREATE OR REPLACE PROCEDURE ACTUALIZAR_ESTATUS(
    v_dpi in varchar2
) 
AS
    v_padrono number;
BEGIN 
SELECT PK_ID_EMPADRONAMIENTO INTO v_padrono FROM TBL_EMPADRONAMIENTO WHERE DPI_PERSONA = v_dpi;
UPDATE TBL_ESTATUSPADRONO SET ESTATUS = 'V' WHERE FK_EMPADRONAMIENTO = v_padrono;
END ACTUALIZAR_ESTATUS;

CREATE OR REPLACE TRIGGER INGRESO_ESTATUS
AFTER INSERT 
ON TBL_EMPADRONAMIENTO
FOR EACH ROW
BEGIN
INSERT INTO TBL_ESTATUSPADRONO(FK_EMPADRONAMIENTO,ESTATUS) VALUES (:new.PK_ID_EMPADRONAMIENTO, 'N');
END;