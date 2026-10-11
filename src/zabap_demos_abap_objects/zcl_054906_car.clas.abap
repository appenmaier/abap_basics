CLASS zcl_054906_car DEFINITION
  PUBLIC
  INHERITING FROM zcl_054906_vehicle FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    METHODS constructor
      IMPORTING make       TYPE string
                model      TYPE string
                body_style TYPE string.

    METHODS do_a_turbo_boost.
    METHODS get_body_style RETURNING VALUE(result) TYPE string.
    METHODS to_string REDEFINITION.

  PROTECTED SECTION.

  PRIVATE SECTION.
    DATA body_style TYPE string.
ENDCLASS.


CLASS zcl_054906_car IMPLEMENTATION.
  METHOD do_a_turbo_boost.
    speed_in_kmh += 50.
  ENDMETHOD.

  METHOD to_string.
    string = |{ get_make( ) } { get_model( ) } ({ body_style }): { speed_in_kmh }kmh|.
  ENDMETHOD.

  METHOD constructor.
    super->constructor( make  = make
                        model = model ).
    me->body_style = body_style.
  ENDMETHOD.

  METHOD get_body_style.
    result = body_style.
  ENDMETHOD.
ENDCLASS.
