@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'TABLA QUERY DRAFT DE SUPLEMENTOS'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType: {
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZBKSUPPL_CEAS_D_QUERY
  as select from zbksuppl_ceas_d
{
  key booksuppluuid                 as Booksuppluuid,
  key draftuuid                     as Draftuuid,
  key parentdraftuuid               as Parentdraftuuid,
  key traveldraftuuid               as Traveldraftuuid,
      traveluuid                    as Traveluuid,
      bookinguuid                   as Bookinguuid,
      bookingsupplementid           as Bookingsupplementid,
      supplementid                  as Supplementid,
      @Semantics.amount.currencyCode: 'Currencycode'
      price                         as Price,
      currencycode                  as Currencycode,
      locallastchangedat            as Locallastchangedat,
      draftentitycreationdatetime   as Draftentitycreationdatetime,
      draftentitylastchangedatetime as Draftentitylastchangedatetime,
      draftadministrativedatauuid   as Draftadministrativedatauuid,
      draftentityoperationcode      as Draftentityoperationcode,
      hasactiveentity               as Hasactiveentity,
      draftfieldchanges             as Draftfieldchanges
}
