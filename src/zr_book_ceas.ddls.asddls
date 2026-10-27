@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'DD Root Booking'
@Metadata.ignorePropagatedAnnotations: true
define view entity zr_book_ceas
  as select from zbook_ceas_a

  //  ASOCIACIÓN DE LA TABLA HIJA A LA TABLA PADRE
  association        to parent zr_travel_ceas    as _Travel        on  $projection.TravelUUID = _Travel.TravelUUID

  //  COMPOSITION DE LA TABLA PADRE A LA TABLA HIJA
  composition [0..*] of zr_bksuppl_ceas          as _BookingSupplement

  //  ASOCIACIÓN A LA TABLA CUSTOMER
  association [1..1] to /DMO/I_Customer          as _Customer      on  $projection.CustomerID = _Customer.CustomerID

  //  ASOCIACIÓN CON TABLA CARRIER
  association [1..1] to /DMO/I_Carrier           as _Carrier       on  $projection.CarrierID = _Carrier.AirlineID

  //   ASOCIACIÓN CON LA TABLA CONNECTION
  association [1..1] to /DMO/I_Connection        as _Connection    on  $projection.CarrierID    = _Connection.AirlineID
                                                                   and $projection.ConnectionID = _Connection.ConnectionID

  //  ASOCIACIÓN CON LA TABLA BOOKING PARA EL ESTADO
  association [1..1] to /DMO/I_Booking_Status_VH as _BookingStatus on  $projection.BookingStatus = _BookingStatus.BookingStatus

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
      _BookingSupplement,
      _Customer,
      _Carrier,
      _Connection,
      _BookingStatus
}
