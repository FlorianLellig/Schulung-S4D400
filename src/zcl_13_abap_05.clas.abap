CLASS zcl_13_abap_05 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_13_abap_05 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    DATA customerID TYPE /dmo/customer_id VALUE 15.

    TRY.
        data(collecteddata) = zcl_abap_helper=>get_customer( customer_id = customerid ).
      CATCH zcx_abap_no_data.
        out->write( |Unknown User| ).
    ENDTRY.
    out->write( collecteddata ).

  ENDMETHOD.
ENDCLASS.
