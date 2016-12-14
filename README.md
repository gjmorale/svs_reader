
# README

## SVS Reader

Lee contenidos de series para instrumentos financieros en  [SVS](http://www.svs.cl/)
### Instalar
Primero [instalar watir](https://gist.github.com/enroxorz/968527/f7d5e064eba5addb3a998ce7e1c8dc4ca4cd1563). Luego [instalar phantomjs](https://gist.github.com/julionc/7476620) desde la carpeta principal
* __Linux:__ Ejecutar
```zsh
$ ruby install_phantomjs.sh
```
* __Windows:__ Seguir estos pasos
  1. Descomprimir archivos de _phantomjs-2.1.1-windows.zip_ en ubicación favorita.
  2. Crear la variable de entorno _webdriver.phantomjs.driver_ en:
    * _Mi Equipo > Propiedades > Administración Avanzada > Variables de Entorno > Nueva_

### Setup
Preparar instrumentos en _data/Instrumentos.rb_ siguiendo el formato [CSV](https://es.wikipedia.org/wiki/CSV): 
```
id_ti;id_ti_valor;Serie;URL;fecha_inicio;fecha_fin
```
E.g:
```
Nemo;BTGBRSHDURA;;http://www.svs.cl/entidad.php?9361=7;14/9/2016;17/9/2016
Nemo;CFISECRFN4;CUATRO;http://www.svs.cl/entidad.php?9117=7;14/9/2016;17/9/2016
Nemo;CFISECRFN4;TRES;http://www.svs.cl/entidad.php?9117=7;14/9/2016;17/9/2016
```
### Ejecutar
Desde la carpeta principal donde estan los archivos _preciosSVS.rb_ y _run.sh_ ejecutar
```zsh
$ ruby preciosSVS.rb
```
Para configuraciones the path específicas ejecutar
```zsh
$ ruby run.rb
> Please enter username
> $USER_NAME
```
Si el resultado no es el esperado, solicite ayuda a [Guillermo Morales](gmorales@quaam.cl)
### Resultados
Los resultados se encuentran en _data/SVS_precios.csv_ en formato [CSV](https://es.wikipedia.org/wiki/CSV)
Los datos están separados por _;_ en el orden _tipo;codigo;fecha;valor;p_cierre;serie_ siendo

* _Tipo: Tipo de código (E.g: nemo)_
* _Código: Codigo identificador del instrumento_
* _Fecha: Fecha en formato dd/mm/aaaa_
* _Valor: Monto registrado_
* _Precio Cierre: PlaceHolder para vector precio_
* _Serie: Código de serie a la que pertence la posición_

tipo | codigo | fecha | valor | p_cierre | serie
--- | --- | --- | --- | --- | ---
Nemo | BTGBRSHDURA | 16/09/2016 | 988,9074 | p_cierre | A
Nemo | BTGBRSHDURA | 17/09/2016 | 988,8910 | p_cierre | A
Nemo | CFISECRFN4 | 16/09/2016 | 1007,1618 | p_cierre | CUATRO
Nemo | CFISECRFN4 | 17/09/2016 | 1007,1956 | p_cierre | CUATRO
Nemo | CFISECRFN4 | 16/09/2016 | 1104,1448 | p_cierre | TRES
Nemo | CFISECRFN4 | 17/09/2016 | 1104,1979 | p_cierre | TRES

> ### Notas
> * Para un instrumento que no se encuentra en SVS, **no** aparecerán resultados en la tabla final.
> * Para verificar casos extraños, revisar _data/log.txt_.
> * Para adaptar rutas personalizadas, modificar en _run.sh_ los path en las variables de entorno **INPUT_SVS** y **OUTPUT_SVS** para el usuario específico.
> 

***

###### Código para uso privado. Utilizar a discreción sin garantías.