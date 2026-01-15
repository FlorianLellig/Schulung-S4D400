CLASS zcl_13_demo_07 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_13_demo_07 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

**********************************************************************
* Deklaration interner Tabellen
**********************************************************************
    DATA connections TYPE z13_connections. " TYPE [Tabellentyp]
    DATA connections2 TYPE TABLE OF z13_connection. "TYPE TABLE OF [Strukturtyp]

    DATA connection TYPE Z13_connection.

**********************************************************************
* Hinzufügen von Datensätzen
**********************************************************************
    connections = VALUE #(
      ( carrier_id = 'LH' connection_id = '0400' )
      ( carrier_id = 'UA' airport_from_id = 'FRA' )
      ( connection_id = '0401' airport_to_id = 'FRA' ) ).

    connection = VALUE #( carrier_id = 'AZ' connection_id = '0017' airport_from_id = 'BER' airport_to_id = 'ROM' ).

    connections = VALUE #( BASE connections ( connection ) ).
    APPEND connection TO connections.

**********************************************************************
* Lesen von Einzelsätzen
**********************************************************************

    TRY.
        connection = connections[ 3 ].    " per Index auf dritten Datensatz zugreifen
      CATCH cx_sy_itab_line_not_found.
    ENDTRY.

    IF line_exists( connections[ connection_id = '0400' ] ).
      connection = connections[ connection_id = '0400' ]. " per Schlüssel auf Datensatz zugreifen
    ENDIF.

**********************************************************************
* Lesen mehrerer Datensätze
**********************************************************************

    LOOP AT connections INTO connection WHERE carrier_id IS NOT INITIAL.  " LOOP AT connections INTO DATA(connection2)
      out->write( connection ).
      out->write( |{ sy-tabix } { connection-connection_id }| ).
    ENDLOOP.

**********************************************************************
* Ändern von Einzelsätze
**********************************************************************

    TRY.
        connections[ 1 ]-airport_from_id = 'FRA'.    " per Index auf dritten Datensatz zugreifen
      CATCH cx_sy_itab_line_not_found.
    ENDTRY.

    IF line_exists( connections[ connection_id = '0400' ] ).
      connections[ connection_id = '0400' ]-connection_id = '0402'. " per Schlüssel auf Datensatz zugreifen
    ENDIF.


**********************************************************************
* Sortieren, etc.
**********************************************************************

    SORT connections BY carrier_id DESCENDING connection_id ASCENDING.

**********************************************************************
* Löschen
**********************************************************************

    DELETE connections WHERE airport_from_id = 'FRA'.

**********************************************************************
* Ändern mehrerer Datensätze
**********************************************************************

    """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " Ändern per SY-TABIX
    """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    LOOP AT connections INTO connection.
      connection-airport_to_id = 'JFK'.
      connections[ sy-tabix ]-airport_to_id = 'JFK'.
    ENDLOOP.


    """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " Ändern per Datenreferenz
    """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    DATA connection2 TYPE REF TO Z13_Connection.
    LOOP AT connections REFERENCE INTO connection2.
      connection2->airport_from_id = 'BER'.
    ENDLOOP.


    """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " Ändern per Feldsymbol
    """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    FIELD-SYMBOLS <connection> TYPE Z13_Connection.
    LOOP AT connections ASSIGNING <connection>.
      <connection>-carrier_id = 'LH'.
    ENDLOOP.

    out->write( connections ).

**********************************************************************
* Anzahl Datensätze
**********************************************************************

    out->write( lines( connections ) ).


  endmethod.
ENDCLASS.
