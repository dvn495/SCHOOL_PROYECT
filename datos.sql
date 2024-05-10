INSERT INTO tipo_tel (id_tipo_tel, nombre_tipo_tel, descripcion_tipo_tel)
VALUES 
  (1, 'Teléfono móvil', 'Teléfono celular'),
  (2, 'Teléfono fijo', 'Teléfono de línea fija'),
  (3, 'Teléfono satelital', 'Teléfono para zonas remotas');
  
INSERT INTO telefono (id_telefono, id_cliente_telefono, id_tipo, numero, prefijo)
VALUES 
  (1, 1, 1, 123456789, '+1'),
  (2, 2, 1, 234567890, '+1'),
  (3, 3, 2, 345678901, '+1'),
  (4, 4, 1, 456789012, '+1');
  
INSERT INTO calle (id_calle, calle)
VALUES 
  (1, 'Calle Principal'),
  (2, 'Avenida Central'),
  (3, 'Bulevar del Norte');

INSERT INTO barrio (id_barrio, barrio)
VALUES 
  (1, 'Barrio del Sol'),
  (2, 'Barrio del Centro'),
  (3, 'Barrio de las Flores');

INSERT INTO direccion (id_direccion, id_calle_direccion, id_barrio_direccion, vivienda)
VALUES 
  (1, 1, 1, 'Casa 12'),
  (2, 2, 2, 'Apartamento 3B'),
  (3, 3, 3, 'Casa 25'),
  (4, 2, 1, 'Apartamento 2A');

INSERT INTO ciudad (id_ciudad, ciudad)
VALUES 
  (1, 'Ciudad Alpha'),
  (2, 'Ciudad Beta'),
  (3, 'Ciudad Gamma');

INSERT INTO genero (id_genero, genero)
VALUES 
  (1, 'Masculino'),
  (2, 'Femenino');

INSERT INTO departamento (id_departamento, departamento)
VALUES 
  (1, 'Ciencias'),
  (2, 'Matemáticas'),
  (3, 'Ingeniería'),
  (4, 'Literatura');

INSERT INTO creditos (id_creditos, creditos)
VALUES 
  (1, 3),
  (2, 4),
  (3, 6),
  (4, 5);

INSERT INTO tipo (id_tipo, tipo)
VALUES 
  (1, 'Teórico'),
  (2, 'Práctico');

INSERT INTO grado (id_grado, grado)
VALUES 
  (1, 'Grado en Matemáticas'),
  (2, 'Grado en Ciencias'),
  (3, 'Grado en Literatura'),
  (4, 'Grado en Física'),
  (5, 'Grado en Ingeniería Informática (Plan 2015)'),
  (6, 'Grado en Ingeniería Mecánica'),
  (7, 'Grado en Ingeniería Electrónica');

INSERT INTO curso_escolar (id_curso, inicio, finalizacion)
VALUES 
  (1, '2018-09-01', '2019-06-30'),
  (2, '2019-09-01', '2020-06-30'),
  (3, '2020-09-01', '2021-06-30');

INSERT INTO alumno (id_alumno, nit_alumno, nombre_alumno, apellido1_alumno, apellido2_alumno, id_ciudad_alumno, id_direccion_alumno, id_telefono_alumno, fecha_nacimiento_alumno, id_genero_alumno)
VALUES 
  (1, '12345678A', 'Juan', 'García', 'López', 1, 1, 1, '1999-01-15', 1),
  (2, '87654321B', 'Ana', 'Martínez', 'Sánchez', 2, 2, 2, '1999-05-10', 2),
  (3, '34567890C', 'Pedro', 'Pérez', 'Gómez', 3, 3, 3, '2000-12-01', 1),
  (4, '23456789D', 'María', 'González', 'Núñez', 1, 4, 4, '2001-03-25', 2);

INSERT INTO profesor (id_profesor, nit_profesor, nombre_profesor, apellido1_profesor, apellido2_profesor, id_ciudad_profesor, id_direccion_profesor, id_telefono_profesor, fecha_nacimiento_profesor, id_genero_profesor, id_departamento_profesor)
VALUES 
  (1, '12345678K', 'Carlos', 'Mendoza', 'Rodríguez', 1, 1, 1, '1980-04-15', 1, 1),
  (2, '87654321L', 'Laura', 'Jiménez', 'Álvarez', 2, 2, 2, '1982-07-20', 2, 2),
  (3, '23456789M', 'Raúl', 'Ruiz', 'Ortega', 1, 3, 3, '1985-09-15', 1, 3),
  (4, '34567890N', 'Sofía', 'Romero', 'Santos', 3, 3, 3, '1990-02-20', 2, 3);

INSERT INTO asignatura (id_asignatura, nombre_asignatura, id_creditos_asignatura, id_tipo_asignatura, curso_asignatura, cuatrimentre, id_profesor_asignatura, id_grado_asignatura)
VALUES 
  (1, 'Matemáticas I', 2, 1, 3, 1, 1, 1),
  (2, 'Física I', 2, 1, 3, 2, 1, 2),
  (3, 'Programación I', 3, 2, 3, 1, 3, 5),
  (4, 'Programación II', 3, 2, 3, 1, NULL, 5),
  (5, 'Historia', 4, 1, 1, 2, NULL, 3),
  (6, 'Algebra', 4, 2, 1, 2, NULL, 1),
  (7, 'Redes', 3, 1, 1, 1, NULL, 7),
  (8, 'Lógica', 4, 1, 3, 2, NULL, 7);

INSERT INTO alumno_se_matricula_asignatura (id_alumno_matricula, id_asignatura_matricula, id_curso_escolar_matricula)
VALUES 
  (1, 1, 1),
  (2, 2, 1),
  (3, 3, 1),
  (4, 4, 2),
  (3, 5, 3),
  (4, 6, 2);

