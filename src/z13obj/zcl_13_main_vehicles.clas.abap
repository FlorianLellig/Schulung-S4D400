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

    DATA rental TYPE REF TO zcl_13_rental.
    DATA carrier TYPE REF TO ZCL_13_carrier.
    DATA partners TYPE TABLE OF REF TO zif_13_partner.

    rental = new #(  ).
    carrier = new #( 'Lufthansa' ).

    append rental to partners. " Upcast
    APPEND carrier to partners. " Upcast

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
    DATA truck TYPE REF TO zcl_13_truck.

    LOOP AT vehicles INTO vehicle.
      TRY.
        vehicle->accelerate( 30 ).
        vehicle->brake( 30 ).
        vehicle->accelerate( 30 ).
        CATCH zcx_13_value_too_high INTO DATA(x).
          out->write( x->get_text( ) ).
      ENDTRY.

      IF vehicle IS INSTANCE OF zcl_13_truck.
        truck = CAST #( vehicle ).
        truck->transform(  ).
        out->write( |{ cond #( WHEN truck->is_transformed = 'X' THEN 'Der LKW hat sich in einen Autobot verwandelt.'
                                                                ELSE 'Der Autobot hat sich in einen LKW verwandlet.' ) } | ).
      ENDIF.

      out->write( vehicle->to_string( ) ).                 " Downcast bzw. Narrowing-cast --> (Dynamische) Polymorphie
    ENDLOOP.


    LOOP AT partners INTO DATA(partner).

      out->write( partner->to_string(  ) ). "Dynamische Polymorphie

      IF partner IS INSTANCE OF zcl_13_carrier.
        carrier = cast #( partner ). "Downcast
        out->write( carrier->get_biggest_cargo_plane(  ) ).
      ENDIF.

    ENDLOOP.


  ENDMETHOD.
ENDCLASS.




