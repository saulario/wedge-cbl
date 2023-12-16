            SELECT FD-IDIOMAS
                ASSIGN TO DISK "IDIOMAS"
                FILE STATUS IS FS
                LOCK MODE IS MANUAL
                ORGANIZATION IS INDEXED
                ACCESS MODE IS DYNAMIC
                RECORD KEY IS AACOD
                SHARING WITH ALL OTHER.
                