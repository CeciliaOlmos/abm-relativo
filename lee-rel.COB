      ******************************************************************
      * Author:
      * Date:
      * Purpose:
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. YOUR-PROGRAM-NAME.
       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT socios ASSIGN TO "..\arch.dat"
           ORGANIZATION RELATIVE
           ACCESS MODE is DYNAMIC
           RELATIVE KEY is rel-nro.

       DATA DIVISION.
       FILE SECTION.
       fd  socios.
       01  soc-reg.
           03 soc-nro pic 999.
           03 soc-nom pic x(10).
       WORKING-STORAGE SECTION.
       77  sen pic 9.
           88  fin-de-archivo value 1.
       77  aux pic 999.
       77  rel-nro pic 99.
           88 no-quiere-mas value 0.
       PROCEDURE DIVISION.
       MAIN-PROCEDURE.
           OPEN input socios.
           perform pido.
           perform ciclo-general thru fin-ciclo-general
                   until no-quiere-mas.
           close socios.
           STOP RUN.
       pido.
           display "ingrese un nro, x fin 0".
           accept rel-nro.
       ciclo-general.
           move 0 to sen
           start socios key is not < rel-nro invalid key
                   display "no ta"
                   go to voy-a-pedir.
           read socios NEXT at end move 1 to sen.
           perform until fin-de-archivo
                   display "número: ", soc-nro
                   display "nombre: ", soc-nom
                   read socios NEXT at end move 1 to sen
                   END-READ
           END-PERFORM.
       voy-a-pedir.
           perform pido.
       fin-ciclo-general.
           exit.
       END PROGRAM YOUR-PROGRAM-NAME.
