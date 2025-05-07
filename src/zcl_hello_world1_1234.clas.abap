CLASS zcl_hello_world1_1234 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_hello_world1_1234 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
**  Using Literal
*  out->write( |Hello World| ).

**Let's enhance the current output with the user alias by using embedded expression.
out->write( |Hello world! ({ cl_abap_context_info=>get_system_date(  ) })| ).

  ENDMETHOD.
ENDCLASS.
