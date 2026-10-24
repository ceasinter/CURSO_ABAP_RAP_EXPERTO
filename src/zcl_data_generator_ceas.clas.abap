CLASS zcl_data_generator_ceas DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_data_generator_ceas IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

*    AGREGAR REGISTROS EN LA TABLA ZTRAVEL_CEAS_A
    DELETE FROM ztravel_ceas_a.
    INSERT ztravel_ceas_a FROM (
      SELECT FROM /dmo/travel FIELDS
      " client
      uuid( ) AS travel_uuid,
      travel_id,
      agency_id,
      customer_id,
      begin_date,
      end_date,
      booking_fee,
      total_price,
      currency_code,
      description,
      CASE status WHEN 'B' THEN 'A'
      WHEN 'P' THEN 'O'
      WHEN 'N' THEN 'O'
      ELSE 'X' END AS overall_status,
      createdby AS local_created_by,
      createdat AS local_created_at,
      lastchangedby AS local_last_changed_by,
      lastchangedat AS local_last_changed_at,
      lastchangedat AS last_changed_at
    ).
    out->write( |--> Travel: inserted { sy-dbcnt } rows| ).

*   AGREGAR REGISTROS EN LA TABLA ZBOOK_CEAS_A
    DELETE FROM zbook_ceas_a.
    INSERT zbook_ceas_a FROM (
        SELECT FROM /dmo/booking
        JOIN ztravel_ceas_a ON /dmo/booking~travel_id = ztravel_ceas_a~travel_id
        JOIN /dmo/travel ON /dmo/travel~travel_id = /dmo/booking~travel_id
        FIELDS "client,
        uuid(  ) AS booking_uuid,
        ztravel_ceas_a~travel_uuid AS parent_uuid,
        /dmo/booking~booking_id,
        /dmo/booking~booking_date,
        /dmo/booking~customer_id,
        /dmo/booking~carrier_id,
        /dmo/booking~connection_id,
        /dmo/booking~flight_date,
        /dmo/booking~flight_price,
        /dmo/booking~currency_code,
        CASE /dmo/travel~status WHEN 'P' THEN 'N'
                                ELSE /dmo/travel~status END AS booking_status,
        ztravel_ceas_a~last_changed_at AS local_last_changed_at
    ).

    out->write( |--> Bookings: Inserted { sy-dbcnt } rows| ).


*    AGREGAR REGISTROS ENLA TABLA ZBKSUPPL_CEAS_A
    DELETE FROM zbksuppl_ceas_a.
    INSERT zbksuppl_ceas_a FROM (
        SELECT FROM /dmo/book_suppl AS supp
        JOIN ztravel_ceas_a AS trvl ON trvl~travel_id = supp~travel_id
        JOIN zbook_ceas_a AS book ON book~parent_uuid = trvl~travel_uuid
        AND book~booking_id = supp~booking_id
        FIELDS
        "client
        uuid(  ) AS booksuppl_uuid,
        trvl~travel_uuid AS root_uuid,
        book~booking_uuid AS parent_uuid,
        supp~booking_supplement_id,
        supp~supplement_id,
        supp~price,
        supp~currency_code,
        trvl~last_changed_at AS local_last_changed_at
    ).

    out->write( |--> Supplements: Inserted { sy-dbcnt } rows| ).
  ENDMETHOD.
ENDCLASS.
