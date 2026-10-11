CLASS zcl_054906_truck DEFINITION
  PUBLIC
  INHERITING FROM zcl_054906_vehicle FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    TYPES ty_transformed TYPE c LENGTH 1.

    INTERFACES zif_054906_transformer.

    METHODS constructor
      IMPORTING make        TYPE string
                model       TYPE string
                transformed TYPE ty_transformed.

    METHODS transform.
    METHODS is_transformed RETURNING VALUE(result) TYPE ty_transformed.
    METHODS to_string REDEFINITION.

  PROTECTED SECTION.

  PRIVATE SECTION.
    DATA transformed TYPE c LENGTH 1.

ENDCLASS.


CLASS zcl_054906_truck IMPLEMENTATION.
  METHOD transform.
    IF transformed = abap_true.
      transformed = abap_false.
    ELSE.
      transformed = abap_true.
    ENDIF.
  ENDMETHOD.

  METHOD is_transformed.
    result = transformed.
  ENDMETHOD.

  METHOD constructor.
    super->constructor( make  = make
                        model = model ).

    me->transformed = transformed.
  ENDMETHOD.

  METHOD to_string.
    DATA(transformed_text) = COND string( WHEN transformed = abap_true
                                          THEN 'Autobot'
                                          ELSE 'Truck' ).
    string = |{ get_make( ) } { get_model( ) } ({ speed_in_kmh }kmh): { transformed_text }|.
  ENDMETHOD.

  METHOD zif_054906_transformer~is_transformed.
    result = is_transformed( ).
  ENDMETHOD.

  METHOD zif_054906_transformer~transform.
    transform( ).
  ENDMETHOD.
ENDCLASS.
