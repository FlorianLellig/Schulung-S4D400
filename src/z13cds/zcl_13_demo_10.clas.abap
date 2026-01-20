CLASS zcl_13_demo_10 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_13_demo_10 IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

    SELECT FROM Z13_Demo08
      FIELDS CarrierId, ConnectionID, \_Carrier-name
      INTO table @data(connections).

    out->write( connections ).

  ENDMETHOD.
ENDCLASS.
