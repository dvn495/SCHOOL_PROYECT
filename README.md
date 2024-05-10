# SCHOOL_PROYECT
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

```

1. Devuelve un listado con todas las asignaturas ofertadas en el Grado en
Ingeniería Informática (Plan 2015).

```sql

```

1. Devuelve un listado de los profesores junto con el nombre del
departamento al que están vinculados. El listado debe devolver cuatro
columnas, primer apellido, segundo apellido, nombre y nombre del
departamento. El resultado estará ordenado alfabéticamente de menor a
mayor por los apellidos y el nombre.

```sql

```

1. Devuelve un listado con el nombre de las asignaturas, año de inicio y año de
fin del curso escolar del alumno con nif 26902806M.

```sql

```

1. Devuelve un listado con el nombre de todos los departamentos que tienen
profesores que imparten alguna asignatura en el Grado en Ingeniería
Informática (Plan 2015).

```sql

```

1. Devuelve un listado con todos los alumnos que se han matriculado en
alguna asignatura durante el curso escolar 2018/2019.

```sql

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

```

1. Devuelve un listado con los profesores que no están asociados a un
departamento.

```sql

```

1. Devuelve un listado con los departamentos que no tienen profesores
asociados.

```sql

```

1. Devuelve un listado con los profesores que no imparten ninguna asignatura.

```sql

```

1. Devuelve un listado con las asignaturas que no tienen un profesor asignado.

```sql

```

1. Devuelve un listado con todos los departamentos que tienen alguna
asignatura que no se haya impartido en ningún curso escolar. El resultado
debe mostrar el nombre del departamento y el nombre de la asignatura que
no se haya impartido nunca.

```sql

```

### Consultas resumen

1. Devuelve el número total de alumnas que hay.

```sql

```

1. Calcula cuántos alumnos nacieron en 1999.

```sql

```

1. Calcula cuántos profesores hay en cada departamento. El resultado sólo
debe mostrar dos columnas, una con el nombre del departamento y otra
con el número de profesores que hay en ese departamento. El resultado
sólo debe incluir los departamentos que tienen profesores asociados y
deberá estar ordenado de mayor a menor por el número de profesores.

```sql

```

1. Devuelve un listado con todos los departamentos y el número de profesores
que hay en cada uno de ellos. Tenga en cuenta que pueden existir
departamentos que no tienen profesores asociados. Estos departamentos
también tienen que aparecer en el listado.

```sql

```

1. Devuelve un listado con el nombre de todos los grados existentes en la base
de datos y el número de asignaturas que tiene cada uno. Tenga en cuenta
    
    que pueden existir grados que no tienen asignaturas asociadas. Estos grados
    también tienen que aparecer en el listado. El resultado deberá estar
    ordenado de mayor a menor por el número de asignaturas.
    
    ```sql
    
    ```
    
    6. Devuelve un listado con el nombre de todos los grados existentes en la base
    de datos y el número de asignaturas que tiene cada uno, de los grados que
    tengan más de 40 asignaturas asociadas.
    
    ```sql
    
    ```
    
    7. Devuelve un listado que muestre el nombre de los grados y la suma del
    número total de créditos que hay para cada tipo de asignatura. El resultado
    debe tener tres columnas: nombre del grado, tipo de asignatura y la suma
    de los créditos de todas las asignaturas que hay de ese tipo. Ordene el
    resultado de mayor a menor por el número total de crédidos.
    
    ```sql
    
    ```
    
    8. Devuelve un listado que muestre cuántos alumnos se han matriculado de
    alguna asignatura en cada uno de los cursos escolares. El resultado deberá
    mostrar dos columnas, una columna con el año de inicio del curso escolar y
    otra con el número de alumnos matriculados.
    
    ```sql
    
    ```
    
    9. Devuelve un listado con el número de asignaturas que imparte cada
    profesor. El listado debe tener en cuenta aquellos profesores que no
    imparten ninguna asignatura. El resultado mostrará cinco columnas: id,
    nombre, primer apellido, segundo apellido y número de asignaturas. El
    resultado estará ordenado de mayor a menor por el número de asignaturas.
    
    ```sql
    
    ```
    
    ### Subconsultas
    
2. Devuelve todos los datos del alumno más joven.

```sql

```

1. Devuelve un listado con los profesores que no están asociados a un
departamento.

```sql

```

1. Devuelve un listado con los departamentos que no tienen profesores
asociados.

```sql

```

1. Devuelve un listado con los profesores que tienen un departamento
asociado y que no imparten ninguna asignatura.

```sql

```

1. Devuelve un listado con las asignaturas que no tienen un profesor asignado.

```sql

```

1. Devuelve un listado con todos los departamentos que no han impartido
asignaturas en ningún curso escolar.

```sql

```
