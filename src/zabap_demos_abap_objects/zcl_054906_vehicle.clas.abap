CLASS zcl_054906_vehicle DEFINITION
  PUBLIC ABSTRACT
  CREATE PUBLIC.

  PUBLIC SECTION.
    TYPES ty_vehicles TYPE TABLE OF REF TO zcl_054906_vehicle WITH NON-UNIQUE DEFAULT KEY.

    METHODS constructor
      IMPORTING make  TYPE string
                model TYPE string.

    METHODS accelerate FINAL IMPORTING value_in_kmh TYPE i.

    METHODS brake FINAL IMPORTING value_in_kmh TYPE i
                  RAISING   zcx_054906_invalid_value.

    METHODS get_make         RETURNING VALUE(make)         TYPE string.
    METHODS get_model        RETURNING VALUE(model)        TYPE string.
    METHODS get_speed_in_kmh RETURNING VALUE(speed_in_kmh) TYPE i.

    METHODS to_string        ABSTRACT
      RETURNING VALUE(string) TYPE string.

    CLASS-METHODS get_vehicles
      RETURNING VALUE(result) TYPE ty_vehicles.

  PROTECTED SECTION.
    DATA speed_in_kmh TYPE i.

  PRIVATE SECTION.
    DATA make  TYPE string.
    DATA model TYPE string.

    CLASS-DATA vehicles TYPE ty_vehicles.
ENDCLASS.


CLASS zcl_054906_vehicle IMPLEMENTATION.
  METHOD accelerate.
    speed_in_kmh += value_in_kmh.
  ENDMETHOD.

  METHOD brake.
    IF value_in_kmh > speed_in_kmh.
      RAISE EXCEPTION NEW zcx_054906_invalid_value( value = value_in_kmh ).
    ENDIF.

    speed_in_kmh -= value_in_kmh.
  ENDMETHOD.

  METHOD get_make.
    make = me->make.
  ENDMETHOD.

  METHOD get_model.
    model = me->model.
  ENDMETHOD.

  METHOD constructor.
    me->make  = make.
    me->model = model.

    APPEND me TO vehicles.
  ENDMETHOD.

  METHOD get_speed_in_kmh.
    speed_in_kmh = me->speed_in_kmh.
  ENDMETHOD.

  METHOD get_vehicles.
    result = vehicles.
  ENDMETHOD.
ENDCLASS.
