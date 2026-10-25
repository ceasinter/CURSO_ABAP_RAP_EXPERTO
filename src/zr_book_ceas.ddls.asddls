@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'DD Root Booking'
@Metadata.ignorePropagatedAnnotations: true
define view entity zr_book_ceas
  as select from zbook_ceas_a
  association to parent zr_travel_ceas  as _Travel on $projection.TravelUUID = _Travel.TravelUUID
  composition [0..*] of zr_bksuppl_ceas as _BookingSupplement
{
  key booking_uuid          as BookingUUID,
      parent_uuid           as TravelUUID,
      booking_id            as BookingID,
      booking_date          as BookingDate,
      customer_id           as CustomerID,
      carrier_id            as CarrierID,
      connection_id         as ConnectionID,
      flight_date           as FlightDate,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      flight_price          as FlightPrice,
      currency_code         as CurrencyCode,
      booking_status        as BookingStatus,

      // Total ETag
      @Semantics.systemDateTime.localInstanceLastChangedAt: true
      local_last_changed_at as LocalLastChangedAt,

      // ASSOCIATION
      _Travel,
      _BookingSupplement
}
