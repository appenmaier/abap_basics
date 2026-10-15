CLASS zcl_054906_main_cds DEFINITION
  PUBLIC FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
ENDCLASS.


CLASS zcl_054906_main_cds IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    DATA customers TYPE TABLE OF /dmo/customer.

    " ABAP CDS
    SELECT FROM /DMO/I_Flight_R
      FIELDS *
      WHERE AirlineID = 'LH'
      INTO TABLE @DATA(flights).
    IF sy-subrc <> 0.
      " error handling
    ENDIF.

    out->write( flights ).

    " Views with Parameters
    SELECT
      FROM Z054906_Demo08( P_CarrierId = 'LH' )
      FIELDS *
      INTO TABLE @DATA(flights2).
    IF sy-subrc <> 0.
      " error handling
    ENDIF.

    out->write( flights2 ).

    " Path Expressions
    SELECT FROM Z054906_Demo09
      FIELDS CarrierId,
             ConnectionId,
             \_Carrier-name AS CarrierName
      WHERE CarrierId = 'LH'
      INTO TABLE @DATA(connections).
    IF sy-subrc <> 0.
      " error handling
    ENDIF.

    out->write( connections ).

    " Access Controls
    SELECT FROM /dmo/customer
      FIELDS *
      INTO @DATA(customer).

      AUTHORITY-CHECK OBJECT '/DMO/TRVL'
                      ID '/DMO/CNTRY' FIELD customer-country_code
                      ID 'ACTVT' FIELD '03'.
      IF sy-subrc = 0.
        APPEND customer TO customers.
      ENDIF.

    ENDSELECT.

    out->write( customers ).
  ENDMETHOD.
ENDCLASS.
