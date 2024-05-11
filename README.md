### Consultas sobre una tabla

1. Devuelve un listado con el primer apellido, segundo apellido y el nombre de
todos los alumnos. El listado deberá estar ordenado alfabéticamente de
menor a mayor por el primer apellido, segundo apellido y nombre.

```sql
SELECT apellido1_alumno, apellido2_alumno, nombre_alumno
FROM alumno
ORDER BY apellido1_alumno ASC, apellido2_alumno ASC, nombre_alumno ASC;
+------------------+------------------+---------------+
| apellido1_alumno | apellido2_alumno | nombre_alumno |
+------------------+------------------+---------------+
| García           | López            | Juan          |
| González         | Núñez            | María         |
| Martínez         | Sánchez          | Ana           |
| Pérez            | Gómez            | Pedro         |
+------------------+------------------+---------------+
```

1. Averigua el nombre y los dos apellidos de los alumnos que no han dado de
alta su número de teléfono en la base de datos.

```sql
SELECT CONCAT(nombre_alumno,' ' ,apellido1_alumno,' ', apellido2_alumno) AS "Nombre alumno"
FROM alumno
WHERE id_telefono_alumno IS NULL;
+------------------------+
| Nombre alumno          |
+------------------------+
| Ana Martínez Sánchez   |
+------------------------+
```

1. Devuelve el listado de los alumnos que nacieron en 1999.

```sql
SELECT CONCAT(nombre_alumno,' ' ,apellido1_alumno,' ', apellido2_alumno) AS "Nombre alumno"
FROM alumno
WHERE YEAR(fecha_nacimiento_alumno) = 1999;
+------------------------+
| Nombre alumno          |
+------------------------+
| Juan García López      |
| Ana Martínez Sánchez   |
+------------------------+
```

1. Devuelve el listado de profesores que no han dado de alta su número de
teléfono en la base de datos y además su nif termina en K.

```sql
SELECT CONCAT(nombre_profesor,' ', apellido1_profesor,' ', apellido2_profesor) AS "Nombre profesor"
FROM profesor
WHERE id_telefono_profesor IS NULL AND RIGHT(nit_profesor, 1) = 'K';
+---------------------------+
| Nombre profesor           |
+---------------------------+
| Carlos Mendoza Rodríguez  |
+---------------------------+
```

1. Devuelve el listado de las asignaturas que se imparten en el primer
cuatrimestre, en el tercer curso del grado que tiene el identificador 7.

```sql
SELECT nombre_asignatura
FROM asignatura
WHERE cuatrimentre = 1 AND curso_asignatura = 3 AND id_grado_asignatura = 7;
+-------------------+
| nombre_asignatura |
+-------------------+
| Lógica            |
+-------------------+
```

### Consultas multitabla (Composición interna)

1. Devuelve un listado con los datos de todas las alumnas que se han
matriculado alguna vez en el Grado en Ingeniería Informática (Plan 2015).

```sql
SELECT nombre_alumno, apellido1_alumno, apellido2_alumno
FROM alumno AS a
JOIN alumno_se_matricula_asignatura AS ma 
  ON a.id_alumno = ma.id_alumno_matricula
JOIN asignatura AS s 
  ON ma.id_asignatura_matricula = s.id_asignatura
WHERE s.id_grado_asignatura = 5 AND a.id_genero_alumno = 2;
**+---------------+------------------+------------------+
| nombre_alumno | apellido1_alumno | apellido2_alumno |
+---------------+------------------+------------------+
| María         | González         | Núñez            |
+---------------+------------------+------------------+**
```

1. Devuelve un listado con todas las asignaturas ofertadas en el Grado en
Ingeniería Informática (Plan 2015).

```sql
SELECT nombre_asignatura
FROM asignatura
WHERE id_grado_asignatura = 5;
+-------------------+
| nombre_asignatura |
+-------------------+
| Programación I    |
| Programación II   |
+-------------------+
```

1. Devuelve un listado de los profesores junto con el nombre del
departamento al que están vinculados. El listado debe devolver cuatro
columnas, primer apellido, segundo apellido, nombre y nombre del
departamento. El resultado estará ordenado alfabéticamente de menor a
mayor por los apellidos y el nombre.

```sql
SELECT p.apellido1_profesor, p.apellido2_profesor, p.nombre_profesor, d.departamento 
FROM profesor AS p
JOIN departamento AS d
  ON p.id_departamento_profesor = d.id_departamento
ORDER BY p.apellido1_profesor asc, p.apellido2_profesor asc, p.nombre_profesor asc;
+--------------------+--------------------+-----------------+--------------+
| apellido1_profesor | apellido2_profesor | nombre_profesor | departamento |
+--------------------+--------------------+-----------------+--------------+
| Jiménez            | Álvarez            | Laura           | Matemáticas  |
| Mendoza            | Rodríguez          | Carlos          | Ciencias     |
| Romero             | Santos             | Sofía           | Ingeniería   |
| Ruiz               | Ortega             | Raúl            | Ingeniería   |
+--------------------+--------------------+-----------------+--------------+
```

1. Devuelve un listado con el nombre de las asignaturas, año de inicio y año de
fin del curso escolar del alumno con nif 26902806M.

```sql
SELECT s.nombre_asignatura, c.inicio, c.finalizacion
FROM alumno AS a
JOIN alumno_se_matricula_asignatura AS ma 
  ON a.id_alumno = ma.id_alumno_matricula
JOIN curso_escolar AS c 
  ON ma.id_curso_escolar_matricula = c.id_curso
JOIN asignatura AS s 
  ON ma.id_asignatura_matricula = s.id_asignatura
WHERE a.nit_alumno = '26902806M';
+-------------------+------------+--------------+
| nombre_asignatura | inicio     | finalizacion |
+-------------------+------------+--------------+
| Programación II   | 2019-09-01 | 2020-06-30   |
| Algebra           | 2019-09-01 | 2020-06-30   |
+-------------------+------------+--------------+
```

1. Devuelve un listado con el nombre de todos los departamentos que tienen
profesores que imparten alguna asignatura en el Grado en Ingeniería
Informática (Plan 2015).

```sql
SELECT DISTINCT d.departamento
FROM profesor AS p
JOIN asignatura AS a 
  ON p.id_profesor = a.id_profesor_asignatura
JOIN departamento AS d 
  ON p.id_departamento_profesor = d.id_departamento
WHERE a.id_grado_asignatura = 5;
+--------------+
| departamento |
+--------------+
| Ingeniería   |
+--------------+
```

1. Devuelve un listado con todos los alumnos que se han matriculado en
alguna asignatura durante el curso escolar 2018/2019.

```sql
SELECT nombre_alumno, apellido1_alumno, apellido2_alumno 
FROM alumno AS a
JOIN alumno_se_matricula_asignatura AS ma 
  ON a.id_alumno = ma.id_alumno_matricula
WHERE ma.id_curso_escolar_matricula = 1; 
+---------------+------------------+------------------+
| nombre_alumno | apellido1_alumno | apellido2_alumno |
+---------------+------------------+------------------+
| Juan          | García           | López            |
| Ana           | Martínez         | Sánchez          |
| Pedro         | Pérez            | Gómez            |
+---------------+------------------+------------------+
```

### Consultas multitabla (Composición externa)
Resuelva todas las consultas utilizando las cláusulas LEFT JOIN y RIGHT JOIN.

1. Devuelve un listado con los nombres de todos los profesores y los
departamentos que tienen vinculados. El listado también debe mostrar
aquellos profesores que no tienen ningún departamento asociado. El listado
debe devolver cuatro columnas, nombre del departamento, primer apellido,
segundo apellido y nombre del profesor. El resultado estará ordenado
alfabéticamente de menor a mayor por el nombre del departamento,
apellidos y el nombre.

```sql
SELECT d.departamento, p.apellido1_profesor, p.apellido2_profesor, p.nombre_profesor 
FROM profesor AS p
LEFT JOIN departamento AS d 
  ON p.id_departamento_profesor = d.id_departamento
ORDER BY d.departamento ASC, p.apellido1_profesor ASC, p.apellido2_profesor ASC, p.nombre_profesor ASC;
+--------------+--------------------+--------------------+-----------------+
| departamento | apellido1_profesor | apellido2_profesor | nombre_profesor |
+--------------+--------------------+--------------------+-----------------+
| Ciencias     | Mendoza            | Rodríguez          | Carlos          |
| Ingeniería   | Romero             | Santos             | Sofía           |
| Ingeniería   | Ruiz               | Ortega             | Raúl            |
| Matemáticas  | Jiménez            | Álvarez            | Laura           |
+--------------+--------------------+--------------------+-----------------+
```

1. Devuelve un listado con los profesores que no están asociados a un
departamento.

```sql
SELECT p.nombre_profesor, p.apellido1_profesor, p.apellido2_profesor 
FROM profesor AS p
WHERE p.id_departamento_profesor IS NULL;
+-----------------+--------------------+--------------------+
| nombre_profesor | apellido1_profesor | apellido2_profesor |
+-----------------+--------------------+--------------------+
| Sofía           | Romero             | Santos             |
+-----------------+--------------------+--------------------+
```

1. Devuelve un listado con los departamentos que no tienen profesores
asociados.

```sql
SELECT d.departamento 
FROM departamento AS d
LEFT JOIN profesor AS p 
  ON d.id_departamento = p.id_departamento_profesor
WHERE p.id_departamento_profesor IS NULL;
+--------------+
| departamento |
+--------------+
| Literatura   |
+--------------+
```

1. Devuelve un listado con los profesores que no imparten ninguna asignatura.

```sql
SELECT p.nombre_profesor, p.apellido1_profesor, p.apellido2_profesor 
FROM profesor AS p
LEFT JOIN asignatura AS s 
  ON p.id_profesor = s.id_profesor_asignatura
WHERE s.id_profesor_asignatura IS NULL;
+-----------------+--------------------+--------------------+
| nombre_profesor | apellido1_profesor | apellido2_profesor |
+-----------------+--------------------+--------------------+
| Laura           | Jiménez            | Álvarez            |
| Sofía           | Romero             | Santos             |
+-----------------+--------------------+--------------------+
```

1. Devuelve un listado con las asignaturas que no tienen un profesor asignado.

```sql
SELECT s.nombre_asignatura 
FROM asignatura AS s
LEFT JOIN profesor AS p 
  ON s.id_profesor_asignatura = p.id_profesor
WHERE s.id_profesor_asignatura IS NULL;
+-------------------+
| nombre_asignatura |
+-------------------+
| Programación II   |
| Historia          |
| Algebra           |
| Redes             |
| Lógica            |
+-------------------+
```

1. Devuelve un listado con todos los departamentos que tienen alguna
asignatura que no se haya impartido en ningún curso escolar. El resultado
debe mostrar el nombre del departamento y el nombre de la asignatura que
no se haya impartido nunca.

```sql
SELECT d.departamento, s.nombre_asignatura 
FROM departamento AS d
LEFT JOIN profesor AS p 
  ON p.id_departamento_profesor = d.id_departamento
LEFT JOIN asignatura AS s
  ON s.id_profesor_asignatura = p.id_profesor
LEFT JOIN alumno_se_matricula_asignatura AS ma 
  ON s.id_asignatura = ma.id_asignatura_matricula
WHERE ma.id_asignatura_matricula IS NULL;
 //correguir//
```

### Consultas resumen

1. Devuelve el número total de alumnas que hay.

```sql
SELECT COUNT(id_genero_alumno) AS total_alumnas
FROM alumno
WHERE id_genero_alumno = 2;
+---------------+
| total_alumnas |
+---------------+
|             2 |
+---------------+
```

1. Calcula cuántos alumnos nacieron en 1999.

```sql
SELECT COUNT(id_alumno) AS alumnos_1999
FROM alumno
WHERE YEAR(fecha_nacimiento_alumno) = 1999;
+--------------+
| alumnos_1999 |
+--------------+
|            2 |
+--------------+
```

1. Calcula cuántos profesores hay en cada departamento. El resultado sólo
debe mostrar dos columnas, una con el nombre del departamento y otra
con el número de profesores que hay en ese departamento. El resultado
sólo debe incluir los departamentos que tienen profesores asociados y
deberá estar ordenado de mayor a menor por el número de profesores.

```sql
SELECT d.departamento, COUNT(p.id_profesor) AS numero_profesores
FROM departamento AS d
JOIN profesor AS p 
  ON d.id_departamento = p.id_departamento_profesor
GROUP BY d.departamento
ORDER BY numero_profesores DESC;
+--------------+-------------------+
| departamento | numero_profesores |
+--------------+-------------------+
| Ciencias     |                 1 |
| Matemáticas  |                 1 |
| Ingeniería   |                 1 |
+--------------+-------------------+
```

1. Devuelve un listado con todos los departamentos y el número de profesores
que hay en cada uno de ellos. Tenga en cuenta que pueden existir
departamentos que no tienen profesores asociados. Estos departamentos
también tienen que aparecer en el listado.

```sql
SELECT d.departamento, COUNT(p.id_profesor) AS numero_profesores
FROM departamento AS d
LEFT JOIN profesor AS p 
  ON d.id_departamento = p.id_departamento_profesor
GROUP BY d.departamento
ORDER BY numero_profesores DESC;
+--------------+-------------------+
| departamento | numero_profesores |
+--------------+-------------------+
| Ciencias     |                 1 |
| Matemáticas  |                 1 |
| Ingeniería   |                 1 |
| Literatura   |                 0 |
+--------------+-------------------+
```

1. Devuelve un listado con el nombre de todos los grados existentes en la base
de datos y el número de asignaturas que tiene cada uno. Tenga en cuenta
    
    que pueden existir grados que no tienen asignaturas asociadas. Estos grados
    también tienen que aparecer en el listado. El resultado deberá estar
    ordenado de mayor a menor por el número de asignaturas.
    
    ```sql
    SELECT g.grado, COUNT(s.id_asignatura) AS numero_asignaturas
    FROM grado AS g
    LEFT JOIN asignatura AS s 
      ON g.id_grado = s.id_grado_asignatura
    GROUP BY g.grado
    ORDER BY numero_asignaturas DESC;
    +-----------------------------------------------+--------------------+
    | grado                                         | numero_asignaturas |
    +-----------------------------------------------+--------------------+
    | Grado en Matemáticas                          |                  2 |
    | Grado en Ingeniería Informática (Plan 2015)   |                  2 |
    | Grado en Ingeniería Electrónica               |                  2 |
    | Grado en Ciencias                             |                  1 |
    | Grado en Literatura                           |                  1 |
    | Grado en Física                               |                  0 |
    | Grado en Ingeniería Mecánica                  |                  0 |
    +-----------------------------------------------+--------------------+
    ```
    
    6. Devuelve un listado con el nombre de todos los grados existentes en la base
    de datos y el número de asignaturas que tiene cada uno, de los grados que
    tengan más de 40 asignaturas asociadas.
    
    ```sql
    SELECT g.grado, COUNT(s.id_asignatura) AS numero_asignaturas
    FROM grado AS g
    LEFT JOIN asignatura s 
      ON g.id_grado = s.id_grado_asignatura
    GROUP BY g.grado
    HAVING numero_asignaturas > 40;
    ```
    
    7. Devuelve un listado que muestre el nombre de los grados y la suma del
    número total de créditos que hay para cada tipo de asignatura. El resultado
    debe tener tres columnas: nombre del grado, tipo de asignatura y la suma
    de los créditos de todas las asignaturas que hay de ese tipo. Ordene el
    resultado de mayor a menor por el número total de crédidos.
    
    ```sql
    SELECT g.grado, t.tipo, SUM(c.creditos) AS total_creditos
    FROM grado AS g
    JOIN asignatura AS s 
      ON g.id_grado = s.id_grado_asignatura
    JOIN tipo AS t 
      ON s.id_tipo_asignatura = t.id_tipo
    JOIN creditos AS c 
      ON s.id_creditos_asignatura = c.id_creditos
    GROUP BY g.grado, t.tipo
    ORDER BY total_creditos DESC;
    +-----------------------------------------------+-----------+----------------+
    | grado                                         | tipo      | total_creditos |
    +-----------------------------------------------+-----------+----------------+
    | Grado en Ingeniería Informática (Plan 2015)   | Práctico  |             12 |
    | Grado en Ingeniería Electrónica               | Teórico   |             11 |
    | Grado en Literatura                           | Teórico   |              5 |
    | Grado en Matemáticas                          | Práctico  |              5 |
    | Grado en Matemáticas                          | Teórico   |              4 |
    | Grado en Ciencias                             | Teórico   |              4 |
    +-----------------------------------------------+-----------+----------------+
    ```
    
    8. Devuelve un listado que muestre cuántos alumnos se han matriculado de
    alguna asignatura en cada uno de los cursos escolares. El resultado deberá
    mostrar dos columnas, una columna con el año de inicio del curso escolar y
    otra con el número de alumnos matriculados.
    
    ```sql
    SELECT YEAR(c.inicio) AS curso, COUNT(DISTINCT ma.id_alumno_matricula) AS total_alumnos
    FROM curso_escolar AS c
    JOIN alumno_se_matricula_asignatura AS ma 
      ON c.id_curso = ma.id_curso_escolar_matricula
    GROUP BY curso
    ORDER BY curso;
    +-------+---------------+
    | curso | total_alumnos |
    +-------+---------------+
    |  2018 |             3 |
    |  2019 |             1 |
    |  2020 |             1 |
    +-------+---------------+
    ```
    
    9. Devuelve un listado con el número de asignaturas que imparte cada
    profesor. El listado debe tener en cuenta aquellos profesores que no
    imparten ninguna asignatura. El resultado mostrará cinco columnas: id,
    nombre, primer apellido, segundo apellido y número de asignaturas. El
    resultado estará ordenado de mayor a menor por el número de asignaturas.
    
    ```sql
    SELECT p.id_profesor, p.nombre_profesor, p.apellido1_profesor, p.apellido2_profesor, COUNT(s.id_asignatura) AS numero_asignaturas
    FROM profesor AS p
    LEFT JOIN asignatura AS s 
      ON p.id_profesor = s.id_profesor_asignatura
    GROUP BY p.id_profesor
    ORDER BY numero_asignaturas DESC;
    +-------------+-----------------+--------------------+--------------------+--------------------+
    | id_profesor | nombre_profesor | apellido1_profesor | apellido2_profesor | numero_asignaturas |
    +-------------+-----------------+--------------------+--------------------+--------------------+
    |           1 | Carlos          | Mendoza            | Rodríguez          |                  2 |
    |           3 | Raúl            | Ruiz               | Ortega             |                  1 |
    |           2 | Laura           | Jiménez            | Álvarez            |                  0 |
    |           4 | Sofía           | Romero             | Santos             |                  0 |
    +-------------+-----------------+--------------------+--------------------+--------------------+
    ```
    
    ### Subconsultas
    
2. Devuelve todos los datos del alumno más joven.

```sql
SELECT CONCAT(nombre_alumno, ' ',apellido1_alumno, ' ', apellido2_alumno) as "Nombre alumno", nit_alumno
FROM alumno
WHERE fecha_nacimiento_alumno = (
  SELECT MAX(fecha_nacimiento_alumno) 
  FROM alumno
  );
+--------------------------+------------+
| Nombre alumno            | nit_alumno |
+--------------------------+------------+
| María González Núñez     | 26902806M  |
+--------------------------+------------+
```

