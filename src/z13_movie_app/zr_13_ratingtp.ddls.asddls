@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Rating'

define view entity ZR_13_RatingTP
  as select from ZI_13_Rating
  
  association to parent ZR_13_MOVIETP as _Movie 
    on $projection.MovieUuid = _Movie.MovieUuid
{
  key RatingUuid,
      MovieUuid,
      UserName,
      Rating,
      RatingDate,
      
      /* Associations */
      _Movie // Make association public
}
