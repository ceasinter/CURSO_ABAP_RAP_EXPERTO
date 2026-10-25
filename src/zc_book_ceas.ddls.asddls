@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'DD Projection/Consumption Booking'
@Metadata.ignorePropagatedAnnotations: true
define view entity zc_book_ceas
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

      @Semantics.systemDateTime.localInstanceLastChangedAt: true
      LocalLastChangedAt,
      
      _Travel: redirected to parent zc_travel_ceas,
      _BookingSupplement: redirected to composition child zc_bksuppl_ceas
}
