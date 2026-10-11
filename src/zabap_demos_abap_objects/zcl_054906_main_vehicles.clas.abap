CLASS zcl_054906_main_vehicles DEFINITION
  PUBLIC FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
ENDCLASS.


CLASS zcl_054906_main_vehicles IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    DATA vehicle      TYPE REF TO zcl_054906_vehicle.
    DATA vehicles     TYPE TABLE OF REF TO zcl_054906_vehicle.
    DATA transformers TYPE TABLE OF REF TO zif_054906_transformer.
    DATA butterfly    TYPE REF TO zcl_054906_butterfly.
    DATA car          TYPE REF TO zcl_054906_car.
    DATA truck        TYPE REF TO zcl_054906_truck.

    " Vehicle 1
    vehicle = NEW zcl_054906_car( make       = 'BMW'
                                  model      = '1er'
                                  body_style = 'Saloon' ). " Upcast
    vehicle->accelerate( 50 ).
    vehicle->accelerate( 100 ).
    TRY.
        vehicle->brake( 200 ).
      CATCH zcx_054906_invalid_value INTO DATA(e).
        out->write( e->get_text( ) ).
    ENDTRY.
    APPEND vehicle TO vehicles.

    " Vehicle 2
    vehicle = NEW zcl_054906_car( make       = 'Audi'
                                  model      = 'A4'
                                  body_style = 'Saloon' ). " Upcast
    vehicle->accelerate( 90 ).
    APPEND vehicle TO vehicles.

    " Vehicle 3
    vehicle = NEW zcl_054906_truck( make        = 'MAN'
                                    model       = 'TGX'
                                    transformed = abap_false ). " Upcast
    APPEND vehicle TO vehicles.
    APPEND CAST #( vehicles[ 3 ] ) TO transformers.

    " Butterfly
    butterfly = NEW #( ).
    APPEND butterfly TO transformers.

    " Transformations
    LOOP AT transformers INTO DATA(transformer).
      transformer->transform( ).
    ENDLOOP.

    " Output
    LOOP AT vehicles INTO vehicle.
      IF vehicle IS INSTANCE OF zcl_054906_car.
        car = CAST #( vehicle ). " Downcast
        car->do_a_turbo_boost( ).
      ELSEIF vehicle IS INSTANCE OF zcl_054906_truck.
        truck = CAST #( vehicle ). " Downcast
        truck->transform( ).
      ENDIF.
      out->write( vehicle->to_string( ) ). " Polymorphism
    ENDLOOP.
  ENDMETHOD.
ENDCLASS.
