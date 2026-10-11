CLASS zcl_054906_demo_07 DEFINITION
  PUBLIC FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
ENDCLASS.


CLASS zcl_054906_demo_07 IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    DATA carrier_id    TYPE /dmo/carrier_id    VALUE 'LH'.
    DATA connection_id TYPE /dmo/connection_id VALUE '0400'.
    DATA connection    TYPE z054906_connection.
    DATA connections   TYPE TABLE OF z054906_connection WITH NON-UNIQUE DEFAULT KEY.
    DATA flight        TYPE /dmo/flight.

    " Read Single Row
    " ---------------
    SELECT SINGLE FROM /dmo/connection
      FIELDS carrier_id, connection_id, airport_from_id, airport_to_id
      WHERE carrier_id = @carrier_id AND connection_id = @connection_id
      INTO @connection.
    IF sy-subrc <> 0.
      out->write( |No Data Found| ).
    ENDIF.
    out->write( connection ).

    " Read Multiple Rows
    " ------------------
    SELECT FROM /dmo/connection
      FIELDS carrier_id, connection_id, airport_from_id, airport_to_id
      WHERE carrier_id = @carrier_id
      INTO TABLE @connections.
    IF sy-subrc <> 0.
      out->write( |No Data Found| ).
    ENDIF.
    out->write( connections ).

    " Declare Target
    " --------------
    " Alternative A: Use of a suitable structure
    CLEAR connections.
    SELECT FROM /dmo/connection
      FIELDS carrier_id, connection_id, airport_from_id, airport_to_id
      WHERE carrier_id = @carrier_id
      INTO TABLE @connections.
    IF sy-subrc <> 0.
      out->write( |No Data Found| ).
    ENDIF.
    out->write( connections ).

    " Alternative B: Copying only components with same name
    CLEAR connections.
    SELECT FROM /dmo/connection
      FIELDS *
      WHERE carrier_id = 'LH'
      INTO CORRESPONDING FIELDS OF TABLE @connections.
    IF sy-subrc <> 0.
      out->write( |No Data Found| ).
    ENDIF.
    out->write( connections ).

    " CUD Operations
    " --------------
    flight-client        = sy-mandt.
    flight-carrier_id    = 'DA'.
    flight-connection_id = '1234'.
    flight-flight_date   = cl_abap_context_info=>get_system_date( ).

    INSERT /dmo/flight FROM @flight.
    IF sy-subrc <> 0.
      out->write( |Duplicate Data Found| ).
    ENDIF.

    flight-price         = 500.
    flight-currency_code = 'EUR'.
    UPDATE /dmo/flight FROM @flight.
    IF sy-subrc <> 0.
      out->write( |No Data Found| ).
    ENDIF.

    DELETE /dmo/flight FROM @flight.
    IF sy-subrc <> 0.
      out->write( |No Data Found| ).
    ENDIF.
  ENDMETHOD.
ENDCLASS.
