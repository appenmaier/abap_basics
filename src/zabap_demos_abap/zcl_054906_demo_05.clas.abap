CLASS zcl_054906_demo_05 DEFINITION
  PUBLIC FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
ENDCLASS.


CLASS zcl_054906_demo_05 IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    TYPES: BEGIN OF ty_flight,
             carrier_id    TYPE /dmo/carrier_id,
             connection_id TYPE /dmo/connection_id,
             flight_date   TYPE /dmo/flight_date,
           END OF ty_flight.

    TYPES: BEGIN OF        ty_flight_with_connection,
             carrier_id      TYPE /dmo/carrier_id,
             connection_id   TYPE /dmo/connection_id,
             flight_date     TYPE /dmo/flight_date,
             airport_from_id TYPE /dmo/airport_from_id,
             airport_to_id   TYPE /dmo/airport_to_id,
           END OF ty_flight_with_connection.

    DATA connection             TYPE z054906_connection.
    DATA flight                 TYPE ty_flight.
    DATA flight_with_connection TYPE ty_flight_with_connection.

    " Access Structure Components
    " ---------------------------
    connection-carrier_id      = 'LH'.
    connection-connection_id   = '0400'.
    connection-airport_from_id = 'FRA'.
    connection-airport_to_id   = 'JFK'.

    flight-carrier_id    = 'LH'.
    flight-connection_id = '0400'.
    flight-flight_date   = cl_abap_context_info=>get_system_date( ).

    " Copy Structure Components
    " -------------------------
    " Variante A: Copying every component directly
    flight_with_connection-carrier_id      = connection-carrier_id.
    flight_with_connection-connection_id   = connection-connection_id.
    flight_with_connection-airport_from_id = connection-airport_from_id.
    flight_with_connection-airport_to_id   = connection-airport_to_id.
    flight_with_connection-flight_date     = flight-flight_date.
    out->write( flight_with_connection ).

    " Variante B: Copying only components with same name
    CLEAR flight_with_connection.
    flight_with_connection = CORRESPONDING #( connection ).
    flight_with_connection = CORRESPONDING #( BASE ( flight_with_connection ) flight ).
    out->write( flight_with_connection ).
  ENDMETHOD.
ENDCLASS.
