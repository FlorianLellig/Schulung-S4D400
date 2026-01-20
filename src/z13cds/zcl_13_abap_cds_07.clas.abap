CLASS zcl_13_abap_cds_07 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_13_abap_cds_07 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

  SELECT FROM Z13_CustomerWithTravels
      FIELDS CustomerId, FirstName, Title, \_Travels-TravelID
      INTO table @data(data).

    out->write( data ).

  ENDMETHOD.
ENDCLASS.
