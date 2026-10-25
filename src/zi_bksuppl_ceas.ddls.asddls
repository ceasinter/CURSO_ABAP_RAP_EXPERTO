@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'DD Interface Booking Supplement'
@Metadata.ignorePropagatedAnnotations: true
define view entity zi_bksuppl_ceas
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

      _Booking : redirected to parent zi_book_ceas

}
