CLASS zcl_13_demo_09 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_13_demo_09 IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

    SELECT FROM Z13_Demo07( P_carrierId = 'LH' )
      FIELDS *
      INTO table @data(flights).

    out->write( flights ).

  ENDMETHOD.
ENDCLASS.
