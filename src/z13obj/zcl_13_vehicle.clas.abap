CLASS zcl_13_vehicle DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    Methods constructor IMPORTING make TYPE string
                                  model TYPE String.

    METHODS:
      set_speed_in_kmh  IMPORTING speed_in_kmh        TYPE i.

    METHODS accelerate IMPORTING value TYPE i RAISING zcx_13_value_too_high.
    METHODS brake IMPORTING value TYPE i RAISING zcx_13_value_too_high.


    DATA make TYPE string READ-ONLY.
    DATA model TYPE string READ-ONLY.
    DATA speed_in_kmh TYPE i READ-ONLY.

    CLASS-DATA number_of_vehicles TYPE i.

  PROTECTED SECTION.
  PRIVATE SECTION.

ENDCLASS.



CLASS zcl_13_vehicle IMPLEMENTATION.


**********************************************************************
**********************************************************************

  METHOD constructor.

    me->make = make.
    me->model = model.

    number_of_vehicles = number_of_vehicles + 1.

  ENDMETHOD.

**********************************************************************
**********************************************************************

  METHOD set_speed_in_kmh.

    me->speed_in_kmh = speed_in_kmh.

  ENDMETHOD.

  METHOD accelerate.

    IF speed_in_kmh + value > 300.
      RAISE EXCEPTION NEW zcx_13_value_too_high( value = value ).
    ENDIF.

    speed_in_kmh = speed_in_kmh + value.

  ENDMETHOD.

  METHOD brake.

    IF value > speed_in_kmh.
      RAISE EXCEPTION NEW zcx_13_value_too_high( value = value ).
    ENDIF.
    speed_in_kmh = speed_in_kmh - value.

  ENDMETHOD.


ENDCLASS.
