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
      *    ASUME QUE LA POSICION ES EL 1,2,3... NO HACE FALTA DECIRLE
      *     CUAL ES LA CLAVE
           ACCESS MODE is SEQUENTIAL.

       DATA DIVISION.
       FILE SECTION.
       fd  socios.
       01  soc-reg.
           03 soc-nro pic 999.
           03 soc-nom pic x(10).
       WORKING-STORAGE SECTION.
       PROCEDURE DIVISION.
       MAIN-PROCEDURE.
           OPEN OUTPUT socios.
           perform ingreso.
           perform until soc-nro = 0
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
           accept soc-nro.

       END PROGRAM YOUR-PROGRAM-NAME.
