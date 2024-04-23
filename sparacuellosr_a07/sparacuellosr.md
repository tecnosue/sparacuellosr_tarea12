# Tarea: Introducción a XPath

- Módulo profesional: Lenguajes de Marcas y Sistemas de Gestión de Información
- Ciclo formativo: Desarrollo de Aplicaciones Web
- Autor: Susana Paracuellos Ralfas
- Fecha: 23/03/2024

## Actividad 1

Dado el siguiente documento XML, escriba las expresiones XPath que devuelvan la respuesta deseada.

```xml
<?xml version="1.0" encoding="UTF-8"?>
<ies>
  <nombre>Campus Digital</nombre>
  <web>https://campusdigitalfp.com/</web>
  <ciclos>
    <ciclo id="ASIR">
      <nombre>Administración de Sistemas Informáticos en Red</nombre>
      <grado>Superior</grado>
      <decretoTitulo año="2009" />
    </ciclo>
    <ciclo id="DAM">
      <nombre>Desarrollo de Aplicaciones Multiplataforma</nombre>
      <grado>Superior</grado>
      <decretoTitulo año="2010" />
    </ciclo>
    <ciclo id="SMR">
      <nombre>Sistemas Microinformáticos y Redes</nombre>
      <grado>Medio</grado>
      <decretoTitulo año="2008" />
    </ciclo>
  </ciclos>
</ies>
```

### Actividad 1.1

Nombre del instituto

Salida esperada:

```xml
<nombre>Campus Digital</nombre>
```

Consulta XPath:

```xpath
/ies/nombre
```

Salida real:

```xml
<nombre>Campus Digital</nombre>
```

### Actividad 1.2

Página web del Instituto.

Consulta XPath:

```xpath
/ies/web/text()
```

Salida real:
```plaintext
https://campusdigitalfp.com/
```

Salida esperada:

```plaintext
https://campusdigitalfp.com/
```

### Actividad 1.3

Nombre de los Ciclos Formativos.

Consulta XPath:

```xpath
/ies/ciclos/ciclo/nombre/text()
```

Salida real:
```plaintext
Administración de Sistemas Informáticos en Red
Desarrollo de Aplicaciones Multiplataforma
Sistemas Microinformáticos y Redes
```

Salida esperada:

```plaintext
Administración de Sistemas Informáticos en Red
Desarrollo de Aplicaciones Multiplataforma
Sistemas Microinformáticos y Redes
```

### Actividad 1.4

Siglas por las que se conocen los Ciclos Formativos.

Consulta XPath:

```xpath
/ies/ciclos/ciclo/@id
```

Salida real:
```plaintext
id=ASIR
id=DAM
id=SMR
```
Salida esperada:

```xpath
id="ASIR"
id="DAM"
id="SMR"
```

### Actividad 1.5

Años en los que se publicaron los decretos de título de los Ciclos Formativos.

Salida esperada:

```xpath
año="2009"
año="2010"
año="2008"
```
Consulta XPath:


```xpath
/ies/ciclos/ciclo/decretoTitulo/@año
```

Salida real:
```plaintext
año=2009
año=2010
año=2008
```

### Actividad 1.6

Ciclos Formativos de Grado Medio (se trata de obtener el elemento `<ciclo>` completo).

Salida esperada:

> Resuelva este ejercicio de dos formas distintas, en un único paso de búsqueda y en dos pasos de búsqueda.

```xml
<ciclo id="SMR">
  <nombre>Sistemas Microinformáticos y Redes</nombre>
  <grado>Medio</grado>
  <decretoTitulo año="2008"/>
</ciclo>
```

Consulta XPath:

En un único paso de búsqueda:

```xpath
/ies/ciclos/ciclo[grado='Medio']
```

En dos pasos de búsqueda:
```xpath
/ies/ciclos/ciclo[grado='Medio']/grado/..
```
Salida real:
```xml
<ciclo id="SMR">
    <nombre>Sistemas Microinformáticos y Redes</nombre>
    <grado>Medio</grado>
    <decretoTitulo año="2008"/>
</ciclo>
```

### Actividad 1.7

Nombre de los Ciclos Formativos de Grado Superior.

Salida esperada:

> Resuelva este ejercicio de dos formas distintas, en un único paso de búsqueda y en dos pasos de búsqueda.

```xml
<nombre>Desarrollo de Aplicaciones Multiplataforma</nombre>
<nombre>Administración de Sistemas Informáticos en Red</nombre>
```

Consulta XPath:

```xpath
/ies/ciclos/ciclo[grado='Superior']/nombre
```

Salida real:
```xml
<nombre>Administración de Sistemas Informáticos en Red</nombre>
<nombre>Desarrollo de Aplicaciones Multiplataforma</nombre>
```
### Actividad 1.8

Nombre de los Ciclos Formativos anteriores a 2010.

Salida esperada:

> Resuelva este ejercicio de dos formas distintas, en un único paso de búsqueda y en dos pasos de búsqueda.

```plaintext
Administración de Sistemas Informáticos en Red
Sistemas Microinformáticos y Redes
```
Consulta XPath:

```xpath
/ies/ciclos/ciclo[decretoTitulo/@año < '2010']/nombre/text()

```

Salida real:
```plaintext
Administración de Sistemas Informáticos en Red
Sistemas Microinformáticos y Redes
```
### Actividad 1.9

Nombre de los Ciclos Formativos de 2008 o 2010.

Salida esperada:

> Resuelva este ejercicio de dos formas distintas, en un único paso de búsqueda y en dos pasos de búsqueda.

```plaintext
Desarrollo de Aplicaciones Multiplataforma
Sistemas Microinformáticos y Redes
```
Consulta XPath:

```xpath
/ies/ciclos/ciclo[decretoTitulo/@año='2008' or decretoTitulo/@año='2010']/nombre/text()
```
Salida real:
```plaintext
Desarrollo de Aplicaciones Multiplataforma
Sistemas Microinformáticos y Redes
```
### Actividad 1.9

Invéntate tu propia consulta.

Nombre del ciclo con la menor antigüedad (año del decreto más reciente).

Consulta XPath:

```xpath
/ies/ciclos/ciclo[decretoTitulo/@año = max(/ies/ciclos/ciclo/decretoTitulo/@año)]/nombre
```

Salida real:
```xml
<nombre>Desarrollo de Aplicaciones Multiplataforma</nombre>
```

## Actividad 2

Dado el siguiente documento XML, escriba las expresiones XPath que devuelvan la respuesta deseada.

```xml
<?xml version="1.0" encoding="UTF-8"?>
<ies>
  <modulos>
    <modulo id="0228">
      <nombre>Aplicaciones web</nombre>
      <curso>2</curso>
      <horasSemanales>4</horasSemanales>
      <ciclo>SMR</ciclo>
    </modulo>
    <modulo id="0372">
      <nombre>Gestión de bases de datos</nombre>
      <curso>1</curso>
      <horasSemanales>5</horasSemanales>
      <ciclo>ASIR</ciclo>
    </modulo>
    <modulo id="0373">
      <nombre>Lenguajes de marcas y sistemas de gestión de información</nombre>
      <curso>1</curso>
      <horasSemanales>3</horasSemanales>
      <ciclo>ASIR</ciclo>
      <ciclo>DAW</ciclo>
    </modulo>
    <modulo id="0378">
      <nombre>Seguridad y Alta Disponibilidad</nombre>
      <curso>2</curso>
      <horasSemanales>2</horasSemanales>
      <ciclo>ASIR</ciclo>
    </modulo>
  </modulos>
</ies>
```

### Actividad 2.1

Nombre de los módulos que se imparten en el Instituto.

Salida esperada:

```plaintext
Aplicaciones web
Gestión de bases de datos
Lenguajes de marcas y sistemas de gestión de información
Seguridad y Alta Disponibilidad
```
Consulta XPath:

```xpath
/ies/modulos//nombre/text()
```

Salida real:
```plaintext
Aplicaciones web
Gestión de bases de datos
Lenguajes de marcas y sistemas de gestión de información
Seguridad y Alta Disponibilidad
```
### Actividad 2.2

Nombre de los módulos del ciclo ASIR.

Salida esperada:

```plaintext
Gestión de bases de datos
Lenguajes de marcas y sistemas de gestión de información
Seguridad y Alta Disponibilidad
```
Consulta XPath:

```xpath
/ies/modulos/modulo[ciclo='ASIR']/nombre/text()

```

Salida real:
```plaintext
Gestión de bases de datos
Lenguajes de marcas y sistemas de gestión de información
Seguridad y Alta Disponibilidad
```
### Actividad 2.3

Nombre de los módulos que se imparten en el segundo curso de cualquier ciclo.

Salida esperada:

```plaintext
Aplicaciones web
Seguridad y Alta Disponibilidad
```
Consulta XPath:

```xpath
/ies/modulos/modulo[curso='2']/nombre/text()
```

Salida real:
```plaintext
Aplicaciones web
Seguridad y Alta Disponibilidad
```
### Actividad 2.4

Nombre de los módulos de menos de 5 horas semanales.

Salida esperada:

```plaintext
Aplicaciones web
Lenguajes de marcas y sistemas de gestión de información
Seguridad y Alta Disponibilidad
```
Consulta XPath:

```xpath
/ies/modulos/modulo[horasSemanales<5]/nombre/text()
```

Salida real:
```xml
Aplicaciones web
Lenguajes de marcas y sistemas de gestión de información
Seguridad y Alta Disponibilidad
```
### Actividad 2.5

Nombre de los módulos que se imparten en el primer curso de ASIR.

Salida esperada:

```plaintext
Gestión de bases de datos
Lenguajes de marcas y sistemas de gestión de información
```
Consulta XPath:

```xpath
/ies/modulos/modulo[curso='1' and ciclo='ASIR']/nombre/text()
```

Salida real:
```plaintext
Gestión de bases de datos
Lenguajes de marcas y sistemas de gestión de información
```
### Actividad 2.6

Horas semanales de los módulos de más de 3 horas semanales.

Salida esperada:

```plaintext
4
5
```
Consulta XPath:

```xpath
/ies/modulos/modulo[horasSemanales>3]/horasSemanales/text()
```

Salida real:
```plaintext
4
5
```
### Actividad 2.7

Invéntate tu propia consulta.

Nombre del módulo que se imparte en más de un ciclo.
Consulta XPath:

```xpath
/ies/modulos/modulo[count(ciclo)>1]/nombre/text()
```

Salida real:
```plaintext
Lenguajes de marcas y sistemas de gestión de información
```

## Actividad 3

Dado el siguiente documento XML, escriba las expresiones XPath que devuelvan la respuesta deseada.

```xml
<?xml version="1.0" encoding="UTF-8"?>
<ies>
  <nombre>Campus Digital</nombre>
  <web>https://campusdigitalfp.com/</web>
  <ciclos>
    <ciclo id="ASIR">
      <nombre>Administración de Sistemas Informáticos en Red</nombre>
      <grado>Superior</grado>
      <decretoTitulo año="2009" />
    </ciclo>
    <ciclo id="DAW">
      <nombre>Desarrollo de Aplicaciones Web</nombre>
      <grado>Superior</grado>
      <decretoTitulo año="2010" />
    </ciclo>
    <ciclo id="SMR">
      <nombre>Sistemas Microinformáticos y Redes</nombre>
      <grado>Medio</grado>
      <decretoTitulo año="2008" />
    </ciclo>
  </ciclos>
  <modulos>
    <modulo id="0228">
      <nombre>Aplicaciones web</nombre>
      <curso>2</curso>
      <horasSemanales>4</horasSemanales>
      <ciclo>SMR</ciclo>
    </modulo>
    <modulo id="0372">
      <nombre>Gestión de bases de datos</nombre>
      <curso>1</curso>
      <horasSemanales>5</horasSemanales>
      <ciclo>ASIR</ciclo>
    </modulo>
    <modulo id="0373">
      <nombre>Lenguajes de marcas y sistemas de gestión de información</nombre>
      <curso>1</curso>
      <horasSemanales>3</horasSemanales>
      <ciclo>ASIR</ciclo>
      <ciclo>DAW</ciclo>
    </modulo>
    <modulo id="0378">
      <nombre>Seguridad y Alta Disponibilidad</nombre>
      <curso>2</curso>
      <horasSemanales>2</horasSemanales>
      <ciclo>ASIR</ciclo>
    </modulo>
  </modulos>
</ies>
```

### Actividad 3.1

Nombre de los módulos del ciclo "Sistemas Microinformáticos y Redes" (en la expresión final no deben aparecer las siglas SMR).

Salida esperada:

```plaintext
Aplicaciones web
```
Consulta XPath:

```xpath
/ies/modulos/modulo[ciclo='SMR']/nombre/text()
```

Salida real:
```plaintext
Aplicaciones web
```
### Actividad 3.2

Nombre de los ciclos que incluyen el módulo "Lenguajes de marcas y sistemas de gestión de información".

Salida esperada:

```plaintext
Administración de Sistemas Informáticos en Red
Desarrollo de Aplicaciones Web
```
Consulta XPath:

```xpath
//ciclos/ciclo[@id=/ies/modulos/modulo[nombre='Lenguajes de marcas y sistemas de gestión de información']/ciclo]/nombre/node()
```

Salida real:
```plaintext
Administración de Sistemas Informáticos en Red
Desarrollo de Aplicaciones Web
```
### Actividad 3.3

Nombre de los módulos de ciclos de Grado Superior.

Salida esperada:

```plaintext
Gestión de bases de datos
Lenguajes de marcas y sistemas de gestión de información
Seguridad y Alta Disponibilidad
```
Consulta XPath:

```xpath
/ies/modulos/modulo[ciclo = /ies/ciclos/ciclo[grado='Superior']/@id]/nombre/text()
```

Salida real:
```plaintext
Gestión de bases de datos
Lenguajes de marcas y sistemas de gestión de información
Seguridad y Alta Disponibilidad
```
### Actividad 3.4

Nombre de los módulos de ciclos cuyo título se aprobó en 2008.

Salida esperada:

```plaintext
Aplicaciones web
```
Consulta XPath:

```xpath
//modulo[ciclo=/ies/ciclos/ciclo[decretoTitulo/@año='2008']/@id]/nombre/text()
```

Salida real:
```plaintext
Aplicaciones web
```
### Actividad 3.5

Grado de los ciclos con módulos de primer curso.

Salida esperada:

```plaintext
Superior
Superior
```
Consulta XPath:

```xpath
//ciclos/ciclo[@id=/ies/modulos/modulo[curso='1']/ciclo]/grado/text()
```

Salida real:
```plaintext
Superior
Superior
```
### Actividad 3.6

Invéntate tu propia consulta.

Nombre de los módulos que son impartidos en más de un ciclo

Consulta XPath:

```xpath
//modulo[count(ciclo) > 1]/nombre/text()
```

Salida real:
```plaintext
Lenguajes de marcas y sistemas de gestión de información
```

## (Voluntaria) Actividad 4

Dado el siguiente fichero XML:

```xml
<?xml version="1.0" encoding="UTF-8"?>
<universidad>

    <nombre>Universidad de Zaragoza</nombre>
    <pais>España</pais>

    <!-- GRADOS -->

    <grados>

        <grado id="g01">
            <nombre>Grado en Ingeniería Informática</nombre>
            <plan>2003</plan>
            <creditos>250</creditos>
            <centro>Escuela de Informática</centro>
        </grado>

        <grado id="g02">
            <nombre>Grado en Administración y Dirección de Empresas</nombre>
            <plan>2000</plan>
            <creditos>275</creditos>
            <centro>Facultad de Ciencias Sociales</centro>
        </grado>

        <grado id="g03">
            <nombre>Grado en Relaciones Laborales</nombre>
            <plan>2000</plan>
            <creditos>280</creditos>
            <centro>Facultad de Ciencias Sociales</centro>
            <subdirector>Alfonso Martín Luque</subdirector>
        </grado>

        <grado id="g04">
            <nombre>Grado en Quimica</nombre>
            <plan>2003</plan>
            <creditos>175</creditos>
            <centro>Facultad de Ciencias Experimentales</centro>
        </grado>

        <grado id="g05">
            <nombre>Grado en Biotecnología</nombre>
            <plan>2000</plan>
            <creditos>175</creditos>
            <centro>Facultad de Ciencias</centro>
        </grado>

        <grado id="g06">
            <nombre>Grado en Humanidades</nombre>
            <plan>1980</plan>
            <creditos>475</creditos>
            <centro>Facultad de Humanidades</centro>
        </grado>

    </grados>

    <!-- ASIGNATURAS -->

    <asignaturas>

        <asignatura id="a01" titulacion="g01">
            <nombre>Ofimática</nombre>
            <creditosTeoricos>3</creditosTeoricos>
            <creditosPracticos>1.5</creditosPracticos>
            <trimestre>1</trimestre>
        </asignatura>

        <asignatura id="a02" titulacion="g01">
            <nombre>Ingeniería del Software</nombre>
            <creditosTeoricos>6</creditosTeoricos>
            <creditosPracticos>1.5</creditosPracticos>
            <trimestre>2</trimestre>
        </asignatura>

        <asignatura id="a03" titulacion="g02">
            <nombre>Administración de Empresas</nombre>
            <creditosTeoricos>4</creditosTeoricos>
            <creditosPracticos>1.5</creditosPracticos>
            <trimestre>1</trimestre>
        </asignatura>

        <asignatura id="a04" titulacion="g02">
            <nombre>Derecho Internacional</nombre>
            <creditosTeoricos>4</creditosTeoricos>
            <creditosPracticos>5</creditosPracticos>
            <trimestre>1</trimestre>
        </asignatura>

        <asignatura id="a05" titulacion="g04">
            <nombre>Pedagogía</nombre>
            <creditosTeoricos>4</creditosTeoricos>
            <creditosPracticos>1.5</creditosPracticos>
            <trimestre>2</trimestre>
        </asignatura>

        <asignatura id="a06" titulacion="g03">
            <nombre>Didáctica</nombre>
            <creditosTeoricos>4</creditosTeoricos>
            <creditosPracticos>3</creditosPracticos>
            <trimestre>2</trimestre>
        </asignatura>

        <asignatura id="a07" titulacion="g04">
            <nombre>Tecnología de los Alimentos</nombre>
            <creditosTeoricos>1.5</creditosTeoricos>
            <creditosPracticos>7.5</creditosPracticos>
            <trimestre>2</trimestre>
        </asignatura>

        <asignatura id="a08" titulacion="g01">
            <nombre>Bases de Datos</nombre>
            <creditosTeoricos>4.5</creditosTeoricos>
            <creditosPracticos>5.5</creditosPracticos>
            <trimestre>1</trimestre>
        </asignatura>

        <asignatura id="a09" titulacion="g06">
            <nombre>Historia del Pensamiento</nombre>
            <creditosTeoricos>6</creditosTeoricos>
            <creditosPracticos>0</creditosPracticos>
            <trimestre>2</trimestre>
        </asignatura>

    </asignaturas>

    <!-- ALUMNOS -->

    <alumnos>

        <alumno id="e01">
            <apellido1>Rivas</apellido1>
            <apellido2>Santos</apellido2>
            <nombre>Víctor Manuel</nombre>
            <sexo>Hombre</sexo>
            <estudios>
                <grado codigo="g01" />
                <asignaturas>
                    <asignatura codigo="a01" />
                    <asignatura codigo="a03" />
                    <asignatura codigo="a05" />
                    <asignatura codigo="a09" />
                </asignaturas>
            </estudios>
        </alumno>

        <alumno id="e02">
            <apellido1>Pérez</apellido1>
            <apellido2>García</apellido2>
            <nombre>Luisa</nombre>
            <sexo>Mujer</sexo>
            <estudios>
                <grado codigo="g02" />
                <asignaturas>
                    <asignatura codigo="a02" />
                    <asignatura codigo="a01" />
                </asignaturas>
                <proyecto>Web de IBM.com</proyecto>
            </estudios>

        </alumno>

        <alumno id="e03" beca="si">
            <apellido1>Pérez</apellido1>
            <apellido2>Romero</apellido2>
            <nombre>Fernando</nombre>
            <sexo>Hombre</sexo>
            <estudios>
                <grado codigo="g02" />
                <asignaturas>
                    <asignatura codigo="a02" />
                    <asignatura codigo="a01" />
                    <asignatura codigo="a04" />
                    <asignatura codigo="a09" />
                </asignaturas>
            </estudios>
        </alumno>

        <alumno id="e04">
            <apellido1>Avalón</apellido1>
            <apellido2>Jiménez</apellido2>
            <nombre>María</nombre>
            <sexo>Mujer</sexo>
            <estudios>
                <grado codigo="g01" />
                <asignaturas>
                    <asignatura codigo="a02" />
                    <asignatura codigo="a01" />
                    <asignatura codigo="a07" />
                </asignaturas>
                <proyecto>Estudio de Salinidad del Pantano Iris</proyecto>
            </estudios>
        </alumno>

    </alumnos>

</universidad>
```

Obtén la siguiente información.

### Actividad 4.01

Nombre de la Universidad.

Consulta XPath:

```xpath
/universidad/nombre/text()
```

Salida real:
```plaintext
Universidad de Zaragoza
```

### Actividad 4.02

País de la Universidad.

Consulta XPath:

```xpath
/universidad/pais/text()
```

Salida real:
```plaintext
España
```

### Actividad 4.03

Nombres de las grados.

Consulta XPath:

```xpath
/universidad/grados/grado/nombre/text()
```

Salida real:
```plaintext
Grado en Ingeniería Informática
Grado en Administración y Dirección de Empresas
Grado en Relaciones Laborales
Grado en Quimica
Grado en Biotecnología
Grado en Humanidades
```

### Actividad 4.04

Años de plan de estudio de las grados.

Consulta XPath:

```xpath
/universidad/grados/grado/plan/text()
```

Salida real:
```plaintext
2003
2000
2000
2003
2000
1980
```

### Actividad 4.05

Nombres de todos los alumnos.

Consulta XPath:

```xpath
/universidad/alumnos/alumno/nombre/text()
```

Salida real:
```plaintext
Víctor Manuel
Luisa
Fernando
María
```

### Actividad 4.06

Identificadores de todas las grados.

Consulta XPath:

```xpath
/universidad/grados/grado/@id
```

Salida real:
```plaintext
id=g01
id=g02
id=g03
id=g04
id=g05
id=g06
```

### Actividad 4.07

Datos de la grado cuyo id es g01.

Consulta XPath:

```xpath
/universidad/grados/grado[@id='g01']

```

Salida real:
```xml
<grado id="g01">
    <nombre>Grado en Ingeniería Informática</nombre>
    <plan>2003</plan>
    <creditos>250</creditos>
    <centro>Escuela de Informática</centro>
</grado>
```

### Actividad 4.08

Centro en que se estudia de la grado cuyo id es g02.

Consulta XPath:

```xpath
/universidad/grados/grado[@id='g02']/centro/text()
```

Salida real:
```plaintext
Facultad de Ciencias Sociales
```

### Actividad 4.09

Nombre de las grados que tengan subdirector.

Consulta XPath:

```xpath
/universidad/grados/grado[subdirector]/nombre/text()
```

Salida real:
```plaintext
Grado en Relaciones Laborales
```

### Actividad 4.10

Nombre de los alumnos que estén haciendo proyecto.

Consulta XPath:

```xpath
/universidad/alumnos/alumno/estudios/proyecto/../../nombre/text()
```

Salida real:
```plaintext
Luisa
María
```

### Actividad 4.11

Códigos de las grados en las que hay algún alumno matriculado.

Consulta XPath:

```xpath
/universidad/alumnos/alumno/estudios/grado/@codigo
```

Salida real:
```xml
codigo=g01
codigo=g02
codigo=g02
codigo=g01
```

### Actividad 4.12

Apellidos y Nombre de los alumnos con beca.

Consulta XPath:

```xpath
/universidad/alumnos/alumno[@beca='si']/nombre/text()
```

Salida real:
```plaintext
Fernando
```

### Actividad 4.13

Nombre de las asignaturas del grado g04.

Consulta XPath:

```xpath
/universidad/asignaturas/asignatura[@titulacion='g04']/nombre/text()
```

Salida real:
```plaintext
Pedagogía
Tecnología de los Alimentos
```

### Actividad 4.14

Nombre de las asignaturas de segundo trimestre.

Consulta XPath:

```xpath
/universidad/asignaturas/asignatura[trimestre='2']/nombre/text()
```

Salida real:
```plaintext
Ingeniería del Software
Pedagogía
Didáctica
Tecnología de los Alimentos
Historia del Pensamiento
```

### Actividad 4.15

Nombre de las asignaturas que no tienen 4 créditos teóricos.

Consulta XPath:

```xpath
/universidad/asignaturas/asignatura[creditosTeoricos!='4']/nombre/text()
```

Salida real:
```plaintext
Ofimática
Ingeniería del Software
Tecnología de los Alimentos
Bases de Datos
Historia del Pensamiento
```

### Actividad 4.16

Código de la grado que estudia el último alumno.

Consulta XPath:

```xpath
/universidad/alumnos/alumno[last()]/estudios/grado/@codigo
```

Salida real:
```xml
codigo=g01
```

### Actividad 4.17

Código de las asignaturas que estudian mujeres.

Consulta XPath:

```xpath
/universidad/alumnos/alumno[sexo='Mujer']/estudios/asignaturas/asignatura/@codigo
```

Salida real:
```xml
codigo=a02
codigo=a01
codigo=a02
codigo=a01
codigo=a07
```

### Actividad 4.18

Nombre de los alumnos que matriculados en la asignatura a02.

Consulta XPath:

```xpath
/universidad/alumnos/alumno[estudios/asignaturas/asignatura[@codigo='a02']]/nombre/text()
```

Salida real:
```plaintext
Luisa
Fernando
María
```

### Actividad 4.19

Códigos de las grados que estudian los alumnos matriculados en alguna asignatura.

Consulta XPath:

```xpath
/universidad/alumnos/alumno/estudios/grado/@codigo
```

Salida real:
```xml
codigo=g01
codigo=g02
codigo=g02
codigo=g01
```

### Actividad 4.20

Apellidos de todos los hombres.

Consulta XPath:

```xpath
/universidad/alumnos/alumno[sexo='Hombre']/*[self::apellido1 or self::apellido2]/text()
```

Salida real:
```plaintext
Rivas
Santos
Pérez
Romero
```

### Actividad 4.21

Nombre de la grado que estudia Víctor Manuel.

Consulta XPath:

```xpath
/universidad/grados/grado[@id=/universidad/alumnos/alumno[nombre='Víctor Manuel']/estudios/grado/@codigo]/nombre/text()
```

Salida real:
```plaintext
Grado en Ingeniería Informática
```

### Actividad 4.22

Nombre de las asignaturas que estudia Luisa.

Consulta XPath:

```xpath
/universidad/asignaturas/asignatura[@id=/universidad/alumnos/alumno[nombre='Luisa']/estudios/asignaturas/asignatura/@codigo]/nombre/text()
```

Salida real:
```plaintext
Ofimática
Ingeniería del Software
```

### Actividad 4.23

Primer apellido de los alumnos matriculados en Ingeniería del Software.

Consulta XPath:

```xpath
/universidad/alumnos/alumno[estudios/asignaturas/asignatura[@codigo=/universidad/asignaturas/asignatura[nombre='Ingeniería del Software']/@id]]/apellido1/text()
```

Salida real:
```plaintext
Pérez
Pérez
Avalón
```

### Actividad 4.24

Nombre de las grados que estudian los alumnos matriculados en la asignatura Tecnología de los Alimentos.

Consulta XPath:

```xpath
/universidad/grados/grado[@id = /universidad/alumnos/alumno/estudios/asignaturas/asignatura[@codigo = 'a07']/../../grado/@codigo]/nombre/text()
```

Salida real:
```plaintext
Grado en Ingeniería Informática
```

### Actividad 4.25

Nombre de los alumnos matriculados en grados que no tienen subdirector.

Consulta XPath:

```xpath
/universidad/alumnos/alumno[estudios/grado/@codigo = /universidad/grados/grado[not(subdirector)]/@id]/nombre/text()
```

Salida real:
```plaintext
Víctor Manuel
Luisa
Fernando
María
```

### Actividad 4.26

Nombre de las alumnos matriculados en asignaturas con 0 créditos prácticos y que estudien la grado de I.T. Informática .
Consulta XPath:

```xpath
/universidad/alumnos/alumno[estudios/asignaturas/asignatura/@codigo = /universidad/asignaturas/asignatura[creditosPracticos='0']/@id and estudios/grado/@codigo = //grado[nombre="Grado en Ingeniería Informática"]/@id]/nombre/text()
```

Salida real:
```plaintext
Víctor Manuel
```

### Actividad 4.27

Nombre de los alumnos que estudian grados cuyos planes son anteriores a 2002.
Consulta XPath:

```xpath
/universidad/alumnos/alumno[estudios/grado/@codigo = /universidad/grados/grado[plan < '2002']/@id]/nombre/text()
```

Salida real:
```plaintext
Luisa
Fernando
```

### Actividad 4.28

Invéntate tu propia consulta.

Nombre de las asignaturas que tienen más créditos prácticos que teóricos.

Consulta XPath:

```xpath
/universidad/asignaturas/asignatura[number(creditosPracticos) > number(creditosTeoricos)]/nombre/text()
```

Salida real:
```plaintext
Derecho Internacional
Tecnología de los Alimentos
Bases de Datos
```