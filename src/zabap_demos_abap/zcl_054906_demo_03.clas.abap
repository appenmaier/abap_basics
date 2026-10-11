CLASS zcl_054906_demo_03 DEFINITION
  PUBLIC FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
ENDCLASS.


CLASS zcl_054906_demo_03 IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    DATA age        TYPE i          VALUE 44.
    DATA gender     TYPE c LENGTH 1 VALUE 'M'.
    DATA salutation TYPE string.
    DATA last_name  TYPE string     VALUE 'Appenmaier'.
    DATA first_name TYPE string     VALUE 'Daniel'.

    " Branches
    " --------
    " Comparison Operators: <, >, <=, >=, =, <>
    " Logical Operators: AND, OR, NOT

    " Alternative A: Use of keyword IF
    IF age >= 18 AND ( gender = 'M' OR gender = 'm' ).
      salutation = |Mister { last_name }|.
    ELSEIF age >= 18 AND ( gender = 'W' OR gender = 'w' ).
      salutation = |Miss { last_name }|.
    ELSE.
      salutation = first_name.
    ENDIF.

    out->write( |Hello { salutation }| ).

    " Alternative B: Use of operator COND
    salutation = COND string( WHEN age >= 18 AND ( gender = 'M' OR gender = 'm' ) THEN |Mister { last_name }|
                              WHEN age >= 18 AND ( gender = 'W' OR gender = 'w' ) THEN |Miss { last_name }|
                              ELSE                                                     first_name ).
    out->write( |Hello { salutation }| ).

    " Special Operators
    IF salutation IS NOT INITIAL.
      out->write( |Hello { salutation }| ).
    ENDIF.

    " Cases
    " -----
    " Alternative A: Use of keyword CASE
    CASE gender.
      WHEN 'M' OR 'm'.
        salutation = |Mister { last_name }|.
      WHEN 'W' OR 'w'.
        salutation = |Miss { last_name }|.
      WHEN OTHERS.
        salutation = |{ first_name }|.
    ENDCASE.
    out->write( |Hello { salutation }| ).

    " Alternative B: Use of operator SWITCH
    salutation = |{ SWITCH string( gender
                                   WHEN 'M' OR 'm' THEN |Mister { last_name }|
                                   WHEN 'W' OR 'w' THEN |Miss { last_name }|
                                   ELSE                 first_name ) }|.
    out->write( |Hello { salutation }| ).
  ENDMETHOD.
ENDCLASS.
