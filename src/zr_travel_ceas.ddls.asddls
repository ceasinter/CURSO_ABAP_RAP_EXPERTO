@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'DD Root Travel'
@Metadata.ignorePropagatedAnnotations: true
define root view entity zr_travel_ceas
  as select from ztravel_ceas_a

  //  COMPOSITION DE LA TABLA PADRE A LA TABLA HIJA
  composition [0..*] of zr_book_ceas             as _Booking

  //  ASOCIACIÓN CON LA TABLA AGENCY
  association [0..1] to /DMO/I_Agency            as _Agency        on $projection.AgencyID = _Agency.AgencyID

  //  ASOCIACIÓN CON LA TABLA CUSTOMER
  association [0..1] to /DMO/I_Customer          as _Customer      on $projection.CustomerID = _Customer.CustomerID

  //  ASOCIACIÓN CON LA TABLA OVERALL STATUS
  association [1..1] to /DMO/I_Overall_Status_VH as _OverallStatus on $projection.OverallStatus = _OverallStatus.OverallStatus

  //  ASOCIACIÓN A LA TABLA CURRENCY
  association [0..1] to I_Currency               as _Currency      on $projection.CurrencyCode = _Currency.Currency
{
  key travel_uuid           as TravelUUID,
      travel_id             as TravelID,
      agency_id             as AgencyID,
      customer_id           as CustomerID,
      begin_date            as BeginDate,
      end_date              as EndDate,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      booking_fee           as BookingFee,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      total_price           as TotalPrice,
      currency_code         as CurrencyCode,
      description           as Description,
      overall_status        as OverallStatus,
      @Semantics.user.createdBy: true
      local_created_by      as LocalCreatedBy,
      @Semantics.systemDateTime.createdAt: true
      local_created_at      as LocalCreatedAt,
      @Semantics.user.localInstanceLastChangedBy: true
      local_last_changed_by as LocalLastChangedBy,

      // TOTAL ETAG
      @Semantics.systemDateTime.localInstanceLastChangedAt: true
      local_last_changed_at as LocalLastChangedAt,
      @Semantics.systemDateTime.lastChangedAt: true
      last_changed_at       as LastChangedAt,

      // COMPOSITIONS
      _Booking,
      _Agency,
      _Customer,
      _OverallStatus,
      _Currency
}
