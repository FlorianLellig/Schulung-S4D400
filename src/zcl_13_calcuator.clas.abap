CLASS zcl_13_calcuator DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    CLASS-METHODS divide

      IMPORTING
        operand1 TYPE Z13_DECIMAL
        operand2 TYPE Z13_DECIMAL

      RETURNING VALUE(result) TYPE Z13_DECIMAL
      RAISING cx_sy_zerodivide.


    CLASS-METHODS CALCULATE_PERCENTAGE

      IMPORTING
        PERCENTAGE TYPE Z13_decimal
        BASE TYPE Z13_decimal

      RETURNING VALUE(PERCENTAGE_VALUE) TYPE Z13_DECIMAL.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_13_calcuator IMPLEMENTATION.

  METHOD divide.

    IF operand2 is INITIAL.
      RAISE EXCEPTION TYPE cx_sy_zerodivide.
   ENDIF.
    result = operand1 / operand2.

  ENDMETHOD.

**********************************************************************

  METHOD calculate_percentage.

    percentage_value = ( percentage / 100 ) * base.

  ENDMETHOD.

ENDCLASS.
