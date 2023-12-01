#Llista el nom de tots els productes que hi ha en la taula "producto".
select nombre from tienda.producto;
#Llista els noms i els preus de tots els productes de la taula "producto".
select nombre,precio from tienda.producto;
#Llista totes les columnes de la taula "producto".
select * from tienda.producto;
#Llista el nom dels "productos", el preu en euros i el preu en dòlars nord-americans (USD).
select nombre,precio,round(precio*1.09707,2) as dolares from tienda.producto;
#Llista el nom dels "productos", el preu en euros i el preu en dòlars nord-americans. Utilitza els següents àlies per a les columnes: nom de "producto", euros, dòlars nord-americans.
select nombre,precio as Euros,round(precio*1.09707,2) as Dolares_Norteamericanos_USD from tienda.producto;
#Llista els noms i els preus de tots els productes de la taula "producto", convertint els noms a majúscula.
SELECT upper(nombre) from tienda.producto;
#Llista els noms i els preus de tots els productes de la taula "producto", convertint els noms a minúscula.
SELECT lower(nombre) from tienda.producto;
#Llista el nom de tots els fabricants en una columna, i en una altra columna obtingui en majúscules els dos primers caràcters del nom del fabricant.
SELECT CONCAT(UPPER(LEFT(nombre, 2)), LOWER(SUBSTRING(nombre, 3))) AS nombre FROM tienda.producto ORDER BY UPPER(LEFT(nombre, 2)) ASC;
#Llista els noms i els preus de tots els productes de la taula "producto", arrodonint el valor del preu.
SELECT nombre,floor(precio) FROM tienda.producto;
#Llista els noms i els preus de tots els productes de la taula "producto", truncant el valor del preu per a mostrar-lo sense cap xifra decimal.
SELECT nombre,round(precio) FROM tienda.producto;
#Llista el codi dels fabricants que tenen productes en la taula "producto".
SELECT * FROM tienda.producto inner join tienda.fabricante on codigo_fabricante;
SELECT codigo_fabricante FROM tienda.producto;
#Llista el codi dels fabricants que tenen productes en la taula "producto", eliminant els codis que apareixen repetits.
SELECT codigo_fabricante FROM tienda.producto GROUP BY codigo_fabricante;
#Llista els noms dels fabricants ordenats de manera ascendent.
SELECT nombre FROM tienda.fabricante order by nombre asc;
#Llista els noms dels fabricants ordenats de manera descendent.
SELECT nombre FROM tienda.fabricante order by nombre desc;
#Llista els noms dels productes ordenats, en primer lloc, pel nom de manera ascendent i, en segon lloc, pel preu de manera descendent.
SELECT nombre,precio FROM tienda.producto WHERE nombre IS NOT NULL AND precio IS NOT NULL ORDER BY nombre ASC,precio DESC;
#Retorna una llista amb les 5 primeres files de la taula "fabricante".
SELECT codigo,nombre FROM tienda.fabricante LIMIT 5;
#Retorna una llista amb 2 files a partir de la quarta fila de la taula "fabricante". La quarta fila també s'ha d'incloure en la resposta.
SELECT * FROM tienda.fabricante limit 2 offset 3;
#Llista el nom i el preu del producte més barat. (Utilitza solament les clàusules ORDER BY i LIMIT). NOTA: Aquí no podries usar MIN(preu), necessitaries GROUP BY
SELECT nombre,precio FROM tienda.producto ORDER BY precio LIMIT 1;
#Llista el nom i el preu del producte més car. (Fes servir solament les clàusules ORDER BY i LIMIT). NOTA: Aquí no podries usar MAX(preu), necessitaries GROUP BY.
SELECT nombre,precio FROM tienda.producto ORDER BY precio desc LIMIT 1;
#Llista el nom de tots els productes del fabricant el codi de fabricant del qual és igual a 2.
SELECT nombre FROM tienda.producto WHERE codigo_fabricante=2;
#Retorna una llista amb el nom del producte, preu i nom de fabricant de tots els productes de la base de dades.
SELECT f.nombre AS "Fabricante",p.nombre AS "Producto",p.precio AS "Precio" FROM tienda.fabricante f INNER JOIN tienda.producto p ON f.codigo = p.codigo_fabricante;
#Retorna una llista amb el nom del producte, preu i nom de fabricant de tots els productes de la base de dades. Ordena el resultat pel nom del fabricant, per ordre alfabètic.
SELECT f.nombre AS "Fabricante",p.nombre AS "Producto",p.precio AS "Precio" FROM tienda.fabricante f INNER JOIN tienda.producto p ON f.codigo = p.codigo_fabricante order by f.nombre;
#Retorna una llista amb el codi del producte, nom del producte, codi del fabricant i nom del fabricant, de tots els productes de la base de dades.
SELECT f.nombre AS "Fabricante",f.codigo AS "Codigo_fabricante",p.nombre AS "Producto",p.codigo"codigo_producto"FROM tienda.fabricante f left JOIN tienda.producto p ON f.codigo = p.codigo_fabricante;
#Retorna el nom del producte, el seu preu i el nom del seu fabricant, del producte més barat.
SELECT f.nombre AS "Fabricante",p.nombre AS "Producto",p.precio AS "Precio" FROM tienda.fabricante f INNER JOIN tienda.producto p ON f.codigo = p.codigo_fabricante ORDER BY p.precio LIMIT 1;
#Retorna el nom del producte, el seu preu i el nom del seu fabricant, del producte més car.
SELECT f.nombre AS "Fabricante",p.nombre AS "Producto",p.precio AS "Precio" FROM tienda.fabricante f INNER JOIN tienda.producto p ON f.codigo = p.codigo_fabricante ORDER BY p.precio DESC LIMIT 1;
#Retorna una llista de tots els productes del fabricant Lenovo.
SELECT producto.nombre FROM tienda.producto JOIN tienda.fabricante ON producto.codigo_fabricante = fabricante.codigo WHERE fabricante.nombre = 'Lenovo';
#Retorna una llista de tots els productes del fabricant Crucial que tinguin un preu major que 200 €.
SELECT producto.nombre FROM tienda.producto JOIN tienda.fabricante ON producto.codigo_fabricante = fabricante.codigo WHERE fabricante.nombre = 'Crucial' and producto.precio>200;
#Retorna una llista amb tots els productes dels fabricants Asus, Hewlett-Packard i Seagate. Sense utilitzar l'operador IN.
SELECT producto.nombre,fabricante.nombre FROM tienda.producto JOIN tienda.fabricante ON producto.codigo_fabricante = fabricante.codigo WHERE(fabricante.nombre = 'Asus' OR fabricante.nombre = 'Hewlett-Packard'OR fabricante.nombre = 'Seagate');
#Retorna un llistat amb tots els productes dels fabricants Asus, Hewlett-Packard i Seagate. Usant l'operador IN.
SELECT producto.codigo,producto.nombre,producto.precio,fabricante.nombre FROM tienda.producto JOIN tienda.fabricante ON producto.codigo_fabricante = fabricante.codigo WHERE fabricante.nombre IN ('Asus', 'Hewlett-Packard', 'Seagate');
#Retorna un llistat amb el nom i el preu de tots els productes dels fabricants el nom dels quals acabi per la vocal e.
SELECT producto.nombre,producto.precio FROM tienda.producto JOIN tienda.fabricante ON producto.codigo_fabricante=fabricante.codigo where fabricante.nombre like "%e";
#Retorna un llistat amb el nom i el preu de tots els productes dels fabricants dels quals contingui el caràcter w en el seu nom.
SELECT producto.nombre,producto.precio FROM tienda.producto JOIN tienda.fabricante ON producto.codigo_fabricante=fabricante.codigo where fabricante.nombre like "%w%";
#Retorna un llistat amb el nom de producte, preu i nom de fabricant, de tots els productes que tinguin un preu major o igual a 180 €. Ordena el resultat, en primer lloc, pel preu (en ordre descendent) i, en segon lloc, pel nom (en ordre ascendent).
SELECT producto.nombre,producto.precio,fabricante.nombre from tienda.producto JOIN tienda.fabricante where producto.precio >= 180;
#Retorna un llistat amb el codi i el nom de fabricant, solament d'aquells fabricants que tenen productes associats en la base de dades.
SELECT fabricante.codigo,fabricante.nombre FROM tienda.fabricante LEFT JOIN tienda.producto ON fabricante.codigo = producto.codigo_fabricante WHERE producto.codigo IS NOT NULL;
#Retorna un llistat de tots els fabricants que existeixen en la base de dades, juntament amb els productes que té cadascun d'ells. El llistat haurà de mostrar també aquells fabricants que no tenen productes associats.
#Retorna un llistat on només apareguin aquells fabricants que no tenen cap producte associat.
select fabricante.nombre, fabricante.codigo from tienda.fabricante left join tienda.producto on fabricante.codigo = producto.codigo_fabricante where producto.codigo is null;
#Retorna tots els productes del fabricant Lenovo. (Sense utilitzar INNER JOIN).
SELECT producto.nombre FROM tienda.producto WHERE producto.codigo_fabricante IN (SELECT fabricante.codigo FROM tienda.fabricante WHERE fabricante.nombre="lenovo");
#Retorna totes les dades dels productes que tenen el mateix preu que el producte més car del fabricant Lenovo. (Sense fer servir INNER JOIN).
#Llista el nom del producte més car del fabricant Lenovo
SELECT producto.nombre FROM tienda.producto WHERE codigo_fabricante = (SELECT codigo FROM fabricante WHERE nombre = 'Lenovo') ORDER BY precio desc LIMIT 1;
#Llista el nom del producte més barat del fabricant Hewlett-Packard.
SELECT producto.nombre FROM tienda.producto WHERE codigo_fabricante = (SELECT codigo FROM fabricante WHERE nombre = 'Hewlett-Packard') ORDER BY precio asc LIMIT 1;
#Retorna tots els productes de la base de dades que tenen un preu major o igual al producte més car del fabricant Lenovo.
SELECT producto.nombre,producto.precio FROM tienda.producto WHERE codigo_fabricante = (SELECT codigo FROM fabricante WHERE nombre = 'Lenovo') and precio >= (SELECT MAX(precio)FROM producto WHERE codigo_fabricante = (SELECT codigo FROM fabricante WHERE nombre = 'Asus'))ORDER BY precio;
#Llesta tots els productes del fabricant Asus que tenen un preu superior al preu mitjà de tots els seus productes.
SELECT producto.nombre,producto.precio FROM tienda.producto WHERE codigo_fabricante = (SELECT codigo FROM fabricante WHERE nombre = 'Asus') and precio > (SELECT AVG(precio)FROM producto WHERE codigo_fabricante = (SELECT codigo FROM fabricante WHERE nombre = 'Asus'))ORDER BY precio;

#######################################
########                       ########
######## TABLAS DE UNIVERSIDAD ########
########                       ########
#######################################

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
#Retorna el llistat dels/les alumnes que van néixer en 1999.
SELECT nombre,apellido1,apellido2,fecha_nacimiento,tipo FROM universidad.persona WHERE fecha_nacimiento like "%1999%" and tipo not like "%profesor%";
#Retorna un llistat amb el nom de les assignatures, any d'inici i any de fi del curs escolar de l'alumne/a amb NIF 26902806M.
SELECT asignatura.nombre, curso_escolar.anyo_inicio,curso_escolar.anyo_fin FROM universidad.alumno_se_matricula_asignatura INNER JOIN universidad.asignatura ON alumno_se_matricula_asignatura.id_asignatura = asignatura.id INNER JOIN universidad.curso_escolar ON alumno_se_matricula_asignatura.id_curso_escolar = curso_escolar.id WHERE alumno_se_matricula_asignatura.id_alumno = (SELECT id FROM universidad.persona WHERE nif = '26902806M');
#Retorna el nombre total d'alumnes que hi ha.
SELECT COUNT(*) AS numero_total_estudiants FROM universidad.persona WHERE tipo = 'alumno';
#Calcula quants/es alumnes van néixer en 1999.
SELECT COUNT(*) AS alumnos_del_99 FROM universidad.persona WHERE tipo = 'alumno'AND YEAR(fecha_nacimiento) = 1999;
#Calcula quants/es professors/es hi ha en cada departament. El resultat només ha de mostrar dues columnes, una amb el nom del departament i una altra amb el nombre de professors/es que hi ha en aquest departament. El resultat només ha d'incloure els departaments que tenen professors/es associats i haurà d'estar ordenat de major a menor pel nombre de professors/es.
SELECT departamento.nombre, COUNT(*) AS numero_profesores FROM universidad.departamento INNER JOIN universidad.profesor ON departamento.id = profesor.id_departamento GROUP BY departamento.nombre ORDER BY numero_profesores DESC;
#Retorna un llistat amb tots els departaments i el nombre de professors/es que hi ha en cadascun d'ells. Té en compte que poden existir departaments que no tenen professors/es associats/des. Aquests departaments també han d'aparèixer en el llistat.
SELECT departamento.nombre, COUNT(*) AS numero_profesores FROM universidad.departamento LEFT JOIN universidad.profesor ON departamento.id = profesor.id_departamento GROUP BY departamento.nombre;

