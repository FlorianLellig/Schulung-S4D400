CLASS zcl_13_abap_07 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_13_abap_07 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    DATA(result) = ZCL_13_HELPER=>GET_TRAVELS( CUSTOMER_ID = '1' ).

**********************************************************************
* Löschen
**********************************************************************

    DELETE result WHERE begin_date < sy-datum.

    """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " Ändern per Datenreferenz
    """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    DATA result2 TYPE REF TO /dmo/travel.
    LOOP AT result REFERENCE INTO result2.
      result2->booking_fee = result2->booking_fee * '1.1'.
    ENDLOOP.

    out->write( result ).

  ENDMETHOD.
ENDCLASS.
