@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'TABLA QUERY DRAFT DE TRAVEL'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZTRAVEL_CEAS_D_QUERY
  as select from ztravel_ceas_d
{
  key traveluuid                    as Traveluuid,
  key draftuuid                     as Draftuuid,
      travelid                      as Travelid,
      agencyid                      as Agencyid,
      customerid                    as Customerid,
      begindate                     as Begindate,
      enddate                       as Enddate,
      @Semantics.amount.currencyCode: 'Currencycode'
      bookingfee                    as Bookingfee,
      @Semantics.amount.currencyCode: 'Currencycode'
      totalprice                    as Totalprice,
      currencycode                  as Currencycode,
      description                   as Description,
      overallstatus                 as Overallstatus,
      localcreatedby                as Localcreatedby,
      localcreatedat                as Localcreatedat,
      locallastchangedby            as Locallastchangedby,
      locallastchangedat            as Locallastchangedat,
      lastchangedat                 as Lastchangedat,

      draftentitycreationdatetime   as Draftentitycreationdatetime,
      draftentitylastchangedatetime as Draftentitylastchangedatetime,
      draftadministrativedatauuid   as Draftadministrativedatauuid,
      draftentityoperationcode      as Draftentityoperationcode,
      hasactiveentity               as Hasactiveentity,
      draftfieldchanges             as Draftfieldchanges
}
