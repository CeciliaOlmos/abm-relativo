      ******************************************************************
      * Author:
      * Date:
      * Purpose:
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. YOUR-PROGRAM-NAME.
       DATA DIVISION.
       FILE SECTION.
       WORKING-STORAGE SECTION.
       01  sucursales.
           03 filler pic x(14) value "PalPalermo".
           03 filler pic x(14) value "RecRecoleta".
           03 filler pic x(14) value "LinLiniers".
           03 filler pic x(14) value "MatMataderos".
       01  vec-suc redefines sucursales occurs 5 times.
           03 cod-suc pic xxx.
           03 nom-suc pic x(11).
       01  cod-fin pic 9 value 0.


       01  mat-fec-suc.
           03 vec-mes-con occurs 12 times.
               05 vec-suc-con occurs 5 times.
                   07 mat-importes pic 9(9)v99.
       01  tab-tot-suc.
           03 vec-tot-suc pic 9(10)v99 occurs 5 times.
       01  meses.
           03 filler pic x(10) value "Enero".
           03 filler pic x(10) value "Enero".
           03 filler pic x(10) value "Enero".
           03 filler pic x(10) value "Enero".
           03 filler pic x(10) value "Enero".
           03 filler pic x(10) value "Enero".
           03 filler pic x(10) value "Enero".
           03 filler pic x(10) value "Enero".
           03 filler pic x(10) value "Enero".
           03 filler pic x(10) value "Enero".
           03 filler pic x(10) value "Enero".
           03 filler pic x(10) value "Enero".

       PROCEDURE DIVISION.
       MAIN-PROCEDURE.
            DISPLAY "Hello world"
            STOP RUN.
       END PROGRAM YOUR-PROGRAM-NAME.
