CLASS zcl_13_truck DEFINITION
  PUBLIC
  INHERITING FROM zcl_13_vehicle
  CREATE PUBLIC .

  PUBLIC SECTION.
    DATA cargo_in_tons TYPE i.

    methods constructor
      IMPORTING
        make TYPE string
        model TYPE String
        cargo_in_tons TYPE i.

    methods to_string REDEFINITION.


  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_13_truck IMPLEMENTATION.


  METHOD constructor.

    super->constructor( make = make model = model ).
    me->cargo_in_tons = cargo_in_tons.

  ENDMETHOD.


  METHOD to_string.

    string = |{ super->to_string( ) }, Frachtkapazität: { me->cargo_in_tons }t|.

  ENDMETHOD.

ENDCLASS.
