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

      //      VINCULACIÓN DE AYUDAS DE CAMPO
      @Consumption.valueHelpDefinition: [{ entity: {
                                           name: '/DMO/I_Customer_StdVH',
                                           element: 'CustomerID' },
                                           useForValidation: true
                                         }]
      @ObjectModel.text.element: [ 'CustomerName' ]
      CustomerID,
      _Customer.LastName        as CustomerName,

      @Consumption.valueHelpDefinition: [{ entity: {
                                           name: '/DMO/I_Flight_StdVH',
                                           element: 'AirlineID' },
                                           label: 'Flights',
      //                                           MAPEO DE AYUDAS
                                           additionalBinding: [{ localElement: 'ConnectionID', element: 'ConnectionID', usage: #RESULT },
                                                               { localElement: 'FlightDate', element: 'FlightDate', usage: #RESULT },
                                                               { localElement: 'FlightPrice', element: 'Price', usage: #RESULT },
                                                               { localElement: 'CurrencyCode', element: 'CurrencyCode', usage: #RESULT }],
                                            useForValidation: true
                                         }]
      @ObjectModel.text.element: [ 'CarrierName' ]
      CarrierID,

      _Carrier.Name             as CarrierName,

      @Consumption.valueHelpDefinition: [{ entity: {
                                           name: '/DMO/I_Flight_StdVH',
                                           element: 'ConnectionID' },
                                           label: 'Flights',
                                           additionalBinding: [{ localElement: 'CarrierID', element: 'AirlineID', usage: #FILTER_AND_RESULT },
                                                               { localElement: 'FlightDate', element: 'FlightDate', usage: #RESULT },
                                                               { localElement: 'FlightPrice', element: 'Price', usage: #RESULT },
                                                               { localElement: 'CurrencyCode', element: 'CurrencyCode', usage: #RESULT }],
                                            useForValidation: true
                                         }]
      ConnectionID,

      @Consumption.valueHelpDefinition: [{ entity: {
                                           name: '/DMO/I_Flight_StdVH',
                                           element: 'FlightDate' },
                                           label: 'Flights',
                                           additionalBinding: [{ localElement: 'CarrierID', element: 'AirlineID', usage: #FILTER_AND_RESULT },
                                                               { localElement: 'ConnectionID', element: 'ConnectionID', usage: #FILTER_AND_RESULT },
                                                               { localElement: 'FlightPrice', element: 'Price', usage: #RESULT },
                                                               { localElement: 'CurrencyCode', element: 'CurrencyCode', usage: #RESULT }],
                                            useForValidation: true
                                         }]
      FlightDate,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      @Consumption.valueHelpDefinition: [{ entity: {
                                           name: '/DMO/I_Flight_StdVH',
                                           element: 'Price' },
                                           label: 'Price',
                                           additionalBinding: [{ localElement: 'CarrierID', element: 'AirlineID', usage: #FILTER_AND_RESULT },
                                                               { localElement: 'ConnectionID', element: 'ConnectionID', usage: #FILTER_AND_RESULT },
                                                               { localElement: 'FlightDate', element: 'FlightDate', usage: #FILTER_AND_RESULT },
                                                               { localElement: 'CurrencyCode', element: 'CurrencyCode', usage: #RESULT }],
                                            useForValidation: true
                                         }]
      FlightPrice,

      @Consumption.valueHelpDefinition: [{ entity: {
                                           name: 'I_CurrencyStdVH',
                                           element: 'Currency' },
                                           useForValidation: true
                                         }]

      CurrencyCode,

      @Consumption.valueHelpDefinition: [{ entity: {
                                           name: '/DMO/I_Booking_Status_VH',
                                           element: 'BookingStatus' },
                                           useForValidation: true
                                         }]
      @ObjectModel.text.element: [ 'BookingStatusText' ]
      BookingStatus,
      _BookingStatus._Text.Text as BookingStatusText : localized,

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
