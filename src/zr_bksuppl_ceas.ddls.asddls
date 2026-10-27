@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'DD Root Booking Supplement'
@Metadata.ignorePropagatedAnnotations: true
define view entity zr_bksuppl_ceas
  as select from zbksuppl_ceas_a
  //  ASOCIACIÓN DE LA TABLA HIJA A LA TABLA PADRE
  association        to parent zr_book_ceas   as _Booking        on $projection.BookingUUID = _Booking.BookingUUID

  //  ASOCIACIÓN DE LA TABLA NIETO A LA TABLA ABUELO
  association [1..1] to zr_travel_ceas        as _Travel         on $projection.TravelUUID = _Travel.TravelUUID

  //  ASOCIACIÓNA A TABLA SUPPLEMENT
  association [1..1] to /DMO/I_Supplement     as _Supplement     on $projection.SupplementID = _Supplement.SupplementID
  association [1..*] to /DMO/I_SupplementText as _SupplementText on $projection.SupplementID = _SupplementText.SupplementID



{
  key booksuppl_uuid        as BooksupplUUID,
      root_uuid             as TravelUUID,
      parent_uuid           as BookingUUID,
      booking_supplement_id as BookingSupplementID,
      supplement_id         as SupplementID,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      price                 as Price,
      currency_code         as CurrencyCode,

      // Total Etag
      @Semantics.systemDateTime.localInstanceLastChangedAt: true
      local_last_changed_at as LocalLastChangedAt,

      // ASSOCIATIONS
      _Booking,
      _Travel,
      _Supplement,
      _SupplementText
}
