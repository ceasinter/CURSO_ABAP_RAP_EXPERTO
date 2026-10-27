@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'DD Interface Travel'
@Metadata.ignorePropagatedAnnotations: true
define root view entity zi_travel_ceas
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

      @Semantics.user.createdBy: true
      LocalCreatedBy,

      @Semantics.systemDateTime.createdAt: true
      LocalCreatedAt,
      @Semantics.user.localInstanceLastChangedBy: true
      LocalLastChangedBy,

      // Total ETag
      @Semantics.systemDateTime.localInstanceLastChangedAt: true
      LocalLastChangedAt,
      @Semantics.systemDateTime.lastChangedAt: true
      LastChangedAt,

      // ASOCIACIONES
      _Booking : redirected to composition child zi_book_ceas,
      _Agency,
      _Customer,
      _OverallStatus,
      _Currency
}
