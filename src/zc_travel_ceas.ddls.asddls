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

      //       ACTIVACIÓN DE AYUDA DE CAMPOS
      @Consumption.valueHelpDefinition: [{ entity: {
                                           name: '/DMO/I_Agency_StdVH',
                                           element: 'AgencyID' },

      //                                           VALIDACIONES DESDE EL UI
                                           useForValidation: true
                                         }]
      @ObjectModel.text.element: [ 'AgencyName' ]
      AgencyID,

      //      CONFIGURACIÓN DE TEXTOS
      _Agency.Name              as AgencyName,


      @Search.defaultSearchElement: true
      @Search.fuzzinessThreshold: 0.8
      @Consumption.valueHelpDefinition: [{ entity: {
                                           name: '/DMO/I_Customer_StdVH',
                                           element: 'CustomerID' },
                                           useForValidation: true
                                         }]
      //      @ObjectModel.text.element: [ 'LastName', 'FirstName' ]
      @ObjectModel.text.element: [ 'CustomerName' ]
      CustomerID,
      //      _Customer.LastName        as LastName,
      //      _Customer.FirstName       as FirstName,
      _Customer.FirstName       as CustomerName,

      BeginDate,
      EndDate,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      BookingFee,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      TotalPrice,

      @Consumption.valueHelpDefinition: [{ entity: {
                                           name: 'I_CurrencyStdVH',
                                           element: 'Currency' },
                                           useForValidation: true
                                         }]
      CurrencyCode,
      Description,

      @Consumption.valueHelpDefinition: [{ entity: {
                                           name: '/DMO/I_Overall_Status_VH',
                                           element: 'OverallStatus' },
                                           useForValidation: true
                                         }]
      @ObjectModel.text.element: [ 'OverallStatusText' ]
      OverallStatus,

      //      _OverallStatus._Text[ 1: Language = $session.system_language ].Text as OverallStatusText,
      _OverallStatus._Text.Text as OverallStatusText : localized,

      @Semantics.user.localInstanceLastChangedBy: true
      LocalLastChangedAt,


      //      ASOCIACIONES
      _Booking : redirected to composition child zc_book_ceas,
      _Agency,
      _Customer,
      _OverallStatus,
      _Currency

}
