CREATE TABLE tipo_tel(
  id_tipo_tel INT(10) PRIMARY KEY,
  nombre_tipo_tel VARCHAR(50) NOT NULL,
  descripcion_tipo_tel TEXT
  );

CREATE TABLE telefono(
  id_telefono INT(10)PRIMARY KEY,
  id_cliente_telefono INT(10),
  id_tipo INT(10) NOT NULL,
  numero INT(10) NOT NULL,
  prefijo VARCHAR(5),
  CONSTRAINT FK_tipo_tel FOREIGN KEY (id_tipo) REFERENCES tipo_tel(id_tipo_tel)
  );
  
CREATE TABLE calle(
  id_calle INT(10) PRIMARY KEY,
  calle VARCHAR(100) NOT NULL
  );

CREATE TABLE barrio(
  id_barrio INT(10) PRIMARY KEY,
  barrio VARCHAR(100) NOT NULL
  );
  
CREATE TABLE direccion(
  id_direccion INT(10)PRIMARY KEY,
  id_calle_direccion INT(10) NOT NULL,
  id_barrio_direccion INT(10) NOT NULL,
  vivienda VARCHAR(50),
  CONSTRAINT FK_calle FOREIGN KEY (id_calle_direccion) REFERENCES calle(id_calle), 
  CONSTRAINT FK_barrio FOREIGN KEY (id_barrio_direccion) REFERENCES barrio(id_barrio)
  );

CREATE TABLE ciudad(
  id_ciudad INT(10) PRIMARY KEY,
  ciudad VARCHAR(100) NOT NULL
  );

CREATE TABLE genero(
  id_genero INT(10) NOT NULL AUTO_INCREMENT,
  genero VARCHAR(50) NOT NULL,
  PRIMARY KEY (id_genero)
  );

CREATE TABLE departamento(
  id_departamento INT(10) PRIMARY KEY,
  departamento VARCHAR(100) NOT NULL
  );

CREATE TABLE creditos(
  id_creditos INT(10) PRIMARY KEY,
  creditos TINYINT(3) NOT NULL
  );

CREATE TABLE tipo(
  id_tipo INT(10) PRIMARY KEY,
  tipo VARCHAR(100) NOT NULL
  );
  
CREATE TABLE grado(
  id_grado INT(10) PRIMARY KEY,
  grado VARCHAR(100) NOT NULL
  );

CREATE TABLE curso_escolar(
  id_curso INT(10) PRIMARY KEY,
  inicio DATE,
  finalizacion DATE
  );

CREATE TABLE alumno(
  id_alumno INT(10) PRIMARY KEY,
  nit_alumno VARCHAR(9),
  nombre_alumno VARCHAR(50) NOT NULL,
  apellido1_alumno VARCHAR(50) NOT NULL,
  apellido2_alumno VARCHAR(50),
  id_ciudad_alumno INT(10) NOT NULL,
  id_direccion_alumno INT(10) NOT NULL,
  id_telefono_alumno INT(10) ,
  fecha_nacimiento_alumno DATE NOT NULL,
  id_genero_alumno INT(10) NOT NULL,
  CONSTRAINT FK_ciudad_alumno FOREIGN KEY (id_ciudad_alumno) REFERENCES ciudad(id_ciudad),
  CONSTRAINT FK_direccion_alumno FOREIGN KEY (id_direccion_alumno) REFERENCES direccion(id_direccion),
  CONSTRAINT FK_telefono_alumno FOREIGN KEY (id_telefono_alumno) REFERENCES telefono(id_telefono),
  CONSTRAINT FK_genero_alumno FOREIGN KEY (id_genero_alumno) REFERENCES genero(id_genero)
  );
  
CREATE TABLE profesor(
  id_profesor INT(10) PRIMARY KEY,
  nit_profesor VARCHAR(9),
  nombre_profesor VARCHAR(50) NOT NULL,
  apellido1_profesor VARCHAR(50) NOT NULL,
  apellido2_profesor VARCHAR(50),
  id_ciudad_profesor INT(10) NOT NULL,
  id_direccion_profesor INT(10) NOT NULL,
  id_telefono_profesor INT(10),
  fecha_nacimiento_profesor DATE NOT NULL,
  id_genero_profesor INT(10) NOT NULL,
  id_departamento_profesor INT(10) NOT NULL,
  CONSTRAINT FK_ciudad_profesor FOREIGN KEY (id_ciudad_profesor) REFERENCES ciudad(id_ciudad),
  CONSTRAINT FK_direccion_profesor FOREIGN KEY (id_direccion_profesor) REFERENCES direccion(id_direccion),
  CONSTRAINT FK_telefono_profesor FOREIGN KEY (id_telefono_profesor) REFERENCES telefono(id_telefono),
  CONSTRAINT FK_genero_profesor FOREIGN KEY (id_genero_profesor) REFERENCES genero(id_genero),
  CONSTRAINT FK_departamento_profesor FOREIGN KEY (id_departamento_profesor) REFERENCES departamento(id_departamento)
  ); 
  
CREATE TABLE asignatura(
  id_asignatura INT(10) PRIMARY KEY,
  nombre_asignatura VARCHAR(50) NOT NULL,
  id_creditos_asignatura INT(10) NOT NULL,
  id_tipo_asignatura INT(10) NOT NULL,
  curso_asignatura TINYINT(3) NOT NULL,
  cuatrimentre TINYINT(3) NOT NULL,
  id_profesor_asignatura INT(10),
  id_grado_asignatura INT(10) NOT NULL,
  CONSTRAINT FK_creditos_asignatura FOREIGN KEY (id_creditos_asignatura) REFERENCES creditos(id_creditos),
  CONSTRAINT FK_tipo_asignatura FOREIGN KEY (id_tipo_asignatura) REFERENCES tipo(id_tipo),
  CONSTRAINT FK_profesor_asignatura FOREIGN KEY (id_profesor_asignatura) REFERENCES profesor(id_profesor),
  CONSTRAINT FK_grado_asignatura FOREIGN KEY (id_grado_asignatura) REFERENCES grado(id_grado)
  );
  
CREATE TABLE alumno_se_matricula_asignatura(
  id_alumno_matricula INT(10) NOT NULL,
  id_asignatura_matricula INT(10) NOT NULL,
  id_curso_escolar_matricula INT(10) NOT NULL,
  CONSTRAINT FK_alumno_matricula FOREIGN KEY (id_alumno_matricula) REFERENCES alumno(id_alumno),
  CONSTRAINT FK_asignatura_matricula FOREIGN KEY (id_asignatura_matricula) REFERENCES asignatura(id_asignatura),
  CONSTRAINT FK_curso_escolar_matricula FOREIGN key (id_curso_escolar_matricula) REFERENCES curso_escolar(id_curso)
  );
