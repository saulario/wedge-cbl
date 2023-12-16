            SELECT FD-USUARIOS
                ASSIGN TO DISK "USUARIOS"
                FILE STATUS IS FS
                LOCK MODE IS MANUAL
                ORGANIZATION IS INDEXED
                ACCESS MODE IS DYNAMIC
                RECORD KEY IS ACCOD
                SHARING WITH ALL OTHER.
                