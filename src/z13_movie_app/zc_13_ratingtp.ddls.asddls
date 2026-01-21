@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Movie'
@Metadata.allowExtensions: true

define view entity ZC_13_RatingTP as projection on ZR_13_RatingTP
{
  key RatingUuid,
  MovieUuid,
  UserName,
  Rating,
  RatingDate,
  
  /* Associations */
  _Movie : redirected to parent ZC_13_MovieTP
}
