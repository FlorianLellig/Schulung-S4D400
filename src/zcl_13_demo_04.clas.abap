CLASS zcl_13_demo_04 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_13_demo_04 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

**********************************************************************
* While Schleife
**********************************************************************
    WHILE sy-index <= 10.

      out->write( sy-index ).

    ENDWHILE.

  ENDMETHOD.
ENDCLASS.
