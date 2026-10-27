@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'DD Projection/Consumption Booking'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
@Search.searchable: true
@ObjectModel.semanticKey: [ 'BookingID' ]
define view entity zc_book_ceas
  as projection on zr_book_ceas
{
  key BookingUUID,
      TravelUUID,
      @Search.defaultSearchElement: true
      @Search.fuzzinessThreshold: 0.8
      BookingID,
      BookingDate,
      @Search.defaultSearchElement: true
      @Search.fuzzinessThreshold: 0.8
      @Consumption.valueHelpDefinition: [{ entity: {
                                           name: '/DMO/I_Customer_StdVH',
                                           element: 'CustomerID' }
                                         }]
      CustomerID,

      @Consumption.valueHelpDefinition: [{ entity: {
                                           name: '/DMO/I_Flight_StdVH',
                                           element: 'AirlineID' }
                                         }]
      CarrierID,

      @Consumption.valueHelpDefinition: [{ entity: {
                                           name: '/DMO/I_Flight_StdVH',
                                           element: 'ConnectionID' }
                                         }]
      ConnectionID,

      @Consumption.valueHelpDefinition: [{ entity: {
                                           name: '/DMO/I_Flight_StdVH',
                                           element: 'FlightDate' }
                                         }]
      FlightDate,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      @Consumption.valueHelpDefinition: [{ entity: {
                                           name: '/DMO/I_Flight_StdVH',
                                           element: 'Price' }
                                         }]
      FlightPrice,

      @Consumption.valueHelpDefinition: [{ entity: {
                                           name: 'I_CurrencyStdVH',
                                           element: 'Currency' }
                                         }]
      CurrencyCode,

      @Consumption.valueHelpDefinition: [{ entity: {
                                           name: '/DMO/I_Booking_Status_VH',
                                           element: 'BookingStatus' }
                                         }]
      BookingStatus,

      @Semantics.systemDateTime.localInstanceLastChangedAt: true
      LocalLastChangedAt,

      //      ASOCIACIONES
      _Travel            : redirected to parent zc_travel_ceas,
      _BookingSupplement : redirected to composition child zc_bksuppl_ceas,
      _Customer,
      _Carrier,
      _Connection,
      _BookingStatus

}
