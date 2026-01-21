@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Movie'

define root view entity ZR_13_MOVIETP
  as select from ZI_13_MOVIE
  
  composition [0..*] of ZR_13_RatingTP as _Ratings
{
  key MovieUuid,
      Title,
      Genre,
      PublishingYear,
      RuntimeInMin,
      ImageUrl,
      CreatedAt,
      CreatedBy,
      LastChangedAt,
      LastChangedBy,
      
      /* Associations */
      _Ratings
}
