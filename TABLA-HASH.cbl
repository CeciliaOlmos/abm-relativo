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
           SELECT SOCIOS ASSIGN TO "..\arch.dat"
           ORGANIZATION RELATIVE
           ACCESS MODE is DYNAMIC
           RELATIVE key is rel-nro.
       DATA DIVISION.
       FILE SECTION.
       FD  SOCIOS.
       01  soc-reg.
           03 soc-codigo pic 9(4).
           03 soc-nombre pic x(20).
           03 soc-puntero pic 9(3).

       WORKING-STORAGE SECTION.
       77  sen pic 9.
           88 fin-de-archivo value 1.
       77  aux pic 999.
       01  rel-nro pic 999.
           88 no-quiere-mas value 0.
       77  w-llave-menu pic 9.
           88 salir-menu VALUE 3.
       01  w-soc-ant pic 9(4).
       01  w-resul pic 9(3).
       01  w-resto pic 9(3).
       77  w-oficina pic 9(3) value 98.
       01  w-posicion-nula pic 9(3) VALUE ZERO.
       PROCEDURE DIVISION.
       MAIN-PROCEDURE.
           PERFORM 100-INICIO.
           PERFORM 200-MENU.
           PERFORM UNTIL salir-menu
                PERFORM 300-PROCESO
               PERFORM 200-MENU
           END-PERFORM.
           PERFORM 800-FIN.

            STOP RUN.
       100-INICIO.
           OPEN I-O SOCIOS.
           PERFORM 110-PRIMER-POSICION-VACIA.
       110-PRIMER-POSICION-VACIA.
           MOVE w-oficina TO rel-nro
           START SOCIOS KEY IS = rel-nro
            INVALID KEY
            DISPLAY "NO HAY LUGAR PARA SINONIMOS"
            NOT INVALID KEY
               READ SOCIOS
               MOVE soc-puntero TO w-posicion-nula.

       200-MENU.
           DISPLAY "1- ALTA"
           DISPLAY "2- CONSULTA"
           DISPLAY "3- FIN"
           ACCEPT w-llave-menu.
       300-PROCESO.
           IF w-llave-menu is EQUAL 1
               PERFORM 400-ALTA
           ELSE
               PERFORM 600-CONSULTA
           END-IF.
       400-ALTA.
           DISPLAY "Ingrese codigo de socio".
           ACCEPT w-soc-ant.
           PERFORM 410-INVOCAR-FUNCION-HASHING.
           PERFORM 420-BUSCAR-UBICACION.
       410-INVOCAR-FUNCION-HASHING.
           DIVIDE 97 INTO w-soc-ant GIVING w-resul REMAINDER rel-nro.
           if rel-nro=0
               add 1 to rel-nro.

           MOVE rel-nro to w-resto.

       420-BUSCAR-UBICACION.
           PERFORM 430-LEER-SOCIO
           IF soc-codigo=0
               PERFORM 440-PRIMER-INGRESO
           ELSE
               IF rel-nro = w-resto
                       IF  w-soc-ant = soc-codigo
                           PERFORM 460-INGRESO-EXISTENTE
                       ELSE
                           PERFORM 480-UBICAR-SINONIMO
                       END-IF

           END-IF.

       430-LEER-SOCIO.
           READ Socios.

       440-PRIMER-INGRESO.
            MOVE w-soc-ant to soc-codigo
               PERFORM 450-PIDO-NOMBRE
               PERFORM 470-ACTUALIZAR-SOCIO.
       460-INGRESO-EXISTENTE.
           DISPLAY "El socio ya se encuentra registrado"
           DISPLAY "Codigo de socio ",soc-codigo," Nombre ",soc-nombre.
       470-ACTUALIZAR-SOCIO.
           REWRITE soc-reg.
       450-PIDO-NOMBRE.
           DISPLAY "Ingrese el nombre de socio".
           ACCEPT soc-nombre.
       455-MOVER-VARIABLES.
           MOVE w-soc-ant TO soc-codigo
           ADD 1 TO w-posicion-nula
           MOVE w-posicion-nula to soc-puntero.
       480-UBICAR-SINONIMO.
            PERFORM UNTIL soc-puntero is NOT =0
               MOVE w-posicion-nula to soc-puntero
               PERFORM 470-ACTUALIZAR-SOCIO

            END-PERFORM
                 PERFORM 500-BUSCO-LUGAR.
       500-BUSCO-LUGAR.
               MOVE w-posicion-nula to rel-nro
               PERFORM 430-LEER-SOCIO
               PERFORM 450-PIDO-NOMBRE
               PERFORM 455-MOVER-VARIABLES
               PERFORM 470-ACTUALIZAR-SOCIO
               PERFORM 550-REINICIO-OFICINA.
       550-REINICIO-OFICINA.
           MOVE w-oficina TO rel-nro.
           PERFORM 430-LEER-SOCIO.
           MOVE w-posicion-nula TO soc-puntero.
           PERFORM 470-ACTUALIZAR-SOCIO.
       600-CONSULTA.
            PERFORM 610-PIDO-SOCIO.
            PERFORM UNTIL no-quiere-mas
               PERFORM 620-PROCESO-BUSCAR
               PERFORM 610-PIDO-SOCIO
            END-PERFORM.
       610-PIDO-SOCIO.
           DISPLAY "Ingreso un nro. Por fin 0".
           ACCEPT rel-nro.
       620-PROCESO-BUSCAR.
           move 0 to sen.
           start SOCIOS key is = rel-nro invalid key
                   display "NO SE ENCONTRO"
                   NOT INVALID KEY
                   PERFORM 630-MOSTRAR-SOCIO.

       630-MOSTRAR-SOCIO.
            read SOCIOS  at end move 1 to sen.
            display "CODIGO: ", soc-codigo.
            display "Nombre: ", soc-nombre.
       800-FIN.
           CLOSE Socios.
       END PROGRAM YOUR-PROGRAM-NAME.
