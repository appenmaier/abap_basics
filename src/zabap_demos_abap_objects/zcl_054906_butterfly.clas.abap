CLASS zcl_054906_butterfly DEFINITION
  PUBLIC FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES zif_054906_transformer.

    METHODS is_larve RETURNING VALUE(result) TYPE zif_054906_transformer=>ty_transformed.

  PRIVATE SECTION.
    DATA larve TYPE zif_054906_transformer=>ty_transformed.

ENDCLASS.


CLASS zcl_054906_butterfly IMPLEMENTATION.
  METHOD zif_054906_transformer~is_transformed.
    IF larve = abap_true.
      result = abap_false.
    ELSE.
      result = abap_true.
    ENDIF.
  ENDMETHOD.

  METHOD zif_054906_transformer~transform.
    larve = abap_false.
  ENDMETHOD.

  METHOD is_larve.
    result = larve.
  ENDMETHOD.
ENDCLASS.
