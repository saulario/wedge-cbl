       IDENTIFICATION DIVISION.
       PROGRAM-ID. MGR001.
       ENVIRONMENT DIVISION.
        INPUT-OUTPUT SECTION.
        FILE-CONTROL.
        COPY "IDIOMAS-AA-FC" IN "src/dds"
            REPLACING "SELECT" BY "SELECT OPTIONAL".
        COPY "PAISES-AB-FC" IN "src/dds"
            REPLACING "SELECT" BY "SELECT OPTIONAL".
        COPY "USUARIOS-AC-FC" IN "src/dds"
            REPLACING "SELECT" BY "SELECT OPTIONAL".
        SELECT FD-CARGA-PAISES ASSIGN TO DISK "mgr/0001/paises.csv"
            FILE STATUS IS FS
            ORGANIZATION IS LINE SEQUENTIAL
            ACCESS MODE IS SEQUENTIAL.
       DATA DIVISION.
        FILE SECTION.
        COPY "IDIOMAS-FS" IN "src/dds".
        COPY "PAISES-FS" IN "src/dds".
        COPY "USUARIOS-FS" IN "src/dds".
        FD FD-CARGA-PAISES.
        01 RG-CARGA-PAISES.
            05 TEXTO    PIC X(1024).
        WORKING-STORAGE SECTION.
        01 FS           PIC 99.
        01 EOF          PIC 9.
        01 WAUX.
            05 WAUX01   PIC X(80).
            05 WAUX02   PIC X(80).
            05 WAUX03   PIC X(80).
            05 WAUX04   PIC X(80).
            05 WAUX05   PIC X(80).
            05 WAUX06   PIC X(80).
            05 WAUX07   PIC X(80).
            05 WAUX08   PIC X(80).
            05 WAUX09   PIC X(80).
            05 WAUX10   PIC X(80).
            05 WAUX11   PIC X(80).
            05 WAUX12   PIC X(80).

       PROCEDURE DIVISION.

       0000-MAIN SECTION.
        PERFORM 0001-Idiomas
        PERFORM 0001-Paises
        PERFORM 0001-Usuarios
        GOBACK
        .

       0001-Idiomas SECTION.
        DISPLAY "Idiomas..."
        OPEN OUTPUT SHARING WITH ALL OTHER FD-IDIOMAS
        DISPLAY FS
        CLOSE FD-IDIOMAS
        DISPLAY FS
        .

       0001-Paises SECTION. 
        DISPLAY "Paises..."
        OPEN OUTPUT SHARING WITH ALL OTHER FD-PAISES
        DISPLAY FS

        OPEN INPUT FD-CARGA-PAISES
        MOVE 0 TO EOF
        READ FD-CARGA-PAISES NEXT 
            AT END MOVE 1 TO EOF
        END-READ
        READ FD-CARGA-PAISES NEXT 
            AT END MOVE 1 TO EOF
        END-READ
        PERFORM UNTIL EOF = 1
            INITIALIZE RG-PAIS
            UNSTRING TEXTO DELIMITED BY ALL "," INTO
                ABNOM
                ABCOD
                ABCD3
                ABNUM
            END-UNSTRING
            MOVE 1 TO ABACT
            WRITE RG-PAIS
                INVALID KEY DISPLAY RG-PAIS
            END-WRITE
            READ FD-CARGA-PAISES NEXT
                AT END MOVE 1 TO EOF
            END-READ
        END-PERFORM

        CLOSE FD-CARGA-PAISES
        CLOSE FD-PAISES
        DISPLAY FS
        .

       0001-Usuarios SECTION. 
        DISPLAY "Usuarios..."
        OPEN OUTPUT SHARING WITH ALL OTHER FD-USUARIOS
        DISPLAY FS
        CLOSE FD-USUARIOS
        DISPLAY FS
        .

       END PROGRAM MGR001.
