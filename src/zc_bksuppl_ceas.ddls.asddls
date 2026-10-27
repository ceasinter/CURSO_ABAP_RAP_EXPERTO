@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'DD Projection/Consumption Booking Suppl'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
@Search.searchable: true
@ObjectModel.semanticKey: [ 'BookingSupplementID' ]
define view entity zc_bksuppl_ceas
  as projection on zr_bksuppl_ceas
{
  key BooksupplUUID,
      TravelUUID,
      BookingUUID,
      @Search.defaultSearchElement: true
      @Search.fuzzinessThreshold: 0.8

      BookingSupplementID,

      @Consumption.valueHelpDefinition: [{ entity: {
                                           name: '/DMO/I_Supplement_StdVH',
                                           element: 'SupplementID' }
                                         }]
      SupplementID,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      Price,

      @Consumption.valueHelpDefinition: [{ entity: {
                                           name: 'I_CurrencyStdVH',
                                           element: 'Currency' }
                                         }]
      CurrencyCode,

      @Semantics.systemDateTime.localInstanceLastChangedAt: true
      LocalLastChangedAt,

      // ASOCIACIONES
      _Booking : redirected to parent zc_book_ceas,
      _Travel  : redirected to zc_travel_ceas,
      _Supplement,
      _SupplementText
}
