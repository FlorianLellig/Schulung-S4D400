CLASS zcl_13_rental DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES zif_13_partner.
    TYPES ty_vehicles TYPE TABLE OF REF TO zcl_13_vehicle.

    DATA vehicles TYPE ty_vehicles READ-ONLY.

    METHODS add_vehicle
      IMPORTING vehicle TYPE REF TO zcl_13_vehicle.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_13_rental IMPLEMENTATION.
  METHOD add_vehicle.
    APPEND vehicle TO vehicles.
  ENDMETHOD.

  METHOD zif_13_partner~to_string.
    string = 'ICH bin die Autovermietung.'.
  ENDMETHOD.

ENDCLASS.
