CLASS zcl_13_main_airplanes DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_13_main_airplanes IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

**********************************************************************
* Deklarationen
**********************************************************************
    DATA airplane  TYPE REF TO zcl_13_airplane.
    DATA airplanes TYPE TABLE OF REF TO zcl_13_airplane.

**********************************************************************
* Instanziierungen
**********************************************************************
    out->write( |Number of Airplanes: { zcl_13_airplane=>number_of_airplanes }| ).

    TRY.
      airplane = NEW #( id = '1' plane = 'Airbus A380' empty_weight_in_tons = '105' ).
      APPEND airplane TO airplanes.
      CATCH ZCX_ABAP_INITIAL_PARAMETER INTO DATA(x).
          out->write( x->get_text( ) ).
    ENDTRY.
    TRY.
      airplane = NEW #( id = '2' plane = '' empty_weight_in_tons = '15' ).
      APPEND airplane TO airplanes.
      CATCH ZCX_ABAP_INITIAL_PARAMETER INTO DATA(y).
          out->write( y->get_text( ) ).
    ENDTRY.
    TRY.
      airplane = NEW #( id = '3' plane = 'Airbus A320' empty_weight_in_tons = '35' ).
      APPEND airplane TO airplanes.
      CATCH ZCX_ABAP_INITIAL_PARAMETER INTO DATA(z).
          out->write( z->get_text( ) ).
    ENDTRY.

    out->write( |Number of Vehicles: { zcl_13_airplane=>number_of_airplanes }| ).

**********************************************************************
* Ausgabe
**********************************************************************
    LOOP AT airplanes INTO airplane.
      out->write( |{ airplane->plane } { airplane->empty_weight_in_tons }| ).
    ENDLOOP.

  ENDMETHOD.
ENDCLASS.
