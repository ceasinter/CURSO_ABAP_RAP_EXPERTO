@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'DD Projection/Consumption Travel'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
@Search.searchable: true
@ObjectModel.semanticKey: [ 'TravelID' ]
define root view entity zc_travel_ceas
  //  provider contract transactional_interface
  as projection on zr_travel_ceas
{
  key TravelUUID,
      @Search.defaultSearchElement: true
      @Search.fuzzinessThreshold: 0.8
      TravelID,

      @Search.defaultSearchElement: true
      @Search.fuzzinessThreshold: 0.8
      @Consumption.valueHelpDefinition: [{ entity: {
                                           name: '/DMO/I_Agency_StdVH',
                                           element: 'AgencyID' }
                                         }]
      AgencyID,
      @Search.defaultSearchElement: true
      @Search.fuzzinessThreshold: 0.8
      @Consumption.valueHelpDefinition: [{ entity: {
                                           name: '/DMO/I_Customer_StdVH',
                                           element: 'CustomerID' }
                                         }]
      CustomerID,
      BeginDate,
      EndDate,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      BookingFee,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      TotalPrice,

      @Consumption.valueHelpDefinition: [{ entity: {
                                           name: 'I_CurrencyStdVH',
                                           element: 'Currency' }
                                         }]
      CurrencyCode,
      Description,

      @Consumption.valueHelpDefinition: [{ entity: {
                                           name: '/DMO/I_Overall_Status_VH',
                                           element: 'OverallStatus' }
                                         }]
      OverallStatus,

      @Semantics.user.localInstanceLastChangedBy: true
      LocalLastChangedAt,


      //      ASOCIACIONES
      _Booking : redirected to composition child zc_book_ceas,
      _Agency,
      _Customer,
      _OverallStatus,
      _Currency

}
