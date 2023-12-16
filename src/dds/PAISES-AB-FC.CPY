         SELECT FD-PAISES
                ASSIGN TO DISK "PAISES"
                FILE STATUS IS FS
                LOCK MODE IS MANUAL
                ORGANIZATION IS INDEXED
                ACCESS MODE IS DYNAMIC
                RECORD KEY IS ABCOD
                SHARING WITH ALL OTHER.
