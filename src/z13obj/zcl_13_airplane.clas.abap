CLASS zcl_13_airplane DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    Methods constructor IMPORTING id TYPE string
                                  plane TYPE String
                                  empty_weight_in_tons TYPE i
                                  RAISING ZCX_ABAP_INITIAL_PARAMETER.

    DATA id TYPE string READ-ONLY.
    DATA plane TYPE string READ-ONLY.
    DATA empty_weight_in_tons TYPE i READ-ONLY.

    CLASS-DATA number_of_airplanes TYPE i READ-ONLY.

  PROTECTED SECTION.
  PRIVATE SECTION.

ENDCLASS.



CLASS zcl_13_airplane IMPLEMENTATION.

  METHOD constructor.

    IF id IS INITIAL.
      RAISE EXCEPTION NEW ZCX_ABAP_INITIAL_PARAMETER( id ).
    ENDIF.
    IF plane IS INITIAL.
      RAISE EXCEPTION NEW ZCX_ABAP_INITIAL_PARAMETER( plane ).
    ENDIF.
    IF empty_weight_in_tons IS INITIAL.
      RAISE EXCEPTION NEW ZCX_ABAP_INITIAL_PARAMETER( '0' ).
    ENDIF.
    me->id = id.
    me->plane = plane.
    me->empty_weight_in_tons = empty_weight_in_tons.

    number_of_airplanes = number_of_airplanes + 1.
  ENDMETHOD.

ENDCLASS.
