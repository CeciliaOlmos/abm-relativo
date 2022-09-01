       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT socios ASSIGN TO "..\arch.dat"
           ORGANIZATION RELATIVE
           ACCESS MODE is RANDOM
           RELATIVE key is rel-nro.
