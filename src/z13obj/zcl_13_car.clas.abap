CLASS zcl_13_car DEFINITION
  PUBLIC
  INHERITING FROM zcl_13_vehicle
  CREATE PUBLIC .

  PUBLIC SECTION.
    DATA seats type i READ-ONLY.
    METHODS constructor
      IMPORTING
        make TYPE string
        seats TYPE i
        model TYPE string.

    METHODS to_string REDEFINITION.

  PROTECTED SECTION.

  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_13_car IMPLEMENTATION.

  METHOD constructor.

    super->constructor( make = make model = model ).

    me->seats = seats.

  ENDMETHOD.


  METHOD to_string.

    string = |{ make } { model } ({ speed_in_kmh } km/h, { seats } Sitzplätze)|.

  ENDMETHOD.

ENDCLASS.
