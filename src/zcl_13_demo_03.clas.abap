CLASS zcl_13_demo_03 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_13_demo_03 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    DATA age TYPE i VALUE '20'.
    DATA gender TYPE c LENGTH 1 VALUE 'M'.
    DATA first_name TYPE c LENGTH 40 VALUE 'Florian'.
    DATA last_name TYPE c LENGTH 40 VALUE 'Lellig'.

**********************************************************************
*Verzweigungen
    " Vergleichsoperatoren: >, >=, <, <=, =, <>
    " Logische Operatoren: AND, OR, NOT
    " + IS (NOT) INITIAL
**********************************************************************

    IF age < 18.
      out->write( |Hallo { first_name }| ).

    ELSEIF gender = 'm' OR gender = 'M'.
      out->write( |Hallo Herr { last_name }| ).

    ELSEIF gender = 'w' OR gender = 'W'.
      out->write( |Hallo Frau { last_name }| ).

    ELSE.
      out->write( |Hallo { last_name }| ).

    ENDIF.


    out->write( |Hallo { COND #( WHEN age < 18 THEN first_name
                                 WHEN gender = 'm' OR gender = 'M' then |Herr { last_name }|
                                 WHEN gender = 'w' OR gender = 'W' then |Frau { last_name }|
                                 ELSE last_name ) }| ).


  ENDMETHOD.
ENDCLASS.
