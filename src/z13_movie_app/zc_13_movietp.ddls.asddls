@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Movie'


@Search.searchable: true

@Metadata.allowExtensions: true

define root view entity ZC_13_MovieTP
  provider contract transactional_query
  as projection on ZR_13_MOVIETP
{
  key MovieUuid,
  
      @Search.defaultSearchElement: true
      @Search.fuzzinessThreshold: 0.7
      Title,
      
      @Consumption.valueHelpDefinition: [{ entity: { name: 'ZI_13_GenreVH', element: 'Genre' } }]
      Genre,
      PublishingYear,
      RuntimeInMin,
      ImageUrl,
      CreatedAt,
      CreatedBy,
      LastChangedAt,
      LastChangedBy,
      
      /* Transient Data */
      AverageRating,
      AverageRatingCriticality,
      GenreText,
      
      
      /* Associations */
      _Ratings : redirected to composition child ZC_13_RatingTP // Make association public
}
