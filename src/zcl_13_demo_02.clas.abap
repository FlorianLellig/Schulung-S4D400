CLASS zcl_13_demo_02 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_13_demo_02 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    DATA result_i TYPE i.                           " Ganze Zahl
    DATA result_p TYPE p LENGTH 16 DECIMALS 3.      " Ganze Zahl

**********************************************************************
* Mathematische Operationen
**********************************************************************

    result_i = 5 + 3.
    out->write( result_i ).

    result_i = 5 - 3.
    out->write( result_i ).

    result_i = 5 * 3.
    out->write( result_i ).

    result_i = 5 / 3.                               " Im Gegensatz zu Java wird gerundet
    out->write( result_i ).
    result_p = 5 / 3.                               " Im Gegensatz zu Java wird gerundet
    out->write( result_p ).
    result_i = 5 div 3.                             " Im Gegensatz zu Java wird gerundet
    out->write( result_i ).

    result_i = 5 mod 3.
    out->write( result_i ).

    result_i = 5 ** 3.
    out->write( result_i ).

    " Hochzählen
    result_i = result_i + 1.
    result_i += 1.
    add 1 to result_i.
    out->write( result_i ).

    out->write( '' ).

    " Runterzählen
    result_i = result_i - 1.
    result_i -= 1.
    subtract 1 from result_i.
    out->write( result_i ).

**********************************************************************
* Nummerische Funktionen, etc. siehe F1 Dokumentation
**********************************************************************
    out->write( 'Nummerische Funktionen:' ).

    result_i = sqrt( 81 ).
    out->write( result_i ).

    result_p = round( val = '47.895' dec = 2 ).


  ENDMETHOD.
ENDCLASS.
