CLASS zcl_13_abap_06 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_13_abap_06 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    DATA(result) = ZCL_13_HELPER=>GET_TRAVEL_WITH_CUSTOMER( travel_id = '1' ).

    out->write( result ).

    DATA(result2) = ZCL_13_HELPER=>GET_TRAVELS( customer_id = '1' ).

    out->write( result2 ).

  ENDMETHOD.
ENDCLASS.
