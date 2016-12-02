
# README

## SVS Reader

Lee contenidos de series para instrumentos financieros en  [SVS](http://www.svs.cl/)
### Instalar
Primero [instalar watir](https://gist.github.com/enroxorz/968527/f7d5e064eba5addb3a998ce7e1c8dc4ca4cd1563). Luego [instalar phantomjs](https://gist.github.com/julionc/7476620) desde la carpeta principal
```zsh
$ ruby install_phantomjs.sh
```
### Setup
Preparar instrumentos en _data/instrumentos.rb_ siguiendo el formato: 
```
CODE
CODE_TYPE
URL
```
E.g:
```
CFIBTGRI
nemo
http://www.svs.cl/institucional/mercados/entidad.php?...
FIBCI_DEUDABP
nemo
http://www.svs.cl/institucional/mercados/entidad.php?...
CFIFALCTAC
nemo
http://www.svs.cl/institucional/mercados/entidad.php?...
```
### Ejecutar
Desde la carpeta principal donde esta el archivo _preciosSVS.rb_ ejecutar
```zsh
$ ruby preciosSVS.rb
```
### Resultados
Los resultados se encuentran en _SVS_precios.csv_ en formato [CSV](https://es.wikipedia.org/wiki/CSV)
Los datos están separados por _;_ en el orden _Fecha;Tipo;Código;Serie;Valor_ siendo

* _Fecha: Fecha en formato dd/mm/aaaa_
* _Tipo: Tipo de código (E.j: nemo)_
* _Código: Codigo identificador del instrumento_
* _Serie: Código de serie a la que pertence la posición_
* _Valor: Monto registrado_

### Notas
Para un instrumento que no se encuentra en SVS, **no** apareceran resultados en la tabla final.
---
###### Código para uso privado. Utilizar a discreción sin garantías.