# Desatools

Set de herramientas para el equipo de desarrollo. Se incluyen aquellas pensadas para los restores desde POWER7 a SOFTDESA y SOFTTEST.

### Instalacion

1. `git clone` este repositorio
2. Ejecutar `gmake clean all`

### Ejemplo de uso

`git clone https://github.com/hdi-seguros-argentina/Devtools.git`

`make {clean} all {release}`

     * clean: Borra la biblioteca destino primero.
     * all: Compila todo en la biblioteca destino.
     * release: Salva la biblioteca y la envía al siguiente entorno (Dev -> Test -> Prod).

### Para compilar en otra biblioteca

`make clean all BIN_LIB=EJEMPLO`

**Importante: make clean hace que la biblioteca de compilación se BORRE primero; asi que cuidado con lo que se pone en el parámetro BIN_LIB porque si el ejecutor tiene autorización va a BORRAR LA BIBLIOTECA COMPLETAMENTE.**