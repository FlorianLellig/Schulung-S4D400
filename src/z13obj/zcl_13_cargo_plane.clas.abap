CLASS zcl_13_cargo_plane DEFINITION
  PUBLIC
  INHERITING FROM zcl_13_airplane
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    DATA cargo_in_tons TYPE i READ-ONLY.
    METHODS constructor
      IMPORTING
        id TYPE string
        plane TYPE string
        cargo_in_tons TYPE i
        empty_weight_in_tons TYPE i
      RAISING ZCX_ABAP_INITIAL_PARAMETER.

    METHODS: get_total_weight_in_tons REDEFINITION.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.


CLASS zcl_13_cargo_plane IMPLEMENTATION.
  METHOD constructor.

    super->constructor( id = id plane = plane empty_weight_in_tons = empty_weight_in_tons ).

    me->cargo_in_tons = cargo_in_tons.


  ENDMETHOD.

  METHOD get_total_weight_in_tons.
    int = empty_weight_in_tons * '1.1' + cargo_in_tons.
  ENDMETHOD.
ENDCLASS.
