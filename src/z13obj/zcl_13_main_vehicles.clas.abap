CLASS zcl_13_main_vehicles DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_13_main_vehicles IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

**********************************************************************
* Deklarationen
**********************************************************************
    DATA vehicle TYPE REF TO zcl_13_vehicle.
    DATA vehicles TYPE TABLE OF REF TO zcl_13_vehicle.

**********************************************************************
* Instanziierungen
**********************************************************************

    out->write( |Number of Vehicles: { zcl_13_vehicle=>number_of_vehicles }| ).

    vehicle = NEW zcl_13_car( make = 'Porsche' model = '911' seats = 2 ).         " Upcast bzw. Widening-cast
    APPEND vehicle TO vehicles.

    vehicle = NEW zcl_13_truck( make = 'MAN' model = 'TGX' cargo_in_tons = '40' ).
    APPEND vehicle TO vehicles.

    vehicle = NEW zcl_13_car( make = 'Skoda' model = 'Superb Combi' seats = 5 ).
    APPEND vehicle TO vehicles.

    out->write( |Number of Vehicles: { zcl_13_vehicle=>number_of_vehicles }| ).

**********************************************************************
* Ausgabe
**********************************************************************
    LOOP AT vehicles INTO vehicle.
      TRY.
        vehicle->accelerate( 30 ).
        vehicle->brake( 30 ).
        vehicle->accelerate( 30 ).
        CATCH zcx_13_value_too_high INTO DATA(x).
          out->write( x->get_text( ) ).
      ENDTRY.
      out->write( vehicle->to_string( ) ).
    ENDLOOP.



  ENDMETHOD.
ENDCLASS.




