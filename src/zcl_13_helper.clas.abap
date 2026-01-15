CLASS zcl_13_helper DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    CLASS-METHODS get_travel_with_customer
      IMPORTING
                travel_id                   TYPE /dmo/travel_id
      RETURNING VALUE(travel_with_customer) TYPE zabap_travel_with_customer.

    CLASS-METHODS get_travels
      IMPORTING
                customer_id    TYPE /dmo/customer_id
      RETURNING VALUE(travels) TYPE z13_travels.


  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_13_helper IMPLEMENTATION.

  METHOD get_travel_with_customer.

    SELECT FROM /dmo/travel
      INNER JOIN /dmo/customer ON /dmo/travel~customer_id = /dmo/customer~customer_id
      FIELDS *
      WHERE travel_id = @travel_id
      INTO CORRESPONDING FIELDS OF @travel_with_customer.
    ENDSELECT.

  ENDMETHOD.

**********************************************************************

  METHOD get_travels.

**********************************************************************
* Lesen mehrerer Datensätze
**********************************************************************

    SELECT FROM /dmo/travel
      FIELDS *
      WHERE customer_id = @customer_id
      INTO TABLE @travels.

  ENDMETHOD.


ENDCLASS.
