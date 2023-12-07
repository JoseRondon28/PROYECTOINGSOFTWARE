create database colegio
use colegio
create table alumnos(idAlumno char(5) not null,
  dni char(8) not null,
  apellido varchar(30),
  nombre varchar(30),
  peso decimal(4,2)
 );
 insert into alumnos values ('A123','22222222','Perez','Patricia',55.50);
 insert into alumnos values ('A234','23333333','Lopez','Ana',79);
 insert into alumnos values ('A345','24444444','Garcia','Carlos',68.5);
 insert into alumnos values ('A348','25555555','Perez','Daniela',47.85);
 insert into alumnos values ('A457','26666666','Perez','Fabian',63.2);
 insert into alumnos values ('A589','27777777','Gomez','Gaston',56.9);

USE colegio;
CREATE UNIQUE CLUSTERED INDEX idx_apellido ON alumnos(apellido);

USE colegio;
CREATE UNIQUE NONCLUSTERED INDEX idx_dni ON alumnos(dni);

USE colegio;
CREATE NONCLUSTERED INDEX idx_apellido_nombre ON alumnos(apellido, nombre);

USE colegio;
SELECT 
    i.name AS NombreIndice,
    OBJECT_NAME(i.object_id) AS NombreTabla,
    i.type_desc AS TipoIndice,
    c.name AS NombreColumna
FROM 
    sys.indexes i
INNER JOIN 
    sys.index_columns ic ON i.object_id = ic.object_id AND i.index_id = ic.index_id
INNER JOIN 
    sys.columns c ON ic.object_id = c.object_id AND ic.column_id = c.column_id
WHERE 
    OBJECT_NAME(i.object_id) = 'alumnos'
    AND i.name = 'idx_apellido_nombre';

USE colegio;
SELECT 
    i.name AS NombreIndice,
    OBJECT_NAME(i.object_id) AS NombreTabla,
    i.type_desc AS TipoIndice,
    c.name AS NombreColumna
FROM 
    sys.indexes i
INNER JOIN 
    sys.index_columns ic ON i.object_id = ic.object_id AND i.index_id = ic.index_id
INNER JOIN 
    sys.columns c ON ic.object_id = c.object_id AND ic.column_id = c.column_id
WHERE 
    OBJECT_NAME(i.object_id) = 'alumnos'
    AND i.name = 'idx_dni';


