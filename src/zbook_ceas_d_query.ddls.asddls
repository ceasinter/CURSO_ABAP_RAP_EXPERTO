@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'TABLA QUERY DRAFT DE BOOKING'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType: {
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZBOOK_CEAS_D_QUERY
  as select from zbook_ceas_d
{
  key bookinguuid                   as Bookinguuid,
  key draftuuid                     as Draftuuid,
  key parentdraftuuid               as Parentdraftuuid,
      traveluuid                    as Traveluuid,
      bookingid                     as Bookingid,
      bookingdate                   as Bookingdate,
      customerid                    as Customerid,
      carrierid                     as Carrierid,
      connectionid                  as Connectionid,
      flightdate                    as Flightdate,
      @Semantics.amount.currencyCode: 'Currencycode'
      flightprice                   as Flightprice,
      currencycode                  as Currencycode,
      bookingstatus                 as Bookingstatus,
      locallastchangedat            as Locallastchangedat,
      draftentitycreationdatetime   as Draftentitycreationdatetime,
      draftentitylastchangedatetime as Draftentitylastchangedatetime,
      draftadministrativedatauuid   as Draftadministrativedatauuid,
      draftentityoperationcode      as Draftentityoperationcode,
      hasactiveentity               as Hasactiveentity,
      draftfieldchanges             as Draftfieldchanges
}
