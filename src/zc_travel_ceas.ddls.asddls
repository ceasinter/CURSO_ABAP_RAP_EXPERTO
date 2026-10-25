@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'DD Projection/Consumption Travel'
@Metadata.ignorePropagatedAnnotations: true
define root view entity zc_travel_ceas
  provider contract transactional_interface
  as projection on zr_travel_ceas
{
  key TravelUUID,
      TravelID,
      AgencyID,
      CustomerID,
      BeginDate,
      EndDate,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      BookingFee,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      TotalPrice,
      CurrencyCode,
      Description,
      OverallStatus,

      //      LocalCreatedBy,
      //      LocalCreatedAt,
      //      LocalLastChangedBy,
      @Semantics.user.localInstanceLastChangedBy: true
      LocalLastChangedAt,
      
      _Booking: redirected to composition child zc_book_ceas

}
