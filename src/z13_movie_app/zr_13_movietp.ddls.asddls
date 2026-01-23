@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Movie'

define root view entity ZR_13_MOVIETP
  as select from ZI_13_MOVIE
  
  association [1..1] to ZI_13_AverageRating as _AverageRating on $projection.MovieUuid = _AverageRating.movie_uuid
  
  association [1..1] to ZI_13_GenreText as _GenreText on $projection.Genre = _GenreText.Kuerzel
  
  composition [0..*] of ZR_13_RatingTP as _Ratings
{
  key MovieUuid,
      Title,
      
      @ObjectModel.text.element: [ 'GenreText' ]
      Genre,
      PublishingYear,
      RuntimeInMin,
      ImageUrl,
      CreatedAt,
      CreatedBy,
      LastChangedAt,
      LastChangedBy,
      
      
      _AverageRating.AverageRating as AverageRating,
      _AverageRating.AverageRatingCriticality as AverageRatingCriticality,
      
      _GenreText.Langweise as GenreText,
      
      /* Associations */
      _Ratings
}
