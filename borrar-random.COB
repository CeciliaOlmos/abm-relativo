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
       77  encontre pic 9.
           88 encontro value 1.
       77  confirm pic x.
           88 confirmado value "s".
       PROCEDURE DIVISION.
       MAIN-PROCEDURE.
           OPEN i-o socios.
           perform ingreso.
           perform until rel-nro = 0
               perform busco-socio
               if encontro
                   PERFORM muestro
                   perform pido-confirmacion
                   if confirmado
                       DELETE socios invalid key display "no pude"
                               not INVALID KEY
                                   display "Borrado exitoso"
                       end-delete
                   ELSE
                       display "Operación cancelada"
                   END-IF
               ELSE
                   display "no ta"
               end-if
            perform ingreso
            END-PERFORM.
            close socios.
            STOP RUN.
       ingreso.
           display "ingrese nro RELATIVO de socio a borrar"
           accept rel-nro.
       busco-socio.
           read socios INVALID key
                           move 0 to encontre
                       not INVALID KEY
                           move 1 to encontre.
       muestro.
           display "Socio: ", soc-nro.
           display "Nombre: ", soc-nom.
       pido-confirmacion.
           display "Está seguro que quiere borrar a este chabón? (s/n)"
           accept confirm.
       END PROGRAM YOUR-PROGRAM-NAME.
