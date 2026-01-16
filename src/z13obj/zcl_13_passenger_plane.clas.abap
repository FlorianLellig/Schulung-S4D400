CLASS zcl_13_passenger_plane DEFINITION
  PUBLIC
  INHERITING FROM zcl_13_airplane
  CREATE PUBLIC .
  PUBLIC SECTION.
    DATA number_of_seats TYPE i READ-ONLY.
    METHODS constructor
      IMPORTING
        id TYPE string
        number_of_seats TYPE i
        plane TYPE string
        empty_weight_in_tons TYPE i
      RAISING ZCX_ABAP_INITIAL_PARAMETER.

    METHODS: get_total_weight_in_tons REDEFINITION.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_13_passenger_plane IMPLEMENTATION.

  METHOD constructor.

    super->constructor( id = id plane = plane empty_weight_in_tons = empty_weight_in_tons ).
    me->number_of_seats = number_of_seats.


  ENDMETHOD.
  METHOD get_total_weight_in_tons.
    int = empty_weight_in_tons * '1.1' + number_of_seats * '0,08'.
  ENDMETHOD.

ENDCLASS.
