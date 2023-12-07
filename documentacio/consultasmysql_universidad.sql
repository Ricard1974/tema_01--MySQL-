SELECT * FROM universidad.persona;

#Retorna un llistat amb el primer cognom, segon cognom i el nom de tots els/les alumnes. El llistat haurà d'estar ordenat alfabèticament de menor a major pel primer cognom, segon cognom i nom.
SELECT apellido1,apellido2,nombre FROM universidad.persona where tipo like '%alumno%' order by apellido1 DESC, apellido2 DESC , nombre DESC;

#Esbrina el nom i els dos cognoms dels/les alumnes que no han donat d'alta el seu número de telèfon en la base de dades.

select nombre,apellido1,apellido2 from universidad.persona where telefono IS NULL;

#Retorna el llistat dels/les alumnes que van néixer en 1999.
SELECT apellido1,apellido2,nombre,fecha_nacimiento FROM universidad.persona where fecha_nacimiento like '%1999%';
#Retorna el llistat de professors/es que no han donat d'alta el seu número de telèfon en la base de dades i a més el seu NIF acaba en K.
SELECT apellido1,apellido2,nombre,telefono,nif FROM universidad.persona where tipo like '%profesor%' and nif like "%K" and telefono is null;

#Retorna el llistat de les assignatures que s'imparteixen en el primer quadrimestre, en el tercer curs del grau que té l'identificador 7.

SELECT nombre FROM universidad.asignatura where cuatrimestre like "1" and curso like "3" and  id_grado like "7";

#Retorna un llistat dels professors/es juntament amb el nom del departament al qual estan vinculats/des. El llistat ha de retornar quatre columnes, primer cognom, segon cognom, nom i nom del departament. El resultat estarà ordenat alfabèticament de menor a major pels cognoms i el nom.

SELECT persona.nombre,persona.apellido1,persona.apellido2,departamento.nombre FROM universidad.persona INNER JOIN universidad.profesor ON persona.id = profesor.id_profesor INNER JOIN universidad.departamento ON profesor.id_departamento = departamento.id WHERE persona.id IN (SELECT profesor.id_profesor FROM universidad.profesor);

SELECT * FROM universidad.profesor;
SELECT * FROM universidad.curso_escolar;
SELECT * FROM universidad.alumno_se_matricula_asignatura;


#Retorna el llistat dels/les alumnes que van néixer en 1999.
SELECT
    nombre,
    apellido1,
    apellido2,
    fecha_nacimiento,
    tipo
FROM
    universidad.persona
WHERE
    fecha_nacimiento like "%1999%" and tipo not like "%profesor%";

#Retorna un llistat amb el nom de les assignatures, any d'inici i any de fi del curs escolar de l'alumne/a amb NIF 26902806M.
SELECT
    asignatura.nombre,
    curso_escolar.anyo_inicio,
    curso_escolar.anyo_fin
FROM
    universidad.alumno_se_matricula_asignatura
INNER JOIN
    universidad.asignatura
ON
    alumno_se_matricula_asignatura.id_asignatura = asignatura.id
INNER JOIN
    universidad.curso_escolar
ON
    alumno_se_matricula_asignatura.id_curso_escolar = curso_escolar.id
WHERE
    alumno_se_matricula_asignatura.id_alumno = (
        SELECT
            id
        FROM
            universidad.persona
        WHERE
            nif = '26902806M'
    );



#Retorna un llistat amb els professors/es que no estan associats a un departament.
    select
    persona.id,
    persona.nombre,
    persona.apellido1,
    persona.apellido2,
    persona.tipo
from
    universidad.persona
INNER JOIN
    universidad.profesor
ON
    persona.id = profesor.id_profesor
where
    profesor.id_departamento is null;


    #Retorna un llistat amb els professors/es que no imparteixen cap assignatura.





####################### consuktas resum #########################


#Retorna el nombre total d'alumnes que hi ha.
SELECT
    COUNT(*) AS numero_total_estudiants
FROM
    universidad.persona
WHERE
    tipo = 'alumno';



#Calcula quants/es alumnes van néixer en 1999.
SELECT
    COUNT(*) AS alumnos_del_99
FROM
    universidad.persona
WHERE
    tipo = 'alumno'
    AND YEAR(fecha_nacimiento) = 1999;



#Calcula quants/es professors/es hi ha en cada departament. El resultat només ha de mostrar dues columnes, una amb el nom del departament i una altra amb el nombre de professors/es que hi ha en aquest departament. El resultat només ha d'incloure els departaments que tenen professors/es associats i haurà d'estar ordenat de major a menor pel nombre de professors/es.

    SELECT
    departamento.nombre,
    COUNT(*) AS numero_profesores
FROM
    universidad.departamento
INNER JOIN
    universidad.profesor
ON
    departamento.id = profesor.id_departamento
GROUP BY
    departamento.nombre
ORDER BY
    numero_profesores DESC;




#Retorna un llistat amb tots els departaments i el nombre de professors/es que hi ha en cadascun d'ells. Té en compte que poden existir departaments que no tenen professors/es associats/des. Aquests departaments també han d'aparèixer en el llistat.
    SELECT
    departamento.nombre,
    COUNT(*) AS numero_profesores
FROM
    universidad.departamento
LEFT JOIN
    universidad.profesor
ON
    departamento.id = profesor.id_departamento
GROUP BY
    departamento.nombre;



