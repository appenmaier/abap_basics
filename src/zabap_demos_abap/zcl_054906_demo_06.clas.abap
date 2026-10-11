CLASS zcl_054906_demo_06 DEFINITION
  PUBLIC FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
ENDCLASS.


CLASS zcl_054906_demo_06 IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    DATA connections  TYPE z054906_connections.
    DATA connections2 TYPE TABLE OF z054906_connection WITH NON-UNIQUE DEFAULT KEY.
    DATA connection   TYPE z054906_connection.
    DATA airline_ids  TYPE TABLE OF /dmo/carrier_id WITH NON-UNIQUE DEFAULT KEY.

    " Fill Internal Table
    " -------------------
    connections = VALUE #( ( carrier_id = 'LH' connection_id = '0400' )
                           ( carrier_id = 'AA' airport_to_id = 'HAV' connection_id = '0017' airport_from_id = 'MIA' )
                           ( carrier_id = 'LH' connection_id = '0401' airport_from_id = 'JFK' airport_to_id = 'FRA' ) ).

    " Copy Internal Tables
    " --------------------
    APPEND LINES OF connections TO connections2.

    " Add Rows
    " --------
    connection-carrier_id      = 'UA'.
    connection-connection_id   = '1537'.
    connection-airport_from_id = 'EWR'.
    connection-airport_to_id   = 'MIA'.

    " Alternative A: Use of operator VALUE
    connections = VALUE #( BASE connections
                           ( )
                           ( connection ) ).

    " Alternative B: Use of keyword APPEND
    APPEND connection TO connections.

    " Read Single Row
    " ---------------
    " Alternative A: Use of table expression with index
    connection = connections[ 1 ].

    " Alternative B: Use of table expression with key components
    connection = connections[ carrier_id    = 'UA'
                              connection_id = '1537' ].

    " Read Multiple Rows
    " ------------------
    LOOP AT connections INTO connection WHERE carrier_id = 'UA'.
      out->write( |{ sy-tabix } { connection-airport_from_id } { connection-airport_to_id }| ).
    ENDLOOP.

    " Update Single Row
    " -----------------
    " Alternative A: Use of table expression with index
    connections[ 1 ]-airport_from_id = 'FRA'.
    connections[ 1 ]-airport_to_id = 'JFK'.

    " Alternative B: Use of table expression with key components
    connections[ carrier_id = '' ]-carrier_id = 'UA'.
    connections[ connection_id = '' ]-connection_id = '0058'.

    " Update Multiple Rows
    " --------------------
    " Alternative A: Use of data reference
    LOOP AT connections REFERENCE INTO DATA(r_connection) WHERE airport_to_id = 'FRA'.
      r_connection->airport_from_id = 'MUC'.
    ENDLOOP.

    " Alternative B: Use of field symbol
    LOOP AT connections ASSIGNING FIELD-SYMBOL(<connection>) WHERE airport_to_id = 'MUC'.
      <connection>-airport_from_id = 'BER'.
    ENDLOOP.

    " Sort Internal Table
    " -------------------
    SORT connections BY carrier_id DESCENDING
                        connection_id ASCENDING
                        airport_to_id DESCENDING.

    " Delete Single Row
    " -----------------
    DELETE connections INDEX 2.

    " Delete Multiple Rows
    " --------------------
    DELETE connections WHERE airport_to_id IS INITIAL.

    " Error Handling for Table Expressions
    " ------------------------------------
    " Alterantive A: Use of keyword TRY
    TRY.
        out->write( connections[ 10 ] ).
      CATCH cx_sy_itab_line_not_found.
        " do nothing
    ENDTRY.

    " Alternative B: Use of built-in function LINE_EXISTS
    IF line_exists( connections[ 10 ] ).
      out->write( connections[ 10 ] ).
    ENDIF.

    " Get Size of Internal Tables
    " ---------------------------
    DATA(lines) = lines( connections ).
    out->write( lines ).

    " Lists | One Column Table
    " ------------------------
    DATA(text) = 'LH,UA,AA,SQ'.
    SPLIT text AT ',' INTO TABLE airline_ids.
    out->write( airline_ids[ table_line = 'UA' ] ).
  ENDMETHOD.
ENDCLASS.
