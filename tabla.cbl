      ******************************************************************
      * Author:
      * Date:
      * Purpose:
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
      *-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-
       PROGRAM-ID. YOUR-PROGRAM-NAME.
       ENVIRONMENT DIVISION.

       CONFIGURATION SECTION.
      *-----------------------
       SPECIAL-NAMES. DECIMAL-POINT IS COMMA.
       INPUT-OUTPUT SECTION.
      *-----------------------
       DATA DIVISION.
      *-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-
       FILE SECTION.
      *-----------------------
       WORKING-STORAGE SECTION.
      *-----------------------
       01  tabla.
           03 banco pic x(12) value "El Corralito".
           03 tab-personas.
               05 personas occurs 3 times.
                  07 nro    pic 999.
                  07 nombre pic x(5).
                  07 tab-movimientos.
                      09 movimientos occurs 2 times.
                         11 tipo  pic x.
                         11 monto pic 9(5)v99.
       77  i pic 9.
       77  j pic 9.
       77  acum pic 9(6)v99 value zero.
       77  k pic 9.
       77  l pic 9.
       77  m pic 9.
       PROCEDURE DIVISION.
      *-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-
       MAIN-PROCEDURE.
           perform lleno-tabla.
           perform muestro-tabla.
      *-*-*-*-*-*-*-*-RECORRIDO DE MATRICES
           perform varying i from 1 by 1 until i > 3 after j from 1
               by 1 until j > 2
                   add monto(i, j) to acum
           END-PERFORM.
           display "en total se movio $ ",acum.
           perform varying i from 1 by 1 until i > 5 after j from 1
               by 1 until j > 4 after k from 1 by 1 until k > 3
               after l from 1 by 1 until l> 2 after m from 1 by 1
               until m >2
                   display i,j,k,l,m
           end-perform.
            STOP RUN.

       lleno-tabla.
           move 111 to nro(1)
           move 222 to nro(2)
           move 333 to nro(3)

           move "Juan"  to nombre(1)
           move "Pedro" to nombre(2)
           move "Maria" to nombre(3)

           move "T0010000" to movimientos(1, 1)
           move "D0020000" to movimientos(1, 2)
           move "E0030000D0040000" to tab-movimientos(2)

      *    move "T" to tipo(1, 1)
      *    move "D" to tipo(1, 2)
      *      move "E" to tipo(2, 1)
      *     move "D" to tipo(2, 2)
           move "T" to tipo(3, 1)
           move "E" to tipo(3, 2)

      *     move 100 to monto(1, 1)
      *     move 200 to monto(1, 2)
      *     move 300 to monto(2, 1)
      *     move 400 to monto(2, 2)
           move 500 to monto(3, 1)
           move 600 to monto(3, 2).

       muestro-tabla.
           display tabla.
           display "BANCO: ",banco
           PERFORM VARYING i from 1 by 1 until i>3
               display "NRO:         NOMBRE"
               display nro(i), "         ",nombre(i)
               display "TIPO         MONTO"
               perform varying j from 1 by 1 until j>2

                   DISPLAY tipo(i,j),"         ",monto(i,j)
               END-PERFORM
           display " "
           END-PERFORM.
      ** add other procedures here
       END PROGRAM YOUR-PROGRAM-NAME.
