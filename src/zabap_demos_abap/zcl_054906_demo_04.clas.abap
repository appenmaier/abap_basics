CLASS zcl_054906_demo_04 DEFINITION
  PUBLIC FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
ENDCLASS.


CLASS zcl_054906_demo_04 IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    " Head Controlled Loop
    " --------------------
    WHILE sy-index <= 10.
      out->write( sy-index ).
    ENDWHILE.
    out->write( |\n| ).

    " Index Loop
    " ----------
    DO 10 TIMES.
      out->write( sy-index ).
    ENDDO.
    out->write( |\n| ).

    " Infinite Loop
    " -------------
    DO.
      IF sy-index = 11.
        EXIT.
      ENDIF.
      out->write( sy-index ).
    ENDDO.
    out->write( |\n| ).

    " Random Number Generator
    " -----------------------
    DATA(generator) = cl_abap_random_int=>create( seed = CONV i( cl_abap_context_info=>get_system_time( ) )
                                                  min  = 1
                                                  max  = 100 ).
    DO.
      DATA(random_number) = generator->get_next( ).
      out->write( random_number ).
      IF random_number = 50.
        EXIT.
      ENDIF.
    ENDDO.
  ENDMETHOD.
ENDCLASS.
