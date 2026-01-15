CLASS zcl_13_abap_03 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_13_abap_03 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

**********************************************************************
* Festlegen von Variablen
**********************************************************************

    DATA operandOne    TYPE Z13_DECIMAL VALUE '50'.
    DATA operandTwo    TYPE Z13_DECIMAL VALUE '200'.
    DATA operandResult TYPE Z13_DECIMAL.
    DATA operator      TYPE c LENGTH 2  VALUE '**'.

**********************************************************************
* Fallunterscheidung
**********************************************************************

    IF operator = '+'.
      operandResult = operandOne + operandTwo.
    ELSEIF operator = '-'.
      operandResult = operandOne - operandTwo.
    ELSEIF operator = '*'.
      operandResult = operandOne * operandTwo.
    ELSEIF operator = '/'.
      operandResult = operandOne / operandTwo.
    ELSEIF operator = '%'.
      operandResult = zcl_13_calcuator=>CALCULATE_PERCENTAGE( percentage = operandOne base = operandTwo ).
    ELSEIF operator = '**'.
      TRY.
        operandResult = zcl_abap_calculator=>calculate_power( base = operandOne exponent = CONV i( operandTwo ) ).
      CATCH zcx_abap_exponent_too_high INTO DATA(x).
        out->write( x->get_text( ) ).
    ENDTRY.
    ENDIF.

**********************************************************************
* Ausgabe
**********************************************************************

    out->write( |{ operandOne NUMBER = USER } { operator } { operandTwo NUMBER = USER } = { operandResult NUMBER = USER }| ).

  ENDMETHOD.


ENDCLASS.
