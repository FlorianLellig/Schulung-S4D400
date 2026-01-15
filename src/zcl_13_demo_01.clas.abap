CLASS zcl_13_demo_01 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_13_demo_01 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

**********************************************************************
* Hello World
**********************************************************************
    DATA text TYPE string.      " Deklaration
    text = 'Hello World!'.      " Wertzuweisung
    out->write( text ).         " Ausgabe

**********************************************************************
* Datentypen und Datenobjekte
**********************************************************************
    DATA age TYPE i.                                  " Integer Ganze Zahlen
    DATA salary_in_euro TYPE p length 16 decimals 2.  " Datentyp: Binary coded decimal (Kommarzahl, 16 Byte)
    DATA first_name TYPE c LENGTH 40.                 " Zeichenketten fester Laenge
    DATA matriculation_number TYPE n LENGTH 7.        " Ziffernfolge
    DATA xmas type d.                                 " Datumsangaben
    DATA noon TYPE t.                                 " Zeitangaben

    DATA flag TYPE abap_boolean.                      " Boolean existiert nicht richtig, im Hintergrund ist einfach ein char mit 'X' oder ''


  ENDMETHOD.


ENDCLASS.
