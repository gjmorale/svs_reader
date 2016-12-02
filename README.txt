
README (https://github.com/gjmorale/svs_reader/blob/master/README.md)

SVS Reader

Lee contenidos de series para instrumentos financieros en  SVS (http://www.svs.cl/)

Instalar

Primero instalar watir (https://gist.github.com/enroxorz/968527/f7d5e064eba5addb3a998ce7e1c8dc4ca4cd1563)
Luego instalar phantomjs (https://gist.github.com/julionc/7476620) desde la carpeta principal:

$ ruby install_phantomjs.sh

Setup

Preparar instrumentos en data/instrumentos.rb siguiendo el formato: 

CODE
CODE_TYPE
URL

E.g:
---------------------------------------------data/instrumentos.rb
CFIBTGRI
nemo
http://www.svs.cl/institucional/mercados/entidad.php?...
FIBCI_DEUDABP
nemo
http://www.svs.cl/institucional/mercados/entidad.php?...
CFIFALCTAC
nemo
http://www.svs.cl/institucional/mercados/entidad.php?...
-----------------------------------------------------------------

Ejecutar

Desde la carpeta principal donde esta el archivo preciosSVS.rb ejecutar:

$ ruby preciosSVS.rb

Para configuraciones the path específicas ejecutar

$ bash ./run.sh
> Please enter username
> $USER_NAME

Si el resultado no es el esperado, solicite ayuda a gmorales@quaam.cl

Resultados

Los resultados se encuentran en data/SVS_precios.csv en formato CSV (https://es.wikipedia.org/wiki/CSV)
Los datos están separados por ";" en el orden Fecha;Tipo;Código;Serie;Valor siendo

 - Fecha: Fecha en formato dd/mm/aaaa
 - Tipo: Tipo de código (E.j: nemo)
 - Código: Codigo identificador del instrumento
 - Serie: Código de serie a la que pertence la posición
 - Valor: Monto registrado

Notas

Para un instrumento que no se encuentra en SVS, no aparecerán resultados en la tabla final.



Código para uso privado.
Utilizar a discreción sin garantías.

Consultas, sugerencias o reclamos dirigirse a Guillermo Morales (gmorales@quaam.cl)