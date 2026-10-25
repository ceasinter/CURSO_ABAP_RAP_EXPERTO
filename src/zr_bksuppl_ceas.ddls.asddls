@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'DD Root Booking Supplement'
@Metadata.ignorePropagatedAnnotations: true
define view entity zr_bksuppl_ceas
  as select from zbksuppl_ceas_a
  association to parent zr_book_ceas  as _Booking on $projection.BookingUUID = _Booking.BookingUUID
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
      _Booking
}
