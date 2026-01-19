CLASS zcl_13_carrier DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES zif_13_Partner.
    Methods constructor IMPORTING name TYPE string.

    Methods add_plane IMPORTING airplane TYPE REF TO zcl_13_airplane.

    METHODS get_biggest_cargo_plane RETURNING VALUE(plane) TYPE i.

    DATA name TYPE string READ-ONLY.
    DATA airplanes TYPE TABLE OF REF TO zcl_13_airplane READ-ONLY.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_13_carrier IMPLEMENTATION.

  METHOD constructor.
    me->name = name.
  ENDMETHOD.


  METHOD add_plane.
    APPEND airplane TO me->airplanes.
  ENDMETHOD.

  METHOD get_biggest_cargo_plane.

    DATA airplane TYPE REF TO zcl_13_airplane.
    DATA cargo_plane TYPE REF TO zcl_13_cargo_plane.

    LOOP AT airplanes INTO airplane.

      IF airplane IS INSTANCE OF zcl_13_cargo_plane.
        cargo_plane = CAST #( airplane ).
        if cargo_plane->get_total_weight_in_tons(  ) > plane.
          plane = cargo_plane->get_total_weight_in_tons(  ).
        ENDIF.
      ENDIF.

    ENDLOOP.
  ENDMETHOD.

  METHOD zif_13_partner~to_string.
    string = 'ICH bin die Fluggesellschaft.'.
  ENDMETHOD.

ENDCLASS.
