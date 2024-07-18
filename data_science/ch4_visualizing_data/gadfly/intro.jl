using Gadfly

"""
GadFly.jl es una implementación de la gramática de gráficos de Wilkinson, que
descompone la tarea de la visualización en componentes primitivos similares A
sentencias en lenguaje humano. Las sentencias pueden ser descompuestas en
sustantivos, adjetivos y verbos para formar una gramática para dicha sentencia.

Estos componentes pueden ser combinados de maneras especificas para producir
sentencias con significados muy diferentes. Por ejemplo:

  "fast Julia passed slow R"

puede ser descompuesta en sus sustantivos, re-combinarla con otros verbos y el
significado de la sentencia cambia completamente

  "popular R overshadows Julia"

GoG nos permite hacer lo mismo con gráficas, tomando un conjunto de sustantivos
(datos) y combinarlos con adjetivos y verbos (scales, geometries, etc.) para
formar visualizaciones que, tanto se comprenden semanticamente, como se ajustan
a las necesidades en particular que pudieran surgir.

Gadfly tiene una interfaz simple y prefiere recibir datos de entrada en la forma
de DataFrames de Julia, aunque permite otros formatos.

```julia
Gadfly.plot(data::DataFrame, mapping::Dict, elements::Element)
```

- El `mapping` son los estilos que mapea las columnas del dataframe a la 
geometría de la gráfica.

- Por otro lado los `elements` son los adjetivos y verbos utilizados para 
mostrar los datos e incluyen:

  + `Geometries`: Que reciben estilos como entrada y utilizan los datos ligados
  a ellos para dibujar la gráfica.

  + `Guides`: Que dibujan los axis, ticks, labels y keys fuera del marco de
  la gráfica.

  + `Statistics`: Que toman estilos como entrada, efectúan una operación sobre
  ellos y devuelven la estética transformada.

  + `Coordinates`: Que mapea los datos al espacio bidimensional de 
  visualización.

  + `Scales`: Que mapea la transformación de una estética de vuelta al estilo.

Podemos guardar los gráficos como objetos de Julia, para utilizarlos en
llamadas a función subsecuentes. Cuando hacemos esto podemos utilizar el punto
y coma para indicar que no se imprima en la salida estándar, sino que 
directamente se guarde.

```julia
p1 = Gadfly.plot(data::DataFrame, mapping::Dict, elements::Element)
```

"""
