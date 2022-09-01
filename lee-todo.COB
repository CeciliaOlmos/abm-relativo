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
           ACCESS MODE is SEQUENTIAL.

       DATA DIVISION.
       FILE SECTION.
       fd  socios.
       01  soc-reg.
           03 soc-nro pic 999.
           03 soc-nom pic x(10).
       WORKING-STORAGE SECTION.
       77  sen pic 9 value 0.
       PROCEDURE DIVISION.
       MAIN-PROCEDURE.
           OPEN input socios.
           perform leo.
           perform until sen = 1
               display "número: ", soc-nro
               display "nombre: ", soc-nom
               perform leo
            END-PERFORM.
            close socios.
            STOP RUN.
       leo.
           read socios at end move 1 to sen.


       END PROGRAM YOUR-PROGRAM-NAME.
