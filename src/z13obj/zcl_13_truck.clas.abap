CLASS zcl_13_truck DEFINITION
  PUBLIC
  INHERITING FROM zcl_13_vehicle
  CREATE PUBLIC .

  PUBLIC SECTION.
    DATA cargo_in_tons TYPE i.
    DATA is_transformed TYPE c LENGTH 1 READ-ONLY.

    METHODS constructor
      IMPORTING
        make          TYPE string
        model         TYPE String
        cargo_in_tons TYPE i.

    METHODS to_string REDEFINITION.

    METHODS transform.


  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_13_truck IMPLEMENTATION.


  METHOD constructor.

    super->constructor( make = make model = model ).
    me->cargo_in_tons = cargo_in_tons.

  ENDMETHOD.


  METHOD to_string.

    string = |Ich bin ein { cond #( WHEN is_transformed = 'X' THEN 'Autobot' ELSE 'LKW' ) }|.

  ENDMETHOD.


  METHOD transform.

    IF me->is_transformed = 'X'.
      me->is_transformed = ''.
    ELSE.
      me->is_transformed = 'X'.
    ENDIF.


  ENDMETHOD.

ENDCLASS.
