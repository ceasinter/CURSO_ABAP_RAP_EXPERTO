@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'DD Projection/Consumption Booking Suppl'
@Metadata.ignorePropagatedAnnotations: true
define view entity zc_bksuppl_ceas
  as projection on zr_bksuppl_ceas
{
  key BooksupplUUID,
      TravelUUID,
      BookingUUID,
      BookingSupplementID,
      SupplementID,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      Price,
      CurrencyCode,

      @Semantics.systemDateTime.localInstanceLastChangedAt: true
      LocalLastChangedAt,
      _Booking: redirected to parent zc_book_ceas
}
