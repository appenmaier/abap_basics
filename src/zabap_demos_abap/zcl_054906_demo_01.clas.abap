CLASS zcl_054906_demo_01 DEFINITION
  PUBLIC FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
ENDCLASS.


CLASS zcl_054906_demo_01 IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    " Define Local Types
    " ------------------
    TYPES ty_c_50 TYPE c LENGTH 50.

    " Declare Constants
    " -----------------
    CONSTANTS co_pi TYPE p LENGTH 2 DECIMALS 2 VALUE '3.14'.

    " Declare Data Objects
    " --------------------
    " Alternative A: Use of predefinded types
    DATA size_in_m     TYPE p LENGTH 16 DECIMALS 2.
    DATA user_id       TYPE n LENGTH 6.
    DATA birthday      TYPE d.
    DATA time_of_birth TYPE t.

    " Alternative B: Use of local type definitions
    DATA male      TYPE abap_bool.
    DATA full_name TYPE ty_c_50.
    DATA address   TYPE ty_c_50.

    " Alternative C: Use of data elements
    DATA first_name TYPE /dmo/first_name.
    DATA last_name  TYPE /dmo/last_name.

    " Alternative D: Use of inline declaration
    DATA(hobbies) = 'Gaming, Movies, Calistehnics'.

    " Assign Values
    " -------------
    " Alternative A: Use of assignment operator
    size_in_m = '1.79'.
    male = abap_true.
    first_name = 'Daniel'.
    last_name = 'Appenmaier'.
    user_id = '054906'.
    birthday = '19820104'.
    time_of_birth = '043144'.
    full_name = first_name && ` ` && last_name.
    address = 'Lindenweg 7, Schlier'.

    " Alternative B: Use of keyword VALUE
    DATA age TYPE i VALUE 44.

    " Initialize Data Objects
    " -----------------------
    CLEAR size_in_m.

    " Systemfields
    " ------------
    out->write( |Client: { sy-mandt }| ).
    out->write( |User Name: { sy-uname }| ).
    out->write( |System Language: { sy-langu }| ).

    " Output
    " ------
    out->write( |First Name: { first_name }| ).
    out->write( |Last Name: { last_name }| ).
    out->write( |Full Name: { full_name }| ).
    out->write( |User ID: { user_id }| ).
    out->write( |Male: { male }| ).
    out->write( |Size in Meters: { size_in_m NUMBER = USER }| ).
    out->write( |Birthday: { birthday DATE = USER }| ).
    out->write( |Time of Birth: { time_of_birth TIME = USER }| ).
    out->write( |Age: { age }| ).
    out->write( |Address: { address }| ).
    out->write( |Hobbies: { hobbies }| ).
    out->write( |PI: { co_pi }| ).
  ENDMETHOD.
ENDCLASS.
