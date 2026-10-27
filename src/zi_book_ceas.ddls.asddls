@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'DD Interface Booking'
@Metadata.ignorePropagatedAnnotations: true
define view entity zi_book_ceas
  as projection on zr_book_ceas
{
  key BookingUUID,
      TravelUUID,
      BookingID,
      BookingDate,
      CustomerID,
      CarrierID,
      ConnectionID,
      FlightDate,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      FlightPrice,
      CurrencyCode,
      BookingStatus,

      // Total ETag
      @Semantics.systemDateTime.localInstanceLastChangedAt: true
      LocalLastChangedAt,


      //      ASOCIACIONES
      _Travel            : redirected to parent zi_travel_ceas,
      _BookingSupplement : redirected to composition child zi_bksuppl_ceas,
      _Customer,
      _Carrier,
      _Connection,
      _BookingStatus

}
