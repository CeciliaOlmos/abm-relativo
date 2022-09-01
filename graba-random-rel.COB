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
           ACCESS MODE is RANDOM
           RELATIVE key is rel-nro.

       DATA DIVISION.
       FILE SECTION.
       fd  socios.
       01  soc-reg.
           03 soc-nro pic 999.
           03 soc-nom pic x(10).
       WORKING-STORAGE SECTION.
       01  rel-nro pic 99.
       PROCEDURE DIVISION.
       MAIN-PROCEDURE.
           OPEN i-o socios.
           perform ingreso.
           perform until rel-nro = 0
               display "ingrese el código de socio"
               accept soc-nro
               display "ingrese nombre"
               accept soc-nom
               write soc-reg invalid key display "no pude"
               end-write
               perform ingreso
            END-PERFORM.
            close socios.
            STOP RUN.
       ingreso.
           display "ingrese nro"
           accept rel-nro.

       END PROGRAM YOUR-PROGRAM-NAME.
