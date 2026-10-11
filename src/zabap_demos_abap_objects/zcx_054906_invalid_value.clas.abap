CLASS zcx_054906_invalid_value DEFINITION
  PUBLIC
  INHERITING FROM cx_static_check FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_t100_message.
    INTERFACES if_t100_dyn_msg.

    DATA value TYPE i.

    CONSTANTS:
      BEGIN OF co_invalid_value,
        msgid TYPE symsgid      VALUE 'Z054906_VEHICLE',
        msgno TYPE symsgno      VALUE '001',
        attr1 TYPE scx_attrname VALUE 'VALUE',
        attr2 TYPE scx_attrname VALUE '',
        attr3 TYPE scx_attrname VALUE '',
        attr4 TYPE scx_attrname VALUE '',
      END OF co_invalid_value.

    METHODS constructor
      IMPORTING textid    LIKE if_t100_message=>t100key OPTIONAL
                !previous LIKE previous                 OPTIONAL
                !value    TYPE i.

  PROTECTED SECTION.

  PRIVATE SECTION.

ENDCLASS.


CLASS zcx_054906_invalid_value IMPLEMENTATION.
  METHOD constructor ##ADT_SUPPRESS_GENERATION.
    " TODO: parameter TEXTID is never used (ABAP cleaner)

    super->constructor( previous = previous ).
    me->value = value.
    if_t100_message~t100key = co_invalid_value.
  ENDMETHOD.
ENDCLASS.
